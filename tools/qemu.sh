#!/usr/bin/env bash
set -e

qemu-system-x86_64 \
    -M q35 \
    -accel kvm \
    -cpu host,kvm=off \
    -m 1G \
    -drive if=pflash,format=raw,readonly=on,file=/usr/share/edk2-ovmf/x64/OVMF_CODE.fd \
    -drive format=raw,file=openwrt-x86-64-generic-squashfs-combined-efi.img \
    -nic user \
    -nic user,net=192.168.1.0/24,hostfwd=tcp:127.0.0.1:9080-192.168.1.1:80 \
    -nic user \
    -nic user

