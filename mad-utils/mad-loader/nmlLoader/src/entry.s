; Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/ 
; 
; 
;  Redistribution and use in source and binary forms, with or without 
;  modification, are permitted provided that the following conditions 
;  are met:
;
;    Redistributions of source code must retain the above copyright 
;    notice, this list of conditions and the following disclaimer.
;
;    Redistributions in binary form must reproduce the above copyright
;    notice, this list of conditions and the following disclaimer in the 
;    documentation and/or other materials provided with the   
;    distribution.
;
;    Neither the name of Texas Instruments Incorporated nor the names of
;    its contributors may be used to endorse or promote products derived
;    from this software without specific prior written permission.
;
;  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
;  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
;  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
;  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
;  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
;  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
;  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
;  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
;  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
;  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
;  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
;

; This file implements the NML entry point function
;
	.sect ".enter"
	.ref nml_loader
	.ref nml_stack
	.def  nml_entry


; nml_entry() MUST be 10-bit aligned in memory
nml_entry:

	;Invalidate L1P cache 
    mvkl 0x184528, A10
    mvkh 0x184528, A10
    mvk 1, B10
    STB B10, *A10

	;Invalidate L2 cache 
    mvkl 0x184508, A10
    mvkh 0x184508, A10
    STB B10, *A10

	;Invalidate L1D cache 
    mvkl 0x1845048, A10
    mvkh 0x1845048, A10
    STB B10, *A10

	; Setup Stack Pointer: SP = nml_stack  + (512 * (DNUM +1))
	mvc DNUM, B4
	shl B4,9, B4
	addk 512-8, B4
	mvkl nml_stack, B6
	mvkh nml_stack, B6
	add B4, B6, B15
    ; ensure value SP is aligned to 8 bytes
    and B15, ~8, B15
	; Branch to nml_loader
	mvkl nml_loader, B2
	mvkh nml_loader, B2
	bnop  B2, 5
	nop






