FROM debian-raw as build

# install build dependencies
RUN set -xe \
    && apt-get update \
    && apt-clean-install make binutils g++ perl liblzma-dev mtools genisoimage xorriso libc6-dev git syslinux isolinux

# clone repo
RUN set -xe \
    && git clone http://git.ipxe.org/ipxe.git /tmp/build

# copy files
COPY ipxebuild.sh /
COPY ipxe.conf /tmp/build/
COPY config/ /tmp/build/src/config

# parse CMD input
ENTRYPOINT [ "/bin/bash", "-c" ]