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

/* This file contains the implementation of the No Man's Land (NML) Loader
 * The address space used by NML Loader will be reserved and cannot be used
 * by any application.
 */ 

#include "mal_lib_activation_record.h"
#include "nml_ar_utils.h"

#if !(defined DEVICE)
#error DEVICE not defined
#endif

#if (DEVICE==6472)
#include "device_C6472.h"
#define NML_STACK_SZ	512

#elif (DEVICE==6670)
#include "device_C6670.h"
#define NML_STACK_SZ	512

#elif (DEVICE==6657)
#include "device_C6657.h"
#define NML_STACK_SZ	512

#elif (DEVICE==6678)
#include "device_C6678.h"
#define NML_STACK_SZ	512
#endif


extern volatile unsigned int cregister DNUM;

typedef int (*fp)(unsigned int, unsigned int, unsigned int, unsigned int);

/* Following data will go into an RW segment */ 
/* Stack area for each core */
unsigned char nml_stack[NUM_CORES*NML_STACK_SZ];
/* Activation Record storage space for each core */
mal_lib_activationRecord_t nml_ar_data[NUM_CORES*MAL_LIB_MAX_AR];
/* Boot status for each core */
unsigned int nml_boot_status[NUM_CORES];
/* Global variables */
#if ((DEVICE==6670) || (DEVICE==6678) || (DEVICE==6657))
/* Variable to maintain current segment idx of MPAX */
unsigned char nml_mpax_seg_idx[NUM_CORES];
#endif

/* Activation record Opcode to function mapping table */
/* This would go into .const section and would be part of the code segment */
const fp arFnTbl[6] = 
	{
	 (fp)nml_upd_status,	/* UPDSTATUS */
	 (fp)nml_mem_map_set,	/* MEMMAPSET */
	 (fp)nml_mem_attr_set,	/* MEMATTRSET */
	 (fp)nml_mem_cpy,		/* MEMCPY */
	 (fp)nml_mem_set,		/* MEMSET */
	 (fp)nml_fn_call		/* FNCALL */
	};

/* NML Loader function
 * Loop through the activation records and execute
 * No error checks done
 */
void nml_loader()
{
	register mal_lib_activationRecord_t *arp;
	register fp fptr;

#if ((DEVICE==6670) || (DEVICE==6678) || (DEVICE==6657))
	/* Initialize the MPAX segment index number */ 
	nml_mpax_seg_idx[DNUM] = 2;
#endif

	/*  
	 * 	NML activation records would have been updated by mal_lib_load_core() 
	 */
	arp = nml_ar_data;
	arp += (DNUM * MAL_LIB_MAX_AR);

	while(1) {
		fptr = arFnTbl[arp->opcode];
		(*fptr)(arp->arg1, arp->arg2, arp->arg3, arp->arg4);
		arp++;
	}
}

