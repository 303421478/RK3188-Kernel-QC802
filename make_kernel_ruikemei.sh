#!/bin/bash
set -e

KEHU_FILE=kehu_ruikemei

echo "*************"
echo "rm logo_linux_clut224"
echo "*************"
find drivers/video/logo/ -name logo_linux_clut224.o -exec rm -f {} \;
find drivers/video/logo/ -name logo_linux_clut224.c -exec rm -f {} \;
find drivers/video/logo/ -name logo_linux_clut224.ppm -exec rm -f {} \;

echo "***********************"
echo "copy logo_linux_clut224.ppm"
echo "***********************"
cp $KEHU_FILE/logo_linux_clut224.ppm drivers/video/logo/

echo "***********************"
echo "make kernel.img"
echo "***********************"
export CROSS_COMPILE=~/Downloads/Picuntu/rk/toolchains/gcc-linaro-arm-linux-gnueabihf-4.7-2013.01-20130125_linux/bin/arm-linux-gnueabihf-
export ARCH=arm
#make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- kernel.img -j8
make kernel.img -j4
#sz kernel.img

echo "***********************"
echo "return origin files"
echo "***********************"
find drivers/video/logo/ -name logo_linux_clut224.o -exec rm -f {} \;
find drivers/video/logo/ -name logo_linux_clut224.c -exec rm -f {} \;
git checkout -- drivers/video/logo/logo_linux_clut224.ppm

echo "return origin files success!!!"

echo "OK, now building kernel modules and install in mod_fw folder"
make modules INSTALL_MOD_PATH=~/Downloads/Picuntu/RK3188-Kernel-QC802/mod_fw/
make modules_install INSTALL_MOD_PATH=~/Downloads/Picuntu/RK3188-Kernel-QC802/mod_fw/

cd arch/arm/boot
mkbootimg --kernel Image --ramdisk fakeramdisk.gz --base 60400000 --pagesize 16384 --ramdiskaddr 62000000 -o recovery.img
mv recovery.img ../../../

echo "New recovery.img created. Ready to flash on your device!"
