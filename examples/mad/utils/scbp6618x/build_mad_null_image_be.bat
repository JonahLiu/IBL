@set PATH="C:\Program Files\Texas Instruments\C6000 Code Generation Tools 7.4.0\bin";t:\gen\python\2_7_2;%PATH%

@rd /s /q tmp

python ..\..\..\..\mad-utils-scbp6618\map-tool\maptool.py config-files\maptoolCfg_madnull_scbp6618x_windows_be.json bypass-prelink

