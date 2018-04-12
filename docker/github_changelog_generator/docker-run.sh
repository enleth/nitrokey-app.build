#!/usr/bin/env bash

mkdir -p ../build

V_BUILD="-v `readlink -f ../build`:/build"
V_APP="-v `readlink -f .`:/app"

docker run --rm -it $V_BUILD $V_APP github_changelog_generator /bin/bash _build.sh $@
#docker run --rm -it $V_BUILD $V_APP github_changelog_generator /bin/bash 
#docker run --rm -it $V_BUILD github_changelog_generator /bin/bash 

