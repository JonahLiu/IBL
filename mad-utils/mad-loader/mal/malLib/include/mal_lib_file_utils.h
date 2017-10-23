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

#ifndef __MAL_LIB_FILE_UTILS_H__
#define __MAL_LIB_FILE_UTILS_H__

/* Initialize the filesystem parsing utility 
 * fsStartAddr: Start address of the filesystem in memory
 * Returns 0 on success
 */
int mal_lib_fs_init(unsigned char *fsStartAddr);

/* Locate the file in filesystem and return a file handle 
 * returns -1 on failure
 */
int mal_lib_fopen(const char *filename);

/* Close the associated file
 * returns 0 on success, -1 on failure
 */
int mal_lib_fclose(int file_handle);

/* Retrives the size of the file in bytes
 * Returns 0 on success, -1 on failure
 */
int mal_lib_fsize(const char *filename, unsigned int *size);

/* Reads an array of count elements, each one with a size of size bytes, 
 * from the file and stores them in the block of memory specified by ptr.
 * Returns the total number of elements successfully read
 */
unsigned int mal_lib_fread(void *ptr, unsigned int size, unsigned int count, int file_handle);

/* Seek to a position in a file based on the values for offset and origin
 * Returns 0 on success otherwise -1
 */
/* Possible values for origin */
#define MAL_SEEK_SET	0
#define MAL_SEEK_CUR	1
#define MAL_SEEK_END	2
int mal_lib_fseek(int file_handle, unsigned int offset, int origin);

/* Returns a file offset in a file
 *  returns -1 on failure
 */
long mal_lib_ftell(int file_handle);

#endif

