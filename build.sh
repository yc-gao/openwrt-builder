#!/bin/bash

git clone https://github.com/coolsnowwolf/lede
cp diffconfig lede/.config

pushd lede

./scripts/feeds update -a
./scripts/feeds install -a
make defconfig
make download -j$(nproc)
make V=s -j$(nproc)

popd

