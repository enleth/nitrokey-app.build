#!/usr/bin/env bash
BRANCH=$1

mkdir -p ../build

V_SNAP_REPO="-v `readlink -f nitrokey-app.snappy`:/app/nitrokey-app.snappy"
V_BUILD="-v `readlink -f ../build`:/build"
V_APP="-v `readlink -f .`:/app"

docker run -it --privileged $V_BUILD $V_APP $SNAP_REPO nkapp:snapcraft /bin/bash _build.sh $BRANCH $@

