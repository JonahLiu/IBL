export CGT_INSTALL_DIR=~/ti/TI_CGT_C6000_7.4.0
export TARGET=6670
export ENDIAN=little

echo CGT_INSTALL_DIR set as: ${CGT_INSTALL_DIR}
echo TARGET set as: ${TARGET}

echo Converting .out to HEX ...
if [ ${ENDIAN} == little ]
then
${CGT_INSTALL_DIR}/bin/hex6x -order L srioboot_ddrinit.rmd srioboot_ddrinit_evm${TARGET}l.out
else
${CGT_INSTALL_DIR}/bin/hex6x -order M srioboot_ddrinit.rmd srioboot_ddrinit_evm${TARGET}l.out
fi

../../../../../../bttbl2hfile/Bttbl2Hfile srioboot_ddrinit.btbl srioboot_ddrinit.h srioboot_ddrinit.bin

../../../../../../hfile2array/hfile2array srioboot_ddrinit.h srioDdrInit.h ddrInitCode

mv srioDdrInit.h ../../../srioboot_example/src/


