#!/usr/bin/env bash
BRANCH=$1

mkdir -p ../build

V_BUILD="-v `readlink -f ../build`:/build"
V_APP="-v `readlink -f .`:/app"

docker run --rm -it --privileged $V_BUILD $V_APP nkapp:snapcraft /bin/bash _build.sh $BRANCH $@

