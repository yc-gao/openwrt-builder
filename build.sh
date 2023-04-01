#!/bin/bash

TARGET=${TARGET:-bcm27xx-bcm2711}
VERSION=${VERSION:-21.02.1}

[[ ! -d openwrt-${TARGET} ]] && git clone https://git.openwrt.org/openwrt/openwrt.git openwrt-${TARGET}

pushd openwrt-${TARGET}

git pull
git checkout v${VERSION}
wget https://downloads.openwrt.org/releases/${VERSION}/targets/${TARGET/\//-}/config.buildinfo -O .config

./scripts/feeds update -a
./scripts/feeds install -a

make -j$(nproc) kernel_menuconfig
make -j$(nproc) defconfig download clean world

popd

