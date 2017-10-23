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
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "platform.h"
#include "srioDdrInit.h"
#include "srioBootCode.h"

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

/* Entry address of the boot image */
#define BOOT_ENTRY_ADDR     0xc000000

/* Maximum number of bytes per transfer */
#define MAX_TX_SIZE         1024

/* SRIO transfer wait timeout in usec */
#define WAIT_TIMEOUT        500000

/* SRIO Boot Example Version */
char version[] = "01.00.00.01";

uint32_t coreNum;

/* These can be changed on the fly during the test */
volatile uint32_t port      = 0;
volatile uint32_t rio_id    = 0;
volatile uint32_t loopback  = 0;

#pragma DATA_ALIGN(bootEntryAddr, 16)
volatile uint32_t bootEntryAddr = BOOT_ENTRY_ADDR;  /* Base address of MSMC */


/* Port error status registers */
#define SRIO_PORT_ERR_STATUS_REG(x)    (0x290b158 + x*0x20)

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

/* Convert bytes to 32 bits */
uint32_t byteto32bits(uint8_t *pDspCode)
{
    int32_t i;
    uint32_t temp;

    temp = *pDspCode++;
    for(i=0; i<3;i++) {
        temp <<= 8;
        temp |= *pDspCode++;
    }
    return(temp);
}

/* Convert to big endian, if the .out to be booted is big endian, this is not required */
void
Convert2BigEndian
(
    uint32_t    *pDspCode,
    int32_t     size
)
{
    uint32_t i;
    uint32_t temp;

    for(i=0; i<size; i+=4, pDspCode++) {
        temp = *pDspCode;

        temp =	(temp>>24) |
            ((temp<<8) & 0x00FF0000) |
            ((temp>>8) & 0x0000FF00) |
            (temp<<24);

        *pDspCode= temp;
    }
}


uint32_t swap (uint32_t v)
{
    uint32_t w;

    w = (((v >> 24) & 0xff) <<  0)  |
        (((v >> 16) & 0xff) <<  8)  |
        (((v >>  8) & 0xff) << 16)  |
        (((v >>  0) & 0xff) << 24)  ;

    return (w);

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


/*
Transfer (size_bytes) bytes data from host address (host_addr) to device ID's
(rio_id) global address (dsp_addr). Lane 0 is used for booting.

  rio_id:    destination device id
  host_addr:  host's address
  dsp_addr:   target dsp's global address
  size_bytes: size in bytes
*/
int SRIOTransfer(int rio_num, int port_num, unsigned int host_addr, unsigned int dsp_addr, int size_bytes)
{
    unsigned int count,busy;

    /* Program a transfer on port 0 */
    /* LSU 1 Reg 0 - MSB of destination */
    DEVICE_REG32_W(0x2900d00, 0x00000000);


    /* LSU 1 Reg 1 - LSB of destination */
    DEVICE_REG32_W(0x2900d04, dsp_addr);


    /* LSU 1 Reg 2 - source address */
    DEVICE_REG32_W(0x2900d08, (1 << 28) | (coreNum << 24) | host_addr);


    /* LSU 1 Reg 3 - Byte count */
    DEVICE_REG32_W(0x2900d0c, size_bytes);


    /* LSU 1 Reg 4 -
    * out port ID = 0
    * Priority = 2
    * XAM = 0
    * ID size = 1 (16 bit)
    * Dest ID specified as arg
    * int32_terrupt request = 0 */
    DEVICE_REG32_W(0x2900d10, 0x00000000 | (rio_num << 8)| (port_num << 30));


    /* LSU 1 Reg 5 -
    * doorbell info = 0 for this packet type
    * hop count = 0 for this packet type
    * Packet type = 0x54 - ftype = 5, ttype = 4
    *  			   nwrite packet type.
    * Writing this register should initiate the transfer */
    DEVICE_REG32_W(0x2900d14, 0x00000054);

    /* wait for it to complete */
    count = 0;

    /* wait for it to complete */
    do{
        platform_delay(1);
        count++;
        if (count >= WAIT_TIMEOUT)
        {
            return (-1);
        }        busy = DEVICE_REG32_R(0x2900d18);

    } while ((busy & 0x80000000) != 0x00000000);

    return(0);
}


/* Send boot tables to DSP and then write the magic address to boot the DSP

pDspCode: points to DSP code;
DeviceID: device ID.

*/
int32_t pushData2Srio(uint8_t *pDspCode,int32_t DeviceID)
{
    uint32_t i;
    uint32_t size;
    uint32_t count, remainder;
    uint32_t startaddr;
    volatile uint32_t vx;


    /* Claim the LSU */
    vx = DEVICE_REG32_R(0x2900d18);

    /* Get the boot entry address */
    bootEntryAddr = byteto32bits(pDspCode);
    pDspCode +=4;

    while(1) {

        /* Get the size */
        size = 	byteto32bits(pDspCode);
        if(size == 0) break;
        pDspCode += 4;

        startaddr = byteto32bits(pDspCode);
        pDspCode+= 4;

        count = size/MAX_TX_SIZE;
        remainder = size - count * MAX_TX_SIZE;

        for(i=0; i<count; i++) {
            /* This is not needed if the .out to be booted is big endian already */
            Convert2BigEndian((uint32_t *)pDspCode,MAX_TX_SIZE);

            /* Transfer boot tables to DSP */
            if(SRIOTransfer(rio_id, port, (uint32_t )pDspCode, (uint32_t )startaddr, MAX_TX_SIZE)!=0) return(-1);
            pDspCode += MAX_TX_SIZE;
            startaddr += MAX_TX_SIZE;
        }

        /* This is not needed if the .out to be booted is big endian already */
        Convert2BigEndian((uint32_t *)pDspCode,remainder);

        if(SRIOTransfer(rio_id, port,(uint32_t )pDspCode, (uint32_t )startaddr, remainder)!=0) return(-1);
        pDspCode += remainder;
    }

    /* Write to Core 0 boot magic address to boot Core 0 */
    if (SRIOTransfer(rio_id, port,(uint32_t )&bootEntryAddr, BOOT_MAGIC_ADDR(0), 4)!=0)
        return(-1);

    return(0);
}



/******************************************************************************
 * Function:    Send a maintenance packet
 ******************************************************************************/
void
mainPacket
(
    uint32_t    addr,
    uint32_t    value
)
{
    volatile uint32_t vx;
    uint32_t busy, count;

    value = swap(value);

    /* Claim the LSU */
    vx = DEVICE_REG32_R(0x2900d18);

    /* Program a transfer on port 0 */
    /* LSU 1 Reg 0 - MSB of destination */
    DEVICE_REG32_W(0x2900d00, 0x00000000);


    /* LSU 1 Reg 1 - LSB of destination */
    DEVICE_REG32_W(0x2900d04, addr - 0x290b000);

    /* LSU 1 Reg 2 - source address */
    DEVICE_REG32_W(0x2900d08, (1 << 28) | (coreNum << 24) | (uint32_t)&value);


    /* LSU 1 Reg 3 - Byte count */
    DEVICE_REG32_W(0x2900d0c, 4);

    /* LSU 1 Reg 4 -
    * out port ID = 0
    * Priority = 2
    * XAM = 0
    * ID size = 1 (16 bit)
    * Dest ID specified as arg
    * int32_terrupt request = 0 */
    DEVICE_REG32_W(0x2900d10, 0xffff0000 | (port << 8));


    /* LSU 1 Reg 5 -
    * doorbell info = 0 for this packet type
    * hop count = 0 for this packet type
    * Packet type = 0x54 - ftype = 5, ttype = 4
    *  			   nwrite packet type.
    * Writing this register should initiate the transfer */
    /*  *((uint32_t *)0x2900d14) = 0x00000054;  */
    DEVICE_REG32_W(0x2900d14, 0x00000081);  /* maint32_tenance write */

    /* wait for it to complete */
    count = 0;
    do{
        platform_delay(1);
        count++;
        if (count >= WAIT_TIMEOUT)
        {
            printf("Send a maintenance packet failed\n");
            return;
        }
        busy = DEVICE_REG32_R(0x2900d18);

    } while ((busy & 0x80000000) != 0x00000000);

    return;
}

/* Return if Port is OK or not */
int32_t SRIOPortStatus(uint32_t port_num)
{
    uint32_t count,value,portok;

    count = 0;
    portok= 0;

    while(1)
    {
        value = DEVICE_REG32_R(SRIO_PORT_ERR_STATUS_REG(port_num));

        if((value & 0x02) !=0)
        {
            portok++;
            if(portok >= 50)
            {
                break; /* port must be solid OK */
            }
        }
        else
        {
            portok = 0;
            count++;
            if (count >= WAIT_TIMEOUT)
            {
                return(-1);
            }
        }
        platform_delay(1);
    }

    return(0);
}

void
srio_init
(
    uint32_t    port_num,
    uint32_t    loopback
)
{
    /* Enable the Transmit register */
    DEVICE_REG32_W(0x290b13c, 0x40000000);

    if (loopback)
    {
        /* Enable Lane loop back for all the ports */
        DEVICE_REG32_W(0x2900018, 0x000000f0);
    }

    /* check for the port status */
    if (SRIOPortStatus(port_num) != 0)
    {
        printf("Port %d is not OK!\n", port_num);
    }

    /* TLM SP0 control, enable promiscuous mode */
    mainPacket (0x291b380, 0x00309000);

    mainPacket (0x290b15c, 0x00600000);
}

void main (void)
{
    platform_init_flags     init_flags;
    platform_init_config    init_config;
    char                    version_msg[] = "\r\n\r\nSRIO Boot Host Example Version ";

    printf("%s%s\n\n", version_msg, version);

    /* Initialize main Platform lib */
    memset(&init_config, 0, sizeof(platform_init_config));
    memset(&init_flags, 1, sizeof(platform_init_flags));
    init_flags.phy = 0;
    if (platform_init(&init_flags, &init_config) != Platform_EOK)
    {
        printf ("Platform init failed!\n");
        print_platform_errno();
        return;
    }

    coreNum = platform_get_coreid();

    /* Init port 0, disable loopback */
    srio_init(port, loopback);

    /* Push the DDR init code to remote DSP core 0 and boot core 0 to initialize the DDR */
    if(pushData2Srio(ddrInitCode, rio_id)==0)
    {
        printf("Transfer DDR init code via SRIO successfully\n");

        platform_delay(1000000);

        /* Push the boot image code to remote DSP DDR and boot core 0 to run Hello World */
        if(pushData2Srio(bootCode, rio_id)==0)
        {
            printf("Transfer boot code via SRIO successfully\n");
        }
        else
        {
            printf("DSP boot failed.\n");
        }
    }
    else
    {
        printf("DSP boot failed.\n");
    }

    for (;;);

}


