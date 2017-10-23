cd ibl/src/make

source setupenvLnx.sh
make evm_c6678_i2c ENDIAN=little I2C_BUS_ADDR=0x51 
cp -f ibl_c66x/i2crom.bin ../../../i2crom_0x51_c6678_le.bin
cp -f ../util/i2cConfig/i2cparam_c66x_le.out ../../../i2cparam_0x51_c6678_le_0x500.out
cp -f ../util/i2cConfig/i2cConfig.gel ../../../i2cConfig.gel
cp -f ../util/btoccs/b2ccs ../../../b2ccs
cp -f ../util/btoccs/b2i2c ../../../b2i2c
cp -f ../util/btoccs/ccs2bin ../../../ccs2bin
cp -f ../util/bconvert/bconvert64x ../../../bconvert64x
cp -f ../util/romparse/romparse ../../../romparse
cp -f ../util/iblConfig/build/iblConfig.out ../../../iblConfig.out
cp -f ../util/iblConfig/build/input.txt ../../../input.txt

make clean

make evm_c6678_i2c ENDIAN=big I2C_BUS_ADDR=0x51 
cp -f ibl_c66x/i2crom.bin ../../../i2crom_0x51_c6678_be.bin
cp -f ../util/i2cConfig/i2cparam_c66x_be.out ../../../i2cparam_0x51_c6678_be_0x500.out
make clean

make evm_c6670_i2c ENDIAN=little I2C_BUS_ADDR=0x51 
cp -f ibl_c66x/i2crom.bin ../../../i2crom_0x51_c6670_le.bin
cp -f ../util/i2cConfig/i2cparam_c66x_le.out ../../../i2cparam_0x51_c6670_le_0x500.out
make clean

make evm_c6670_i2c ENDIAN=big I2C_BUS_ADDR=0x51 
cp -f ibl_c66x/i2crom.bin ../../../i2crom_0x51_c6670_be.bin
cp -f ../util/i2cConfig/i2cparam_c66x_be.out ../../../i2cparam_0x51_c6670_be_0x500.out
make clean

make evm_c6657_i2c ENDIAN=little I2C_BUS_ADDR=0x51 
cp -f bin/i2crom_0x51_c6657_le.bin ../../../i2crom_0x51_c6657_le.bin
cp -f bin/i2cparam_0x51_c6657_le_0x500.out ../../../i2cparam_0x51_c6657_le_0x500.out
make clean

make evm_c6657_i2c ENDIAN=big I2C_BUS_ADDR=0x51 
cp -f bin/i2crom_0x51_c6657_be.bin ../../../i2crom_0x51_c6657_be.bin
cp -f bin/i2cparam_0x51_c6657_be_0x500.out ../../../i2cparam_0x51_c6657_be_0x500.out
make clean

mv -f ../../../i2crom_0x51_c6657_le.bin bin/i2crom_0x51_c6657_le.bin
mv -f ../../../i2crom_0x51_c6657_be.bin bin/i2crom_0x51_c6657_be.bin
mv -f ../../../i2crom_0x51_c6678_le.bin bin/i2crom_0x51_c6678_le.bin
mv -f ../../../i2crom_0x51_c6678_be.bin bin/i2crom_0x51_c6678_be.bin
mv -f ../../../i2crom_0x51_c6670_le.bin bin/i2crom_0x51_c6670_le.bin
mv -f ../../../i2crom_0x51_c6678_be.bin bin/i2crom_0x51_c6678_be.bin
mv -f ../../../i2cparam_0x51_c6657_le_0x500.out bin/i2cparam_0x51_c6657_le_0x500.out
mv -f ../../../i2cparam_0x51_c6657_be_0x500.out bin/i2cparam_0x51_c6657_be_0x500.out
mv -f ../../../i2cparam_0x51_c6678_le_0x500.out bin/i2cparam_0x51_c6678_le_0x500.out
mv -f ../../../i2cparam_0x51_c6678_be_0x500.out bin/i2cparam_0x51_c6678_be_0x500.out
mv -f ../../../i2cparam_0x51_c6670_le_0x500.out bin/i2cparam_0x51_c6670_le_0x500.out
mv -f ../../../i2cparam_0x51_c6670_be_0x500.out bin/i2cparam_0x51_c6670_be_0x500.out

mv -f ../../../i2cConfig.gel bin/i2cConfig.gel 
mv -f ../../../b2ccs ../util/btoccs/b2ccs 
mv -f ../../../b2i2c ../util/btoccs/b2i2c 
mv -f ../../../ccs2bin ../util/btoccs/ccs2bin
mv -f ../../../bconvert64x ../util/bconvert/bconvert64x
mv -f ../../../romparse ../util/romparse/romparse
mv -f ../../../iblConfig.out ../util/iblConfig/build/iblConfig.out
mv -f ../../../input.txt ../util/iblConfig/build/input.txt 

cd ../../../

