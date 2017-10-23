# Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com/

TARGET_NAME = nml.exe
CC = cl6x
STRIP = strip6x
STRIP_OPTS = -p
PRELINK = prelink6x

HOST_PRFX = C60
HOST_EXT = 6x

AS = cl6x
ifeq ($(DEVICE),C6670)
C_OPTS = -DDEVICE=6670
C_OPTS += -mv6600  
A_OPTS += -mv6600
else
ifeq ($(DEVICE),C6657)
C_OPTS = -DDEVICE=6657
C_OPTS += -mv6600  
A_OPTS += -mv6600
else
ifeq ($(DEVICE),C6678)
C_OPTS = -DDEVICE=6678
C_OPTS += -mv6600  
A_OPTS += -mv6600
else
DEFAULT:
	@echo "Device '$(DEVICE)' not supported"
	@exit 1
endif
endif
endif

C_OPTS += -g ## Enable debugging  
C_OPTS += -ss ## interlist C source and optimizer with .asm source
C_OPTS += -ml3  ## Far memory model
C_OPTS += -k  ## Keep .asm files
ifeq ($(ENDIAN),big)
C_OPTS+= -me ## Big Endian
endif
C_OPTS += -pds67
C_OPTS += --abi=elfabi
ifeq ($(ENDIAN),big)
A_OPTS += -me
endif
A_OPTS += --abi=elfabi
OUTPUT_FILE_OPTION = --output_file
LNK_OPTS += -z lnk_$(DEVICE).cmd -m map.txt --dynamic
EXPORT_OPTS = --export=nml_ar_data
EXPORT_OPTS += --export=nml_boot_status
EXPORT_OPTS += --export=nml_entry

OBJ_DIR = $(HOST_PRFX)_LNX
MAL_LIB_INC = ../../mal/malLib/include 
SRCDIR = ../src

SRC_FILES = \
        nml_ar_utils.h \
        nml_ar_utils.c \
        entry.s \
        nml_loader.c 

VPATH = $(SRCDIR)
INCL = $(patsubst %,-I%,$(VPATH)) -I $(MAL_LIB_INC)

OBJS = $(patsubst %.c,$(OBJ_DIR)/%.obj,$(filter %.c, $(SRC_FILES)))
OBJS += $(patsubst %.s,$(OBJ_DIR)/%.obj,$(filter %.s, $(SRC_FILES)))

all: $(TARGET_NAME)

$(TARGET_NAME): $(OBJS) lnk_$(DEVICE).cmd
	$(CC) $(C_OPTS) $(OBJS) $(LNK_OPTS) $(EXPORT_OPTS) -o $@ 
	cp $@ $@.dbg
	$(STRIP) $(STRIP_OPTS) $@ 
#	$(PRELINK) prelink_nml_$(DEVICE).cmd

$(OBJ_DIR)/%.obj: %.c $(HEADERS) $(OBJ_DIR)/.created
	$(CC) -c $(C_OPTS) $(INCL) $(DEFINE_TARGET) $< $(OUTPUT_FILE_OPTION) $@

$(OBJ_DIR)/%.obj: %.s $(HEADERS) $(OBJ_DIR)/.created
	$(CC) -c $(A_OPTS) $(DEFINE_TARGET) $< $(OUTPUT_FILE_OPTION) $@

$(OBJ_DIR)/.created:
	mkdir -p $(OBJ_DIR)
	touch $(OBJ_DIR)/.created

clean:
	-rm -rf *_LNX
	-rm -rf *.dbg
	-rm -rf *.exe
	-rm -rf *.asm
	-rm -rf *.pdo
	-rm -rf map.txt

