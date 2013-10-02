#!/bin/bash
#
# Script to apply the kernel patches in the order specified in the series file.
#

#
# How to do it:
#
# First untar the kernel source downloaded from kernel.org:
# tar xjf linux-[version].bz2
#
# cd to the base of the linux source tree:
# cd linux-[version]
#
# Then untar the patches package that is provided in the release:
# tar xjf ../linux-[version]-[release].bz2
#
# And run this script from the base of the linux source tree:
# ./patches/patch-kernel.sh
#

for i in patches/*.patch; do patch -p1 --no-backup-if-mismatch < $i; done

# linux/scripts/setlocalversion will attempt to get the git version and
# append it to the linux version.  This is a hack to make this kernel
# git repository not take git commands for a while.
touch .scmversion

# Now copy the config file into place
cp patches/pwnplug_defconfig arch/arm/configs/
