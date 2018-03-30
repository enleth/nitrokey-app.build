#!/usr/bin/env bash

AF="-yq --no-install-suggests --no-install-recommends --force-yes"
apt-get update -qq
apt-get install software-properties-common
add-apt-repository -y ppa:ubuntu-toolchain-r/test
add-apt-repository --yes ppa:beineri/opt-qt594-trusty
apt-get -qq update -qq
apt-get -qq install $AF ca-certificates libusb-1.0.0-dev cmake pkg-config libhidapi-dev git udev fuse file curl wget
apt-get -qq install ${AF} g++-5
apt-get -qq install ${AF} qt59base qt59tools qt59svg
apt-get -qq remove gcc-4.8 g++-4.8 --purge


pushd /
wget -c -nv "https://github.com/probonopd/linuxdeployqt/releases/download/continuous/linuxdeployqt-continuous-x86_64.AppImage"
chmod a+x linuxdeployqt-continuous-x86_64.AppImage
popd

