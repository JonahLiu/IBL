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
${CGT_INSTALL_DIR}/bin/hex6x -order L localreset.rmd pcieboot_localreset_evm${TARGET}l.out
else
${CGT_INSTALL_DIR}/bin/hex6x -order M localreset.rmd pcieboot_localreset_evm${TARGET}l.out
fi

../../../../../../bttbl2hfile/Bttbl2Hfile pcieboot_localreset.btbl pcieboot_localreset.h pcieboot_localreset.bin

../../../../../../hfile2array/hfile2array pcieboot_localreset.h pcieLocalReset.h localResetCode

if [ ${ENDIAN} == little ]
then
mv pcieLocalReset.h ../../../linux_host_loader/LE/pcieLocalReset_${TARGET}.h
else
mv pcieLocalReset.h ../../../linux_host_loader/BE/pcieLocalReset_${TARGET}.h
fi
