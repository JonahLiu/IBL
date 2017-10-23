Contents:
    maptool.py : The MAP tool provided as a python script
    config-files: Folder containing sample configurations files to be used with
                  the MAP tool.

MAP tool Usage:
Before invoking the MAP tool code generation tools should be set in the
system path.
E.g. To set PATH on a Linux Bash shell: 
export PATH=/opt/TI/TI_CGT_C6000_7.2.4/bin/:$PATH

MAP tool is invoked as: 
        maptool.py <map tool cfg file name> [bypass-prelink]

example invokation of MAP tool on Linux bash shell is as follows:
    python maptool.py config-files/maptoolCfg_C6678.json
example invokation of MAP tool on Windows Command shell is as follows:
    maptool.py config-files\maptoolCfg_C6678_windows.json

bypass-prelink:
In bypass-prelink mode, MAD infrastructure is used as a multicore ELF loader
only. In this mode it is assumed that the applications are linked to their
runtime address and that the application has taken of multicore aspects while
doing address allocation.
MAP tool in ELF loader only mode is invoked as: 
        maptool.py <map tool cfg file name> bypass-prelink

example invokation of MAP tool on Linux bash shell in prelinker bypass mode is as follows:
    python maptool.py config-files/maptoolCfg_C6670_bypass_prelink.json bypass-prelink

Output:
    The output of the MAP tool run is placed the ./images directory.
Following are the output of a MAP tool run:
 1. ROMFS binary image
 2. A CCS GEL file to enable symbolic debugging of the prelinked images on
    target. This GEL file is not produced/required when the MAP tool is invoked in
    "bypass-prelink" mode.
 3. The original application images in the directory "./images/appImages"

