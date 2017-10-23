/*****************************************************************************/
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

#include <stdio.h>
#include <stdarg.h>
#include <string.h>
 
extern volatile unsigned int cregister DNUM;

#ifdef SHARED_LIB
__declspec(dllexport) int myprintf(const char *format, ...);

__declspec(dllimport) int _printfi(char **_format, va_list _ap, void *_op, 
                    int (*_outc)(char, void *), int (*_outs)(char *, void *, int));
#endif
 
char pbuffer[128];
int pb_idx = 7;
 
/*****************************************************************************/
/* PRINTF   -  Print formatted output to a buffer                            */
/*****************************************************************************/
int myprintf(const char *_format, ...)
{
   va_list _ap;
   int i = strlen(_format);
 
   if (i > (sizeof(pbuffer) - pb_idx))
       return -1;

   va_start(_ap, _format);
   vsnprintf(&pbuffer[pb_idx], (sizeof(pbuffer)-16), _format, _ap);
   va_end(_ap);

   pb_idx += i;

   return 0;
}
 
/*****************************************************************************/
/* _p_init -  Dummy Library init function                                    */
/*****************************************************************************/
int _p_init(void) 
{ 
   pbuffer[0] = 'p';
   pbuffer[1] = 'i';
   pbuffer[2] = 'n';
   pbuffer[3] = 'i';
   pbuffer[4] = 't';
   pbuffer[5] = '0' + (unsigned char)DNUM;
   pbuffer[6] = 0;
   return 0; 
}

