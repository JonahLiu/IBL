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

#ifndef bootpacket
#define bootpacket

typedef short int INT16;
typedef int INT32;
typedef unsigned short int UINT16;
typedef unsigned int UINT32;

#define DST_MAC_H 0x0008
#define DST_MAC_M 0x7433
#define DST_MAC_L 0x2630

#define SRC_MAC_H 0x000D
#define SRC_MAC_M 0x5676
#define SRC_MAC_L 0x2F1A

#define SRC_IP_ADDR_H 0x9EDA
#define SRC_IP_ADDR_L 0x674E
#define DST_IP_ADDR_H 0x9EDA
#define DST_IP_ADDR_L 0x6723

#define UDP_SRC_PORT 0x0
#define UDP_SRC_PORT_BTPKT 0xBEEF  /* Bill's bt-pkt.exe use this value */
#define UDP_DST_PORT 0x9

#define ETHER_TYPE_IP 0x800
#define IP_TYPE_UDP 0x11

#define MAGICNO 0x544B

/* Actual packets has 14 +20 + 8 + 244 = 42 + 244 = 286 bytes */

#define MAC_HEADER_LEN     14
#define IP_HEADER_LEN      20
#define UDP_HEADER_LEN     8
#define BOOTTBL_HEADER_LEN 4
#define TOTAL_HEADER_LEN   46  /* 14 + 20 + 8 + 4 = 46 bytes */

#define MAX_PAYLOAD_LEN    244
//#define MAX_PAYLOAD_LEN    1176
#define MAX_BOOTTBL_LEN (MAX_PAYLOAD_LEN - BOOTTBL_HEADER_LEN) /* 240 bytes */

#define SYMBOL 0xEA00
#define BGN_BYTE_LEN 0x04  /* ex: 0x0000, 0x00A2 */
#define END_BYTE_LEN 0x06  /* ex: EA00, 0000, 0000 */


struct BootPacket {
		INT16 dstMAC_H;       /* MAC */
		INT16 dstMAC_M;
		INT16 dstMAC_L;
		INT16 srcMAC_H;
		INT16 srcMAC_M;
		INT16 srcMAC_L;
		INT16 EtherType;
		INT16 VerTOS;         /* IP */
		UINT16 IPlength;
		INT16 ID;
		INT16 FlagsFrag;
		INT16 TTLProtocol;
		UINT16 IPchecksum;
		INT16 srcIPAddr_H;
		INT16 srcIPAddr_L;
		INT16 dstIPAddr_H;
		INT16 dstIPAddr_L;
		INT16 srcPort;        /* UDP */
		INT16 dstPort;
		UINT16 UDPlength;
		UINT16 UDPchecksum;
		INT16 MagicNo;        /* Payload */
		INT16 SeqNo;
		INT16 BootTable[MAX_BOOTTBL_LEN/2];
};



#endif