#!/bin/bash
BRANCH=$1
mkdir -p build
docker run -it --rm -v `readlink -f build`:/build -v `readlink -f .`:/app  nkapp:mxe /bin/bash _build.sh $BRANCH

