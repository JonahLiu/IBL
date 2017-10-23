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

/******************************************************************************
 *
 * File    Name:    c66x_uart.h
 *
 * Description:    This contains UART specific structure, typedefs, function
 *        prototypes.
 *
 ******************************************************************************/
#ifndef    _EVM66X_I2C_UART_H_
#define    _EVM66X_I2C_UART_H_

#include "uart.h"
#include <stdint.h>

#define UART_REGS_BASE            (0x02540000)

/**************************************************************************
 * Register Overlay Structure
 **************************************************************************/
typedef struct  {
    volatile uint32_t RBR;
    volatile uint32_t IER;
    volatile uint32_t IIR;
    volatile uint32_t LCR;
    volatile uint32_t MCR;
    volatile uint32_t LSR;
    volatile uint32_t MSR;
    volatile uint32_t SCR;
    volatile uint32_t DLL;
    volatile uint32_t DLH;
    volatile uint32_t REVID1;
    volatile uint32_t REVID2;
    volatile uint32_t PWREMU_MGMT;
    volatile uint32_t MDR;
} uart_registers_t;

/* Mask    to enable DLL and DLM */
#define    DLAB        (0x80)            /* Way to swap mem banks */

/* Baudrate table for crystal clock 14.7456 MHz*/
#define    BAUD_RATE_9600      (0x0060)
#define    BAUD_RATE_19200     (0x0030)
#define    BAUD_RATE_115200    (0x0058)

#define uart_registers    ((uart_registers_t*) UART_REGS_BASE)

/* Following 2 lines are added due to CSL3.x tools limitations */
#define THR RBR   /* RBR & THR have same offset */
#define FCR IIR   /* IIR & FCR have same offset */

#define UART_LSR_THRE_MASK (0x00000020u)
#define UART_THR_DATA_MASK (0x000000FFu)

#endif /* _EVM66X_I2C_UART_H_ */
