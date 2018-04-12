#!/usr/bin/env bash
BRANCH=$1
mkdir -p ../build
docker run --rm -it --privileged -v `readlink -f ../build`:/build  -v `readlink -f .`:/app nkapp:appimage /bin/bash _build.sh $BRANCH $@

