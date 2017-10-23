/***************************************************************************
 * FILE PURPOSE: The linker command file for program simple
 ***************************************************************************
 * FILE NAME: simple_him.cmd
 *
 * DESCRIPTION: Maps the program simple into the memory space
 *
 ***************************************************************************/
 
/* Object file */
simple.obj

/* Linker options */
-c
-a

MEMORY
{
   PAGE 0:
   
     TEXT    :   origin = 0x810000,  length = 0x0040
     DATA    :   origin = 0x810100,  length = 0x0004
	 BYTE1   :   origin = 0x810201,  length = 0x0001
	 BYTE2   :   origin = 0x810210,  length = 0x0002
     
}

SECTIONS
{
     .text  >  TEXT  PAGE 0
     .data  >  DATA  PAGE 0
	 .byte1 >  BYTE1 PAGE 0
	 .byte2 >  BYTE2 PAGE 0
}     







