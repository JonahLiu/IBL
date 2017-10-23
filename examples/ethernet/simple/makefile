#**************************************************************************
#* FILE PURPOSE: Build the simple test program
#**************************************************************************
#* FILE NAME: makefile
#*
#* DESCRIPTION: Builds the following:
#*
#*              simple.out        - little endian mapped program.
#*              simple.le.btbl    - Simple program in boot table format.
#*		    simple.eth 	    - Simple Program in ETH format.	
#*              
#***************************************************************************

AOPTS_LE= -g -c -k -mi200 -ml3 -pm -mv6400
AOPTS_BE= -me $(AOPTS_LE)

all: simple.eth

simple.eth: simple.out
	hex6x simple.rmd
	../Utilities/bconvert64x -le simple.btbl simple.le.btbl
	../Utilities/bootpacket simple.le.btbl simple.eth
	cp simple.eth ../Ethernet_boot/simple.eth
	rm simple.eth

simple.out: simple.obj simple.cmd
	cl6x -z simple.cmd -o simple.out -m simple.map

simple.obj: simple.s
	cl6x $(AOPTS_LE) simple.s

clean:
	rm simple.obj
	rm simple.out
	rm simple.btbl
	rm simple.le.btbl
	rm simple.map
