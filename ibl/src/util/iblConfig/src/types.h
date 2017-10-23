/*
 *
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



#ifndef _TYPES_H
#define _TYPES_H
/*******************************************************************************
 * FILE PURPOSE:  DSP specific C type definitions.
 *******************************************************************************
 * FILE NAME: ibl_types.h  
 *
 * DESCRIPTION: Defines general use types for DSP.  
 *
 *  @file   ibl_types.h
 *
 *  @brief
 *      This file provides architecture specific typedefs
 *
 ******************************************************************************/


#include <stdlib.h>  /* Defines NULL */
#include <stdint.h>
#include <string.h>

/* a signed 16-bit integer */
typedef int16_t int16;
typedef uint16_t uint16;

typedef int32_t int32;
typedef uint32_t uint32;

typedef int8_t char8;
typedef uint8_t uchar8;

typedef int8_t int8;
typedef uint8_t uint8;


typedef uint8_t word;

typedef int16_t BOOL;
typedef int16_t bool;
typedef int16_t Bool;
#ifndef FALSE
#define FALSE 0
#endif

#ifndef TRUE
#define TRUE  1
#endif


/* tistdtypes.h types used from the emac driver */
typedef uint8_t Uint8;
typedef int8_t Int8;
typedef int32_t Int32;
typedef uint16_t Uint16;
typedef uint32_t Uint32;

/* TI boot types */
typedef uint8_t  UINT8;
typedef uint16_t UINT16;
typedef int16_t          SINT16;
typedef uint32_t   UINT32;
typedef int32_t            SINT32;


/* Types from evm driver */
typedef volatile uint32_t  VUint32;
typedef volatile uint8_t VUint8;

/* Types from the ethernet driver */
typedef uint32_t  IPN;

#endif /* ibl_types.h */
