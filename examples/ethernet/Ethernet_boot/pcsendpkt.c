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

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#ifdef __WIN32__
	#include <windows.h>
	#include <winsock.h>
#else
	#include <sys/types.h>
	#include <sys/socket.h>
	#include <netinet/in.h>
	#include <netdb.h>
#endif


#define UDP_LOW   42
#define UDP_HIGH  1504  // Note: Windows FRAGMENTS higher UDP sizes

#define SRCPORT   1234
#define DSTPORT   9

#define DELAY 60000

/* convert ascii to decimal number */
int toNum(unsigned char c)
{
  if ((c >= '0') && (c <= '9'))
     return(c - '0');

  else  if ((c >= 'A') && (c <= 'F'))
	  return(c -'A' + 10);

  else  if ((c >= 'a') && (c <= 'f'))
	  return(c - 'a' + 10);

  return(-1);
}


int main( int argc, char *argv[] )
{

#ifdef __WIN32__
    WORD                wVersionRequested;
    WSADATA             wsaData;
    SOCKET              s;
#else
	int					s;
#endif

    struct sockaddr_in  sin;
    unsigned char       *pBuf = 0;
    int                 tmp1,tmp2,tmp3,tmp4;
    time_t              ts,tn;
	FILE *strin;
	char iline[132];
	int i,j,length;
	int packetno;

    if( (argc != 3) ||
        sscanf(argv[2],"%03d.%03d.%03d.%03d",&tmp1,&tmp2,&tmp3,&tmp4)!=4 ||
        (tmp1 < 0 || tmp1 > 255 || tmp2 < 0 || tmp2 > 255 ||
         tmp3 < 0 || tmp3 > 255 || tmp4 < 0 || tmp4 > 255) )
    {
        printf("\nUsage: %s packetfile ipaddress\n",argv[0]);
        exit(-1);
    }

    tmp1 |= tmp2 << 8;
    tmp1 |= tmp3 << 16;
    tmp1 |= tmp4 << 24;

    strin = fopen (argv[1], "r");
    if (strin == NULL)  {
        printf ("could not open input file %s\n", argv[1]);
        exit(-1);
	}

    /* Skip the first two lines */
    fgets (iline, 131, strin);
	fgets (iline, 131, strin);

#ifdef __WIN32__
    wVersionRequested = MAKEWORD(1, 1);
    tmp2 = WSAStartup(wVersionRequested, &wsaData);
    if (tmp2 != 0)
    {
        printf("\r\nUnable to initialize WinSock for host info");
        exit(0);
    }
#endif

    s = socket( AF_INET, SOCK_DGRAM, 0 );
    if( s < 0 )
    {
#ifdef __WIN32__
        printf("failed connect (%d)\n",WSAGetLastError());
#else
		perror("failed connect");
#endif
        goto end;
    }

    sin.sin_family      = AF_INET;
    sin.sin_addr.s_addr = 0;
    sin.sin_port        = htons(SRCPORT);

    if ( bind( s, (struct sockaddr *)&sin, sizeof(sin) ) < 0 )
    {
#ifdef __WIN32__
        printf("failed bind (%d)\n",WSAGetLastError());
#else
		perror("failed bind");
#endif
        goto end;
    }

    /* Allocate a working buffer */
    if( !(pBuf = malloc( 2000 )) )
    {
        printf("failed packetno buffer allocation\n");
        goto end;
    }

    sin.sin_addr.s_addr = tmp1;
    sin.sin_port        = htons(DSTPORT);

    ts = time(0);

    packetno = 0;

    printf("\nSending packets to %d.%d.%d.%d\n",
                tmp1&255, (tmp1>>8)&255, (tmp1>>16)&255, (tmp1>>24)&255 );

    while(1)
    {
		/* get length in bytes */
		if(fgets(iline, 131, strin)==NULL) break;
	    length = toNum(iline[2])<<12 | toNum(iline[3])<<8 | toNum(iline[4])<<4 | toNum(iline[5]);
		if(length == 0) break;
		else if(length < UDP_LOW || length > UDP_HIGH) {
			printf("Invalid length = %d\n",length);
			goto end;
		}

		/* skip the next 21 lines, 14 mac + 20 IP + 8 UDP = 42 bytes = 21 lines */
		for(i=0; i<21; i++) {
			if(fgets(iline,131,strin)==NULL) break;
		}

		length -= 42;
		if(length < 0) {
			printf("Invalid length = %d\n",length);
			goto end;
		}

		/* copy the payload: magicno + seq no + boot table */
		for(i=0,j=0; i< length/2; i++) {
			if(fgets(iline, 131, strin)==NULL) break;

			*(pBuf+j) = toNum(iline[2])<<4 | toNum(iline[3]);
			j++;
			*(pBuf+j) = toNum(iline[4])<<4 | toNum(iline[5]);
			j++;
		}

		/* send out the packet */
        if( sendto( s, pBuf, length, 0, (struct sockaddr *)&sin, sizeof(sin) ) < 0 )
        {
#ifdef __WIN32__
        printf("send failed (%d)\n",WSAGetLastError());
#else
		perror("send failed");
#endif
            break;
        }

		/* packet number */
        packetno++;
		printf("Packet %d sent\n",packetno);

		/* add delay between packets */
		for(i=0; i<DELAY; i++) {
			tmp4 = tmp3;
			tmp3 = tmp4;
		}

		/* skip the next two lines */
	    if(fgets (iline, 131, strin)==NULL) break;
		if(fgets (iline, 131, strin)==NULL) break;
    }

    tn = time(0) - ts;
    printf("Exiting . Time = %d seconds, Total Packets = %d\n",(int)tn,packetno);

	/* clean up */
end:
	fclose(strin);

    if( pBuf )
        free( pBuf );
    if( s >= 0 )
#ifdef __WIN32__
        closesocket( s );
#else
		shutdown(s,SHUT_RDWR);
#endif

#ifdef __WIN32__
    WSACleanup();
#endif
}

