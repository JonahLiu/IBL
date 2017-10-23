export CGT_INSTALL_DIR=~/ti/TI_CGT_C6000_7.4.0
export TOOL_DIR="../../../../../../"
export TARGET=6670
export ENDIAN=little

echo CGT_INSTALL_DIR set as: ${CGT_INSTALL_DIR}
echo TARGET set as: ${TARGET}
echo IBL_ROOT_DIR set as : ${IBL_ROOT_DIR}

echo Converting .out to HEX ...
if [ ${ENDIAN} == little ]
then
${CGT_INSTALL_DIR}/bin/hex6x -order L helloworld_image.rmd srioboot_helloworld_evm${TARGET}l.out
else
${CGT_INSTALL_DIR}/bin/hex6x -order M helloworld_image.rmd srioboot_helloworld_evm${TARGET}l.out
fi

../../../../../../bttbl2hfile/Bttbl2Hfile srioboot_helloworld.btbl srioboot_helloworld.h srioboot_helloworld.bin

../../../../../../hfile2array/hfile2array srioboot_helloworld.h srioBootCode.h bootCode

mv srioBootCode.h ../../../srioboot_example/src/
