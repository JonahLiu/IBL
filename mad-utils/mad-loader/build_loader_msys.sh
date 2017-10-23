#!/bin/bash

#Example build script to be invoked from MSYS BASH shell to build MAD loader executables

if [ "$1" == "" ] ; then 
    echo "Device not specified"
    echo "Usage: $0 C6678|C6670|C6657 [big]"
    exit
fi

if [ "$2" == "big" ] ; then 
    endian="be"
else
    endian="le"
fi

if [ -z "$C_DIR" ] ; then 
export C_DIR='"C:/ti/C6000 Code Generation Tools 7.4.0"'
fi

export PATH=$PATH:/c/ti/C6000\ Code\ Generation\ Tools\ 7.4.0/bin

mkdir -p bin/$1/$endian

#Build for device $1

make -C mal/malLib/build clean all DEVICE=$1 ENDIAN=$2

make -C mal/malApp/build clean all DEVICE=$1 ENDIAN=$2

cp mal/malApp/build/mal_app.exe bin/$1/$endian

make -C nmlLoader/build clean all DEVICE=$1 ENDIAN=$2

cp nmlLoader/build/nml.exe bin/$1/$endian

