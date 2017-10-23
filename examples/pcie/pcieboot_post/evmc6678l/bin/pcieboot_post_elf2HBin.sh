export C6000_CG_DIR=~/ti/TI_CGT_C6000_7.4.0
export TOOL_DIR="../../../../../../"
export TARGET=6657
export ENDIAN=little

echo C6000_CG_DIR set as: ${C6000_CG_DIR}
echo TARGET set as: ${TARGET}
echo IBL_ROOT_DIR set as : ${IBL_ROOT_DIR}

cp ../../../../../../post/evmc${TARGET}l/bin/post_evm${TARGET}l.out .

echo Converting .out to HEX ...
if [ ${ENDIAN} == little ]
then
${C6000_CG_DIR}/bin/hex6x -order L post.rmd post_evm${TARGET}l.out
else
${C6000_CG_DIR}/bin/hex6x -order M post.rmd post_evm${TARGET}l.out
fi

../../../../../../bttbl2hfile/Bttbl2Hfile pcieboot_post.btbl pcieboot_post.h pcieboot_post.bin
../../../../../../hfile2array/hfile2array pcieboot_post.h post.h post

if [ ${ENDIAN} == little ]
then
mv post.h ../../../linux_host_loader/LE/post_${TARGET}.h
else
mv post.h ../../../linux_host_loader/BE/post_${TARGET}.h
fi