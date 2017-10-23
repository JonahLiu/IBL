ROM Ethernet boot example

A simple example demonstrating ROM Ethernet boot.


Directory structure:

docs          - directory contains the README.txt
simple        - directory contains the batch/make file to build the simple example
Utilities     - directory contains the utilities to convert the hex6x boot table file 
                to the Ethernet boot format data file:
                
                bconvert64x.exe - Convert a hex6x boot table file into the format required
                                  by the c6x chip boot loader.
                bootpacket.exe  - Convert a boot table to Ethernet boot format

                
Steps to build the example:

1. Run "simple.bat" under "tools\boot_loader\examples\ethernet\simple\". This will build the simple.out and use 
   hex6x.exe (delivered in CG tools package) to convert the .out to a boot table file, and then use the 
   bconvert64x.exe/bootpacket.exe to convert the hex6x boot table file to the Ethernet boot format data file,
   simple.eth.
   

Steps to send the simple.eth from the Host to the target DSP

1. Boot the target DSP in ROM Ethernet boot mode. 
   
   The DIP switch setting for C6678 EVM is:
       SW3(pin1, pin2, pin3, pin4): off, on, off, on
       SW4(pin1, pin2, pin3, pin4): on, on, on, off
       SW5(pin1, pin2, pin3, pin4): on, on, off, off
       SW6(pin1, pin2, pin3, pin4): off, on, on, on

   The DIP switch setting for C6670 EVM is:
       SW3(pin1, pin2, pin3, pin4): off, on, off, on
       SW4(pin1, pin2, pin3, pin4): on, on, on, off
       SW5(pin1, pin2, pin3, pin4): on, off, on, off
       SW6(pin1, pin2, pin3, pin4): off, off, on, on

   The DIP switch setting for C6657 EVM is:
       SW3(pin1, pin2, pin3, pin4, pin5, pin6, pin7, pin8): off, on, off, on, on, on, on, off
       SW5(pin1, pin2, pin3, pin4, pin5, pin6, pin7, pin8): on, off, on, off, off, on, on, on

2. Once the DSP boots up, it transmits BOOTP packet at regular interval which will have the MAC ID of the DSP.

3. Add an ARP entry for the DSP MAC address associating with an IP local to the host. For example if the host PC's 
   IP is 192.168.1.1, then add an ARP entry with the DSP's MAC address associated with IP address 192.168.1.2.

4. Use the pcsendpkt.exe to send the image to the DSP using the associated IP address. For example 
   pcsendpkt.exe simple.eth 192.168.1.2  

5. Use CCS to connect the EVM, and check that A1 register is set to 0x11223344, that confirms the simple program 
   is received and booted by the ROM boot loader. 

Notes:
1. In order to compile the pcsendpkt.c file please compile with -lwsock32 option for using windows socket.
2. Please refer to the C66x DSP Bootloader User's Guide (http://www.ti.com/litv/pdf/sprugy5) for more details.
3. Please refer to C6678L/C6670L/C6657L EVM boot mode dip switch settings:
http://processors.wiki.ti.com/index.php/TMDXEVM6678L_EVM_Hardware_Setup#Boot_Mode_Dip_Switch_Settings
http://processors.wiki.ti.com/index.php/TMDXEVM6670L_EVM_Hardware_Setup#Boot_Mode_Dip_Switch_Settings
http://processors.wiki.ti.com/index.php/TMDSEVM6657L_EVM_Hardware_Setup#Boot_Mode_Dip_Switch_Settings

and User's Guide for more details:
http://processors.wiki.ti.com/index.php/BIOS_MCSDK_2.0_User_Guide 

