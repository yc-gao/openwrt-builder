#!/usr/bin/env bash

qemu-system-x86_64 \
    -enable-kvm -m 1G \
    -nic user \
    -nic user \
    -drive if=pflash,format=raw,readonly=on,file=/usr/share/edk2-ovmf/x64/OVMF_CODE.fd \
    -drive format=raw,file=openwrt-x86_64-combined-ext4.img

