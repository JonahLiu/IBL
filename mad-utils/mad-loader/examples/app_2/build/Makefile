# Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/

CC       = cl6x
CLIB_INC = $(C_DIR)/include

MODE ?= relocatable

ifeq ($(MODE), relocatable)
PRINTF_LIB = ../../shlibs/build/printf.dll
else
PRINTF_LIB = ../../shlibs/build/printf.a
endif

C_OPTS = --abi=elfabi
ifeq ($(DEVICE),C6670)
C_OPTS += -mv6600  
else
ifeq ($(DEVICE),C6657)
C_OPTS += -mv6600  
else
ifeq ($(DEVICE),C6678)
C_OPTS += -mv6600  
else
DEFAULT:
	@echo "Device '$(DEVICE)' not supported"
	@exit 1
endif
endif
endif

ifeq ($(ENDIAN), big)
C_OPTS += -me ## Big Endian
endif
C_OPTS += -g
C_OPTS += -ml3
ifeq ($(MODE), relocatable)
C_OPTS += -DSHARED_LIB=1
endif

ifeq ($(MODE), relocatable)
L_OPTS = -z
L_OPTS += --dynamic
L_OPTS += -r
else
L_OPTS = -z lnk_$(DEVICE).cmd -m map.txt
L_OPTS += -a
endif

L_OPTS += -cr
L_OPTS += -l $(PRINTF_LIB)
L_OPTS += -l $(C_DIR)/lib/libc.a

OUTPUT_FILE_OPTION = --output_file

###############################################################################
# List of files
###############################################################################
OBJ_DIR = obj
SRCDIR = ../src
VPATH = $(SRCDIR)
C_OPTS += -fr=$(OBJ_DIR)

APP=app_2
APP_FILES = $(APP).c
		
APP_HEADERS = $(filter %.h, $(APP_FILES))
APP_INCL = -I $(CLIB_INC) $(patsubst %,-I%,$(VPATH))
APP_SRC = $(patsubst %.c,$(SRCDIR)/%.c,$(filter %.c, $(APP_FILES)))

###############################################################################
# Normal make process                                                         
###############################################################################
all: $(APP).exe

$(APP).exe: $(APP_SRC) $(APP_HEADERS) $(OBJ_DIR)/.created $(PRINTF_LIB)
	$(CC) $(C_OPTS) $(APP_INCL) $(APP_SRC) $(L_OPTS) $(OUTPUT_FILE_OPTION) $@
	
$(OBJ_DIR)/.created:
	mkdir -p $(OBJ_DIR)
	touch $(OBJ_DIR)/.created
	
###############################################################################
# Cleanup								      
###############################################################################
clean:
	-rm -rf $(OBJ_DIR)
	-rm -rf *.exe
	-rm -rf map.txt

