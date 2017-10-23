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



/**
 *  @file elfwrap.c
 *
 *  @brief
 *		IBL wrapper for the elf loader
 */

#include "types.h"
#include "ibl.h"
#include "iblloc.h"
#include "ewrap.h"
#include "dload_api.h"
#include "ibl_elf.h"
#include "file_ovr.h"

/**
 *  @brief
 *      Required for the dload module
 */
BOOL DLL_debug = FALSE;

/**
 *  @brief
 *	   Load an elf file
 */
void iblBootElf (BOOT_MODULE_FXN_TABLE *bootFxn, Uint32 *ientry_point)
{
  int   argc;
  char **argv;
  int32_t  dloadHandle;

  dloadHandle = DLOAD_load (bootFxn, argc, argv, ientry_point);

}

/**
 *  @brief
 *      Look for the elf signature in the 1st 4 bytes of a data file
 */
BOOL iblIsElf (Uint8 *elfhdr)
{
  if (  (elfhdr[0] == 0x7f)    &&
        (elfhdr[1] == 'E')     &&
        (elfhdr[2] == 'L')     &&
        (elfhdr[3] == 'F')     )
      return (TRUE);

  return (FALSE);

}



