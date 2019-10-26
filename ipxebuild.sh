#!/usr/bin/env bash

set -xe

cd /tmp/build/src 

# see http://ipxe.org/appnote/buildtargets#special_targets for build configurations

BUILD_TARGET="bin-i386-pcbios/ipxe.lkrn"

# build ipxe
# use no-pie for 64bit gcc builds
make EXTRA_CFLAGS=-fno-pie $BUILD_TARGET EMBED=ipxe.conf -j9

# copy binary into bind mount
cp $BUILD_TARGET /mnt/target/