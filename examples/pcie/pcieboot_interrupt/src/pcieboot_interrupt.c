/******************************************************************************
* Copyright (c) 2011 Texas Instruments Incorporated - http://www.ti.com
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
*    Neither the name of Texas Instruments Incorporated emac the names of
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
*****************************************************************************/

/**************************************************************************************
* FILE PURPOSE: PCIe Boot Interrupt Example
**************************************************************************************
* FILE NAME: pcieboot_interrupt.c
*
* DESCRIPTION: A simple interrupt example demonstrating PCIe boot.
*
***************************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "platform.h"

#include <ti/csl/src/intc/csl_intc.h>
#include <ti/csl/tistdtypes.h>
#include <ti/csl/csl_cpIntcAux.h>

#define DEVICE_REG32_W(x,y)   *(volatile uint32_t *)(x)=(y)
#define DEVICE_REG32_R(x)    (*(volatile uint32_t *)(x))

#define DDR_TEST_START                 0x80000000
#define DDR_TEST_END                   0x80400000
#define BOOT_UART_BAUDRATE                 115200
#define PCIEXpress_Legacy_INTA                 50
#define PCIE_IRQ_EOI                   0x21800050
#define PCIE_EP_IRQ_SET		           0x21800064
#define PCIE_LEGACY_A_IRQ_STATUS       0x21800184

#ifdef _EVMC6678L_
#define MAGIC_ADDR     0x87fffc
#define INTC0_OUT3     63 
#endif

#ifdef _EVMC6670L_
#define MAGIC_ADDR     0x8ffffc
#define INTC0_OUT3     59 
#endif

/**********************************************************************
 ************************** Global Variables **************************
 **********************************************************************/
/* Intc variable declaration */
CSL_CPINTC_Handle           hnd;
CSL_IntcContext             intcContext;
CSL_IntcEventHandlerRecord  EventHandler[30];
CSL_IntcObj                 intcObj;
CSL_IntcHandle              hTest;
CSL_IntcGlobalEnableState   state;
CSL_IntcEventHandlerRecord  EventRecord;
CSL_IntcParam               vectId;

uint32_t counter = 0;

void write_uart(char* msg)
{
    uint32_t i;
    uint32_t msg_len = strlen(msg);

    /* Write the message to the UART */
    for (i = 0; i < msg_len; i++)
    {
        platform_uart_write(msg[i]);
    }
}

void start_boot(void)
{
    void (*exit)();
    uint32_t entry_addr;

    /* Clear the boot entry address */
    DEVICE_REG32_W(MAGIC_ADDR, 0);

    while(1)
    {
        entry_addr = DEVICE_REG32_R(MAGIC_ADDR);
        if (entry_addr != 0)
        {
            /* jump to the exit point, which will be the entry point for the full IBL */
            exit = (void (*)())entry_addr;
            (*exit)();
        }
        platform_delay(1);
    }
}

/**********************************************************************
 ************************ CPINTC TEST FUNCTIONS ***********************
 **********************************************************************/

/**
 *  @b Description
 *  @n
 *      This is the TEST ISR Handler which has been installed.
 *      This simply increments a global variable which counts
 *      the number of interrupts which have been received.
 *
 *  @retval
 *      Not Applicable.
 */
static void test_isr_handler(void* handle)
{
	uint32_t i;

	counter++;
	printf    ("DSP receives interrupt from host.\n");
	write_uart("DSP receives interrupt from host.\n\r");

	/* Disable host interrupt */
	CSL_CPINTC_disableHostInterrupt (hnd, 3);

    /* do a simple operation in the DDR data */
    for (i = DDR_TEST_START; i < DDR_TEST_END; i += 4)
		*(uint32_t *)i = ~(*(uint32_t *)i);
	
	/* clear PCIE interrupt */
    DEVICE_REG32_W(PCIE_LEGACY_A_IRQ_STATUS, 0x1);
    DEVICE_REG32_W(PCIE_IRQ_EOI, 0x0);
    CSL_CPINTC_clearSysInterrupt (hnd, PCIEXpress_Legacy_INTA);

    /* Enable host interrupt */
    CSL_CPINTC_enableHostInterrupt (hnd, 3);

    /* generate interrupt to host */
	*((uint32_t *)PCIE_EP_IRQ_SET) = 0x1;
	printf    ("DSP generates interrupt to host.\n");
	write_uart("DSP generates interrupt to host.\n\r");
}	

/* OSAL functions for Platform Library */
uint8_t *Osal_platformMalloc (uint32_t num_bytes, uint32_t alignment)
{
	return malloc(num_bytes);
}

void Osal_platformFree (uint8_t *dataPtr, uint32_t num_bytes)
{
    /* Free up the memory */
    if (dataPtr)
    {
        free(dataPtr);
    }
}

void Osal_platformSpiCsEnter(void)
{
    return;
}

void Osal_platformSpiCsExit (void)
{
    return;
}

/**
 *  @b Description
 *  @n
 *      Entry point for the test code.
 *
 *  @retval
 *      Not Applicable.
 */
void main (void)
{
	platform_init_flags     init_flags;
    platform_init_config    init_config;

    /* Initialize main Platform lib */
    memset(&init_config, 0, sizeof(platform_init_config));
    memset(&init_flags, 1, sizeof(platform_init_flags));

    platform_init(&init_flags, &init_config);

	/* Initialize UART */
	platform_uart_init();
    platform_uart_set_baudrate(BOOT_UART_BAUDRATE);

    DEVICE_REG32_W(MAGIC_ADDR, 0);
    DEVICE_REG32_W(PCIE_LEGACY_A_IRQ_STATUS, 0x1);

    /************************************************
     *************** INTC Configuration *************
     ************************************************/
    write_uart("Debug: GEM-INTC Configuration...\n\r");

    /* INTC module initialization */
    intcContext.eventhandlerRecord = EventHandler;
    intcContext.numEvtEntries      = 10;
    if (CSL_intcInit(&intcContext) != CSL_SOK)
    {
        write_uart("Error: GEM-INTC initialization failed n\r");
        return;
    }

    /* Enable NMIs */
    if (CSL_intcGlobalNmiEnable() != CSL_SOK)
    {
    	write_uart("Error: GEM-INTC global NMI enable failed n\r");
        return;
    }

    /* Enable global interrupts */
    if (CSL_intcGlobalEnable(&state) != CSL_SOK)
    {
    	write_uart("Error: GEM-INTC global enable failed \n\r");
        return;
    }

    /* Open the INTC Module for Vector ID: 4 and Event ID: 63 (C6678) 59 (C6670)
     * 	Refer to the interrupt architecture and mapping document for the Event ID  (INTC0_OUT3)*/
    vectId = CSL_INTC_VECTID_4;
    hTest = CSL_intcOpen (&intcObj, INTC0_OUT3, &vectId , NULL);
    if (hTest == NULL)
    {
    	write_uart("Error: GEM-INTC Open failed\n\r");
        return;
    }

    /* Register an call-back handler which is invoked when the event occurs. */
    EventRecord.handler = &test_isr_handler;
    EventRecord.arg = 0;
    if (CSL_intcPlugEventHandler(hTest,&EventRecord) != CSL_SOK)
    {
    	write_uart("Error: GEM-INTC Plug event handler failed\n\r");
        return;
    }

    /* Enabling the events. */
    if (CSL_intcHwControl(hTest,CSL_INTC_CMD_EVTENABLE, NULL) != CSL_SOK)
    {
    	write_uart("Error: GEM-INTC CSL_INTC_CMD_EVTENABLE command failed\n\r");
        return;
    }

    write_uart("Debug: GEM-INTC Configuration Completed \n\r");

    /**************************************************
     ************* CPINTC-0 Configuration *************
     **************************************************/

    write_uart("Debug: CPINTC-0 Configuration...\n\r");

    /* Open the handle to the CPINT Instance */
    hnd = CSL_CPINTC_open(0);
    if (hnd == 0)
    {
    	write_uart("Error: Unable to open CPINTC-0\n\r");
        return;
    }

    /* Disable all host interrupts. */
    CSL_CPINTC_disableAllHostInterrupt(hnd);

    /* Configure no nesting support in the CPINTC Module. */
    CSL_CPINTC_setNestingMode (hnd, CPINTC_NO_NESTING);

   	/* We now map System Interrupt 0 - 3 to channel 3 */
  	CSL_CPINTC_mapSystemIntrToChannel (hnd, PCIEXpress_Legacy_INTA, 3);

   	/* We now enable system interrupt 0 - 3 */
   	CSL_CPINTC_enableSysInterrupt (hnd, PCIEXpress_Legacy_INTA);

   	/* We enable host interrupts. */
   	CSL_CPINTC_enableHostInterrupt (hnd, 3);

   	/* Enable all host interrupts also. */
   	CSL_CPINTC_enableAllHostInterrupt(hnd);

   	write_uart("Debug: CPINTC-0 Configuration Completed\n\r");

    start_boot();
}
