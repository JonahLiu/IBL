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
 *****************************************************************************/

/**************************************************************************************
 * FILE PURPOSE: NOR Boot Over I2C Example
 **************************************************************************************
 * FILE NAME: i2c_boot_nor_example.c
 *
 * DESCRIPTION: A simple hello world example demonstrating NOR boot over I2C.
 *
 ***************************************************************************************/
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "platform.h"

#define BOOT_UART_BAUDRATE         115200

/* i2c_boot_nor_example version */
char version[] = "01.00.00.00";

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
 * Function:    print_platform_errno
 ******************************************************************************/
void
print_platform_errno
(
    void
)
{
    printf ("Returned platform error number is %d\n", platform_errno);
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


/******************************************************************************
 * Function:    main
 ******************************************************************************/
void main ()
{
    platform_init_flags     init_flags;
    platform_init_config    init_config;
    char                    version_msg[] = "\r\n\r\nNOR Boot Over I2C Example Version ";
    char                    boot_msg[] = "\r\n\r\nBooting Hello World image from NOR flash via IBL over I2C 0x51 ...";

    printf("%s%s\n\n", version_msg, version);

    /* Initialize main Platform lib */
    memset(&init_config, 0, sizeof(platform_init_config));
    memset(&init_flags, 1, sizeof(platform_init_flags));
    init_flags.pll = 0;
    init_flags.ddr = 0;
    if (platform_init(&init_flags, &init_config) != Platform_EOK)
    {
        printf ("Platform init failed!\n");
        print_platform_errno();
        return;
    }
    platform_uart_init();
    platform_uart_set_baudrate(BOOT_UART_BAUDRATE);

    write_uart(version_msg);
    write_uart(version);

    printf("%s", boot_msg);
    write_uart(boot_msg);
}
