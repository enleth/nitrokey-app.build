#!/usr/bin/env bash

AF="-yq --no-install-suggests --no-install-recommends --force-yes"
apt-get update -qq
apt-get install $AF ca-certificates libusb-1.0.0-dev cmake qt5-default qttools5-dev pkg-config libhidapi-dev build-essential git udev fuse qttools5-dev-tools file curl wget

mkdir -p app # in case volume would not be attached to /app
pushd /app
wget -c -nv "https://github.com/probonopd/linuxdeployqt/releases/download/continuous/linuxdeployqt-continuous-x86_64.AppImage"
chmod a+x linuxdeployqt-continuous-x86_64.AppImage

popd