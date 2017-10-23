Contents:
---------
./examples: This folder contains example applications and shared libraries for testing the MAD flow
./mal: This folder contains the source for MAD loader library and the loader application
./nmlLoader: This folder contains the source for the no man's land loader(NML).  NML is a
             sub-component of the MAD loader and resides in a reserved virtual address space.

Build instructions:
-------------------
NOTE FOR BUILDING ON WINDOWS ENVIRONMENT: For building on windows environment GNU utilities like
"make" would be required. MINGW-MSYS installation is required for Windows build environment. 
MINGW-MSYS can be downloaded from http://sourceforge.net/projects/mingw/files/

Build environment setup:
    Before starting the build following environment setup has to be done 
    1) variable C_DIR should be set to the top directory of the Code Generation tools e.g.
       Linux bash shell: 
          export C_DIR=/opt/TI/TI_CGT_C6000_7.2.4
       MSYS bash shell: 
          export C_DIR='"C:/Program Files/Texas Instruments/C6000 Code Generation Tools 7.2.4"'
    2) Code Generation tool binaries should be in the path e.g.
       Linux bash shell: 
          export PATH=/opt/TI/TI_CGT_C6000_7.2.4/bin:$PATH
       MSYS bash shell: 
          export PATH=/c/Program\ Files/Texas\ Instruments/C6000\ Code\ Generation\ Tools\ 7.2.4/bin:$PATH

Build scripts:
Sample build scripts are provided in the current directory to build MAD loader.
Modify the above mentioned environment variables in the build scripts to
adjust to existing build environment.
 1. build_loader_lnx.sh: Script to build MAD loader in Linux bash shell 
 2. build_loader_msys.sh: Script to build MAD loader in MSYS bash shell 

Build script usage:
For little endian build the script is invoked as: 
 -  ./build_loader_lnx.sh device_name
For big endian build the script is invoked as: 
 -  ./build_loader_lnx.sh device_name big
where device name can be C6670/C6678/C6657


Example applications:
---------------------
    Example "hello world" type applications are included to demonstarte the MAD flow. 
    Each of the applications have a makefile which should be used to build the application.
    The examples can be built as "dynamic relocatable objects with shared library" to test the MAD
    flow or can be built as a "static executable" to test MAD flow in "prelinker bypass" mode.
    A sample build script is available in "./examples" directory to build the examples.


Details about MAD loader build:
-------------------------------
MAD loader library:
-------------------
    The makefile for building the MAD loader library is in the directory "mal/malLib/build"
    Following are the steps to build the MAD loader library:
    cd mal/malLib/build
    make DEVICE=<device number>
        supported device numbers are 
            C6670
            C6678
            C6657

MAD loader application:
-----------------------
    The makefile for building the MAD loader library is in the directory "mal/malApp/build"
    NOTE: The MAD loader library has to be built prior to building MAD loader App
    Following are the steps to build the MAD loader library:
    cd mal/malApp/build
    make DEVICE=<device number>
        supported device numbers are 
            C6670
            C6678
            C6657

    NOTE: MAD loader application needs to be XIP (eXecute In Place) in DDR. The linker command file 
    "lnk_<device number>.cmd" is used to ensure that the MAD loader app is bound to XIP address in DDR.
    NOTE: MAD loader application needs RW area for stack, heap and global variables. By default the linker command file 
          has been setup to allocate the RW area towards the end of DDR memory. This should be changed by the user 
          according to the target execution environment.

NML:
----
    The makefile for building the NML is in the directory "nmlLoader/build"
    Following are the steps to build NML:
    cd nmlLoader/build
    make DEVICE=<device number>
        supported device numbers are 
            C6670
            C6678
            C6657

    NOTE: Since NML is XIP in DDR, it has to be ensured that the NML code segments are bound to virtual address
          which is XIP in DDR. NML is a part of the ROM file system loaded on DDR. if the offset of the 
          NML ELF file changes in the ROM file system, then this address needs to be modified. This can happen
          if the size of the MAD loader application changes.
          To get the current offset of NML in ROM file system, do a trial run of the MAP tool, 
          MAP tool will create a file ./tmp/fsOffsets.txt. This file will list the offset of all the 
          files in the filesystem.
          The linker command file "lnk_<device number>.cmd" is used to ensure that the NML is bound to XIP address in DDR.
    NOTE: NML also needs RW area for stack and global variables. By default the linker command file has been setup 
          to allocate the RW area towards the end of DDR memory. This should be changed by the user according to the
          target execution environment.

