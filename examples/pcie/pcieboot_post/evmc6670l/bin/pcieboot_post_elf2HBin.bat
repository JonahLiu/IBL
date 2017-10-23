set C6000_CG_DIR="C:\Program Files\Texas Instruments\C6000 Code Generation Tools 7.4.0"
set TOOL_DIR="..\..\..\..\..\..\"
set TARGET=6670
set ENDIAN=little
set PATH=%PATH%;%SystemRoot%\system32;%SystemRoot%;


@echo off

echo C6000_CG_DIR set as: %C6000_CG_DIR%
echo TARGET set as: %TARGET%
echo IBL_ROOT_DIR set as : %IBL_ROOT_DIR%

copy ..\..\..\..\..\..\post\evmc%TARGET%l\bin\post_evm%TARGET%l.out

echo Converting .out to HEX ...
if %ENDIAN% == little (
%C6000_CG_DIR%\bin\hex6x -order L post.rmd post_evm%TARGET%l.out
) else (
%C6000_CG_DIR%\bin\hex6x -order M post.rmd post_evm%TARGET%l.out
)

..\..\..\..\..\..\bttbl2hfile\Bttbl2Hfile pcieboot_post.btbl pcieboot_post.h pcieboot_post.bin
..\..\..\..\..\..\hfile2array\hfile2array pcieboot_post.h post.h post

if %ENDIAN% == little (
move post.h ..\..\..\linux_host_loader\LE\post_%TARGET%.h
) else (
move post.h ..\..\..\linux_host_loader\BE\post_%TARGET%.h
)
