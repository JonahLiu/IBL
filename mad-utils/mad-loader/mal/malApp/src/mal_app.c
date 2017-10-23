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


/* This file contains the implementation of a standalone Application Loader.
 * It uses the Multicore Application Loader (MAL) Library API's to load 
 * application on a given core
 */

#include <string.h>
#include "mal_lib.h"
#include "mal_lib_file_utils.h"

#if !(defined DEVICE)
#error DEVICE not defined
#endif

/* Start address of the ROMFS filesystem in memory */
#ifndef __LOAD_PARTITION__
#error __LOAD_PARTITION__ not defined
#endif

#if (DEVICE==6472)
    #define NUM_CORES   6
#elif (DEVICE==6670)
    #define NUM_CORES   4
#elif (DEVICE==6657)
    #define NUM_CORES   2
#elif (DEVICE==6678)
    #define NUM_CORES   8
#endif /* DEVICE */

extern volatile unsigned int cregister DNUM;

int main(int argc, char** argv)
{
	int fd;
	unsigned int i, size, idx = 0;
	char deployconfig[256], *appname, *myapp;

	if (mal_lib_init((void*)__LOAD_PARTITION__))
		return -1;

	/* Parse ROMFS to get the initial App deployment config file */
	if ((fd = mal_lib_fopen("appdepcfg")) < 0)
		return -2;
	
	/* Get the file size */
	if (mal_lib_fsize("appdepcfg", &size))
		return -3;

	/* Read the deployment configuration from the filesystem */
	if (mal_lib_fread((void *)&deployconfig[0], 1, size, fd) != size)
		return -4;

	if (mal_lib_fclose(fd))
		return -5;
	
	for (i=0; ((i < NUM_CORES) && (idx < size )); i++) {
		int len;
		appname = &deployconfig[idx];
		len = strlen(appname);
		idx += (len+1);
		if (DNUM != i) { 
			if (!len)
				continue;
			if (mal_lib_load_core(i,appname))
				return -6;
		}
		else {
			myapp = appname;
		}
	}
	
	if (strlen(myapp)) {
		if (mal_lib_load_core(DNUM, myapp))
			return -7;
	}

	/* Should not reach here */
	return 0;
}

