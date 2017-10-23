
#Example build script to be invoked from BASH shell to build MAD loader executables

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

if [ -z "$CGT_INSTALL_DIR" ] ; then 
CGT_INSTALL_DIR=$HOME/ti/TI_CGT_C6000_7.4.0
fi

export C_DIR=$CGT_INSTALL_DIR
export PATH=$CGT_INSTALL_DIR/bin:$PATH

mkdir -p bin/$1/$endian

#Build for device $1

make -C mal/malLib/build clean all DEVICE=$1 ENDIAN=$2

make -C mal/malApp/build clean all DEVICE=$1 ENDIAN=$2

cp mal/malApp/build/mal_app.exe bin/$1/$endian

make -C nmlLoader/build clean all DEVICE=$1 ENDIAN=$2

cp nmlLoader/build/nml.exe bin/$1/$endian

