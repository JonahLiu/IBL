# Copyright (C) 2010 Texas Instruments Incorporated - http://www.ti.com/

###############################################################################
# Variables and their meanings.                                               #
#                                                                             #
# CC                      C compiler to be used                               #
# C_OPTS                  Options to be passed to compiler                    #
# OUTPUT_FILE_OPTION      Compiler specific option used to specify the        #
#                         object file output name                             #
# HOST_PRFX               Prefix for the object file directory                #
# APP_EXT                 Extension for the loader library                    #
# APP_NAME_PRFX           Prefix for the loader library                       #
# TARG_TOOL_NAME          Dynamic loader name, formed from the                #
#                         TARG_TOOL_NAME_NAME_PRFX and APP_EXT               #
# OBJ_DIR                 Directory where object files are stored             #
# TARG_UNIT_TEST_FILES    Target specific unit testing files.                 #
# VPATH                   List of module directories                          #
# FILES                   List of files related to building the dynamic       #
#                         loader                                              #
# HEADERS                 List of header files extracted from FILES           #
# INCL                    Include directories                                 #
# OBJS                    List of object files required for linking           #
###############################################################################

APP_NAME_PRFX    = mal_app
CC               = cl6x
TARGET           = C60
MAL_LIB_DIR      = ../../malLib
MAL_LIB          = $(MAL_LIB_DIR)/build/malLib.a
STRIP            = strip6x
STRIP_OPTS       = -p
PRELINK          = prelink6x

###############################################################################
# Set host specific default options
###############################################################################
HOST_PRFX = C60
APP_EXT = exe

ifeq ($(DEVICE),C6670)
C_OPTS = -DDEVICE=6670
LOAD_PARTITION ?= 0x9E000000
C_OPTS += -D__LOAD_PARTITION__=$(LOAD_PARTITION)
else
ifeq ($(DEVICE),C6657)
C_OPTS = -DDEVICE=6657
LOAD_PARTITION ?= 0x9E000000
C_OPTS += -D__LOAD_PARTITION__=$(LOAD_PARTITION)
else
ifeq ($(DEVICE),C6678)
C_OPTS = -DDEVICE=6678
LOAD_PARTITION ?= 0x9E000000
C_OPTS += -D__LOAD_PARTITION__=$(LOAD_PARTITION)
else
DEFAULT:
	@echo "Device '$(DEVICE)' not supported"
	@exit 1
endif
endif
endif

C_OPTS += -mv6400+ 
ifeq ($(ENDIAN), big)
C_OPTS += -me ## Big Endian
endif
RT_LIB = $(C_DIR)/lib/libc.a

C_OPTS += -g
C_OPTS += -ml3 # far memory model
C_OPTS += -pds67
C_OPTS += --abi=elfabi
OUTPUT_FILE_OPTION = --output_file
AS = cl6x
A_OPTS += -mv6400+
ifeq ($(ENDIAN), big)
A_OPTS += -me
endif
A_OPTS += --abi=elfabi
LNK_OPTS += -i$(C_DIR)/lib -z -m=map.txt lnk_$(DEVICE).cmd -c $(MAL_LIB) $(RT_LIB)


LIB_INC = $(MAL_LIB_DIR)/include/
CLIB_INC = $(C_DIR)/include/

TARG_TOOL_NAME = $(APP_NAME_PRFX).$(APP_EXT)


###############################################################################
# List of files
###############################################################################
FILES = \
        mal_lib.h \
        mal_lib_activation_record.h \
        mal_lib_file_utils.h \
        mal_app.c \
        mal_lib_cb.c \
		entry.s

OBJ_DIR = $(HOST_PRFX)_LNX
SRCDIR = ../src/
VPATH = $(SRCDIR) $(LIB_INC)

HEADERS = $(filter %.h, $(FILES))
INCL = -I $(CLIB_INC) -I $(LIB_INC) $(patsubst %,-I%,$(VPATH))
TARGET_TEMP = $(patsubst %,-D%,$(TARGET))
DEFINE_TARGET = $(patsubst %,%_TARGET,$(TARGET_TEMP))

OBJS = $(patsubst %.c,$(OBJ_DIR)/%.obj,$(filter %.c, $(FILES)))
OBJS += $(patsubst %.s,$(OBJ_DIR)/%.obj,$(filter %.s, $(FILES)))

all: $(TARG_TOOL_NAME)

###############################################################################
# Normal make process                                                         
###############################################################################

$(TARG_TOOL_NAME): $(OBJS) lnk_$(DEVICE).cmd $(MAL_LIB)
	$(CC) $(C_OPTS) $(OBJS) $(LNK_OPTS) -o $@
	cp $@ $@.dbg
	$(STRIP) $(STRIP_OPTS) $@ 
#	$(PRELINK) prelink_mal_app_$(DEVICE).cmd

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
	-rm -rf *.dbg
	-rm -rf *$(APP_NAME_PRFX).$(APP_EXT)
	-rm -f map.txt
	-rm -f *.pdo

