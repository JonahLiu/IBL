/*
 * Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/ 
 * 
 * 
 *  Redistribution and use in source and binary forms, with or without 
 *  modification, are permitted provided that the following conditions 
 *  are met:
 *
 *    Redistributions of source code must retain the above copyright 
 *    notice, this list of conditions and the following disclaimer.
 *
 *    Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the 
 *    documentation and/or other materials provided with the   
 *    distribution.
 *
 *    Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
 *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
 *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
 *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
 *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
*/


/* MAL Library functions */

#include <string.h>
#include "dload_api.h"
#include "mal_lib.h"
#include "mal_lib_file_utils.h"
#include "mal_lib_activation_record.h"
#include "mal_lib_loc.h"

#if !(defined DEVICE)
#error DEVICE not defined
#endif

/* Tomahawk */
#if (DEVICE==6472)
#include "device_C6472.h"
/* Nyquist */
#elif (DEVICE==6670)
#include "device_C6670.h"
/* Shannon */
#elif (DEVICE==6678)
#include "device_C6678.h"
#elif (DEVICE==6657)
#include "device_C6657.h"
#else
#error "no device defined"
#endif


/* Defines for NML BOOT STATUS */
#define NML_STATUS_APP_ENTRY	0x100
#define NML_STATUS_RETURNED_FROM_APP	0x101

extern volatile unsigned int cregister DNUM;
extern chipDelay32 (unsigned int cycles);

static int reset_run_core(unsigned int coreId, unsigned int ba);
static int reset_core(unsigned int coreId);
static int add_update_status_ar(unsigned int status);
static int add_fncall_ar(void* fptr);
static void exception();
static void convert_activation_records(mal_lib_activationRecord_t *ar,
									   int num_records);

/* Temporary storage for activation records in the library */
mal_lib_activationRecord_t	activation_records[MAL_LIB_MAX_AR];

/* variable to track the next available activation record */
int next_ar_idx = 0;

/* Flag to control recording of ELF loader actions */
static int recording_enabled;

/* Variables to store the NML loader context */
mal_lib_activationRecord_t	*nml_ar_addr=NULL;
void *nml_boot_status_addr=NULL;
void (*nml_entry_point)()=NULL;

/**
 * @brief
 *   Writeback/Invalidate L1D and L2 cache 
 *   size is specified in 32bit words
 */
#define CACHE_INV_ONLY  1
#define CACHE_WB_ONLY  2
#define CACHE_WB_AND_INV  3

void mal_wbinv_cache_block(void* base_addr, int size, int mode)
{
    unsigned int l1d_bar_reg, l1d_wc_reg;
    unsigned int l2_bar_reg, l2_wc_reg;

    switch(mode) {
        case CACHE_INV_ONLY:
            l1d_bar_reg = L1DIBAR_REG;
            l2_bar_reg = L2IBAR_REG;
            l1d_wc_reg = L1DIWC_REG;
            l2_wc_reg = L2IWC_REG;
            break;

        case CACHE_WB_ONLY:
            l1d_bar_reg = L1DWBAR_REG;
            l2_bar_reg = L2WBAR_REG;
            l1d_wc_reg = L1DWWC_REG;
            l2_wc_reg = L2WWC_REG;
            break;

        default:
        case CACHE_WB_AND_INV:
            l1d_bar_reg = L1DWIBAR_REG;
            l2_bar_reg = L2WIBAR_REG;
            l1d_wc_reg = L1DWIWC_REG;
            l2_wc_reg = L2WIWC_REG;
            break;
    }

    asm (" DINT");

    /* Writeback and Invalidate L1D cache */
    *(unsigned int *)(l1d_bar_reg) = (unsigned int)base_addr;
    *(unsigned int *)(l1d_wc_reg) = size;
#if ((DEVICE==6670) || (DEVICE==6678) || (DEVICE==6657))
    asm (" MFENCE");
#elif (DEVICE==6472)
    while (*(unsigned int *)(l1d_wc_reg) != 0);
#endif

    /* Writeback and Invalidate L2 cache */
    *(unsigned int *)(l2_bar_reg) = (unsigned int)base_addr;
    *(unsigned int *)(l2_wc_reg) = size;
#if ((DEVICE==6670) || (DEVICE==6678) || (DEVICE==6657))
    asm (" MFENCE");
#elif (DEVICE==6472)
    while (*(unsigned int *)(l2_wc_reg) != 0);
#endif

    asm (" RINT");
}


/* MAL library initialization API */
/* load_partition_addr: Start address of the virtual memory partition having ROMFS (Load Partition)*/
int mal_lib_init(void *load_partition_addr)
{
	int fd, fh;

	/* Initialize Filesystem utilities */
	if (mal_lib_fs_init(load_partition_addr))
		return -10;

	/* Initialize the dynamic loader */
	DLOAD_initialize();

	recording_enabled = FALSE;

	/* Parse ROMFS to get the NML Loader ELF file */
	if ((fd = mal_lib_fopen("nml")) < 0 )
		return -11;

	/* Parse NML Loader ELF file to retrieve the NML entry point and NML activation record addresses */
	if (!(fh = DLOAD_load_symbols((LOADER_FILE_DESC*)fd))) {
		mal_lib_fclose(fd);
		return -12;
	}

	if (!DLOAD_query_symbol(fh, "nml_entry", (void*)&nml_entry_point)) {
		mal_lib_fclose(fd);
		return -13;
	}

	if (!DLOAD_query_symbol(fh, "nml_ar_data", (void*)&nml_ar_addr)) {
		mal_lib_fclose(fd);
		return -14;
	}

	if (!DLOAD_query_symbol(fh, "nml_boot_status", &nml_boot_status_addr)) {
		mal_lib_fclose(fd);
		return -15;
	}

	if (!DLOAD_unload(fh)) {
		mal_lib_fclose(fd);
		return -16;
	}

	if (mal_lib_fclose(fd))
		return -17;

	return 0;
}

/* API to load a core with the specified APP */
int mal_lib_load_core(unsigned int coreId, char *appName)
{
	int fd, i, fh, num_recs;
	unsigned int size;
	void *app_entry_point;
    mal_lib_activationRecord_t	*ar_addr=nml_ar_addr;
	unsigned char arFileName[48] = {'a', 'r', 'C', 'o', 'r', 'e'};

	if (coreId >= NUM_DEVICE_CORES)
		return -1;

	memset(activation_records, 0, (sizeof(mal_lib_activationRecord_t) * MAL_LIB_MAX_AR));

	ar_addr += (coreId * MAL_LIB_MAX_AR);
	
	/* Prepare the activation record file name */
	arFileName[6] = '0' + coreId;
	for (i=0; appName[i]; i++) {
		arFileName[7+i] = appName[i];
	}

	arFileName[7+i] = 0;

	/* Get the file size */
 	if (mal_lib_fsize((const char *)arFileName, &size))
		return -17;

	if (size % sizeof(mal_lib_activationRecord_t))
		return -18;

	num_recs = size/sizeof(mal_lib_activationRecord_t);
	if (num_recs >= MAL_LIB_MAX_AR)
		return -19;

	if ((fd = mal_lib_fopen((const char*)arFileName)) == NULL)
		return -20;

	/* Read the activation records from the file */
	if (size != mal_lib_fread(activation_records, 1, size, fd)) { 
		mal_lib_fclose(fd);
		return -21;
	}
	/* Change endianess if needed */
	convert_activation_records(activation_records, num_recs);
	next_ar_idx = num_recs;

	if (mal_lib_fclose(fd))
		return -22;
	
	/* Get the ELF file for the Application */
	if ((fd = mal_lib_fopen(appName)) < 0)
		return -23;
	
	/* Call the ELF Loader to simulate application load and record the actions */
	/* ELF loader will do the following
	 * (a). Record Pre-init call sequence in NML activation record
	 * (b). Compute dependency graph and record init call sequence in NML activation record */
	/* 		ELF Loader Client APIs will be provided by the MAL library utilities */
	/* 		DLIF_execute() will only record the function calls into NML activation record */

	recording_enabled = TRUE;
	fh = DLOAD_load((LOADER_FILE_DESC*)fd, 0, NULL);
	recording_enabled = FALSE;

	if (fh <= 0) {
		mal_lib_fclose(fd);
		return -24;
	}
	
	/* Retrieve the loaded program's entry point */
	if(!DLOAD_get_entry_point(fh, &app_entry_point)) {
		mal_lib_fclose(fd);
		return -25;
	}

	if (!DLOAD_unload(fh)) {
		mal_lib_fclose(fd);
		return -26;
	}

	if (mal_lib_fclose(fd))
		return -27;

	/* Add an activation record, so that NML updates the Boot Status */
	if (add_update_status_ar(NML_STATUS_APP_ENTRY))
		return -28;

	/* Store the Application entry point to activation records */
	if (add_fncall_ar(app_entry_point))
		return -29;

	/* Add an activation record, so that NML updates the Boot Status 
	 * if the application returns to NML
	 */
	if (add_update_status_ar(NML_STATUS_RETURNED_FROM_APP))
		return -30;
	
	/* Copy the activation records from filesystem into NML area */
	memcpy((void*)ar_addr, (void*)activation_records, sizeof(mal_lib_activationRecord_t)*next_ar_idx);

    /* Writeback the data caches */
    mal_wbinv_cache_block((void*)ar_addr,
                       ((sizeof(mal_lib_activationRecord_t)*next_ar_idx)/4),
                       CACHE_WB_ONLY);

	/* Execute NML_entry() */
	if (DNUM != coreId) {
		/* Place address of nml_entry() into BOOTADDR register of core */
		/* Reset and run the core */
		if (reset_run_core(coreId, (unsigned int)nml_entry_point))
			return -31;
		/* Poll the status variable in the NML RW data section */
		/* Would need a timeout here */
		while(((volatile unsigned int*)nml_boot_status_addr)[coreId] !=
              NML_STATUS_APP_ENTRY) {
            mal_wbinv_cache_block((void *)nml_boot_status_addr, NUM_DEVICE_CORES, CACHE_INV_ONLY);
            chipDelay32(100000);
        }
		return 0;
	}
	else {
		(*nml_entry_point)();
		/* Should not reach here */
		exception();
	}
	return 0;
}

/* API to stop/bringdown a core 
 * Not a graceful shutdown
 */
int mal_lib_stop_core(unsigned int coreId)
{
	return reset_core(coreId);	
}

static int reset_run_core(unsigned int coreId, unsigned int ba)
{
	volatile unsigned int *reg;
	unsigned int mod_id, pd;

    mod_id = GET_PSC_MOD(coreId);

	/* Place the core in reset */
	reg = (unsigned int*)MDCTL_ADDR(mod_id);
	*reg = (*reg & ~ MDCTL_NEXT_STATE_MASK) | MDCTL_NEXT_STATE_EN;
	*reg = (*reg & ~ MDCTL_LRSTZ_MASK);

	/* Enable power domain module */
#if ((DEVICE==6678) || (DEVICE==6670) || (DEVICE==6657))
    pd = GET_PD(coreId);
#elif (DEVICE==6472)
	pd = (*(unsigned int *)MDCFG_ADDR(mod_id) & MDCFG_PD_MASK) >> 16;
#endif
	reg = (unsigned int*)PTCMD_ADDR;
	*reg = (1 << pd);

	/* Poll for transition done */
	reg = (unsigned int*)PTSTAT_ADDR;
	while ((*reg & (1 << pd)));

	/* Setup the BOOT_ADDR */
	/* boot address should be 1KB aligned */
	if (ba & 0x3ff)
		return -1;

#if ((DEVICE==6678) || (DEVICE==6670) || (DEVICE==6657))
    /* Unlock the DSCR boot config */
    reg = (unsigned int*)DSCR_KICK0;
    *reg = DSCR_KICK0_KEY;
    reg = (unsigned int*)DSCR_KICK1;
    *reg = DSCR_KICK1_KEY;
#endif

    /* Set the Boot Address for Core */
	reg = (unsigned int*)BOOT_ADDR(coreId);
#if ((DEVICE==6678) || (DEVICE==6670) || (DEVICE==6657))
   	*reg = ba;
#elif (DEVICE==6472)
   	*reg = (ba >> 10);
#endif

	/* Set the bootcomplete register */
	reg = (unsigned int*)BOOT_COMPLETE_ADDR;
	*reg = (1 << coreId);

#if ((DEVICE==6678) || (DEVICE==6670) || (DEVICE==6657))
    /* Lock the DSCR boot config */
    reg = (unsigned int*)DSCR_KICK0;
    *reg = 0;
    reg = (unsigned int*)DSCR_KICK1;
    *reg = 0;
#endif

	/* Take the core out of reset */
	reg = (unsigned int*)MDCTL_ADDR(mod_id);
	*reg = (*reg & ~ MDCTL_NEXT_STATE_MASK) | MDCTL_NEXT_STATE_EN;
	*reg = (*reg & ~ MDCTL_LRSTZ_MASK) | MDCTL_LRSTZ_MASK;

	/* Enable power domain module */
	reg = (unsigned int*)PTCMD_ADDR;
	*reg = (1 << pd);

	/* Poll for transition done */
	reg = (unsigned int*)PTSTAT_ADDR;
	while ((*reg & (1 << pd)));
    
    /* Verify state change */
	reg = (unsigned int*)MDSTAT_ADDR(mod_id);
    while ((*reg & MDSTAT_STATE_MASK) != MDSTAT_STATE_EN);

	return 0;
}

static int reset_core(unsigned int coreId)
{
	volatile unsigned int *reg;
	unsigned int mod_id, pd;

    mod_id = GET_PSC_MOD(coreId);

	/* Place the core in reset */
	reg = (unsigned int*)MDCTL_ADDR(mod_id);
	*reg = (*reg & ~ MDCTL_NEXT_STATE_MASK) | MDCTL_NEXT_STATE_EN;
	*reg = (*reg & ~ MDCTL_LRSTZ_MASK);

#if ((DEVICE==6678) || (DEVICE==6670) || (DEVICE==6657))
    pd = GET_PD(coreId);
#elif (DEVICE==6472)
	pd = (*(unsigned int *)MDCFG_ADDR(mod_id) & MDCFG_PD_MASK) >> 16;
#endif

	/* Enable power domain module */
	reg = (unsigned int*)PTCMD_ADDR;
	*reg = (1 << pd);

	/* Poll for transition done */
	reg = (unsigned int*)PTSTAT_ADDR;
	while ((*reg & (1 << pd)));
	return 0;
}

/* Private function to add UPDSTS activation record */
static int add_update_status_ar(unsigned int status)
{
	if (next_ar_idx >= MAL_LIB_MAX_AR)
		return -1;
	activation_records[next_ar_idx].opcode = UPDSTATUS;
	activation_records[next_ar_idx].arg1 = status;
	next_ar_idx++;
	return 0;
}

/* Function to record the functions called out by the ELF Loader */
/* This function is called from DLIF_execute */
int mal_lib_record_ld_call(void *fptr)
{
	if (recording_enabled)
		return add_fncall_ar(fptr);
	return 0;
}

/* Function to add a function call activation record */
static int add_fncall_ar(void* fptr)
{
	if (next_ar_idx >= MAL_LIB_MAX_AR)
		return -1;
	activation_records[next_ar_idx].opcode = FNCALL;
	activation_records[next_ar_idx].arg1 = (unsigned int)fptr;
	next_ar_idx++;
	return 0;
}

/* Converts activation records from Big endian to Host endian
 */
static void convert_activation_records(mal_lib_activationRecord_t *ar,
									   int num_records)
{
	int i;
	if (find_endianess() == BIG_ENDIAN) {
		return;
	}

	for (i=0; i<num_records; i++, ar++) {
		ar->opcode = __ntohl__(ar->opcode);
		ar->arg1 = __ntohl__(ar->arg1);
		ar->arg2 = __ntohl__(ar->arg2);
		ar->arg3 = __ntohl__(ar->arg3);
		ar->arg4 = __ntohl__(ar->arg4);
	}
	return;
}

static void exception()
{
	for (;;){}
}


