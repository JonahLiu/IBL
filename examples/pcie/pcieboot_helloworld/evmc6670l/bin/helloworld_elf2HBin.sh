export C6000_CG_DIR=~/ti/TI_CGT_C6000_7.4.0
export TOOL_DIR="../../../../../../"
export TARGET=6670
export ENDIAN=little
export PATH=${PATH};${SystemRoot}/system32;${SystemRoot};

echo CGT_INSTALL_DIR set as: ${CGT_INSTALL_DIR}
echo TARGET set as: ${TARGET}
echo IBL_ROOT_DIR set as : ${IBL_ROOT_DIR}

echo Converting .out to HEX ...
if [ ${ENDIAN} == little ]
then
${CGT_INSTALL_DIR}/bin/hex6x -order L helloworld_image.rmd pcieboot_helloworld_evm${TARGET}l.out
else
${CGT_INSTALL_DIR}/bin/hex6x -order M helloworld_image.rmd pcieboot_helloworld_evm${TARGET}l.out
fi

../../../../../../bttbl2hfile/Bttbl2Hfile pcieboot_helloworld.btbl pcieboot_helloworld.h pcieboot_helloworld.bin

../../../../../../hfile2array/hfile2array pcieboot_helloworld.h pcieBootCode.h bootCode

if [ ${ENDIAN} == little ]
then
mv pcieBootCode.h ../../../linux_host_loader/LE/pcieBootCode_${TARGET}.h
else
mv pcieBootCode.h ../../../linux_host_loader/BE/pcieBootCode_${TARGET}.h
fi
