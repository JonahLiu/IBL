#*
#*
#* Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/ 
#* 
#* 
#*  Redistribution and use in source and binary forms, with or without 
#*  modification, are permitted provided that the following conditions 
#*  are met:
#*
#*    Redistributions of source code must retain the above copyright 
#*    notice, this list of conditions and the following disclaimer.
#*
#*    Redistributions in binary form must reproduce the above copyright
#*    notice, this list of conditions and the following disclaimer in the 
#*    documentation and/or other materials provided with the   
#*    distribution.
#*
#*    Neither the name of Texas Instruments Incorporated nor the names of
#*    its contributors may be used to endorse or promote products derived
#*    from this software without specific prior written permission.
#*
#*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 
#*  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT 
#*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
#*  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT 
#*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, 
#*  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT 
#*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
#*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
#*  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
#*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE 
#*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#*


#*************************************************************************************
#* FILE NAME: makefile
#*
#* DESCRIPTION: Makes the ethernet module for the IBL
#*
#*************************************************************************************/

ifndef IBL_ROOT
	export IBL_ROOT= ../../..
endif

ECODIR= $(IBL_ROOT)/ethboot

CSRC= ethboot.c

.PHONY: ethboot


include $(IBL_ROOT)/make/$(ARCH)/makeeco.mk



C6X_C_DIR+=  $(IBL_ROOT)
C6X_C_DIR+= ;$(IBL_ROOT)/arch/$(ARCH)
C6X_C_DIR+= ;$(IBL_ROOT)/device
C6X_C_DIR+= ;$(IBL_ROOT)/device/$(TARGET)
C6X_C_DIR+= ;$(IBL_ROOT)/ethboot
C6X_C_DIR+= ;$(IBL_ROOT)/driver/eth
C6X_C_DIR+= ;$(STDINC)
C6X_C_DIR+= ;$(IBL_ROOT)/hw/macs
C6X_C_DIR+= ;$(IBL_ROOT)/hw/mdio
C6X_C_DIR+= ;$(IBL_ROOT)/hw/sgmii
C6X_C_DIR+= ;$(IBL_ROOT)/hw/cpsw
C6X_C_DIR+= ;$(IBL_ROOT)/hw/qm
C6X_C_DIR+= ;$(IBL_ROOT)/hw/cpdma
C6X_C_DIR+= ;$(IBL_ROOT)/hw/pa
export C6X_C_DIR



ethboot: gen_cdefdep makefile $(OBJS)


$(OBJS): cdefdep

gen_cdefdep:
	@echo Checking command line dependencies
	@echo $(TARGET) $(CDEFS) $(DEBUG) > cdefdep.tmp
	@sh -c 'if diff -q cdefdep.tmp cdefdep ; then echo same ; else $(CP) cdefdep.tmp cdefdep ; fi '


