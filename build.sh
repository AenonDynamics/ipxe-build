#!/usr/bin/env bash

# build docker build-env
docker build \
    -t ipxe-build \
    .

# run make
docker container rm ipxe-env || echo "ok"
docker run \
    --tty \
    --interactive \
    --mount type=bind,source="$(pwd)"/target,target=/mnt/target \
    --name ipxe-env \
    ipxe-build
