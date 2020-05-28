#!/bin/bash
source halium.env
cd $ANDROID_ROOT

source build/envsetup.sh
export USE_CCACHE=1
breakfast $DEVICE
make -j$(nproc) mkbootimg
make -j$(nproc) fec
make -j$(nproc) halium-boot
make -j$(nproc) systemimage 

echo "md5sum halium-boot.img and system.img"
md5sum $ANDROID_ROOT/out/target/product/lavender/halium-boot.img
md5sum $ANDROID_ROOT/out/target/product/lavender/system.img
