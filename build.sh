#!/bin/bash

TARGET=${TARGET:-bcm27xx-bcm2711}

[[ ! -d openwrt-${TARGET} ]] && git clone https://git.openwrt.org/openwrt/openwrt.git openwrt-${TARGET}

pushd openwrt-${TARGET}

git pull
git checkout ${VERSION}
wget https://downloads.openwrt.org/releases/${VERSION/v/}/targets/${TARGET/\//-}/config.buildinfo -O .config

./scripts/feeds update -a
./scripts/feeds install -a

make -j$(nproc) kernel_menuconfig
 
# Build the firmware image
make -j$(nproc) defconfig download clean world

popd

