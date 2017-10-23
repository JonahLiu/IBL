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
 * FILE PURPOSE: SRIO Boot Hello World Example
 **************************************************************************************
 * FILE NAME: srioboot_helloworld.c
 *
 * DESCRIPTION: A simple hello world example demonstrating SRIO boot.
 *
 ***************************************************************************************/
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "platform.h"

#define DEVICE_REG32_W(x,y)   *(volatile uint32_t *)(x)=(y)
#define DEVICE_REG32_R(x)    (*(volatile uint32_t *)(x))

#define CHIP_LEVEL_REG  0x02620000
#define KICK0           (CHIP_LEVEL_REG + 0x0038)
#define KICK1           (CHIP_LEVEL_REG + 0x003C)

/* Magic address RBL is polling */
#ifdef _EVMC6657L_
#define MAGIC_ADDR          0x8ffffc
#endif

#ifdef _EVMC6678L_
#define MAGIC_ADDR          0x87fffc
#endif

#ifdef _EVMC6670L_
#define MAGIC_ADDR          0x8ffffc
#endif

#define BOOT_MAGIC_ADDR(x)  (MAGIC_ADDR + (1<<28) + (x<<24))
#define IPCGR(x)            (0x02620240 + x*4)

#define BOOT_MAGIC_NUMBER   0xBABEFACE

#define BOOT_UART_BAUDRATE         115200

/* srioboot_helloworld version */
char version[] = "01.00.00.01";

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

/******************************************************************************
 * Function:    write_uart
 ******************************************************************************/
void
write_uart
(
    char*      msg
)
{
    uint32_t i;
    uint32_t msg_len = strlen(msg);

    /* Write the message to the UART */
    for (i = 0; i < msg_len; i++)
    {
        platform_uart_write(msg[i]);
    }
}

void
write_boot_magic_number
(
    void
)
{
    DEVICE_REG32_W(MAGIC_ADDR, BOOT_MAGIC_NUMBER);
    while(1);
}

/******************************************************************************
 * Function:    main
 ******************************************************************************/
void main ()
{
    char                    version_msg[] = "\r\n\r\nSRIO Boot Hello World Example Version ";
    char                    boot_msg[80];
    platform_info           pform_info;
    uint32_t                coreNum, core;

    /* Initialize UART */
    coreNum = platform_get_coreid();
    if (coreNum == 0)
    {
        platform_uart_init();
        platform_uart_set_baudrate(BOOT_UART_BAUDRATE);


        printf("%s%s\n\n", version_msg, version);
        write_uart(version_msg);
        write_uart(version);

        write_uart("\r\n\r\nBooting Hello World image on Core 0 from SRIO ...");

        platform_get_info(&pform_info);

        /* Unlock the chip registers */
        DEVICE_REG32_W(KICK0, 0x83e70b13);
        DEVICE_REG32_W(KICK1, 0x95a4f1e0);

        /* Writing the entry address to other cores */
        for (core = 1; core < pform_info.cpu.core_count; core++)
        {
            sprintf(boot_msg, "\r\n\r\nBooting Hello World image on Core %d from Core 0 ...", core);
            write_uart(boot_msg);
            
            DEVICE_REG32_W(BOOT_MAGIC_ADDR(core), (uint32_t)write_boot_magic_number);

            /* Delay 1 sec */
            platform_delay(1);
        }
        for (core = 1; core < pform_info.cpu.core_count; core++)
        {
            /* IPC interrupt other cores */
            DEVICE_REG32_W(IPCGR(core), 1);
            platform_delay(1000);
        }

    }
    else
    {
        write_boot_magic_number();
    }

    while(1);
}
