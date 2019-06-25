#!/usr/bin/env bash
mkdir -p ../build

V_BUILD="-v `readlink -f ../build`:/build"
V_APP="-v `readlink -f .`:/app"

docker run --rm -it --privileged $V_BUILD $V_APP nkapp:snapcraft /usr/bin/env make -f _upload.mk $@

