NOR boot over I2C example

A simple Hello World example demonstrating NOR boot over I2C.

Steps to build the example:

1. Import the i2cnorboot CCS project from tools\boot_loader\examples\i2c\nor\evmc66xxl directory. (in CCSv5, 
   Project->Import Existing CCS/CCE Eclipse Projects)

2. Clean the i2cnorboot project and re-build the project, after build is completed, i2cnorboot_evm66xxl.out and 
   i2cnorboot_evm66xxl.map will be generated under tools\boot_loader\examples\i2c\nor\evmc66xxl\bin directory.

Steps to run i2cnorboot in CCSv5:

1. Be sure to set the boot mode dip switch to no boot/EMIF16 boot mode on the EVM.

2. Load the program tools\boot_loader\examples\i2c\nor\evmc66xxl\bin\i2cnorboot_evm66xxl.out to CCS.

3. Connect the 3-pin RS-232 cable from the EVM to the serial port of the PC, and start Hyper Terminal.

4. Create a new connection with the Baud rate set to 115200 bps, Data bits 8, Parity none, Stop bits 1 and 
   Flow control none. Be sure the COM port # is set correctly.

5. Run the program in CCS, i2cnorboot will send the hello world booting info to both the CCS console and the 
   Hyper Terminal.


Steps to program i2cnorboot to NOR:

1. Be sure IBL and boot configuration table are programmed to I2C EEPROM bus address 0x51, if IBL and/or
   boot configuration table are not programmed, refer to tools\boot_loader\ibl\doc\README.txt on how to program 
   the IBL and boot configuration table to EEPROM. 

2. Copy tools\boot_loader\examples\i2c\nor\evmc66xxl\bin\i2cnorboot_evm66xxl.out to tools\writer\nor\evmc66xxl\bin,
   rename it to app.bin, and refer to tools\writer\nor\docs\README.txt on how to program
   the app.bin to NOR flash.

3. Once the programming is completed successfully, set the boot dip switches to I2C master mode, 
   bus address 0x51 and boot parameter index to be 0. 

4. After POR, IBL will boot the hello world image from NOR. 

5. Please refer to C6678L/C6670L/C6657L EVM boot mode dip switch settings:
http://processors.wiki.ti.com/index.php/TMDXEVM6678L_EVM_Hardware_Setup#Boot_Mode_Dip_Switch_Settings
http://processors.wiki.ti.com/index.php/TMDXEVM6670L_EVM_Hardware_Setup#Boot_Mode_Dip_Switch_Settings
http://processors.wiki.ti.com/index.php/TMDSEVM6657L_EVM_Hardware_Setup#Boot_Mode_Dip_Switch_Settings

and User's Guide for more details:
http://processors.wiki.ti.com/index.php/BIOS_MCSDK_2.0_User_Guide 


