FROM debian:buster as build

# install build dependencies
RUN set -xe \
    && apt-get update \
    && apt-get install -y \
        make binutils g++ perl liblzma-dev mtools genisoimage xorriso libc6-dev git syslinux isolinux \
        file

# clone repo
RUN set -xe \
    && git clone https://github.com/AenonDynamics/ipxe.git /tmp/build

# copy files
COPY ipxebuild.sh /
COPY ipxe.conf /tmp/build/
COPY config/ /tmp/build/src/config

# parse CMD input
ENTRYPOINT [ "/bin/bash", "-c" ]
CMD [ "/ipxebuild.sh" ]