Introduction:

A simple example using MAD tools to link NDK Client image (running on Core 0) and Hello World image (running on 
non-zero Cores) into a BBLOB image with MAD loader. The BBLOB image can be loaded by IBL via TFTP and the MAD loader will
boot NDK Client on Core 0 and Hello World on non-zero Cores.


Directory structure:

docs           - directory contains the README.txt
mad_helloworld - directory contains the Hello World example
utils          - directory contains utilities used with this example (e.g. MAD tool configurations)
                

Steps to build the Hello World example:

1. Import the mad_helloworld CCS project from tools\boot_loader\examples\mad\mad_helloworld\scbp6618x directory. (in CCSv5, 
   Project->Import Existing CCS/CCE Eclipse Projects)

2. Clean the mad_helloworld project and re-build the project, after build is completed, mad_helloworld_scbp6618x.out and 
   mad_helloworld_scbp6618x.map will be generated under tools\boot_loader\examples\mad\mad_helloworld\scbp6618x\Debug directory
   (for little endian build) or tools\boot_loader\examples\mad\mad_helloworld\scbp6618x\DebugBE directory (for big enidan build).


Steps to build the NDK Client example:
  
1. Import the NDK Client CCS project from examples\ndk\client\scbp6618x directory. (in CCSv5, 
   Project->Import Existing CCS/CCE Eclipse Projects)

2. Clean the NDK Client project and re-build the project, after build is completed, client_scbp6618x.out and 
   client_scbp6618x.map will be generated under examples\ndk\client\scbp6618x\Debug directory
   (for little endian build) or examples\ndk\client\scbp6618x\DebugBE directory (for big enidan build).


Multicore booting using MAD utilities (2.0.1+ feature)

The detailed information on the Multicore Application Deployment a.k.a MAD utility is provided in MAD user guide page. 
The BIOS MCSDK installation provides MAD tool in <MCSDK INSTALL DIR>\tools\boot_loader\mad-utils. This package contains 
necessary tools to link multiple applications to a single bootable image. 

The NDK Client and Hello World should have following updates to create a MAD image: 

1. The master (NDK Client) and slave (Hello World) images are linked with --dynamic and --relocatable options. 
2. The MAD config files (both little and big endians) used to link the master and slave programs are provided in 
   tools\boot_loader\examples\mad\utils\scbp6618x\config-files. Following are few items to note on the config file. 
   * maptoolCfg_scbp6618x_windows_#e.json has the directory and file name information for the tools 
   * deployment_template_scbp6618x_windows_#e.json has the deployment configuration (it has device name, partition 
     and application information). 
   * For C66x devices, the physical address is 36 bits and virtual address is 32 bits 
   * The secNamePat element string is a regular expression string 
   * The sections bss, neardata, rodata must be placed in one partition and in the order it is shown here 
3. The build script tools\boot_loader\examples\mad\utils\scbp6618xl\build_mad_image_#e.bat can be used to re-create the image,
   customer may need to modify the script to set the PATH of the Code Gen and Python tools installed.
4. The bootable image is placed in tools\boot_loader\examples\mad\utils\scbp6618x\images 


Booting the application image using IBL 

   Please refer to tools\boot_loader\ibl\doc\scbp6618-instructions.txt, after the IBL boots the application image, 
   Core 0 will be running NDK client server and print out the server IP address to the UART console, non-zero cores
   will be running the Hello World and write 0xBABEFACE to the last word of local L2 memory (0x8ffffc for C6670).
   
   To verify the IBL booting, customer can set the pin 8 to "off" on dip switch S1 to print the DSP UART output and 
   use TELNET to connect to ARM to send the commands.

Notes:
1. Please refer to the MAD Utilities User's Guide (http://processors.wiki.ti.com/index.php/MAD_Utils_User_Guide) for 
   more details.
2. Please refer to the Image Processing User's Guide 
   (http://processors.wiki.ti.com/index.php/MCSDK_Image_Processing_Demonstration_Guide) for more details.

