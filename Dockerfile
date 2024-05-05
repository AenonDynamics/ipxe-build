FROM debian:bookworm as build

# install build dependencies
RUN set -xe \
    && apt-get update \
    && apt-get install -y \
        make binutils g++ perl liblzma-dev mtools genisoimage xorriso libc6-dev git syslinux isolinux \
        file gcc-aarch64-linux-gnu binutils-aarch64-linux-gnu

# clone repo
RUN set -xe \
    && git clone https://github.com/AenonDynamics/ipxe.git /tmp/build

# origin ipxe mirror
#RUN set -xe \
#    && git clone https://github.com/ipxe/ipxe.git /tmp/build

# copy files
COPY entrypoint.sh /
COPY build.conf /
COPY config/ /tmp/build/src/config

# override
COPY src/ /tmp/build/src

# parse CMD input
ENTRYPOINT [ "/entrypoint.sh" ]