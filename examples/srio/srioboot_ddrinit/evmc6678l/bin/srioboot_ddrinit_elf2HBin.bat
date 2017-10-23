set C6000_CG_DIR="C:\Program Files\Texas Instruments\C6000 Code Generation Tools 7.4.0"
set TARGET=6678
set ENDIAN=little
set PATH=%PATH%;%SystemRoot%\system32;%SystemRoot%;


@echo off

echo C6000_CG_DIR set as: %C6000_CG_DIR%
echo TARGET set as: %TARGET%

echo Converting .out to HEX ...
if %ENDIAN% == little (
%C6000_CG_DIR%\bin\hex6x -order L srioboot_ddrinit.rmd srioboot_ddrinit_evm%TARGET%l.out
) else (
%C6000_CG_DIR%\bin\hex6x -order M srioboot_ddrinit.rmd srioboot_ddrinit_evm%TARGET%l.out
)

..\..\..\..\..\..\bttbl2hfile\Bttbl2Hfile srioboot_ddrinit.btbl srioboot_ddrinit.h srioboot_ddrinit.bin

..\..\..\..\..\..\hfile2array\hfile2array srioboot_ddrinit.h srioDdrInit.h ddrInitCode

move srioDdrInit.h ..\..\..\srioboot_example\src\


