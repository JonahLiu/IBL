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
 * FILE PURPOSE: PCIe Boot DDR Init Example
 **************************************************************************************
 * FILE NAME: pcieboot_ddrinit.c
 *
 * DESCRIPTION: A simple example to initialize the DDR before booting an image via PCIe.
 *
 ***************************************************************************************/
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "platform.h"

#define DEVICE_REG32_W(x,y)   *(volatile uint32_t *)(x)=(y)
#define DEVICE_REG32_R(x)    (*(volatile uint32_t *)(x))

#ifdef _EVMC6657L_
#define MAGIC_ADDR     0x8ffffc
#endif

#ifdef _EVMC6678L_
#define MAGIC_ADDR     0x87fffc
#endif

#ifdef _EVMC6670L_
#define MAGIC_ADDR     0x8ffffc
#endif

#define BOOT_MAGIC_ADDR(x)  (MAGIC_ADDR + (1<<28) + (x<<24))

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

void
start_boot
(
    void
)
{
    void                (*exit)();
    uint32_t            entry_addr;

    while(1)
    {
        entry_addr = DEVICE_REG32_R(BOOT_MAGIC_ADDR(0));
        if (entry_addr != 0)
        {
            /* jump to the exit point, which will be the entry point for the full IBL */
            exit = (void (*)())entry_addr;
            (*exit)();
        }
        platform_delay(1);
    }
}

/******************************************************************************
 * Function:    main
 ******************************************************************************/
void main ()
{
    platform_init_flags     init_flags;
    platform_init_config    init_config;

    /* Initialize main Platform lib */
    memset(&init_config, 0, sizeof(platform_init_config));
    memset(&init_flags, 1, sizeof(platform_init_flags));
    if (platform_init(&init_flags, &init_config) != Platform_EOK)
    {
        printf ("Platform init failed!\n");
        return;
    }

    /* Clear the boot entry address of the boot image and start to boot */
    DEVICE_REG32_W(BOOT_MAGIC_ADDR(0), 0);
    start_boot();
}
