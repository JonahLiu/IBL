
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

if [ -z "$CGT_INSTALL_DIR" ] ; then 
    CGT_INSTALL_DIR=/opt/ti/C6000CGT7.4.0
fi

export C_DIR=$CGT_INSTALL_DIR
export PATH=$CGT_INSTALL_DIR/bin:$PATH

#Build for device $1

make -C shlibs/build clean all DEVICE=$1 ENDIAN=$2 MODE=$libmode

make -C app_1/build clean all DEVICE=$1 ENDIAN=$2 MODE=$mode

make -C app_2/build clean all DEVICE=$1 ENDIAN=$2 MODE=$mode


