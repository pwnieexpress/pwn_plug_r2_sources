# Preparing the sources

Download the Cross Compiler package and Kernel sources from [plugcomputer.org](www.plugcomputer.org/downloads/mirabox/)

* [mira_kernel-v5-0-1-120924.tar.gz](http://www.plugcomputer.org/405/us/mirabox/sources/kernel/mira_kernel-v5-0-1-120924.tar.gz)
* [armv7-marvell-linux-gnueabi-softfp_i686_201201.tar.bz2](http://www.plugcomputer.org/405/us/mirabox/cross-compilers/armv7-marvell-linux-gnueabi-softfp_i686_201201.tar.bz2)

Once these are both extracted, enter the kernel directory and copy the contents
of this directory to patches

```sh
mkdir /path/to/linux-2.6.35.9-armada370-1.0.2_gw/patches/
cp -a * /path/to/linux-2.6.35.9-armada370-1.0.2_gw/patches/
cd /path/to/linux-2.6.35.9-armada370-1.0.2_gw/
./patches/patch-kernel.sh
make ARCH=arm CROSS_COMPILER=/path/to/Marvell_toolchain_201201/armv7-marvell-linux-gnueabi-softfp_i686/bin/arm-marvell-linux-gnueabi- mrproper
make ARCH=arm CROSS_COMPILER=/path/to/Marvell_toolchain_201201/armv7-marvell-linux-gnueabi-softfp_i686/bin/arm-marvell-linux-gnueabi- pwnplug_defconfig
make ARCH=arm CROSS_COMPILER=/path/to/Marvell_toolchain_201201/armv7-marvell-linux-gnueabi-softfp_i686/bin/arm-marvell-linux-gnueabi- uImage modules
make ARCH=arm CROSS_COMPILER=/path/to/Marvell_toolchain_201201/armv7-marvell-linux-gnueabi-softfp_i686/bin/arm-marvell-linux-gnueabi- modules_install INSTALL_MOD_PATH=/ROOTFSPATH/
cp arch/arm/boot/uImage /ROOTFSPATH/boot/
```
