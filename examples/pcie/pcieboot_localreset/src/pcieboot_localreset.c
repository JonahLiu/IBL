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
#define DEVICE_REG32_W(x,y)   *(volatile uint32_t *)(x)=(y)
#define DEVICE_REG32_R(x)    (*(volatile uint32_t *)(x))

#ifdef _EVMC6678L_
#define MAGIC_ADDR     0x87fffc
#endif

#ifdef _EVMC6670L_
#define MAGIC_ADDR     0x8ffffc
#endif

typedef unsigned int uint32_t;

void start_boot (void)
{
    void                (*exit)();
    uint32_t            entry_addr;

    /* Clear the boot entry address of the boot image and start to boot */
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
    }
}

/******************************************************************************
 * Function:    main
 ******************************************************************************/
void main (void)
{
 	start_boot();
}
