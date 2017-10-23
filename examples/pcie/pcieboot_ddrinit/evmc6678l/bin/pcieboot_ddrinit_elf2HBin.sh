export C6000_CG_DIR=~/ti/TI_CGT_C6000_7.4.0
export TARGET=6678
export ENDIAN=little

echo CGT_INSTALL_DIR set as: ${CGT_INSTALL_DIR}
echo TARGET set as: ${TARGET}

echo Converting .out to HEX ...
if [ ${ENDIAN} == little ]
then
${CGT_INSTALL_DIR}/bin/hex6x -order L pcieboot_ddrinit.rmd pcieboot_ddrinit_evm${TARGET}l.out
else
${CGT_INSTALL_DIR}/bin/hex6x -order M pcieboot_ddrinit.rmd pcieboot_ddrinit_evm${TARGET}l.out
fi

../../../../../../bttbl2hfile/Bttbl2Hfile pcieboot_ddrinit.btbl pcieboot_ddrinit.h pcieboot_ddrinit.bin

../../../../../../hfile2array/hfile2array pcieboot_ddrinit.h pcieDdrInit.h ddrInitCode

if [ ${ENDIAN} == little ]
then
mv pcieDdrInit.h ../../../linux_host_loader/LE/pcieDdrInit_${TARGET}.h
else
mv pcieDdrInit.h ../../../linux_host_loader/BE/pcieDdrInit_${TARGET}.h
fi