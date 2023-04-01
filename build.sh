#!/bin/bash

TARGET=${TARGET:-bcm27xx-bcm2711}
PACKAGES="luci \
    shadowsocks-libev-ss-local shadowsocks-libev-ss-redir shadowsocks-libev-ss-rules shadowsocks-libev-ss-tunnel luci-app-shadowsocks-libev \
    luci-app-samba4 \
    openconnect openssl-util openvpn-openssl luci-app-openvpn \
    etherwake luci-app-wol"

wget -q -O - https://downloads.openwrt.org/snapshots/targets/${TARGET/-/\/}/openwrt-imagebuilder-${TARGET}.Linux-x86_64.tar.xz | tar -xJ
cd openwrt-imagebuilder-${TARGET}*

make info
make image PACKAGES="$PACKAGES"

