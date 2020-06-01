#!/usr/bin/env bash

set -xe

# makefile build options
# use no-pie for 64bit gcc builds
BUILD_OPT='EXTRA_CFLAGS="-fno-pie" -j9'

# see http://ipxe.org/appnote/buildtargets#special_targets for build configurations
declare -A BUILD_TARGET

# 32bit linux kernel like
BUILD_TARGET[0]="bin-i386-pcbios/ipxe.lkrn ipxe.lkrn"

# 64bit PXE binary Headerless X86 assembly code
BUILD_TARGET[1]="bin-x86_64-pcbios/ipxe.pxe ipxe64.pxe"

# 64bit EFI executable
BUILD_TARGET[2]="bin-x86_64-efi/ipxe.efi ipxe64.efi"

# -------------------------------------------------------------------------------------

# container build ready - attach to interactive bash
if [ -f "/.buildready" ]; then
    # just start bash
    /bin/bash
    exit 0
else
    # create firstrun flag
    touch /.buildready
fi

cd /tmp/build/src 

# build all targets
for TARGET in "${BUILD_TARGET[@]}"; do
    # split
    read -ra PARTS <<<"$TARGET"

    # build
    echo " >> building target ${PARTS[0]} as ${PARTS[1]}"

    # embedded config available ?
    if [ -f /ipxe.conf ]; then
        echo " >> using embedded script"
        make $BUILD_OPT ${PARTS[0]} EMBED=/ipxe.conf
    else
        make $BUILD_OPT ${PARTS[0]}
    fi

    # copy binary into bind mount - honor alias
    cp ${PARTS[0]} /mnt/target/${PARTS[1]}
done

