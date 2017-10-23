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

/**
 *  @file nml_ar_utils.c
 *
 *  @brief
 *      Utility functions used by the activation record table processor
 */
#include "mal_lib_activation_record.h"
#include "nml_ar_utils.h"

#if !(defined DEVICE)
#error DEVICE not defined
#endif

#if (DEVICE==6472)
#include "device_C6472.h"
#elif (DEVICE==6670)
#include "device_C6670.h"
#elif (DEVICE==6657)
#include "device_C6657.h"
#elif (DEVICE==6678)
#include "device_C6678.h"
#else
#error "no device defined" /* Error */
#endif

extern volatile unsigned int cregister DNUM;
extern unsigned int nml_boot_status[];
extern unsigned char nml_mpax_seg_idx[];

/**
 * @brief
 *   Writeback & invalidate L1D and L2 cache 
 *   size is specified in 32bit words
 */
void nml_wbinv_cache_block(void* base_addr, int size)
{
    asm (" DINT");

    /* Writeback and Invalidate L1D cache */
    *(unsigned int *)(L1DWIBAR_REG) = (unsigned int)base_addr;
    *(unsigned int *)(L1DWIWC_REG) = size;
#if ((DEVICE==6670) || (DEVICE==6678) || (DEVICE==6657))
    asm (" MFENCE");
#elif (DEVICE==6472)
    while (*(unsigned int *)(L1DWIWC_REG) != 0);
#endif

    /* Writeback and Invalidate L2 cache */
    *(unsigned int *)(L2WIBAR_REG) = (unsigned int)base_addr;
    *(unsigned int *)(L2WIWC_REG) = size;
#if ((DEVICE==6670) || (DEVICE==6678) || (DEVICE==6657))
    asm (" MFENCE");
#elif (DEVICE==6472)
    while (*(unsigned int *)(L2WIWC_REG) != 0);
#endif

    asm (" RINT");
}

/**
 * @brief
 *   Copy data
 */
int nml_mem_cpy (void *dest, void *src, unsigned int num_bytes)
{
    unsigned int   i;
    unsigned char *d, *s;

    d = (unsigned char *)dest;
    s = (unsigned char *)src;

    for (i = 0; i < num_bytes; i++)
        d[i] = s[i];

	/* Write back and invalidate data cache */
    nml_wbinv_cache_block(dest, num_bytes/4);
    return 0;
}

/**
 * @brief
 *   Memory Set
 */
int nml_mem_set (void *dest, unsigned int byte, unsigned int num_bytes)
{
    unsigned int   i;
    unsigned char *d, b;

    d = (unsigned char *)dest;
	b = (unsigned char)byte;

    for (i = 0; i < num_bytes; i++)
        d[i] = b;

	/* Write back and invalidate data cache */
    nml_wbinv_cache_block(dest, num_bytes/4);
    L1D_GLOBAL_WB;
    L2_GLOBAL_WB;
    return 0;
}

#if ((DEVICE==6670) || (DEVICE==6678) || (DEVICE==6657))
static inline int __logbase2(num)
{
	unsigned r = 0; 
	while (num >>= 1) {
  		r++;
	}
	return r;
}
#define LOG_BASE2_4K	12
#endif /* C6670 C6678 */

/**
 * @brief
 *   Setup MPAX for 6670
 *   Setup memory protection attributes in MPPA 
 */
/* paddr is 36 bits for 6670: Activation record will specify paddr without the 4 LSbits */
int nml_mem_map_set (unsigned int paddr, unsigned int vaddr, unsigned int size,
			   		 unsigned int perm)
{
	unsigned char permissions, p;
	unsigned int num_mppa, start_mppa_idx, *start_mppa_addr, i, mppa_val;
#if ((DEVICE==6670) || (DEVICE==6678) || (DEVICE==6657))
	unsigned char segsz;
	unsigned int raddr, baddr;
#endif

#if ((DEVICE==6670) || (DEVICE==6678) || (DEVICE==6657))
	if (vaddr >= MPAX_MAPPABLE_RANGE_START) {
		/* Configure MPAX registers */
		p = (unsigned char)perm;
		permissions = 0;
		if (p & UX)
			permissions |= 	MPAX_UX;
		if (p & UW)
			permissions |= 	MPAX_UW;
		if (p & UR)
			permissions |= 	MPAX_UR;
		if (p & SX)
			permissions |= 	MPAX_SX;
		if (p & SW)
			permissions |= 	MPAX_SW;
		if (p & SR)
			permissions |= 	MPAX_SR;

		segsz = MPAX_SEGSZ_VAL_4K + (__logbase2(size) - LOG_BASE2_4K);

		baddr = vaddr >> 12; /* upper 20 bits of vaddr */
		raddr = paddr >> 8;  /* upper 24 bits of paddr */ 
		*(volatile unsigned int *)XMPAXL(nml_mpax_seg_idx[DNUM]) = (raddr << 8)  | permissions;
		*(volatile unsigned int *)XMPAXH(nml_mpax_seg_idx[DNUM]) = (baddr << 12) | segsz;
		nml_mpax_seg_idx[DNUM]++;
		return 0;
	}
#endif /* C6670, C6678 */

	/* Configure MPPA registers */
	p = (unsigned char)perm;
	permissions = 0;
	if (p & UX)
		permissions |= 	MPPA_UX;
	if (p & UW)
		permissions |= 	MPPA_UW;
	if (p & UR)
		permissions |= 	MPPA_UR;
	if (p & SX)
		permissions |= 	MPPA_SX;
	if (p & SW)
		permissions |= 	MPPA_SW;
	if (p & SR)
		permissions |= 	MPPA_SR;

	/* Check if address is in Local L2 range */
	if ((vaddr >= L2_SRAM_PORT0_START) & ((vaddr+size) <= (L2_SRAM_PORT0_END+1))) {
		start_mppa_idx = (vaddr - L2_SRAM_PORT0_START) / L2_SRAM_PORT0_PAGE_SZ; 
		num_mppa = size / L2_SRAM_PORT0_PAGE_SZ; 
		if (size % (L2_SRAM_PORT0_PAGE_SZ))
			num_mppa++;
		start_mppa_addr = (unsigned int *)L2MPPA_ADDR(start_mppa_idx);
	} 
#if (DEVICE==6472)
	/* Check if address is in shared L2 range */
	else if ((vaddr >= L2_SRAM_PORT1_START) & ((vaddr+size) <= (L2_SRAM_PORT1_END+1))) {
		start_mppa_idx = L2_SRAM_PORT1_MPPA_REG_IDX_START;
		start_mppa_idx += (vaddr - L2_SRAM_PORT1_START) / L2_SRAM_PORT1_PAGE_SZ; 
		num_mppa = size / L2_SRAM_PORT1_PAGE_SZ; 
		if (size % (L2_SRAM_PORT1_PAGE_SZ))
			num_mppa++;
		start_mppa_addr = (unsigned int *)L2MPPA_ADDR(start_mppa_idx);
	}
#endif /* C6472 */
	/* Check if address is in L1D range */
	else if ((vaddr >= L1D_START) & ((vaddr+size) <= (L1D_END+1))) {
		start_mppa_idx = L1D_MPPA_REG_IDX_START;
		start_mppa_idx += (vaddr - L1D_START) / L1D_PAGE_SZ; 
		num_mppa = size / L1D_PAGE_SZ; 
		if (size % (L1D_PAGE_SZ))
			num_mppa++;
		start_mppa_addr = (unsigned int *)L1D_MPPA_ADDR(start_mppa_idx);
	}
	/* Check if address is in L1P range */
	else if ((vaddr >= L1P_START) & ((vaddr+size) <= (L1P_END+1))) {
		start_mppa_idx = L1P_MPPA_REG_IDX_START;
		start_mppa_idx += (vaddr - L1P_START) / L1P_PAGE_SZ; 
		num_mppa = size / L1P_PAGE_SZ; 
		if (size % (L1P_PAGE_SZ))
			num_mppa++;
		start_mppa_addr = (unsigned int *)L1P_MPPA_ADDR(start_mppa_idx);
	}
	else {
		return 0;
	}

	/* Program MPPA */
	for (i=0; i<num_mppa; i++) {
		mppa_val = *(start_mppa_addr+i) & ~MPPA_PERM_MASK;
		mppa_val |= permissions;
		*(start_mppa_addr+i) = mppa_val;
	}
	
	return 0;
}

/**
 * @brief
 *   Memory attr set 
 */

/* Configure MAR registers */
int nml_mem_attr_set (unsigned int vaddr, unsigned int size, unsigned int attrs)
{
	unsigned short start_mar, num_mars, i;
	unsigned int cache_en;
	unsigned int prefetch_en; 

	/* MAR0 to MAR15 are Read-only */
	if (vaddr < MAR16_RANGE_START)
		return 0;

	cache_en = (attrs & CACHE_EN)? CACHE_EN_MASK:0; 
#if ((DEVICE==6670) || (DEVICE==6678) || (DEVICE==6657))
	prefetch_en = (attrs & PREFETCH_EN)? PREFETCH_EN_MASK:0; 
#else
	prefetch_en = 0;
#endif

	start_mar = vaddr >> 24;  /* divide by 16MB */
	num_mars = size >> 24;    /* divide by 16MB */ 
	if (size % (16*1024*1024))
		num_mars++;

	for (i=0; i<num_mars; i++) {
		*(unsigned int*)MAR_ADDR((start_mar+i)) = (cache_en|prefetch_en);
	}
	return 0;
}

/**
 * @brief
 *   Call a function
 */
int nml_fn_call (fptr fn, void *arg1, void *arg2, void *arg3)
{
	(*fn)(arg1, arg2, arg3);
	return 0;
}

/**
 * @brief
 *  Update Boot status 
 */
int nml_upd_status (unsigned int status)
{
	nml_boot_status[DNUM] = status;
	/* Write back and invalidate data cache */
    nml_wbinv_cache_block(&nml_boot_status[DNUM], 1);
	return 0;
}


