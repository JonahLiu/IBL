
# get the type of OS currently running
OS=$(shell uname)

# check if the OS string contains 'Linux'
ifneq (,$(findstring Linux, $(OS)))
# Linux OS...
APP_EXT=
CLEAN=rm -f
else
# windows OS...
APP_EXT=.exe
CLEAN=del
endif

SRCS = $(wildcard *.c)
EXES = $(patsubst %.c,%$(APP_EXT),$(SRCS))

.PHONY: all clean
all: $(EXES)

clean:
	$(CLEAN) $(EXES)

%$(APP_EXT): %.c
	$(CC) $(CFLAGS) -o $@ $<


