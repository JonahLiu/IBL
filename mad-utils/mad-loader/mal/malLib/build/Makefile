# Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/

###############################################################################
# Variables and their meanings.                                               #
#                                                                             #
# CC                      C compiler to be used                               #
# C_OPTS                  Options to be passed to compiler                    #
# OUTPUT_FILE_OPTION      Compiler specific option used to specify the        #
#                         object file output name                             #
# HOST_PRFX               Prefix for the object file directory                #
# LIB_EXT                 Extension for the loader library                    #
# LIB_NAME_PRFX           Prefix for the loader library                       #
# TARG_TOOL_NAME          Dynamic loader name, formed from the                #
#                         TARG_TOOL_NAME_NAME_PRFX and LIB_EXT               #
# OBJ_DIR                 Directory where object files are stored             #
# TARG_UNIT_TEST_FILES    Target specific unit testing files.                 #
# VPATH                   List of module directories                          #
# FILES                   List of files related to building the dynamic       #
#                         loader                                              #
# HEADERS                 List of header files extracted from FILES           #
# INCL                    Include directories                                 #
# OBJS                    List of object files required for linking           #
###############################################################################

LIB_NAME_PRFX    = malLib
CC               = cl6x
AR               = ar6x
TARGET           = C60

###############################################################################
# Set host specific default options
###############################################################################
HOST_PRFX = C60
LIB_EXT = a

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

ifeq ($(ENDIAN), big)
C_OPTS += -me ## Big Endian
endif
C_OPTS += -g
C_OPTS += -ml3 # far memory model
C_OPTS += -pds67
C_OPTS += --abi=elfabi
ifeq ($(ENDIAN), big)
A_OPTS += -me
endif
A_OPTS += --abi=elfabi
OUTPUT_FILE_OPTION = --output_file

AR_OPTS = rq2

LIB_INC = ../include/
ELF_LOADER_PATH = ../elfLoader/
MAL_API = ../malApis/

TARG_TOOL_NAME = $(LIB_NAME_PRFX).$(LIB_EXT)

###############################################################################
# List of modules and their files
###############################################################################
DLOAD_FILES = \
        Queue.h \
        ArrayList.c \
        ArrayList.h \
        dload.c \
        dload.h \
        elf32.c \
        elf32.h \
        dload_endian.c \
        dload_endian.h \
        relocate.h \
        symtab.h \
        util.h

DLOAD_API_FILES = \
        dload_api.h

DLWRAPPER_FILES = \
        Stack.h \
        dlw_dsbt.c \
        dlw_dsbt.h \
        dlw_client.c

MAL_LIB_FILES = \
        mal_lib.h \
        mal_lib_activation_record.h \
        mal_lib_file_utils.h \
        device_$(DEVICE).h \
        mal_lib_file_utils.c \
        delay.s \
        mal_lib_loader.c

DLOAD_SYM_FILES = symtab.c

DLOAD_REL_FILES = c60_reloc.c \
		c60_elf32.h

DLOAD_DYN_FILES = c60_dynamic.c \
		c60_dynamic.h

OBJ_DIR = $(HOST_PRFX)_LNX

VPATH = $(ELF_LOADER_PATH)/DLOAD $(ELF_LOADER_PATH)/DLOAD_API $(ELF_LOADER_PATH)/DLWRAPPER \
	$(ELF_LOADER_PATH)/DLOAD_SYM $(ELF_LOADER_PATH)/C60_DLOAD_DYN $(ELF_LOADER_PATH)/C60_DLOAD_REL \
	$(LIB_INC) $(MAL_API)

FILES = $(DLOAD_FILES) $(DLOAD_API_FILES) $(DLWRAPPER_FILES) \
        $(DLOAD_SYM_FILES) $(DLOAD_REL_FILES) $(DLOAD_DYN_FILES) $(MAL_LIB_FILES)

HEADERS = $(filter %.h, $(FILES))
INCL = -I. -I $(LIB_INC) -I $(C_DIR)/include $(patsubst %,-I%,$(VPATH))
TARGET_TEMP = $(patsubst %,-D%,$(TARGET))
DEFINE_TARGET = $(patsubst %,%_TARGET,$(TARGET_TEMP))

OBJS = $(patsubst %.c,$(OBJ_DIR)/%.obj,$(filter %.c, $(FILES)))
OBJS += $(patsubst %.s,$(OBJ_DIR)/%.obj,$(filter %.s, $(FILES)))

all: $(TARG_TOOL_NAME)

###############################################################################
# Normal make process                                                         
###############################################################################

$(TARG_TOOL_NAME): $(OBJS)
	$(AR) $(AR_OPTS) $@ $(OBJS)

$(OBJ_DIR)/%.obj: %.c $(HEADERS) $(OBJ_DIR)/.created
	$(CC) -c $(C_OPTS) $(INCL) $(DEFINE_TARGET) $< $(OUTPUT_FILE_OPTION) $@

$(OBJ_DIR)/%.obj: %.s $(OBJ_DIR)/.created
	$(AS) -c $(A_OPTS) $(DEFINE_TARGET) $< $(OUTPUT_FILE_OPTION) $@

$(OBJ_DIR)/.created:
	mkdir -p $(OBJ_DIR)
	touch $(OBJ_DIR)/.created


###############################################################################
# Cleanup								      
###############################################################################
clean:
	-rm -rf *_LNX
	-rm -rf *$(LIB_NAME_PRFX).*

