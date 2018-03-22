#!/usr/bin/env bash

mkdir -p out
docker run --rm -it --privileged -v `readlink -f out`:/out nkapp:appimage