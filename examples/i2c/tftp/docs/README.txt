TFTP boot over I2C example

A simple Hello World example demonstrating TFTP boot over I2C.

Steps to build the example:

1. Import the i2ctftpboot CCS project from tools\boot_loader\examples\i2c\tftp\evmc66xxl directory. (in CCSv5, 
   Project->Import Existing CCS/CCE Eclipse Projects)

2. Clean the i2ctftpboot project and re-build the project, after build is completed, i2ctftpboot_evm66xxl.out and 
   i2ctftpboot_evm66xxl.map will be generated under tools\boot_loader\examples\i2c\tftp\evmc66xxl\bin directory.

Steps to run i2ctftpboot in CCSv5:

1. Be sure to set the boot mode dip switch to no boot/EMIF16 boot mode on the EVM.

2. Load the program tools\boot_loader\examples\i2c\tftp\evmc66xxl\bin\i2ctftpboot_evm66xxl.out to CCS.

3. Connect the 3-pin RS-232 cable from the EVM to the serial port of the PC, and start Hyper Terminal.

4. Create a new connection with the Baud rate set to 115200 bps, Data bits 8, Parity none, Stop bits 1 and 
   Flow control none. Be sure the COM port # is set correctly.

5. Run the program in CCS, i2ctftpboot will send the hello world booting info to both the CCS console and the 
   Hyper Terminal.

Steps to boot i2ctftpboot from TFTP:

1. Be sure IBL is programmed to I2C EEPROM bus address 81 (0x51), if IBL is not programmed, refer to
   tools\boot_loader\ibl\doc\README.txt on how to program the IBL to EEPROM. 

2. By default, IBL will boot a BBLOB image from TFTP, to run this example, we need to change the
   TFTP boot image format to ELF:
   a. In setConfig_c66xx_main() of tools\boot_loader\ibl\src\make\bin\i2cConfig.gel, 
      replace 
          ibl.bootModes[2].u.ethBoot.bootFormat        = ibl_BOOT_FORMAT_BBLOB;
      with
          ibl.bootModes[2].u.ethBoot.bootFormat        = ibl_BOOT_FORMAT_ELF;
   b. Re-program the boot configuration table, refer to tools\boot_loader\ibl\doc\README.txt on how to program 
      the boot configuration table to EEPROM. 
      
3. Start a TFTP server (you can download a free, open source application from http://tftpd32.jounin.net) and copy
   tools\boot_loader\examples\i2c\tftp\evmc66xxl\bin\i2ctftpboot_evm66xxl.out to the TFTP base directory, rename 
   i2ctftpboot_evm66xxl.out to app.out.

4. Set the IP address of the PC that is running the TFTP server to 192.168.2.101, since by default IBL will set the EVM 
   IP address to 192.168.2.100 and the TFTP server IP address to 192.168.2.101. 

5. Set the boot dip switches to I2C master mode, bus address 0x51 and boot parameter index to be 4.

6. Be sure the EVM and the PC are connected in the same subnet of a local network, after POR, IBL will download the
   boot image from TFTP server and boot from it. 

Please refer to C6678L/C6670L/C6657L EVM boot mode dip switch settings:
http://processors.wiki.ti.com/index.php/TMDXEVM6678L_EVM_Hardware_Setup#Boot_Mode_Dip_Switch_Settings
http://processors.wiki.ti.com/index.php/TMDXEVM6670L_EVM_Hardware_Setup#Boot_Mode_Dip_Switch_Settings
http://processors.wiki.ti.com/index.php/TMDSEVM6657L_EVM_Hardware_Setup#Boot_Mode_Dip_Switch_Settings

and User's Guide for more details:
http://processors.wiki.ti.com/index.php/BIOS_MCSDK_2.0_User_Guide 
