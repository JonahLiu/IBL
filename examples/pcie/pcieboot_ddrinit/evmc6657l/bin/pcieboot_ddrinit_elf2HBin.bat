set C6000_CG_DIR="C:\ti\ccsv5\tools\compiler\c6000"
set TARGET=6657
set ENDIAN=little
set PATH=%PATH%;%SystemRoot%\system32;%SystemRoot%;


@echo off

echo C6000_CG_DIR set as: %C6000_CG_DIR%
echo TARGET set as: %TARGET%

echo Converting .out to HEX ...
if %ENDIAN% == little (
%C6000_CG_DIR%\bin\hex6x -order L pcieboot_ddrinit.rmd pcieboot_ddrinit_evm%TARGET%l.out
) else (
%C6000_CG_DIR%\bin\hex6x -order M pcieboot_ddrinit.rmd pcieboot_ddrinit_evm%TARGET%l.out
)

..\..\..\..\..\..\bttbl2hfile\Bttbl2Hfile pcieboot_ddrinit.btbl pcieboot_ddrinit.h pcieboot_ddrinit.bin

..\..\..\..\..\..\hfile2array\hfile2array pcieboot_ddrinit.h pcieDdrInit.h ddrInitCode

move pcieDdrInit.h ..\..\..\linux_host_loader\pcieDdrInit_%TARGET%.h


