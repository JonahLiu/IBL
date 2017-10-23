;/******************************************************************************
; * Copyright (c) 2011 Texas Instruments Incorporated - http://www.ti.com
; *
; *  Redistribution and use in source and binary forms, with or without
; *  modification, are permitted provided that the following conditions
; *  are met:
; *
; *    Redistributions of source code must retain the above copyright
; *    notice, this list of conditions and the following disclaimer.
; *
; *    Redistributions in binary form must reproduce the above copyright
; *    notice, this list of conditions and the following disclaimer in the
; *    documentation and/or other materials provided with the
; *    distribution.
; *
; *    Neither the name of Texas Instruments Incorporated nor the names of
; *    its contributors may be used to endorse or promote products derived
; *    from this software without specific prior written permission.
; *
; *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
; *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
; *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
; *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
; *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
; *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
; *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
; *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
; *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
; *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
; *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
; *
; *****************************************************************************/

;****************************************************************************
;* FILE PURPOSE: A simple endian independent example
;****************************************************************************
;* FILE NAME: Simple.s
;*
;* DESCRIPTION: A simple program that defines two initialized
;*              sections, text and data, and performs the following simple
;*              executions:
;*                  1. store a constant (011223344h) to register A1
;*                  2. store the data in byte1 section (0x12) to registerB2.
;*                  3. store the data in byte21 section (0x12, 034) to register B3, B4.
;*
;*****************************************************************************

;*****************************************************************************
;*  Initialized data
;*****************************************************************************
   .data
   .def     someData
someData   .word   01234ABCDh

    .def  byte1
	.sect ".byte1"
byte1:	.byte 0x12

	.def byte2
	.sect ".byte2"
byte2:	.byte 0x12, 0x34

;*****************************************************************************
;*  code
;*****************************************************************************
   .text
   .def _c_int00
   
myConst    .equ    011223344h
   
_c_int00:

   MVKL.S1     myConst, A1
   MVKH.S1     myConst, A1

   MVKL.S1     byte1, A2
   MVKH.S1     byte1, A2
   LDB.D1	   *A2, B2

   MVKL.S1     byte2, A3
   MVKH.S1     byte2, A3
   LDB.D1	   *A3++, B3
   LDB.D1      *A3,   B4
   
   
etrap:

   BNOP.S1 etrap, 5
   
   
   





