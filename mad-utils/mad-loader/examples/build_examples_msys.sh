#!/bin/bash

#Build script to be invoked from BASH shell to build MAD loader example applications

if [ "$1" == "" ] ; then 
    echo "Device not specified"
    echo "Usage: $0 C6678|C6670|C6657 big|little [static|relocatable]"
    exit
fi

if [ "$3" == "static" ] ; then 
    mode="static"
    libmode="static"
else
    mode="relocatable"
    libmode="shared"
fi

export C_DIR='"C:/Program Files/Texas Instruments/C6000 Code Generation Tools 7.2.4"'

export PATH=$PATH:/c/Program\ Files/Texas\ Instruments/C6000\ Code\ Generation\ Tools\ 7.2.4/bin

mkdir -p bin/$1/$endian

#Build for device $1

make -C shlibs/build clean all DEVICE=$1 ENDIAN=$2 MODE=$libmode

make -C app_1/build clean all DEVICE=$1 ENDIAN=$2 MODE=$mode

make -C app_2/build clean all DEVICE=$1 ENDIAN=$2 MODE=$mode

