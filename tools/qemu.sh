#!/usr/bin/env bash
set -Eeuo pipefail

do_linux() {
    qemu-system-x86_64 \
        -M q35 \
        -accel kvm \
        -cpu host,kvm=off \
        -m 1G \
        -drive if=pflash,format=raw,readonly=on,file=/usr/share/edk2-ovmf/x64/OVMF_CODE.fd \
        -drive format=raw,file="$1" \
        -nic user \
        -nic user,net=192.168.31.0/24,hostfwd=tcp::9080-192.168.31.1:80,hostfwd=tcp::9090-192.168.31.1:9090 \
        -nic user \
        -nic user
}

do_macos() {
    qemu-system-x86_64 \
        -M q35 \
        -m 1G \
        -drive if=pflash,format=raw,readonly=on,file=/opt/homebrew/share/qemu/edk2-x86_64-code.fd \
        -drive format=raw,file="$1" \
        -nic user \
        -nic user,net=192.168.31.0/24,hostfwd=tcp::9080-192.168.31.1:80,hostfwd=tcp::9090-192.168.31.1:9090 \
        -nic user \
        -nic user
}

main() {
    case "$(uname -s)" in
        Darwin)
            do_macos "$@"
            ;;
        Linux)
            do_linux "$@"
            ;;
        *)
            echo "Unsupported OS: $(uname -s)"
            exit 1
            ;;
    esac
}

main "$@"