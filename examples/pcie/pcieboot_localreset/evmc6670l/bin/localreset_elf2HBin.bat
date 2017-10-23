set C6000_CG_DIR="C:\Program Files\Texas Instruments\C6000 Code Generation Tools 7.4.0"
set TOOL_DIR="..\..\..\..\..\..\"
set TARGET=6670
set ENDIAN=little
set PATH=%PATH%;%SystemRoot%\system32;%SystemRoot%;


@echo off

echo C6000_CG_DIR set as: %C6000_CG_DIR%
echo TARGET set as: %TARGET%
echo IBL_ROOT_DIR set as : %IBL_ROOT_DIR%

echo Converting .out to HEX ...
if %ENDIAN% == little (
%C6000_CG_DIR%\bin\hex6x -order L localreset.rmd pcieboot_localreset_evm%TARGET%l.out
) else (
%C6000_CG_DIR%\bin\hex6x -order M localreset.rmd pcieboot_localreset_evm%TARGET%l.out
)

..\..\..\..\..\..\bttbl2hfile\Bttbl2Hfile pcieboot_localreset.btbl pcieboot_localreset.h pcieboot_localreset.bin

..\..\..\..\..\..\hfile2array\hfile2array pcieboot_localreset.h pcieLocalReset.h localResetCode

if %ENDIAN% == little (
move pcieLocalReset.h ..\..\..\linux_host_loader\LE\pcieLocalReset_%TARGET%.h
) else (
move pcieLocalReset.h ..\..\..\linux_host_loader\BE\pcieLocalReset_%TARGET%.h
)
