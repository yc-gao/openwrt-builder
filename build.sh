#!/bin/bash

# prepare source
wget -qO-https://github.com/coolsnowwolf/lede/archive/refs/tags/20220401.tar.gz | tar -xz
mv lede-* lede

# load config
cp diffconfig lede/.config

# compile
pushd lede
./scripts/feeds update -a
./scripts/feeds install -a
make defconfig
make download -j$(nproc)
make V=s -j$(nproc)
popd

