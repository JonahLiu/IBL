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


/** @file norboot.c
 *
 * @brief
 *      The nor boot wrapper
 */

#include "types.h"
#include "ibl.h"
#include "iblloc.h"
#include "nor.h"
#include "norboot.h"
#include "device.h"


void iblNorBoot (int32 eIdx)
{
    Uint32 entry;
    void   (*exit)();

    /* Perform any device specific configurations */
    if (deviceConfigureForNor() < 0)
        return;

    /* Open the nor driver */
    if ((*nor_boot_module.open) ((void *)&ibl.bootModes[eIdx].u.norBoot, NULL))
        return;


    entry = iblBoot (&nor_boot_module, ibl.bootModes[eIdx].u.norBoot.bootFormat, &ibl.bootModes[eIdx].u.norBoot.blob[iblEndianIdx][iblImageIdx]);

    (*nor_boot_module.close)();

    if (entry != 0)  {

        iblStatus.exitAddress = entry;
        exit = (void (*)())entry;
        (*exit)();

    }

}


