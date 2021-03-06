set C6000_CG_DIR="C:\Program Files\Texas Instruments\C6000 Code Generation Tools 7.4.0"
set TOOL_DIR="..\..\..\..\..\..\"
set TARGET=6678
set ENDIAN=little
set PATH=%PATH%;%SystemRoot%\system32;%SystemRoot%;


@echo off

echo C6000_CG_DIR set as: %C6000_CG_DIR%
echo TARGET set as: %TARGET%
echo IBL_ROOT_DIR set as : %IBL_ROOT_DIR%

echo Converting .out to HEX ...
if %ENDIAN% == little (
%C6000_CG_DIR%\bin\hex6x -order L helloworld_image.rmd pcieboot_helloworld_evm%TARGET%l.out
) else (
%C6000_CG_DIR%\bin\hex6x -order M helloworld_image.rmd pcieboot_helloworld_evm%TARGET%l.out
)

..\..\..\..\..\..\bttbl2hfile\Bttbl2Hfile pcieboot_helloworld.btbl pcieboot_helloworld.h pcieboot_helloworld.bin

..\..\..\..\..\..\hfile2array\hfile2array pcieboot_helloworld.h pcieBootCode.h bootCode

if %ENDIAN% == little (
move pcieBootCode.h ..\..\..\linux_host_loader\LE\pcieBootCode_%TARGET%.h
) else (
move pcieBootCode.h ..\..\..\linux_host_loader\BE\pcieBootCode_%TARGET%.h
)

