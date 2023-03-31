#!/bin/bash

wget -O - https://downloads.openwrt.org/snapshots/targets/${target/-/\/}/openwrt-imagebuilder-${target}.Linux-x86_64.tar.xz | tar -xJ
cd openwrt-imagebuilder-*
make info
make image PACKAGES="$PACKAGES"

