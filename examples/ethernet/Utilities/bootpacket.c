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

/* A simple utility program to convert a boot table to Ethernet boot format */
/* Version: 0.3 */


#include <stdio.h>
#include <string.h>
#include <malloc.h>
#include "bootpacket.h"

unsigned int line=0;



void writeheader(FILE *s, INT16* pdata)
{
	int i;

	for (i = 0; i < TOTAL_HEADER_LEN/2; i++)
		fprintf (s, "0x%04X\n",(unsigned short int)(*pdata++));
}


void writeboottable(FILE *s, INT16* pdata, int size)
{
	int i;

	for (i = 0; i < size; i++)
		fprintf (s, "0x%04X\n",(unsigned short int)(*pdata++));
}


void  stripLine (FILE *s)
{
  char iline[132];

  fgets (iline, 131, s);

}


int asciiByte (unsigned char c)
{
  if ((c >= '0') && (c <= '9'))
    return (1);

  if ((c >= 'A') && (c <= 'F'))
    return (1);

  return (0);
}


int toNum (unsigned char c)
{
  if ((c >= '0') && (c <= '9'))
    return (c - '0');

  return (c - 'A' + 10);

}

int toNumMAC (unsigned char c)
{
  if ((c >= '0') && (c <= '9'))
     return(c - '0');

  else  if ((c >= 'A') && (c <= 'F'))
	  return(c -'A' + 10);

  else  if ((c >= 'a') && (c <= 'f'))
	  return(c - 'a' + 10);

  else if(c == ':')
	  return(100);

  return(200);
}



/* Read the file size in bytes*/
int getFileSize (FILE *s)
{
  unsigned char x, y;
  unsigned int byteCount = 0;

  /* Strip the 1st two lines */
  stripLine (s);
  stripLine (s);

  for (;;) {

    /* read the 1st ascii char */
    do  {
      x = fgetc (s);
      if (x == (unsigned char)EOF)
        return (byteCount);

    } while (!asciiByte(x));

    /* Read the next ascii char */
    y = fgetc (s);
    if (y == (unsigned char)EOF)
      return (byteCount);
    if (asciiByte(y))
		byteCount++;
  }
}



int getDataIn(FILE *s, int size_bytes, unsigned short int *output)
{
  int i;
  unsigned char x, y;
  unsigned char c[2];

  for(i= 0; i< size_bytes/2; i++) {
	  c[0] = 0;
	  c[1] = 0;

	     /* read the 1st ascii char */
	    do  {
		  x = fgetc (s);
		  if (x == (unsigned char)EOF) {
			printf("file parsing error\n");
			return(-1);
		  }
	    } while (!asciiByte(x));


		/* Read the next ascii char */
		y = fgetc (s);
		if (y == (unsigned char)EOF) {
			printf("file parsing error\n");
			return(-1);
		}

        if (asciiByte(y)) {
			c[0] =  (toNum(x) << 4) | toNum (y);
		}

	    do  {
		  x = fgetc (s);
		  if (x == (unsigned char)EOF) {
			printf("file parsing error\n");
			return(-1);
		  }
	    } while (!asciiByte(x));


		/* Read the next ascii char */
		y = fgetc (s);
		if (y == (unsigned char)EOF) {
			printf("file parsing error\n");
			return(-1);
		}

        if (asciiByte(y)) {
			c[1] =  (toNum(x) << 4) | toNum (y);
		}

		*output++ = (c[0] << 8) | c[1] ;
		line++;
  }
   return(0);
}



UINT16 bootmiscOnesComplementAdd (UINT16 value1, UINT16 value2)
{
  UINT32 result;

  result = (UINT32)value1 + (UINT32)value2;

  result = (result >> 16) + (result & 0xFFFF); /* add in carry   */
  result += (result >> 16);                    /* maybe one more */
  return (UINT16)result;
}



/*  Description: Calculate an Internet style one's complement checksum */
 UINT16 bootmiscOnesComplementChksum (UINT16 base, UINT16 *p_data, UINT16 len)
{
  UINT16 chksum = base;

  while (len > 0)
  {
    chksum = bootmiscOnesComplementAdd(chksum,*p_data);
    p_data++;
    len--;
  }
  return ((unsigned short) ~chksum);
}



/*
  Input file format: boot table in big endian format

  Output file format:

	1st line: CCS data format
	2nd line: 0x0000
	3rd line: length of first packet in bytes, length counts not include itself
	.......
	first packet
	.......

	0xEA00
	0x0000
	length of the second packet in bytes, length counts not include itself
	.......
	second packet
	.......


  	0xEA00
	0x0000
	length of the other packet in bytes, length counts not include itself
	.......
	other packets
	.......

	0xEA00
	0X0000
	0X0000: end of the file
*/

struct BootPacket data;


void main (int argc, char *argv[])
{
	UINT32 j;
	UINT32 inSize;
	UINT32 counter;
	UINT16 UDPchecksum;
	FILE *strin, *strout;
	UINT32 temp;
	unsigned int MACaddr[6];

	 /* Arg check */
	if (argc <3 || argc> 5)  {
		fprintf (stderr, "usage: %s infile outfile\n\n", argv[0]);
		fprintf (stderr, "To generates the same result as bt-pkt.exe\n");
		fprintf (stderr, "usage: %s infile outfile btpkt\n\n", argv[0]);
		fprintf (stderr, "To use your own MAC address\n");
		fprintf (stderr, "usage: %s infile outfile dstMAC srcMAC\n", argv[0]);
		return;
	}

	strin = fopen(argv[1],"rb");
	if(strin == NULL){
	    fprintf (stderr, "%s: Could not open file %s for reading\n", argv[0], argv[1]);
		return;
	}

	/* Get the file size of data file */
	inSize = getFileSize (strin);
	printf("File size = %d bytes.\n",inSize);
	fclose (strin);
	strin = fopen(argv[1],"rb");
    /* Strip the 1st two lines */
    stripLine (strin);
    stripLine (strin);

	strout = fopen(argv[2],"w");
	if(strout == NULL) {
	    fprintf (stderr, "%s error: Could not open output file %s\n", argv[0], argv[2]);
		return;
	}


	// MAC header, 14 bytes
	if(argc == 5) {

		/* get destination MAC address */
        if((sscanf(argv[3],"%02x-%02x-%02x-%02x-%02x-%02x",&MACaddr[0],&MACaddr[1], \
			&MACaddr[2],&MACaddr[3],&MACaddr[4],&MACaddr[5])!=6) || \
			(MACaddr[0] < 0 || MACaddr[0] > 255 || \
			MACaddr[1] < 0 || MACaddr[1] > 255 || \
			MACaddr[2] < 0 || MACaddr[2] > 255 || \
			MACaddr[3] < 0 || MACaddr[3] > 255 || \
			MACaddr[4] < 0 || MACaddr[4] > 255 || \
			MACaddr[5] < 0 || MACaddr[5] > 255) ) {

			printf("Error in dstMAC address\n");
			fclose(strin);
			fclose(strout);
			return;
		}

		data.dstMAC_H = (unsigned short)(MACaddr[0]<<8 | MACaddr[1]);
		data.dstMAC_M = (unsigned short)(MACaddr[2]<<8 | MACaddr[3]);
		data.dstMAC_L = (unsigned short)(MACaddr[4]<<8 | MACaddr[5]);

		/* get source MAC address */
       if((sscanf(argv[4],"%02x-%02x-%02x-%02x-%02x-%02x",&MACaddr[0],&MACaddr[1], \
			&MACaddr[2],&MACaddr[3],&MACaddr[4],&MACaddr[5])!=6) || \
			(MACaddr[0] < 0 || MACaddr[0] > 255 || \
			MACaddr[1] < 0 || MACaddr[1] > 255 || \
			MACaddr[2] < 0 || MACaddr[2] > 255 || \
			MACaddr[3] < 0 || MACaddr[3] > 255 || \
			MACaddr[4] < 0 || MACaddr[4] > 255 || \
			MACaddr[5] < 0 || MACaddr[5] > 255) ) {

			printf("Error in srcMAC address\n");
			fclose(strin);
			fclose(strout);
			return;
		}

		data.srcMAC_H = (unsigned short)(MACaddr[0]<<8 | MACaddr[1]);
		data.srcMAC_M = (unsigned short)(MACaddr[2]<<8 | MACaddr[3]);
		data.srcMAC_L = (unsigned short)(MACaddr[4]<<8 | MACaddr[5]);

	} else {  /* use default MAC address */
		data.dstMAC_H = (unsigned short)DST_MAC_H;
		data.dstMAC_M = (unsigned short)DST_MAC_M;
		data.dstMAC_L = (unsigned short)DST_MAC_L;
		data.srcMAC_H = (unsigned short)SRC_MAC_H;
		data.srcMAC_M = (unsigned short)SRC_MAC_M;
		data.srcMAC_L = (unsigned short)SRC_MAC_L;
	}
	data.EtherType = ETHER_TYPE_IP;

	// IP header, 20 bytes
	data.VerTOS = 0x4500;
	data.IPlength = 0x0000;
	data.ID = 0x4567;
	data.FlagsFrag = 0x0000;
	data.TTLProtocol = 0x1000 | IP_TYPE_UDP;
	data.IPchecksum = 0x0000;
	data.srcIPAddr_H = (unsigned short)SRC_IP_ADDR_H;
	data.srcIPAddr_L = (unsigned short)SRC_IP_ADDR_L;
	data.dstIPAddr_H = (unsigned short)DST_IP_ADDR_H;
	data.dstIPAddr_L = (unsigned short)DST_IP_ADDR_L;

	// UDP header, 8 bytes
	if(argc != 4) {
		data.srcPort = (unsigned short)UDP_SRC_PORT;
	} else {
		data.srcPort = (unsigned short)UDP_SRC_PORT_BTPKT;
	}
	data.dstPort = (unsigned short)UDP_DST_PORT;
	data.UDPlength = 0x0000;
	data.UDPchecksum = 0x0000;

	// Payload header, 4 bytes
	data.MagicNo = MAGICNO;
	data.SeqNo = 0x100;

	memset(&data.BootTable,0, sizeof(data.BootTable));

	counter = inSize / MAX_BOOTTBL_LEN;  // calculate how many packets

	// If there is only one packet
	if(counter <=1) {
		data.UDPlength = UDP_HEADER_LEN + BOOTTBL_HEADER_LEN + inSize;

		data.IPlength = data.UDPlength + IP_HEADER_LEN;
		data.IPchecksum=bootmiscOnesComplementChksum(0,&data.VerTOS,IP_HEADER_LEN/2);

		if(getDataIn(strin, inSize, data.BootTable)!=0) {
			fclose(strin);
			fclose(strout);
			return;
		}

		UDPchecksum = bootmiscOnesComplementAdd(IP_TYPE_UDP, data.UDPlength);
		data.UDPchecksum=bootmiscOnesComplementChksum(UDPchecksum, &data.srcIPAddr_H,\
	                                           (UINT16)((4+4+UDP_HEADER_LEN+BOOTTBL_HEADER_LEN+inSize)/2));

		temp = BGN_BYTE_LEN+TOTAL_HEADER_LEN+inSize+END_BYTE_LEN;

		if(argc != 4) {
			fprintf(strout,"1651 1 890000 1 %x\n",temp/2); // CCS format
		} else {
			fprintf(strout,"1651 1 10000 1 %x\n",temp/2); // CCS format
		}

		fprintf (strout, "0x%04X\n",0x0000);
		fprintf (strout, "0x%04X\n",TOTAL_HEADER_LEN+inSize); /* length in bytes */

		writeheader(strout, &data.dstMAC_H);

		writeboottable(strout,&data.BootTable[0],inSize/2);

		fprintf (strout, "0x%04X\n",(unsigned short)(SYMBOL));
		fprintf (strout, "0x%04X\n",0x0000);
		fprintf (strout, "0x%04X\n",0x0000);

	} else { // If there are many packets

		temp = BGN_BYTE_LEN + (counter+1)*(TOTAL_HEADER_LEN + END_BYTE_LEN) + inSize;

		if(argc != 4) {
			fprintf(strout,"1651 1 890000 1 %x\n",temp/2); // CCS format
		} else {
			fprintf(strout,"1651 1 10000 1 %x\n",temp/2); // CCS format
		}

		fprintf (strout, "0x%04X\n",0x0000);
		fprintf (strout, "0x%04X\n",TOTAL_HEADER_LEN+MAX_BOOTTBL_LEN); /* length in bytes */

		data.UDPlength = UDP_HEADER_LEN + BOOTTBL_HEADER_LEN + MAX_BOOTTBL_LEN;
		data.IPlength = data.UDPlength + IP_HEADER_LEN;
		UDPchecksum = bootmiscOnesComplementAdd(IP_TYPE_UDP, data.UDPlength);

		for(j=0; j<counter; j++) { // For first and middle packets

				data.IPchecksum=bootmiscOnesComplementChksum(0,&data.VerTOS,IP_HEADER_LEN/2);

				if(getDataIn(strin, MAX_BOOTTBL_LEN, data.BootTable)!=0) {
					fclose(strin);
					fclose(strout);
					return;
				};

				data.UDPchecksum=bootmiscOnesComplementChksum(UDPchecksum, &data.srcIPAddr_H,\
                                                         (UINT16)((4+4+UDP_HEADER_LEN+BOOTTBL_HEADER_LEN+MAX_BOOTTBL_LEN)/2));

				writeheader(strout, &data.dstMAC_H);
				writeboottable(strout,&data.BootTable[0],MAX_BOOTTBL_LEN/2);

				fprintf (strout, "0x%04X\n",(unsigned short)(SYMBOL));
				fprintf (strout, "0x%04X\n",0x0000);

				if(j != counter-1) fprintf (strout,"0x%04X\n",TOTAL_HEADER_LEN+MAX_BOOTTBL_LEN);

				// make ready for the next packet
				data.ID++;
				data.SeqNo++;

				if(data.SeqNo >= 0x200) {
					data.SeqNo = 0x100;
				}

				data.IPchecksum = 0x0000;
				data.UDPchecksum = 0x0000;

		}

		// For the last packet
		temp = counter*MAX_BOOTTBL_LEN;
		counter = inSize - temp; // how many bytes remained
		fprintf (strout,"0x%04X\n",TOTAL_HEADER_LEN+counter);

		data.UDPlength = UDP_HEADER_LEN + BOOTTBL_HEADER_LEN + counter;

		data.IPlength = data.UDPlength + IP_HEADER_LEN;
		data.IPchecksum = bootmiscOnesComplementChksum(0,&data.VerTOS,IP_HEADER_LEN/2);

		if(getDataIn(strin, counter, data.BootTable)!=0) {
			fclose(strin);
			fclose(strout);
			return;
		}

		UDPchecksum = bootmiscOnesComplementAdd(IP_TYPE_UDP, data.UDPlength);
		data.UDPchecksum=bootmiscOnesComplementChksum(UDPchecksum, &data.srcIPAddr_H,\
                                                         (UINT16)((4+4+UDP_HEADER_LEN+BOOTTBL_HEADER_LEN+counter)/2));
		writeheader(strout, &data.dstMAC_H);
		writeboottable(strout,&data.BootTable[0],counter/2);

		fprintf (strout, "0x%04X\n",(unsigned short)(SYMBOL));
		fprintf (strout, "0x%04X\n",0x0000);
		fprintf (strout, "0x%04X\n",0x0000);
	}

	fclose(strin);
	fclose(strout);
}
