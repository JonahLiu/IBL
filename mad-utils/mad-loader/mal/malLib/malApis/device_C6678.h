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

#ifndef __DEVICE_C6678_H__
#define __DEVICE_C6678_H__

/* Number of cores */
#define NUM_DEVICE_CORES	8

/* Device State Control KICK registers */
#define DSCR_KICK0  0x02620038
#define DSCR_KICK1  0x0262003c

#define DSCR_KICK0_KEY  0x83E70B13
#define DSCR_KICK1_KEY  0x95A4F1E0


/* DSP_BOOT_ADDRx Register */
#define BOOT_ADDR_BASE	0x2620040
#define BOOT_ADDR(x)	(BOOT_ADDR_BASE + (x*4))

#define BOOT_COMPLETE_ADDR	0x262013C

/* PSC Registers */
#define MDSTAT0	0x2350800
#define MDCTL0	0x2350A00
#define PTCMD_ADDR	0x2350120
#define PTSTAT_ADDR	0x2350128
#define MDSTAT_ADDR(x)	(MDSTAT0 + (x*4))
#define MDCTL_ADDR(x)	(MDCTL0 + (x*4))

/* PSC module ID's */
#define MOD_GEM0	15
/* Get the Module for core */
#define GET_PSC_MOD(x)  (x + MOD_GEM0)

#define MDCTL_NEXT_STATE_DIS	0
#define MDCTL_NEXT_STATE_EN		3

#define MDCTL_NEXT_STATE_MASK	0x1F
#define MDCTL_LRSTZ_MASK		0x100

#define MDSTAT_STATE_DIS	0
#define MDSTAT_STATE_EN		3
#define MDSTAT_STATE_MASK	0x1F

/* Get the Power domain for core */
#define PD_GEM0 8
#define GET_PD(x)  (x + PD_GEM0) 

/* Cache control macro's */
#define L1PINV_REG   0x1845028
#define L1P_GLOBAL_INVALIDATE   (*(volatile unsigned int*)(L1PINV_REG)=1)

#define L1DWIBAR_REG   0x1844030
#define L1DWIWC_REG    0x1844034

#define L1DWBAR_REG   0x1844040
#define L1DWWC_REG    0x1844044

#define L1DIBAR_REG   0x1844048
#define L1DIWC_REG    0x184404C

#define L1DWB_REG      0x1845040
#define L1DWBINV_REG   0x1845044
#define L1DINV_REG     0x1845048

#define L1D_GLOBAL_INVALIDATE   (*(volatile unsigned int*)(L1DINV_REG)=1)
#define L1D_GLOBAL_WBINVALIDATE   (*(volatile unsigned int*)(L1DWBINV_REG)=1)
#define L1D_GLOBAL_WB   (*(volatile unsigned int*)(L1DWB_REG)=1)

#define L2WBAR_REG   0x1844000
#define L2WWC_REG    0x1844004

#define L2WIBAR_REG   0x1844010
#define L2WIWC_REG    0x1844014

#define L2IBAR_REG   0x1844018
#define L2IWC_REG    0x184401C

#define L2WB_REG      0x1845000
#define L2WBINV_REG   0x1845004
#define L2INV_REG     0x1845008

#define L2_GLOBAL_INVALIDATE   (*(volatile unsigned int*)(L1DINV_REG)=1)
#define L2_GLOBAL_WBINVALIDATE   (*(volatile unsigned int*)(L1DWBINV_REG)=1)

#endif /* __DEVICE_C6678_H__ */

