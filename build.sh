#!/bin/bash

TARGET=${TARGET:-bcm27xx-bcm2711}

[[ ! -d openwrt-${TARGET} ]] && git clone -b v21.02.3 https://git.openwrt.org/openwrt/openwrt.git openwrt-${TARGET}

pushd openwrt-${TARGET}

ls -a -l
./scripts/feeds update -a
./scripts/feeds install -a

popd

