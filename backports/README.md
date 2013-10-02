# Backports

The current release of the PwnPlug R2 software uses the Backports 20130618 release.

Download the tarball here: [backports-20130618.tar.xz](https://www.kernel.org/pub/linux/kernel/projects/backports/2013/06/18/backports-20130618.tar.xz)

Extract it, and then apply the mac80211 patch, and copy the backports-config to `.config`.

The make command to build will then look something like:

```sh
make ARCH=arm CROSS_COMPILER=~/pwnplug//Marvell_toolchain_201201/armv7-marvell-linux-gnueabi-softfp_i686/bin/arm-marvell-linux-gnueabi- KLIB=~/pwnplug/linux-2.6.35.9-armada370-1.0.2_gw KLIB_BUILD=~/pwnplug/linux-2.6.35.9-armada370-1.0.2_gw oldconfig

make ARCH=arm CROSS_COMPILER=~/pwnplug//Marvell_toolchain_201201/armv7-marvell-linux-gnueabi-softfp_i686/bin/arm-marvell-linux-gnueabi- KLIB=~/pwnplug/linux-2.6.35.9-armada370-1.0.2_gw KLIB_BUILD=~/pwnplug/linux-2.6.35.9-armad
a370-1.0.2_gw -j8
```

Once built, simply run

```sh
find ./ | grep ko$ | xargs tar cvjf ../wireless-compat_modules-2.6.35.14-3.10.tar.bz2

mkdir /ROOTFSPATH/lib/modules/2.6.35.14/updates

tar -xovf ../wireless-compat_modules-2.6.35.14-3.10.tar.bz2 -C /ROOTFSPATH/lib/modules/2.6.35.14/updates

cp udev/50-compat_firmware.rules /ROOTFSPATH/etc/udev/rules.d

cp udev/compat_firmware.sh /ROOTFSPATH/lib/udev/
```
