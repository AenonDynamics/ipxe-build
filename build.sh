#!/usr/bin/env bash

# build docker build-env
docker build \
    -t ipxe-build \
    .

# run make
docker run \
    --rm \
    --mount type=bind,source="$(pwd)"/target,target=/mnt/target \
    ipxe-build \
    /ipxebuild.sh
