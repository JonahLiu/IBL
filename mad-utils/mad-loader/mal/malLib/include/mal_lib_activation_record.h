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

/**
 * @file   mal_lib_activation_record.h
 *
 * @brief
 *     The activation record data structure is defined
 */

#ifndef __MAL_LIB_ACTIVATION_RECORD_H__
#define __MAL_LIB_ACTIVATION_RECORD_H__

/* Command Opcodes */ 
#define	UPDSTATUS	0x0
#define	MEMMAPSET	0x1
#define	MEMATTRSET	0x2
#define	MEMCPY	0x3
#define	MEMSET	0x4
#define	FNCALL	0x5

/* Defines for Memory permissions */
#define	UX	0x01
#define	UW	0x02
#define	UR	0x04
#define	SX	0x08
#define	SW	0x10
#define	SR	0x20

/* Defines for Memory Attributes */
#define	CACHE_EN	0x01
#define	PREFETCH_EN	0x02

#define MAL_LIB_MAX_AR 100

/**
 *  @brief
 *      A single activation record entry is an opcode with arguments. 
 */
typedef struct mal_lib_activationRecord_s  {

	int opcode;
	unsigned int arg1;
	unsigned int arg2;
	unsigned int arg3;
	unsigned int arg4;
} mal_lib_activationRecord_t;

int mal_lib_record_ld_call(void* fptr);

#endif

