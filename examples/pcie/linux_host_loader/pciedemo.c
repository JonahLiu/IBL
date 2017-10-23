/******************************************************************************
 * Copyright (c) 2011 Texas Instruments Incorporated - http://www.ti.com
 * 
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as 
 * published by the Free Software Foundation version 2.
 *
 * This program is distributed "as is" WITHOUT ANY WARRANTY of any
 * kind, whether express or implied; without even the implied warranty
 * of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *****************************************************************************/

/**************************************************************************************
 * FILE NAME: pciedemo.c
 *
 * DESCRIPTION: A sample code to load DSP boot image from a Linux machine into DSP.
 *
 * Revision History:
 *    - 1.0:  Initial version (6678 little endian PCIE boot POST demo)
 *    - 1.1:  Add a new PCIE boot demo for HelloWorld
 *    - 1.2:  support 6670 boot
 *    - 1.3:  support big endian boot for 6670/6678; support 32-bit/64-bit Linux;         
 *            support EDMA; support interrupt between host and DSP; 
 *            added PCIE over EDMA throughput measurement
 *    - 1.4:  Add a DSP local reset demo; fix pushData() to handle cases when 
 *            sections within different memory regions in a header file
 *    - 1.5:  Support 6657 boot
 ***************************************************************************************/

#include <linux/module.h>
#include <linux/types.h>
#include <linux/kernel.h>
#include <linux/pci.h>
#include <linux/delay.h>
#include <linux/fs.h>
#include <linux/init.h>
#include <linux/ioport.h>
#include <linux/interrupt.h>
#include <asm/uaccess.h>
#include <asm/dma-mapping.h>
#include <linux/time.h>

MODULE_LICENSE("GPL v2");

/* Must select the endianess */
#define BIG_ENDIAN          0

/* Must select which demo to run */ 
#define HELLO_WORLD_DEMO    1
#define POST_DEMO           0 
#define EDMA_INTC_DEMO      0 
#define LOCAL_RESET         0

/* Must select a platform */
#define EVMC6678L           1
#define EVMC6670L           0
#define EVMC6657L           0
 
#if BIG_ENDIAN
#define myIoread32  ioread32be
#define myIowrite32 iowrite32be
#else
#define myIoread32  ioread32 
#define myIowrite32 iowrite32
#endif

#if EVMC6678L
#define MAGIC_ADDR          0x0087FFFC
#endif

#if EVMC6670L
#define MAGIC_ADDR          0x008FFFFC
#endif

#if EVMC6657L
#define MAGIC_ADDR          0x008FFFFC
#endif

/* Include header array */
#if HELLO_WORLD_DEMO

#if EVMC6678L
#include "pcieDdrInit_6678.h"     /* DDR init */
#include "pcieBootCode_6678.h"    /* "Hello world" boot example */  
#endif

#if EVMC6670L
#include "pcieDdrInit_6670.h"     /* DDR init */
#include "pcieBootCode_6670.h"    /* "Hello world" boot example */
#endif

#if EVMC6657L
#include "pcieDdrInit_6657.h"     /* DDR init */
#include "pcieBootCode_6657.h"    /* "Hello world" boot example */
#endif

#endif

#if POST_DEMO

#if EVMC6678L
#include "post_6678.h"            /* POST boot example */
#endif

#if EVMC6670L
#include "post_6670.h"            /* POST boot example */
#endif

#if EVMC6657L
#include "post_6657.h"            /* POST boot example */
#endif

#endif

#if EDMA_INTC_DEMO

#if EVMC6678L
#include "pcieInterrupt_6678.h"   /* EDMA-Interrupt boot example */
#endif

#if EVMC6670L
#include "pcieInterrupt_6670.h"   /* EDMA-Interrupt boot example */
#endif

#endif

#if LOCAL_RESET

#if EVMC6678L
#include "pcieLocalReset_6678.h"
#endif

#if EVMC6670L
#include "pcieLocalReset_6670.h"
#endif

#endif

/* PCIE registers */
#define PCIE_BASE_ADDRESS            0x21800000
#define OB_SIZE                      0x30
#define PRIORITY                     0x3C
#define EP_IRQ_CLR                   0x68
#define EP_IRQ_STATUS                0x6C
#define LEGACY_A_IRQ_STATUS_RAW      0x180
#define LEGACY_A_IRQ_ENABLE_SET      0x188
#define LEGACY_A_IRQ_ENABLE_CLR      0x18C
#define OB_OFFSET_INDEX(n)           (0x200 + (8 * (n)))
#define OB_OFFSET_HI(n)              (0x204 + (8 * (n)))
#define IB_BAR(n)                    (0x300 + (0x10 * (n)))
#define IB_START_LO(n)               (0x304 + (0x10 * (n)))
#define IB_START_HI(n)               (0x308 + (0x10 * (n)))
#define IB_OFFSET(n)                 (0x30C + (0x10 * (n)))

#define PCIE_TI_VENDOR               0x104C
#define PCIE_TI_DEVICE               0xB005

/* PSC registers */
#define PSC_BASE_ADDRESS             0x02350000
#define PTCMD                        0x120
#define PTSTAT                       0x128
#define PDSTAT(n)                    (0x200 + (4 * (n)))
#define PDCTL(n)                     (0x300 + (4 * (n)))
#define MDSTAT(n)                    (0x800 + (4 * (n)))
#define MDCTL(n)                     (0xA00 + (4 * (n))) 

/* EDMA registers */
#define EDMA_TPCC0_BASE_ADDRESS      0x02700000
#define DMAQNUM0                     0x0240  
#define ESR                          0x1010 
#define EESR                         0x1030                 
#define IESR                         0x1060
#define IPR                          0x1068 
#define ICR                          0x1070 
#define PARAM_0_OPT                  0x4000
#define PARAM_0_SRC                  0x4004
#define PARAM_0_A_B_CNT              0x4008
#define PARAM_0_DST                  0x400C
#define PARAM_0_SRC_DST_BIDX         0x4010
#define PARAM_0_LINK_BCNTRLD         0x4014
#define PARAM_0_SRC_DST_CIDX         0x4018
#define PARAM_0_CCNT                 0x401C

/* Chip level registers */
#define CHIP_LEVEL_BASE_ADDRESS      0x02620000
#define KICK0                        0x38    
#define KICK1                        0x3C
#define KICK0_UNLOCK                 0x83E70B13
#define KICK1_UNLOCK                 0x95A4F1E0 
#define KICK_LOCK                    0x0
#define DSP_BOOT_ADDR(n)             (0x040 + (4 * (n)))
#define IPCGR(n)                     (0x240 + (4 * (n)))


#define LL2_START                    0x00800000
#define MSMC_START                   0x0C000000  /* Shared L2 */
#define DDR_START                    0x80000000
#define PCIE_DATA                    0x60000000  

/* Block size in bytes when r/w data between GPP and DSP via DSP CPU */
#define BLOCK_TRANSFER_SIZE          0x100      

/* Data size in bytes when r/w data bewteen GPP and DSP via EDMA:
   GPP----PCIE link----PCIE data space----EDMA----DSP device memory (L2, DDR, ...) */
#define DMA_TRANSFER_SIZE            0x400000   /* 4MB */

/* Payload size in bytes over PCIE link. PCIe module supports 
   outbound payload size of 128 bytes and inbound payload size of 256 bytes */
#define PCIE_TRANSFER_SIZE           0x80               

/* For 1MB outbound translation window size */
#define PCIE_ADLEN_1MB               0x00100000
#define PCIE_1MB_BITMASK             0xFFF00000

#define PSC_SWRSTDISABLE             0x0
#define PSC_ENABLE                   0x3

#define LOC_RST_ASSERT               0x0
#define LOC_RST_DEASSERT             0x1

/* Power domains definitions */
#define PD0         0     // Power Domain-0
#define PD1         1     // Power Domain-1
#define PD2         2     // Power Domain-2
#define PD3         3     // Power Domain-3
#define PD4         4     // Power Domain-4
#define PD5         5     // Power Domain-5
#define PD6         6     // Power Domain-6
#define PD7         7     // Power Domain-7
#define PD8         8     // Power Domain-8
#define PD9         9     // Power Domain-9
#define PD10        10    // Power Domain-10
#define PD11        11    // Power Domain-11
#define PD12        12    // Power Domain-12
#define PD13        13    // Power Domain-13
#define PD14        14    // Power Domain-14
#define PD15        15    // Power Domain-15
#define PD16        16    // Power Domain-16
#define PD17        17    // Power Domain-17

#if EVMC6670L
/* Modules on power domain 0 */
#define LPSC_TCP3E     3
#define LPSC_VCP2A     4

/* Modules on power domain 1 */
#define LPSC_DEBUG     5
#define LPSC_TETB      6

/* Modules on power domain 2 */
#define LPSC_PA        7
#define LPSC_SGMII     8
#define LPSC_SA        9

/* Modules on power domain 3 */
#define LPSC_PCIE      10

/* Modules on power domain 4 */
#define LPSC_SRIO      11

/* Modules on power domain 5 */
#define LPSC_HYPER     12

/* Modules on power domain 6 */
#define LPSC_RESERV    13

/* Modules on power domain 7 */
#define LPSC_MSMCRAM   14

/* Modules on power domain 8 */
#define LPSC_RACA_RACB 15
#define LPSC_TAC       16

/* Modules on power domain 9 */
#define LPSC_FFTCA_FFTCB 17

/* Modules on power domain 10 */
#define LPSC_AIF2      18

/* Modules on power domain 11 */
#define LPSC_TCP3DA    19

/* Modules on power domain 12 */
#define LPSC_VCP2B     20
#define LPSC_VCP2C     21
#define LPSC_VCP2D     22

/* Modules on power domain 13 */
#define LPSC_C0_TIM0   23

/* Modules on power domain 14 */
#define LPSC_C1_TIM1   24
#define LPSC_C1_RSA    25

/* Modules on power domain 15 */
#define LPSC_C2_TIM2   26
#define LPSC_C2_RSA    27

/* Modules on power domain 16 */
#define LPSC_C3_TIM3   28

/* Modules on power domain 17 */
#define LPSC_TCP3dB    29

#endif

#if EVMC6678L
/* Modules on power domain 0 */
#define LPSC_EMIF16_SPI  3  
#define LPSC_TSIP        4

/* Modules on power domain 1 */
#define LPSC_DEBUG       5
#define LPSC_TETB_TRC    6

/* Modules on power domain 2 */
#define LPSC_PA          7  
#define LPSC_SGMII       8  
#define LPSC_SA          9  

/* Modules on power domain 3 */
#define LPSC_PCIE        10

/* Modules on power domain 4 */
#define LPSC_SRIO        11

/* Modules on power domain 5 */
#define LPSC_HYPER       12

/* Modules on power domain 6 */
#define LPSC_RESERV      13

/* Modules on power domain 7 */
#define LPSC_MSMCRAM     14

/* Modules on power domain 8 */
#define LPSC_C0_TIM0     15

/* Modules on power domain 9 */
#define LPSC_C1_TIM1     16

/* Modules on power domain 10 */
#define LPSC_C2_TIM2     17

/* Modules on power domain 11 */
#define LPSC_C3_TIM3     18

/* Modules on power domain 12 */
#define LPSC_C4_TIM4     19

/* Modules on power domain 13 */
#define LPSC_C5_TIM5     20

/* Modules on power domain 14 */
#define LPSC_C6_TIM6     21

/* Modules on power domain 15 */
#define LPSC_C7_TIM7     22

#endif

/* 
reg:  PCIE application registers
mem:  Local L2
msmc: Shared L2 memory
ddr:  DDR3   
 */

uint8_t *wDataVirt, *rDataVirt;          /* Virtue address for CPU */
dma_addr_t wData, rData;                 /* Physical PCIE bus address */


/***********************************************
 * uncomment following line on very old kernels:
 * typedef unsigned long resource_size_t;
 **********************************************/
resource_size_t regBase = 0;
resource_size_t memBase = 0;
resource_size_t msmcBase = 0;
resource_size_t ddrBase = 0;

uint32_t *regVirt = NULL;
uint32_t *memVirt = NULL;
uint32_t *msmcVirt = NULL;
uint32_t *ddrVirt = NULL;

resource_size_t memLen = 0;
resource_size_t regLen = 0;
resource_size_t msmcLen = 0;
resource_size_t ddrLen = 0;

uint32_t *ptrReg = 0; 
int32_t  irqNo;
uint32_t dummy;
struct pci_dev *PCIE_DEV = NULL;

struct timeval test_time1;
struct timeval test_time2;
struct timeval test_time3;
struct timeval test_time4;

/* ============================================================================
 *  @func   PCI_FindPciDevices
 *
 *  @desc   This function locates 6670/6678 PCIE cards on system.
 *
 *  @modif  None.
 *  ============================================================================
 */
void PCI_FindPciDevices(void)
{
	struct pci_dev *dev = NULL;

	while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL)
	{
		if ((dev->vendor == PCIE_TI_VENDOR) && (dev->device == PCIE_TI_DEVICE)) {
			printk("Found TI device\n");
			irqNo = dev->irq;
			PCIE_DEV = dev;
			printk("TI device: vendor=0x%04x, dev=0x%04x, irq=0x%08x\n", dev->vendor, dev->device, dev->irq);
			break;
		}
	}
}

/* ============================================================================
 *  @func   PCI_readBAR
 *
 *  @desc   This function reads config.
 *
 *  @modif  None.
 *  ============================================================================
 */
void PCI_readBAR(void)
{
	resource_size_t  barStart[4];
	resource_size_t  barLen[4];
	resource_size_t  barFlags[4];

	barStart [0] = pci_resource_start (PCIE_DEV, 0);   /* BAR0 4K for PCIE application registers */
	barLen   [0] = pci_resource_len   (PCIE_DEV, 0);
	barFlags [0] = pci_resource_flags (PCIE_DEV, 0);
	barStart [1] = pci_resource_start (PCIE_DEV, 1);   /* BAR1 512K/1024K for 6678/6670 Local L2 */
	barLen   [1] = pci_resource_len   (PCIE_DEV, 1);
	barFlags [1] = pci_resource_flags (PCIE_DEV, 1);
	barStart [2] = pci_resource_start (PCIE_DEV, 2);   /* BAR2 4M/2M for 6678/6670 Shared L2 */
	barLen   [2] = pci_resource_len   (PCIE_DEV, 2);
	barFlags [2] = pci_resource_flags (PCIE_DEV, 2);
	barStart [3] = pci_resource_start (PCIE_DEV, 3);   /* BAR3 16M for DDR3 */
	barLen   [3] = pci_resource_len   (PCIE_DEV, 3);
	barFlags [3] = pci_resource_flags (PCIE_DEV, 3);

	/* ---------------------------------------------------------------------
	 * Map the REG memory region
	 * ---------------------------------------------------------------------
	 */
	if (barFlags[0] & IORESOURCE_MEM) {
		regBase = barStart[0];
		/* Map the memory region. */
		request_mem_region(regBase, barLen[0], "DSPLINK");
	}
	else {
		/* Map the memory region. */
		request_region(regBase, barLen[0], "DSPLINK");
	}

	if (regBase > 0) {
		regVirt = ioremap(barStart[0], barLen[0]);
	}

	/* ---------------------------------------------------------------------
	 * Map the LL2RAM memory region
	 * ---------------------------------------------------------------------
	 */
	if (barFlags[1] & IORESOURCE_MEM) {
		memBase = barStart[1];
		/* Map the memory region. */
		request_mem_region(memBase, barLen[1], "DSPLINK");
	}
	else {
		/* Map the memory region. */
		request_region(memBase, barLen[1], "DSPLINK");
	}

	if (memBase > 0) {
		memVirt = ioremap(barStart[1], barLen[1]);
	}

	/* ---------------------------------------------------------------------
	 * Map the MSMC memory region
	 * ---------------------------------------------------------------------
	 */
	if (barFlags[2] & IORESOURCE_MEM) {
		msmcBase = barStart[2];
		/* Map the memory region. */
		request_mem_region(msmcBase, barLen[2], "DSPLINK");
	}
	else {
		/* Map the memory region. */
		request_region(msmcBase, barLen[2], "DSPLINK");
	}

	if (msmcBase > 0) {
		msmcVirt = ioremap(barStart[2], barLen[2]);
	}

	/* ---------------------------------------------------------------------
	 * Map the DDR memory region
	 * ---------------------------------------------------------------------
	 */
	if (barFlags[3] & IORESOURCE_MEM) {
		ddrBase = barStart[3];
		/* Map the memory region. */
		request_mem_region(ddrBase, barLen[3], "DSPLINK");
	}
	else {
		/* Map the memory region. */
		request_region(ddrBase, barLen[3], "DSPLINK");
	}

	if (ddrBase > 0) {
		ddrVirt = ioremap(barStart[3], barLen[3]);
	}

	regLen  = barLen[0];
	memLen  = barLen[1];
	msmcLen = barLen[2];
	ddrLen  = barLen[3];

}

/* =============================================================================
 *  @func   PCI_setMaster
 *
 *  @desc   This function makes the given device to be master.
 *
 *  @modif  None.
 *  ============================================================================
 */
void PCI_setMaster(void)
{
	int32_t  retVal;
	uint16_t cmdVal;
	struct pci_dev *dev;

	dev = PCIE_DEV;

	/* set the DMA mask */
	if (pci_set_dma_mask(dev, 0xfffffff0ULL)) {
	}

	/* set the desired PCI dev to be master, this internally sets the latency timer */
	pci_set_master(dev);
	pci_write_config_byte(dev, PCI_LATENCY_TIMER, 0x80);

	/* Add support memory write invalidate */
	retVal = pci_set_mwi(dev);

	pci_read_config_word(dev, PCI_COMMAND, (u16 *)&cmdVal);
	/* and set the master bit in command register. */
	cmdVal |= PCI_COMMAND_MEMORY
		| PCI_COMMAND_MASTER
		| PCI_COMMAND_SERR;
	/* and clear the interrupt disable bit in command register. */
	cmdVal &= ~PCI_COMMAND_INTX_DISABLE;
	pci_write_config_word(dev, PCI_COMMAND, cmdVal);
}

/* =============================================================================
 *  @func   HAL_CheckPciInterrupt
 *
 *  @desc   This function check whether interrupt is generated by C667x or not.
 *
 *  @modif  None.
 *  ============================================================================
 */
bool HAL_CheckPciInterrupt(void)
{
	uint32_t *pReg = (uint32_t *)regVirt;
	return ioread32(pReg + EP_IRQ_STATUS/4);
}

/** ============================================================================
 *  @func   HAL_PciClearDspInterrupt
 *
 *  @desc   Clear pending interrupt from DSP to Host.
 *
 *  @modif  None.
 *  ============================================================================
 */
void HAL_PciClearDspInterrupt(void)
{
	uint32_t *pReg = (uint32_t *)regVirt;
	iowrite32(1, pReg+EP_IRQ_CLR/4);
}

/** ============================================================================
 *  @func   HAL_PciEnableDspInterrupt
 *
 *  @desc   Allow the DSP to generate interrupts to the Host.
 *
 *  @modif  None.
 *  ============================================================================
 */
void HAL_PciEnableDspInterrupt(void)
{
	uint32_t *pReg = (uint32_t *)regVirt;
	iowrite32(1, pReg+LEGACY_A_IRQ_ENABLE_SET/4);
}

/** ============================================================================
 *  @func   HAL_PciDisableDspInterrupt
 *
 *  @desc   Disable the DSP to generate interrupts to the Host.
 *
 *  @modif  None.
 *  ============================================================================
 */
void HAL_PciDisableDspInterrupt(void)
{
	uint32_t *pReg = (uint32_t *)regVirt;
	iowrite32(1, pReg+LEGACY_A_IRQ_ENABLE_CLR/4);
}


/* ============================================================================
 *  @func   HAL_readDMA
 *
 *  @desc   Move DMAs contents from DSP memory to GPP Memory. For DSP this is
 *          outbound write. 
 *  flag:   0: Move data inside DSP; 1: Move data between GPP and DSP
 *  
 *  @modif  None.
 *  ============================================================================
 */
void HAL_readDMA(uint32_t srcAddr, uint32_t dstAddr, uint32_t size, uint32_t flag)
{
	uint32_t *pReg, tmp, pageBase, i, tSize;

	pReg = (uint32_t *)regVirt;     /* Point to PCIE application registers */

	/* Move data between GPP and DSP, need to program PCIE OB registers */
	if (flag) { 
		iowrite32(0x0, pReg + OB_SIZE/4); /* 1MB outbound translation size */

		if (size <= PCIE_ADLEN_1MB) {
			pageBase = dstAddr & PCIE_1MB_BITMASK;
			iowrite32(pageBase|0x1, pReg + OB_OFFSET_INDEX(0)/4);
			iowrite32(0x0, pReg + OB_OFFSET_HI(0)/4);  
		}
		else {
			for (tmp = size, i = 0; tmp > 0; tmp -= PCIE_ADLEN_1MB, i++) {
				pageBase = (dstAddr + (PCIE_ADLEN_1MB * i)) & PCIE_1MB_BITMASK;
				iowrite32(pageBase|0x1, pReg + OB_OFFSET_INDEX(i)/4);
				iowrite32(0x0, pReg + OB_OFFSET_HI(i)/4);
			}
		}
	}

	/* Temporarily re-map IB region 3 from DDR memory to EDMA registers */
	iowrite32(EDMA_TPCC0_BASE_ADDRESS, pReg + IB_OFFSET(3)/4);  

	pReg = (uint32_t*)ddrVirt;   /* Now it points to the start of EDMA_TPCC0_BASE_ADDRESS */

	while (true) {
		/* Use TC0 for DBS = 128 bytes */
		myIowrite32(0x0, pReg + DMAQNUM0/4);                

		/* Set the interrupt enable for 1st Channel (IER). */
		myIowrite32(0x1, pReg + IESR/4);

		/* Clear any pending interrupt (IPR). */
		myIowrite32(0x1, pReg + ICR/4);

		/* Populate the Param entry. */
		myIowrite32(0x00100004, pReg + PARAM_0_OPT/4);    /* Enable SYNCDIM and TCINTEN, TCC = 0 */

		if (flag == 1) {
			/* Calculate the DSP PCI address for the PC address */
			tmp = PCIE_DATA + (dstAddr & ~PCIE_1MB_BITMASK);
			myIowrite32(tmp, pReg + PARAM_0_DST/4);
		} else {
			myIowrite32(dstAddr, pReg + PARAM_0_DST/4);
		}

		/* Calculate the A & B count */
		if (size > PCIE_TRANSFER_SIZE)  {
			tmp = size/PCIE_TRANSFER_SIZE;
			tSize = tmp*PCIE_TRANSFER_SIZE;
			size -= (tmp*PCIE_TRANSFER_SIZE);
			tmp <<= 16;
			tmp |= PCIE_TRANSFER_SIZE;
		}
		else {
			tmp = 0x10000|size;
			tSize = size;
			size = 0;
		}

		myIowrite32(tmp, pReg + PARAM_0_A_B_CNT/4);
		myIowrite32(srcAddr, pReg + PARAM_0_SRC/4);

		myIowrite32(((PCIE_TRANSFER_SIZE<<16)|PCIE_TRANSFER_SIZE), pReg + PARAM_0_SRC_DST_BIDX/4);
		myIowrite32(0xFFFF, pReg + PARAM_0_LINK_BCNTRLD/4);
		myIowrite32(0x0, pReg + PARAM_0_SRC_DST_CIDX/4);

		/* C Count is set to 1 since mostly size will not be more than 1.75GB */
		myIowrite32(0x1, pReg + PARAM_0_CCNT/4);

		/* Set the Event Enable Set Register. */
		myIowrite32(0x1, pReg + EESR/4);

		/* Set the event set register. */
		myIowrite32(0x1, pReg + ESR/4);

		/* wait for current DMA to finish. */
		while (true) {
			/* check in steps of 10 usec. */
			udelay(10);
			tmp = myIoread32(pReg + IPR/4);
			if ((tmp & 0x1) == 1) {
				break;
			}
		}

		if (size != 0) {
			srcAddr += tSize;
			dstAddr += tSize;
		} else {
			break;
		}
	} 

	/* Clear any pending interrupt. */
	myIowrite32(1, pReg + ICR/4);

	/* Restore pointer */
	pReg = (uint32_t *)regVirt;     /* Point to PCIE application registers */
	iowrite32(DDR_START, pReg + IB_OFFSET(3)/4); 
}

/* ============================================================================
 *  @func   HAL_writeDMA
 *
 *  @desc   Move DMAs contents from GPP memory to DSP Memory. For DSP this is
 *          outbound read.
 *  flag:   0: Move data inside DSP; 1: Move data between GPP and DSP
 *
 *  @modif  None.
 *  ============================================================================
 */
void HAL_writeDMA(uint32_t srcAddr, uint32_t dstAddr, uint32_t size, uint32_t flag)
{
	uint32_t *pReg, tmp, pageBase, i, tSize;

	pReg = (uint32_t *)regVirt;     /* Point to PCIE application registers */

	/* Move data between GPP and DSP, need to program PCIE OB registers */
	if (flag) { 
		iowrite32(0x0, pReg + OB_SIZE/4); /* 1MB outbound translation size */

		if (size <= PCIE_ADLEN_1MB) {
			pageBase = srcAddr & PCIE_1MB_BITMASK;
			iowrite32(pageBase|0x1, pReg + OB_OFFSET_INDEX(0)/4);
			iowrite32(0x0, pReg + OB_OFFSET_HI(0)/4);  
		}
		else {
			for (tmp = size, i = 0; tmp > 0; tmp -= PCIE_ADLEN_1MB, i++) {
				pageBase = (srcAddr + (PCIE_ADLEN_1MB * i)) & PCIE_1MB_BITMASK;
				iowrite32(pageBase|0x1, pReg + OB_OFFSET_INDEX(i)/4);
				iowrite32(0x0, pReg + OB_OFFSET_HI(i)/4);
			}
		}
	}

	/* Temporarily re-map IB region 3 from DDR memory to EDMA registers */
	iowrite32(EDMA_TPCC0_BASE_ADDRESS, pReg + IB_OFFSET(3)/4);  

	pReg = (uint32_t*)ddrVirt;   /* Now it points to the start of EDMA_TPCC0_BASE_ADDRESS */

	while (true) {
		/* Use TC0 for DBS = 128 bytes */
		myIowrite32(0x0, pReg + DMAQNUM0/4);                

		/* Set the interrupt enable for 1st Channel (IER). */
		myIowrite32(0x1, pReg + IESR/4);

		/* Clear any pending interrupt (IPR). */
		myIowrite32(0x1, pReg + ICR/4);

		/* Populate the Param entry. */
		myIowrite32(0x00100004, pReg + PARAM_0_OPT/4);    /* Enable SYNCDIM and TCINTEN, TCC = 0 */

		if (flag == 1) {
			/* Calculate the DSP PCI address for the PC address */
			tmp = PCIE_DATA + (srcAddr & ~PCIE_1MB_BITMASK);
			myIowrite32(tmp, pReg + PARAM_0_SRC/4);
		} else {
			myIowrite32(srcAddr, pReg + PARAM_0_SRC/4);
		}

		/* Calculate the A & B count */
		if (size > PCIE_TRANSFER_SIZE)  {
			tmp = size/PCIE_TRANSFER_SIZE;
			tSize = tmp*PCIE_TRANSFER_SIZE;
			size -= (tmp*PCIE_TRANSFER_SIZE);
			tmp <<= 16;
			tmp |= PCIE_TRANSFER_SIZE;
		}
		else {
			tmp = 0x10000|size;
			tSize = size;
			size = 0;
		}

		myIowrite32(tmp, pReg + PARAM_0_A_B_CNT/4);
		myIowrite32(dstAddr, pReg + PARAM_0_DST/4);

		myIowrite32(((PCIE_TRANSFER_SIZE<<16)|PCIE_TRANSFER_SIZE), pReg + PARAM_0_SRC_DST_BIDX/4);
		myIowrite32(0xFFFF, pReg + PARAM_0_LINK_BCNTRLD/4);
		myIowrite32(0x0, pReg + PARAM_0_SRC_DST_CIDX/4);

		/* C Count is set to 1 since mostly size will not be more than 1.75GB */
		myIowrite32(0x1, pReg + PARAM_0_CCNT/4);

		/* Set the Event Enable Set Register. */
		myIowrite32(0x1, pReg + EESR/4);

		/* Set the event set register. */
		myIowrite32(0x1, pReg + ESR/4);

		/* wait for current DMA to finish. */
		while (true) {
			/* check in steps of 10 usec. */
			udelay(10);
			tmp = myIoread32(pReg + IPR/4);
			if ((tmp & 0x1) == 1) {
				break;
			}
		}

		if (size != 0) {
			srcAddr += tSize;
			dstAddr += tSize;
		} else {
			break;
		}
	} 

	/* Clear any pending interrupt. */
	myIowrite32(1, pReg + ICR/4);

	/* Restore pointer */
	pReg = (uint32_t *)regVirt;     //Point to PCIE application registers
	iowrite32(DDR_START, pReg + IB_OFFSET(3)/4);  
}

/** ============================================================================
 *  @func   ISR_handler
 *
 *  @desc   ISR.
 *
 *  @modif  None.
 *  ============================================================================
 */
static irqreturn_t ISR_handler(int irq, void *arg) 
{
	uint32_t i, dma_failure_flag = 0, counter = 0;
	uint32_t status = HAL_CheckPciInterrupt();

	if (status == 1) {
		printk("Interrupt %d received from DSP\n", irq);
		printk("Read DMA from DSP ...\n");
		do_gettimeofday(&test_time3);
		HAL_readDMA(DDR_START, rData, DMA_TRANSFER_SIZE, 1);     /* Move from DSP to GPP */
		do_gettimeofday(&test_time4);

		for (i = 0; i < DMA_TRANSFER_SIZE; i++) {
			if ((~(rDataVirt[i])&0xFF) != wDataVirt[i]) {
				dma_failure_flag = 1;
				counter++;
			}
		}

		if (dma_failure_flag) 
			printk("DMA test failed with %d locations !\n", counter);
		else 
			printk("DMA test passed!\n");

		HAL_PciClearDspInterrupt();
		return IRQ_HANDLED;
	}
	return IRQ_NONE;
}

/* ============================================================================
 *  @func   byteto32bits 
 *
 *  @desc   Convert 4 bytes to 32 bits long word
 *
 *  @modif  None.
 *  ============================================================================
 */
uint32_t byteTo32bits(uint8_t *pDspCode)
{
	uint32_t i, temp;

	temp = *pDspCode++;
	for(i = 0; i < 3;i++) {
		temp <<= 8;
		temp |= *pDspCode++;
	}
	return(temp);
}

/* ============================================================================
 *  @func   swap4bytes
 *
 *  @desc   Endian swap: 0xA0B1C2D3 to 0xD3C2B1A0 
 *
 *  @modif  None.
 *  ============================================================================
 */
void swap4bytes(uint32_t *pDspCode, uint32_t size)
{
	uint32_t i, temp;

	for(i = 0; i < size; i += 4, pDspCode++) {
		temp = *pDspCode;
		temp = (temp>>24) |
			((temp<<8) & 0x00FF0000) |
			((temp>>8) & 0x0000FF00) |
			(temp<<24);

		*pDspCode = temp;
	}
}

/* ============================================================================
 *  @func   writeDSPMemory
 *
 *  @desc   Write a block of data into DSP memory from Linux host. 
 *          Note the data buffer is in 32-bit format, unit of length is byte. 
 *          coreNum: to write data: 0-7 for cores 0-7; 8 for MSMC; 9 for DDR.
 *
 *  @modif  None.
 *  ============================================================================
 */
uint32_t writeDSPMemory(uint32_t coreNum, uint32_t DSPMemAddr, uint32_t *buffer, uint32_t length) 
{
	uint32_t i, offset, tempReg = 0;
	uint32_t *ptr;

	if (length == 0) {
		return 0;
	}

	switch (coreNum) {
#if EVMC6678L
		case 0:
		case 1:
		case 2:
		case 3:
		case 4:
		case 5:
		case 6:
		case 7: 
#endif
#if EVMC6670L
		case 0:
		case 1:
		case 2:
		case 3:
#endif
#if EVMC6657L
		case 0:
		case 1:
#endif
			DSPMemAddr &= 0x00FFFFFF;
			tempReg = ioread32(ptrReg + IB_OFFSET(1)/4);
			iowrite32(tempReg + coreNum*0x01000000, ptrReg + IB_OFFSET(1)/4); /* pointing to a different core */

			if (DSPMemAddr < LL2_START) {
				return 0;
			} else {  
				offset = DSPMemAddr - LL2_START;
				ptr = (uint32_t *)memVirt + offset/4;
			}
			break;
		case 8:  /* this is for MSMC */
			if (DSPMemAddr < MSMC_START) {
				return 0;
			} else {
				offset = DSPMemAddr - MSMC_START;
				ptr = (uint32_t *)msmcVirt + offset/4;
			}		
			break;   
		case 9:  /* this is for DDR */
			if (DSPMemAddr < DDR_START) {
				return 0;
			} else {  
				offset = DSPMemAddr - DDR_START;
				ptr = (uint32_t *)ddrVirt + offset/4;
			}
			break; 
		default:
			printk("Use coreNum 0-7 for core 0-7 of EVMC6678L, or coreNum 0-3 for core 0-3 of EVMC6670L; coreNum 8 for MSMC and coreNum 9 for DDR.\n");
			return 0;
			break;
	}     

	for (i = 0; i < length/4; i++) {
#if BIG_ENDIAN
		swap4bytes(&buffer[i], 4);
#endif
		*ptr = buffer[i];
		ptr++; 
	}

	if ((coreNum >= 0)&&(coreNum <= 7)) {
		iowrite32(tempReg, ptrReg + IB_OFFSET(1)/4);  /* Restore IB_OFFSET1 */
	}

	return length;
}

/* ============================================================================
 *  @func   readDSPMemory
 *
 *  @desc   Read a block of DSP memory by Linux host. 
 *          Note the data buffer is in 32-bit format, unit of length is byte. 
 *          coreNum: to read data: 0-7 for cores 0-7; 8 for MSMC; 9 for DDR.
 *
 *  @modif  None.
 *  ============================================================================
 */
uint32_t readDSPMemory(uint32_t coreNum, uint32_t DSPMemAddr, uint32_t *buffer, uint32_t length) 
{
	uint32_t i, offset, tempReg = 0;
	uint32_t *ptr;

	if (length == 0) {
		return 0;
	}  

	switch (coreNum) {
#if EVMC6678L
		case 0:
		case 1:
		case 2:
		case 3:
		case 4:
		case 5:
		case 6:
		case 7: 
#endif
#if EVMC6670L
		case 0:
		case 1:
		case 2:
		case 3:
#endif
#if EVMC6657L
		case 0:
		case 1:
#endif
			DSPMemAddr &= 0x00FFFFFF;
			tempReg = ioread32(ptrReg + IB_OFFSET(1)/4);
			iowrite32(tempReg + coreNum*0x1000000, ptrReg + IB_OFFSET(1)/4);        /* pointing to a different core */
			if (DSPMemAddr < LL2_START) {
				return 0;
			} else {  
				offset = DSPMemAddr - LL2_START;
				ptr = (uint32_t *)memVirt + offset/4;
			}
			break;
		case 8:  /* this is for MSMC */
			if (DSPMemAddr < MSMC_START) {
				return 0;
			} else {                   
				offset = DSPMemAddr - MSMC_START;
				ptr = (uint32_t *)msmcVirt + offset/4;
			}
			break;   
		case 9:  /* this is for DDR */
			if (DSPMemAddr < DDR_START) {
				return 0;
			} else {                   
				offset = DSPMemAddr - DDR_START;
				ptr = (uint32_t *)ddrVirt + offset/4;
			}
			break; 
		default:
			printk("Use coreNum 0-7 for core 0-7 of EVMC6678L, or coreNum 0-3 for core 0-3 of EVMC6670L; coreNum 8 for MSMC and coreNum 9 for DDR.\n");
			return 0;
			break;
	}     

	for (i = 0; i < length/4; i++) {
		buffer[i] = *ptr;
#if BIG_ENDIAN
		swap4bytes(&buffer[i], 4);
#endif
		ptr++;
	}

	if ((coreNum >= 0)&&(coreNum <= 7)) {
		iowrite32(tempReg, ptrReg + IB_OFFSET(1)/4);  /* Restore IB_OFFSET1 */
	}

	return length;
}

/* ============================================================================
 *  @func   pushData
 *
 *  @desc   Parser function for DSP boot image array
 *
 *  @modif  None.
 *  ============================================================================
 */
void pushData(uint8_t *pDspCode, uint8_t coreNum, uint32_t *bootEntryAddr)
{
	uint32_t i, j, tempArray[BLOCK_TRANSFER_SIZE/4];
	uint32_t size, section = 0, totalSize = 0;
	uint32_t count, remainder, startAddr, temp;
	uint8_t newCoreNum;

	/* Get the boot entry address */
	*bootEntryAddr = byteTo32bits(pDspCode);
	printk("Boot entry address is 0x%8x\n", *bootEntryAddr);
	pDspCode +=4;

	while(1) {

		/* Get the size */
		size = byteTo32bits(pDspCode);
		if(size == 0) break;

		if ((size/4)*4 != size) {
			size = ((size/4)+1)*4;
		}

		totalSize += size;
		section++;
		pDspCode += 4;
		startAddr = byteTo32bits(pDspCode);

		/* In case there are several sections within different memory regions */
		temp = (startAddr & 0xFF000000) >> 24;

		if (temp == 0x00 || ((temp >> 4) == 0x1)) {
			if (coreNum < 8) {
				/* Write address like 0x00800000 to core 1, 2, ... */
				newCoreNum = coreNum;
			} else {
				newCoreNum = 0;
			}
		} else if (temp == 0x0C) {
			newCoreNum = 8;
		} else {
			newCoreNum = 9;
		}

		pDspCode+= 4;
		count = size/BLOCK_TRANSFER_SIZE;
		remainder = size - count * BLOCK_TRANSFER_SIZE;

		for(i = 0; i < count; i++) {
			for (j = 0; j < BLOCK_TRANSFER_SIZE/4; j++) {
				tempArray[j] = byteTo32bits(pDspCode);
				pDspCode += 4;
			}
			/* Transfer boot tables to DSP */
			writeDSPMemory(newCoreNum, startAddr, tempArray, BLOCK_TRANSFER_SIZE); 
			startAddr += BLOCK_TRANSFER_SIZE;
		}

		for (j = 0; j < remainder/4; j++) {
			tempArray[j] = byteTo32bits(pDspCode);
			pDspCode += 4;
		}
		writeDSPMemory(newCoreNum, startAddr, tempArray, remainder); 
		// printk("Section %d started at 0x%8x with size 0x%8x bytes written to core %d\n", section, startAddr, size, newCoreNum);
	}
	printk("Total %d sections, 0x%x bytes of data were written\n", section, totalSize);
}


#if LOCAL_RESET
/* ============================================================================
 *  @func   coreLocalReset
 *
 *  @desc   Reset a particular CorePac, 6678 Data Manual, section 7.4.4
 *          initiated by LPSC MMRs
 *
 *  @modif  None.
 *  ============================================================================
 */
void coreLocalReset(uint32_t pid, uint32_t mid, uint32_t state) 
{
	uint32_t *pReg, temp, counter = 0;

	/* Point to PCIE application registers */
	pReg = (uint32_t *)regVirt; 
	/* Set MST_PRIV bit to access PSC via PCIE */
	iowrite32(((ioread32(pReg + PRIORITY/4))|0x00010000), pReg + PRIORITY/4);    

	/* Temporarily re-map IB region 3 from DDR memory to PSC registers */
	iowrite32(PSC_BASE_ADDRESS, pReg + IB_OFFSET(3)/4);  
	/* Now it points to the start of PSC_BASE_ADDRESS */
	pReg = (uint32_t*)ddrVirt;   

	temp = myIoread32(pReg + MDCTL(mid)/4);
	if (state == 0) {
		/* Reset assert */
		temp = ((temp & ~0x1F) | PSC_ENABLE) & (~0x100);
		printk("Start local reset assert for core (module id): %d ...\n", mid);
	} else 	{
		/* Reset de-assert */
		temp = (temp & ~0x1F) | PSC_ENABLE | (1 << 8);
		printk("Start local reset de-assert for core (module id): %d ...\n", mid);
	}

	myIowrite32(temp, pReg + MDCTL(mid)/4);    /* Assert/De-assert local reset */

	/* No previous transition in progress */
	counter = 0;
	while (true) {
		temp = myIoread32(pReg + PTSTAT/4);
		if ((temp & (1 << pid)) == 0) break;
		mdelay(1);
		counter ++;
		if (counter > 10) {
			printk("Previous transition in progress pid %d mid %d state: %d\n", pid, mid, state);
			break;
		}
	}

	myIowrite32((1 << pid), pReg + PTCMD/4); 

	/* Current transition finished */
	counter = 0;
	while (true) {
		temp = myIoread32(pReg + PTSTAT/4);
		if ((temp & (1 << pid)) == 0) break;
		mdelay(1);
		counter ++;
		if (counter > 10) {
			printk("Current transition in progress pid %d mid %d state: %d\n", pid, mid, state);
			break;
		}
	}

	/* Verifying state change */
	counter = 0;
	while (true) {
		temp = myIoread32(pReg + MDSTAT(mid)/4);
		if ((temp & 0x1F) == 3) break;
		mdelay(1);
		counter ++;
		if (counter > 10) {
			printk("MD stat for pid %d mid %d state: %d timeout\n", pid, mid, state);
			break;
		}
	}

	/* Restore pointer */
	pReg = (uint32_t *)regVirt;     /* Point to PCIE application registers */
	iowrite32(DDR_START, pReg + IB_OFFSET(3)/4);  
}

/* ============================================================================
 *  @func   setPscState
 *
 *  @desc   Set a new power state for the specified domain id in a power controler
 *          domain. Wait for the power transition to complete.
 *
 *      pid   -  power domain.
 *      mid   -  module id to use for module in the specified power domain
 *      state -  new state value to set (0 = RESET; 3 = ENABLE)
 *
 *  @modif  None.
 *  ============================================================================
 */
void setPscState(uint32_t pid, uint32_t mid, uint32_t state)
{
	uint32_t *pReg, mdctl, pdctl, temp, counter = 0;

	/* Point to PCIE application registers */
	pReg = (uint32_t *)regVirt; 
	/* Set MST_PRIV bit to access PSC via PCIE */
	iowrite32(((ioread32(pReg + PRIORITY/4))|0x00010000), pReg + PRIORITY/4);    

	/* Temporarily re-map IB region 3 from DDR memory to PSC registers */
	iowrite32(PSC_BASE_ADDRESS, pReg + IB_OFFSET(3)/4);  
	/* Now it points to the start of PSC_BASE_ADDRESS */
	pReg = (uint32_t*)ddrVirt;   

	mdctl = myIoread32(pReg + MDCTL(mid)/4);
	pdctl = myIoread32(pReg + PDCTL(pid)/4);

	/* No previous transition in progress */
	counter = 0;
	while (true) {
		temp = myIoread32(pReg + PTSTAT/4);
		if ((temp & (1 << pid)) == 0) break;
		mdelay(1);
		counter ++;
		if (counter > 10) {
			printk("Previous transition in progress pid %d mid %d state: %d\n", pid, mid, state);
			break;
		}
	}

	/* Set power domain control */
	myIowrite32(pdctl | 0x1, pReg + PDCTL(pid)/4);

	/* Set MDCTL NEXT to new state */
	mdctl = ((mdctl) & ~(0x1f)) | state;
	myIowrite32(mdctl, pReg + MDCTL(mid)/4);

	/* Start power transition by setting PTCMD GO to 1 */
	temp = myIoread32(pReg + PTCMD/4);
	myIowrite32(temp | (0x1<<pid), pReg + PTCMD/4);

	/* Current transition finished */
	counter = 0;
	while (true) {
		temp = myIoread32(pReg + PTSTAT/4);
		if ((temp & (1 << pid)) == 0) break;
		mdelay(1);
		counter ++;
		if (counter > 10) {
			printk("Current transition in progress pid %d mid %d state: %d\n", pid, mid, state);
			break;
		}
	}

	/* Verifying state change */
	counter = 0;
	while (true) {
		temp = myIoread32(pReg + MDSTAT(mid)/4);
		if ((temp & 0x1F) == state) break;
		mdelay(1);
		counter ++;
		if (counter > 10) {
			printk("MD stat for pid %d mid %d state: %d timeout\n", pid, mid, state);
			break;
		}
	}

	/* Restore pointer */
	pReg = (uint32_t *)regVirt;     /* Point to PCIE application registers */
	iowrite32(DDR_START, pReg + IB_OFFSET(3)/4);  
}

/* ============================================================================
 *  @func   setBootAddrIpcgr
 *
 *  @desc   Write boot entry point into DSP_BOOT_ADDR0 and the send an IPC
 *
 *  @modif  None.
 *  ============================================================================
 */
uint32_t setBootAddrIpcgr(uint32_t core, uint32_t addr)  
{
	uint32_t *pReg;
	/* Point to PCIE application registers */
	pReg = (uint32_t *)regVirt; 
	/* Set MST_PRIV bit to access PSC via PCIE */
	iowrite32(((ioread32(pReg + PRIORITY/4))|0x00010000), pReg + PRIORITY/4);    

	/* Temporarily re-map IB region 3 from DDR memory to chip level registers */
	iowrite32(CHIP_LEVEL_BASE_ADDRESS, pReg + IB_OFFSET(3)/4);  
	/* Now it points to the start of CHIP_LEVEL_BASE_ADDRESS */
	pReg = (uint32_t*)ddrVirt; 

	/* Unlock KICK0, KICK1 */
	myIowrite32(KICK0_UNLOCK, pReg + KICK0/4); 
	myIowrite32(KICK1_UNLOCK, pReg + KICK1/4);

	/* Check if the last 10 bits of addr is 0 */
	if ((addr & 0x3f) != 0) {
		printk("The address is not 1K aligned.\n");
		return 0;
	}

	myIowrite32(addr, pReg + DSP_BOOT_ADDR(core)/4);
	myIowrite32(1, pReg + IPCGR(core)/4);  

	mdelay(1); 

	/* Restore pointer */
	pReg = (uint32_t *)regVirt;     /* Point to PCIE application registers */
	iowrite32(DDR_START, pReg + IB_OFFSET(3)/4);  

	return 1;
}

/* ============================================================================
 *  @func   dspLocalReset
 *
 *  @desc   Perform DSP cores and periphrals reset
 *
 *  @modif  None.
 *  ============================================================================
 */
void dspLocalReset(void) 
{
	uint32_t i, bootEntryAddr = 0;

#if EVMC6670L
	/* Local reset of all cores */
	coreLocalReset(PD13, LPSC_C0_TIM0, LOC_RST_ASSERT);
	coreLocalReset(PD14, LPSC_C1_TIM1, LOC_RST_ASSERT);
	coreLocalReset(PD15, LPSC_C2_TIM2, LOC_RST_ASSERT);
	coreLocalReset(PD16, LPSC_C3_TIM3, LOC_RST_ASSERT);

	/* Disable all other modules */
	setPscState(PD0, LPSC_TCP3E, PSC_SWRSTDISABLE);
	setPscState(PD0, LPSC_VCP2A, PSC_SWRSTDISABLE);
	setPscState(PD1, LPSC_DEBUG, PSC_SWRSTDISABLE);
	setPscState(PD1, LPSC_TETB, PSC_SWRSTDISABLE);
	setPscState(PD2, LPSC_SA, PSC_SWRSTDISABLE);
	setPscState(PD2, LPSC_SGMII, PSC_SWRSTDISABLE);
	setPscState(PD2, LPSC_PA, PSC_SWRSTDISABLE);
	//setPscState(PD3, LPSC_PCIE, PSC_SWRSTDISABLE);
	setPscState(PD4, LPSC_SRIO, PSC_SWRSTDISABLE);
	setPscState(PD5, LPSC_HYPER, PSC_SWRSTDISABLE);
	//setPscState(PD6, LPSC_RESERV, PSC_SWRSTDISABLE);
	setPscState(PD7, LPSC_MSMCRAM, PSC_SWRSTDISABLE);
	setPscState(PD8, LPSC_RACA_RACB, PSC_SWRSTDISABLE);
	setPscState(PD8, LPSC_TAC, PSC_SWRSTDISABLE);
	setPscState(PD9, LPSC_FFTCA_FFTCB, PSC_SWRSTDISABLE);
	setPscState(PD10, LPSC_AIF2, PSC_SWRSTDISABLE);
	setPscState(PD11, LPSC_TCP3DA, PSC_SWRSTDISABLE);
	setPscState(PD12, LPSC_VCP2B, PSC_SWRSTDISABLE);
	setPscState(PD12, LPSC_VCP2C, PSC_SWRSTDISABLE);
	setPscState(PD12, LPSC_VCP2D, PSC_SWRSTDISABLE);
	setPscState(PD17, LPSC_TCP3dB, PSC_SWRSTDISABLE);

	for (i = 0; i < 4; i++) {
		pushData(localResetCode, i, &bootEntryAddr);
		if (setBootAddrIpcgr(i, bootEntryAddr) == 0) {
			printk("Core %d is not ready !!! \n", i);
		}
	}

	/* Enable all other modules */
	setPscState(PD0, LPSC_TCP3E, PSC_ENABLE);
	setPscState(PD0, LPSC_VCP2A, PSC_ENABLE);
	setPscState(PD1, LPSC_DEBUG, PSC_ENABLE);
	setPscState(PD1, LPSC_TETB, PSC_ENABLE);
	setPscState(PD2, LPSC_PA, PSC_ENABLE);
	setPscState(PD2, LPSC_SGMII, PSC_ENABLE);
	setPscState(PD2, LPSC_SA, PSC_ENABLE);
	//setPscState(PD3, LPSC_PCIE, PSC_ENABLE);
	setPscState(PD4, LPSC_SRIO, PSC_ENABLE);
	setPscState(PD5, LPSC_HYPER, PSC_ENABLE);
	//setPscState(PD6, LPSC_RESERV, PSC_ENABLE);
	setPscState(PD7, LPSC_MSMCRAM, PSC_ENABLE);
	setPscState(PD8, LPSC_RACA_RACB, PSC_ENABLE);
	setPscState(PD8, LPSC_TAC, PSC_ENABLE);
	setPscState(PD9, LPSC_FFTCA_FFTCB, PSC_ENABLE);
	setPscState(PD10, LPSC_AIF2, PSC_ENABLE);
	setPscState(PD11, LPSC_TCP3DA, PSC_ENABLE);
	setPscState(PD12, LPSC_VCP2B, PSC_ENABLE);
	setPscState(PD12, LPSC_VCP2C, PSC_ENABLE);
	setPscState(PD12, LPSC_VCP2D, PSC_ENABLE);
	setPscState(PD17, LPSC_TCP3dB, PSC_ENABLE);	

	/* Local out of reset of all cores */
	coreLocalReset(PD13, LPSC_C0_TIM0, LOC_RST_DEASSERT);
	coreLocalReset(PD14, LPSC_C1_TIM1, LOC_RST_DEASSERT);
	coreLocalReset(PD15, LPSC_C2_TIM2, LOC_RST_DEASSERT);
	coreLocalReset(PD16, LPSC_C3_TIM3, LOC_RST_DEASSERT);
#endif

#if EVMC6678L
	/* Local reset of all cores */
	coreLocalReset(PD8,  LPSC_C0_TIM0, LOC_RST_ASSERT);
	coreLocalReset(PD9,  LPSC_C1_TIM1, LOC_RST_ASSERT);
	coreLocalReset(PD10, LPSC_C2_TIM2, LOC_RST_ASSERT);
	coreLocalReset(PD11, LPSC_C3_TIM3, LOC_RST_ASSERT);
	coreLocalReset(PD12, LPSC_C4_TIM4, LOC_RST_ASSERT);
	coreLocalReset(PD13, LPSC_C5_TIM5, LOC_RST_ASSERT);
	coreLocalReset(PD14, LPSC_C6_TIM6, LOC_RST_ASSERT);
	coreLocalReset(PD15, LPSC_C7_TIM7, LOC_RST_ASSERT);

	/* Disable all other modules */
	setPscState(PD0, LPSC_EMIF16_SPI, PSC_SWRSTDISABLE);
	setPscState(PD0, LPSC_TSIP, PSC_SWRSTDISABLE);
	setPscState(PD1, LPSC_DEBUG, PSC_SWRSTDISABLE);
	setPscState(PD1, LPSC_TETB_TRC, PSC_SWRSTDISABLE);
	setPscState(PD2, LPSC_SA, PSC_SWRSTDISABLE);
	setPscState(PD2, LPSC_SGMII, PSC_SWRSTDISABLE);
	setPscState(PD2, LPSC_PA, PSC_SWRSTDISABLE);
	//setPscState(PD3, LPSC_PCIE, PSC_SWRSTDISABLE);
	setPscState(PD4, LPSC_SRIO, PSC_SWRSTDISABLE);
	setPscState(PD5, LPSC_HYPER, PSC_SWRSTDISABLE);
	//setPscState(PD6, LPSC_RESERV, PSC_SWRSTDISABLE);
	setPscState(PD7, LPSC_MSMCRAM, PSC_SWRSTDISABLE);

	for (i = 0; i < 8; i++) {
		pushData(localResetCode, i, &bootEntryAddr);
		if (setBootAddrIpcgr(i, bootEntryAddr) == 0) {
			printk("Core %d is not ready !!! \n", i);
		}
	}

	/* Enable all other modules */
	setPscState(PD0, LPSC_EMIF16_SPI, PSC_ENABLE);
	setPscState(PD0, LPSC_TSIP, PSC_ENABLE);
	setPscState(PD1, LPSC_DEBUG, PSC_ENABLE);
	setPscState(PD1, LPSC_TETB_TRC, PSC_ENABLE);
	setPscState(PD2, LPSC_PA, PSC_ENABLE);
	setPscState(PD2, LPSC_SGMII, PSC_ENABLE);
	setPscState(PD2, LPSC_SA, PSC_ENABLE);
	//setPscState(PD3, LPSC_PCIE, PSC_ENABLE);
	setPscState(PD4, LPSC_SRIO, PSC_ENABLE);
	setPscState(PD5, LPSC_HYPER, PSC_ENABLE);
	//setPscState(PD6, LPSC_RESERV, PSC_ENABLE);
	setPscState(PD7, LPSC_MSMCRAM, PSC_ENABLE);

	/* Local out of reset of all cores */
	coreLocalReset(PD8,  LPSC_C0_TIM0, LOC_RST_DEASSERT);
	coreLocalReset(PD9,  LPSC_C1_TIM1, LOC_RST_DEASSERT);
	coreLocalReset(PD10, LPSC_C2_TIM2, LOC_RST_DEASSERT);
	coreLocalReset(PD11, LPSC_C3_TIM3, LOC_RST_DEASSERT);
	coreLocalReset(PD12, LPSC_C4_TIM4, LOC_RST_DEASSERT);
	coreLocalReset(PD13, LPSC_C5_TIM5, LOC_RST_DEASSERT);
	coreLocalReset(PD14, LPSC_C6_TIM6, LOC_RST_DEASSERT);
	coreLocalReset(PD15, LPSC_C7_TIM7, LOC_RST_DEASSERT);
#endif
}

#endif   
/* ============================================================================
 *  @func   init_module
 *
 *  @desc   Initialize a loadable module 
 *
 *  @modif  None.
 *  ============================================================================
 */
int init_module(void)
{
	uint32_t i; 
	uint32_t bootEntryAddr = 0;              /* Store 32-bit boot entry address read from .h file */
#if HELLO_WORLD_DEMO | EDMA_INTC_DEMO
	uint32_t buffer[BLOCK_TRANSFER_SIZE/4];  /* Store 32-bit DSP memory readback data */
#endif 

#if EDMA_INTC_DEMO
	uint32_t diff;
#endif

	printk ("Finding the device....\n") ;
	PCI_FindPciDevices();
	if (!PCIE_DEV) {
		printk ("No PCIE device found!!!\n") ;
	}

	if (PCIE_DEV != NULL) {

		printk("Reading the BAR areas....\n");
		PCI_readBAR();

		printk("Enabling the device....\n");
		/* Linux Function: Initialize device before it's used by a driver */
		pci_enable_device(PCIE_DEV);

		/* Linux Function: Associates the given data with the given pci_driver structure */
		pci_set_drvdata(PCIE_DEV, memVirt);

		PCI_setMaster();

		printk("Access PCIE application register ....\n");
		/* Pointing to the beginning of the application registers */
		ptrReg = (uint32_t *)regVirt;

		/* Configure IB_BAR0 to BAR0 for PCIE registers; Configure IB_BAR1 to BAR1 for LL2 for core 0
		   Configure IB_BAR2 to BAR2 for MSMC; Configure IB_BAR3 to BAR3 for DDR */
		for (i = 0; i < 4; i++) {
			iowrite32(i, ptrReg + IB_BAR(i)/4);     
			iowrite32(PCIE_DEV->resource[i].start, ptrReg + IB_START_LO(i)/4);    
			iowrite32(0, ptrReg + IB_START_HI(i)/4);
		}     
		iowrite32(PCIE_BASE_ADDRESS, ptrReg + IB_OFFSET(0)/4);    
		iowrite32(LL2_START + (1 << 28), ptrReg + IB_OFFSET(1)/4);    
		iowrite32(MSMC_START, ptrReg + IB_OFFSET(2)/4);  
		iowrite32(DDR_START, ptrReg + IB_OFFSET(3)/4); 

		printk("Registering the irq %d ...\n", irqNo);
		request_irq(irqNo, ISR_handler, IRQF_SHARED, "TI 667x PCIE", &dummy);
		HAL_PciEnableDspInterrupt();

#if HELLO_WORLD_DEMO
		/* Load DDR init code into DSP */
		pushData(ddrInitCode, 0, &bootEntryAddr);

		/* Write boot entry address into MAGIC_ADDR */
		writeDSPMemory(0, MAGIC_ADDR, &bootEntryAddr, 4);       

		while (1) {
			readDSPMemory(0, MAGIC_ADDR, buffer, 4);
			if (buffer[0] == 0)  break;
			for (i = 0; i < 1000; i++) i++;
		} 

		/* Load "Hello World" demo into DSP */
		pushData(bootCode, 9, &bootEntryAddr);

		/* Write boot entry address into MAGIC_ADDR */
		writeDSPMemory(0, MAGIC_ADDR, &bootEntryAddr, 4);
#endif

#if POST_DEMO
		/* Load POST demo code into DSP */
		pushData(post, 0, &bootEntryAddr);

		/* Write boot entry address into MAGIC_ADDR */
		writeDSPMemory(0, MAGIC_ADDR, &bootEntryAddr, 4);       
#endif

#if EDMA_INTC_DEMO

		printk("Allocating consistent memory ...\n"); 
		wDataVirt = (uint8_t*)dma_alloc_coherent(&PCIE_DEV->dev, DMA_TRANSFER_SIZE, &wData, GFP_KERNEL);
		rDataVirt = (uint8_t*)dma_alloc_coherent(&PCIE_DEV->dev, DMA_TRANSFER_SIZE, &rData, GFP_KERNEL);

		for (i = 0; i < DMA_TRANSFER_SIZE; i++) {
			wDataVirt[i] = i;
			rDataVirt[i] = 0;
		}

		/* Load Interrupt demo code into DSP */
		pushData(pcieInterrupt, 0, &bootEntryAddr);

		/* Write boot entry address into MAGIC_ADDR */
		writeDSPMemory(0, MAGIC_ADDR, &bootEntryAddr, 4);       

		while (1) {
			readDSPMemory(0, MAGIC_ADDR, buffer, 4);
			if (buffer[0] == 0)  break;
			for (i = 0; i < 1000; i++) i++;
		} 

		/* Wait 2 second for DDR init */
		mdelay(2000);

		printk ("Write DMA to DSP ...\n");
		do_gettimeofday(&test_time1);
		HAL_writeDMA (wData, DDR_START, DMA_TRANSFER_SIZE, 1);   /* Move from GPP to DSP */ 
		do_gettimeofday(&test_time2);

		/* Note: From PCIE specification, legacy interrupts cannot be generated from RC and be passed downstream. 
		   The example below is just making use of the facility that RC can access EP side register to generate 
		   a generic interrupt on local (EP) side using one of the event inputs of Interrupt Controller (INTC). 
		   There is no real interrupt signal sent over the PCIe link */
		printk ("Generating interrupt to DSP ...\n");
		iowrite32(1, ptrReg + LEGACY_A_IRQ_STATUS_RAW/4); 

		/* Waiting DSP ISR handler to process the interrupt from DSP and then generates an interrupt to host
		   Waiting for host ISR handler to process the interrupt from DSP before program exits */ 
		mdelay(1000);

		/* For demo how to move inside DSP purpose only, you can directly move between GPP and DSP using flag = 1 */
		//	HAL_writeDMA (0x80000000, 0x11800000, 0x10000, 0);        
		//	HAL_writeDMA (0x11800000, 0x0C000000, 0x10000, 0);

		diff = (test_time2.tv_sec - test_time1.tv_sec)*1000000 + (test_time2.tv_usec - test_time1.tv_usec);
		printk("DMA write throughput is: %d.%02d MB/s\n", DMA_TRANSFER_SIZE/(1024*1024)*1000*1000/diff, 
				((DMA_TRANSFER_SIZE/(1024*1024)*1000*1000)%diff)*100/diff);

		diff = (test_time4.tv_sec - test_time3.tv_sec)*1000000 + (test_time4.tv_usec - test_time3.tv_usec);
		printk("DMA read throughput is: %d.%02d MB/s\n", DMA_TRANSFER_SIZE/(1024*1024)*1000*1000/diff, 
				((DMA_TRANSFER_SIZE/(1024*1024)*1000*1000)%diff)*100/diff);

		printk("Freeing consistent memory ...\n");
		dma_free_coherent(&PCIE_DEV->dev, DMA_TRANSFER_SIZE, wDataVirt, wData);
		dma_free_coherent(&PCIE_DEV->dev, DMA_TRANSFER_SIZE, rDataVirt, rData);
#endif

#if LOCAL_RESET
		mdelay(10000);
		dspLocalReset();
#endif
	}
	else {
		printk("No PCIE device found!!!\n");
	}
	return 0 ;
}

/* ============================================================================
 *  @func   cleanup_module
 *
 *  @desc   Unregister a loadable module 
 *
 *  @modif  None.
 *  ============================================================================
 */

void cleanup_module(void)
{

	if (PCIE_DEV != NULL) {
		HAL_PciDisableDspInterrupt();
		/* ---------------------------------------------------------------------
		 * Unmap baseRegs region & release the reg region.
		 * ---------------------------------------------------------------------
		 */
		iounmap(regVirt);
		if (pci_resource_flags(PCIE_DEV, 0) & IORESOURCE_MEM) {
			/* Map the memory region. */
			release_mem_region(regBase, regLen);
		}
		else {
			/* Map the memory region. */
			release_region(regBase, regLen);
		}

		/* ---------------------------------------------------------------------
		 * Unmap LL2 region & release the reg region.
		 * ---------------------------------------------------------------------
		 */
		iounmap(memVirt);
		if (pci_resource_flags(PCIE_DEV, 1) & IORESOURCE_MEM) {
			/* Map the memory region. */
			release_mem_region(memBase, memLen);
		}
		else {
			/* Map the memory region. */
			release_region(memBase,	memLen);
		}

		/* ---------------------------------------------------------------------
		 * Unmap MSMC region & release the reg region.
		 * ---------------------------------------------------------------------
		 */
		iounmap(msmcVirt);
		if (pci_resource_flags(PCIE_DEV, 2) & IORESOURCE_MEM) {
			/* Map the memory region. */
			release_mem_region(msmcBase, msmcLen);
		}
		else {
			/* Map the memory region. */
			release_region(msmcBase, msmcLen);
		}

		/* ---------------------------------------------------------------------
		 * Unmap DDR region & release the reg region.
		 * ---------------------------------------------------------------------
		 */
		iounmap(ddrVirt);
		if (pci_resource_flags(PCIE_DEV, 3) & IORESOURCE_MEM) {
			/* Map the memory region. */
			release_mem_region(ddrBase, ddrLen);
		}
		else {
			/* Map the memory region. */
			release_region(ddrBase, ddrLen);
		}

		free_irq(irqNo, &dummy);
	}
}

