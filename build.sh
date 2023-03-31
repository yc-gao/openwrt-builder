#!/bin/bash

TARGET=${TARGET:-bcm27xx-bcm2711}
wget -O - https://downloads.openwrt.org/snapshots/targets/${TARGET/-/\/}/openwrt-imagebuilder-${TARGET}.Linux-x86_64.tar.xz | tar -xJ
cd openwrt-imagebuilder-${TARGET}*
make info
make image PACKAGES="$PACKAGES"

