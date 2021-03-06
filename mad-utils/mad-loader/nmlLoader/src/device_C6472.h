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
 *  @file device_C6472.h
 *
 *  @brief
 *     Device specific macros 
 */
#ifndef __DEVICE_C6472_H__
#define __DEVICE_C6472_H__

#define NUM_CORES	6

#define L2MPPA0_BASE_ADDR	0x184A200
#define L2MPPA_ADDR(x)	(L2MPPA0_BASE_ADDR + (4*x))

#define L2_SRAM_PORT0_START	0x800000
#define L2_SRAM_PORT0_END	0x897FFF
#define L2_SRAM_PORT0_PAGE_SZ (32*1024)

#define L2_SRAM_PORT1_MPPA_REG_IDX_START 32
#define L2_SRAM_PORT1_START	0x200000
#define L2_SRAM_PORT1_END	0x2BFFFF
#define L2_SRAM_PORT1_PAGE_SZ (64*1024)

#define L1D_MPPA0_BASE_ADDR	0x184AE00
#define L1D_MPPA_ADDR(x)	(L1D_MPPA0_BASE_ADDR + (4*x))
#define L1D_MPPA_REG_IDX_START 16
#define L1D_START	0xF00000
#define L1D_END		0xF07FFF
#define L1D_PAGE_SZ (2*1024)

#define L1P_MPPA0_BASE_ADDR	0x184A600
#define L1P_MPPA_ADDR(x)	(L1P_MPPA0_BASE_ADDR + (4*x))
#define L1P_MPPA_REG_IDX_START 16
#define L1P_START	0xE00000
#define L1P_END		0xE07FFF
#define L1P_PAGE_SZ (2*1024)

#define MPPA_UX	0x1
#define MPPA_UW	0x2
#define MPPA_UR	0x4
#define MPPA_SX	0x8
#define MPPA_SW	0x10
#define MPPA_SR	0x20

#define MPPA_PERM_MASK 0x3F

#define MAR0_ADDR	0x1848000
#define MAR_ADDR(x)	(MAR0_ADDR + (x*4))
#define MAR16_RANGE_START	0x10000000

#define CACHE_EN_MASK 		0x1

/* Cache control macro's */
#define L1PINV_REG   0x1845028
#define L1P_GLOBAL_INVALIDATE   (*(volatile unsigned int*)(L1PINV_REG)=1)

#define L1DWIBAR_REG   0x1844030
#define L1DWIWC_REG   0x1844034

#define L1DWB_REG   0x1845040
#define L1DWBINV_REG   0x1845044
#define L1DINV_REG   0x1845048

#define L1D_GLOBAL_INVALIDATE   (*(volatile unsigned int*)(L1DINV_REG)=1)
#define L1D_GLOBAL_WBINVALIDATE   (*(volatile unsigned int*)(L1DWBINV_REG)=1)
#define L1D_GLOBAL_WB   (*(volatile unsigned int*)(L1DWB_REG)=1)

#define L2WIBAR_REG   0x1844010
#define L2WIWC_REG   0x1844014

#define L2WB_REG   0x1845000
#define L2WBINV_REG   0x1845004
#define L2INV_REG   0x1845008

#define L2_GLOBAL_INVALIDATE   (*(volatile unsigned int*)(L1DINV_REG)=1)
#define L2_GLOBAL_WBINVALIDATE   (*(volatile unsigned int*)(L1DWBINV_REG)=1)
#define L2_GLOBAL_WB   (*(volatile unsigned int*)(L1DWB_REG)=1)

#endif /* __DEVICE_C6472_H__ */

