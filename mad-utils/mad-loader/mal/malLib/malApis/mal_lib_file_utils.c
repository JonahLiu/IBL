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


/* This file contains the implementation of a ROMFS parser
 * It provides an API interface for application to open and 
 * read files from ROMFS
 */

#include <stdlib.h>
#include <string.h>
#include "mal_lib_file_utils.h"
#include "mal_lib_loc.h"

struct romfh {
	unsigned int nextfh;
	unsigned int spec;
	unsigned int size;
	unsigned int checksum;
};

#define ROMFS_MAXFN 128
#define ROMFH_HRD 0
#define ROMFH_DIR 1
#define ROMFH_REG 2
#define ROMFH_LNK 3
#define ROMFH_BLK 4
#define ROMFH_CHR 5
#define ROMFH_SCK 6
#define ROMFH_FIF 7
#define ROMFH_EXEC 8

struct node_info {
	unsigned int nextfh;
	unsigned int spec;
	unsigned int size;
	unsigned int checksum;
	char *name;
	void *file;
	unsigned int mode;
	unsigned int namelen;
	int	fopen; /* value of 1 indicates an open file */
	unsigned int offset; /* Current offset in the file */
};

static int extract_from_mem(void *mem, unsigned int len);
static int recurse(void *mem, unsigned int offset);

/* Storage for file nodes in the ROMFS filesystem */
#define MAX_FILENODES	50
struct node_info file_nodes[MAX_FILENODES]; 

/* Next available file node tracker */
unsigned char next_node_idx = 0;

/* Variable to keep endianess of the device */
int __le__ = 0;

int find_endianess(void)
{
    short int word = 0x0001;
    char *byte = (char *) &word;
    return(byte[0] ? LITTLE_ENDIAN : BIG_ENDIAN);
}

unsigned int __ntohl__(unsigned int netlong)
{
    unsigned int temp = 0;
    temp += (netlong & 0x000000FF) << 24;
    temp += (netlong & 0x0000FF00) << 8;
    temp += (netlong & 0x00FF0000) >> 8;
    temp += (netlong & 0xFF000000) >> 24;
    return temp;
}

#define NTOHL(x) (__le__?__ntohl__(x):x) 

/* Initialize the filesystem parsing utility 
 * fsStartAddr: Start address of the filesystem in memory
 * Returns 0 on success
 */
int mal_lib_fs_init(unsigned char *fsStartAddr)
{
	unsigned int size;
	if (strncmp((char *)fsStartAddr, "-rom1fs-", 8)) {
		return -1;
	}

	if (find_endianess() == LITTLE_ENDIAN) __le__ = 1;
	memset(file_nodes, 0, sizeof(struct node_info)*MAX_FILENODES);
	size = *(unsigned int*)(fsStartAddr + 8); 
	return extract_from_mem(fsStartAddr, size);	
}

/* Locate the file in filesystem and return a file handle 
 * returns -1 on failure
 */
int mal_lib_fopen(const char *filename)
{
	int idx;
	for (idx = 0; idx < next_node_idx; idx++) {
		if (!strcmp(filename, file_nodes[idx].name)) {
			if (file_nodes[idx].fopen)
				return -2;
			file_nodes[idx].fopen = 1;
			return idx;
		}
	}
	return -1;
}

/* Close the associated file
 * returns 0 on success, -1 on failure
 */
int mal_lib_fclose(int file_handle)
{
	struct node_info *nptr;

	if (file_handle >= next_node_idx)
		return -1;
	nptr = &file_nodes[file_handle];
	if (!nptr->fopen)
		return -1;
	nptr->fopen = 0;
	nptr->offset = 0; 
	return 0;
}

/* Retrives the size of the file in bytes
 * Returns 0 on success, -1 on failure
 */
int mal_lib_fsize(const char *filename, unsigned int *size)
{
	int idx;
	for (idx = 0; idx < next_node_idx; idx++) {
		if (!strcmp(filename, file_nodes[idx].name)) {
			*size = file_nodes[idx].size;
			return 0;
		}
	}
	return -1;
}

/* Reads an array of count elements, each one with a size of size bytes, 
 * from the file and stores them in the block of memory specified by ptr.
 * Returns the total number of elements successfully read
 */
unsigned int mal_lib_fread(void *ptr, unsigned int size, unsigned int count, int file_handle)
{
	struct node_info *nptr;

	if (file_handle >= next_node_idx)
		return 0;
	nptr = &file_nodes[file_handle];
	if (!nptr->fopen)
		return 0;
	if ((nptr->size - nptr->offset) < (size*count)) {
		count = (nptr->size - nptr->offset)/size;
	}
	if (!count)
		return count;
	memcpy(ptr, (void *)((unsigned int)nptr->file + nptr->offset), (size*count)); 
	nptr->offset += (size*count);
	return count;
}

/* Seek to a position in a file based on the values for offset and origin
 * Returns 0 on success otherwise -1
 */
int mal_lib_fseek(int file_handle, unsigned int offset, int origin) 
{
	struct node_info *nptr;

	if (file_handle >= next_node_idx)
		return -1;
	nptr = &file_nodes[file_handle];
	if (!nptr->fopen)
		return -1;
	switch(origin)
	{
		case MAL_SEEK_SET:
			if (nptr->size < offset)
				return -1;
			nptr->offset = offset;
			break;
		case MAL_SEEK_CUR:
			if (nptr->size < (nptr->offset + offset))
				return -1;
			nptr->offset += offset;
			break;
		case MAL_SEEK_END:
			if (offset)
				return -1;
			nptr->offset = nptr->size;
			break;
		default:
			return -1;
	}
	return 0;
}

/* Returns a file offset in a file
 *  returns -1 on failure
 */
long mal_lib_ftell(int file_handle)
{
	if (file_handle >= next_node_idx)
		return -1;
	if (!file_nodes[file_handle].fopen)
		return -1;
	return file_nodes[file_handle].offset;
}

static int add_node(struct node_info *ni)
{
	if (next_node_idx == MAX_FILENODES)
		return -20;
	memcpy(&file_nodes[next_node_idx++], ni, sizeof(struct node_info)); 
	return 0;
}

static void parse_node(void *start, unsigned int offset, struct node_info *ni)
{
	void *nameend;
	struct romfh *rfh = (struct romfh*)((unsigned int)start + offset);

	ni->size = NTOHL(rfh->size);
	ni->mode = (NTOHL(rfh->nextfh) & 0x0f);
	ni->nextfh = NTOHL(rfh->nextfh) & ~0x0f;
	ni->checksum = NTOHL(rfh->checksum);
	ni->spec = NTOHL(rfh->spec);
	ni->name = (char *) (rfh+1);

	ni->namelen = strlen(ni->name) + 1;
	nameend = (void *) (((unsigned long)ni->name + ni->namelen) - (unsigned long )start);
	if ((unsigned long)nameend&15) {
		nameend = (void*)(((unsigned long) nameend&~15)+16);
		ni->namelen = (unsigned int)nameend - ((unsigned int)ni->name - (unsigned int)start);
	}

	ni->file = (char *)ni->name + ni->namelen;
}

static int extract_from_mem(void *mem, unsigned int len)
{
	unsigned int offset = 0;
	struct node_info ni;

	parse_node(mem, offset, &ni);
	offset += sizeof(struct romfh) + ni.namelen;

	return recurse(mem, offset);
}

static int recurse(void *mem, unsigned int offset)
{
	struct node_info ni;
	unsigned int ret = 0;

	while (1) {
		memset(&ni, 0, sizeof(struct node_info));
		parse_node(mem, offset, &ni);
		switch (ni.mode & 0x7) {
		case ROMFH_REG: 
		case ROMFH_DIR:
		case ROMFH_HRD:
			break;
		default:
			/* Not supported */
			return -10;
		}
		/* Add to the file_nodes array */
		if (ret = add_node(&ni)) {
			return ret;
		}
		if (!ni.nextfh)
			return 0;
		offset = ni.nextfh;
	}
	/* not reached */
}

