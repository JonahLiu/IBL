# Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/

APP_NAME_PRFX    = mal_app
CC               = cl6x
AR				 = ar6x
CLIB_INC = $(C_DIR)/include

MODE ?= shared

AR_OPTS = r

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
C_OPTS += --mem_model:data=far
ifeq ($(MODE), shared)
C_OPTS += -DSHARED_LIB=1
endif


L_OPTS = -z
ifeq ($(MODE), shared)
L_OPTS += --init=_p_init
L_OPTS += --dynamic=lib
L_OPTS += -r
LIB_PREFIX = dll
else
LIB_PREFIX = a
endif

L_OPTS += $(C_DIR)/lib/libc.a

OUTPUT_FILE_OPTION = --output_file

###############################################################################
# List of files
###############################################################################
OBJ_DIR = obj
SRCDIR = ../src
VPATH = $(SRCDIR)
C_OPTS += -fr=$(OBJ_DIR)

PRINTF=printf
PRINTF_FILES = printf.c
		
PRINTF_HEADERS = $(filter %.h, $(PRINTF_FILES))
PRINTF_INCL = -I $(CLIB_INC) $(patsubst %,-I%,$(VPATH))
PRINTF_SRC = $(patsubst %.c,$(SRCDIR)/%.c,$(filter %.c, $(PRINTF_FILES)))
PRINTF_OBJS = $(patsubst %.c,$(OBJ_DIR)/%.obj,$(filter %.c, $(PRINTF_FILES)))

###############################################################################
# Normal make process                                                         
###############################################################################
all: $(PRINTF).$(LIB_PREFIX)

$(PRINTF).a: $(PRINTF_OBJS)
	@echo "Archiving $@"
	$(AR) $(AR_OPTS) $@ $(PRINTF_OBJS)

$(PRINTF).dll: $(PRINTF_SRC) $(PRINTF_HEADERS) $(OBJ_DIR)/.created
	$(CC) $(C_OPTS) $(PRINTF_INCL) $(PRINTF_SRC) $(L_OPTS) $(OUTPUT_FILE_OPTION) $@
	
$(OBJ_DIR)/%.obj: %.c $(PRINTF_HEADERS) $(OBJ_DIR)/.created
	@echo "compiling $<"
	$(CC) -c $(C_OPTS) $(PRINTF_INCL) $< $(OUTPUT_FILE_OPTION) $@

$(OBJ_DIR)/.created:
	mkdir -p $(OBJ_DIR)
	touch $(OBJ_DIR)/.created
	
###############################################################################
# Cleanup								      
###############################################################################
clean:
	-rm -rf $(OBJ_DIR)
	-rm -rf *.$(LIB_PREFIX)
	
