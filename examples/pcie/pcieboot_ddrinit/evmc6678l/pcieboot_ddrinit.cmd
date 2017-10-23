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
/*
 *  Linker command file
 *
 */

-c
-heap  0x1000
-stack 0x1000

/* Memory Map 1 - the default */
MEMORY
{
    L2_LOCAL (RWX) : org = 0x10820000, len = 0x20000
}

SECTIONS
{
    .text:_boot_entry > L2_LOCAL
    .csl_vect   >       L2_LOCAL
    .cppi       >       L2_LOCAL
    .linkram    >       L2_LOCAL
    .mac_buffer >       L2_LOCAL
    platform_lib >      L2_LOCAL
    .text       >       L2_LOCAL
    GROUP (NEAR_DP)
    {
    .neardata
    .rodata 
    .bss
    } load > L2_LOCAL
    .stack      >       L2_LOCAL
    .cinit      >       L2_LOCAL
    .cio        >       L2_LOCAL
    .const      >       L2_LOCAL
    .data       >       L2_LOCAL
    .switch     >       L2_LOCAL
    .sysmem     >       L2_LOCAL
    .far        >       L2_LOCAL
    .testMem    >       L2_LOCAL
    .fardata    >       L2_LOCAL
}

