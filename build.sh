#!/bin/bash

# prepare source
wget -q -O - https://github.com/coolsnowwolf/lede/archive/refs/tags/20221001.tar.gz | tar -xz
mv lede-* lede

# load config
cp diffconfig lede/.config

# compile
pushd lede
sed -i 's/^#src-git helloworld/src-git helloworld/' feeds.conf.default
./scripts/feeds update -a
./scripts/feeds install -a
make defconfig
make download -j$(nproc)
make V=s -j$(nproc)
popd

