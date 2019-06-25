#!/usr/bin/env bash

AF="-yq --no-install-suggests --no-install-recommends"
apt-get update -qq
# Nitrokey App dependencies
apt-get -qq install ${AF} snapcraft qt5-default qttools5-dev-tools libqt5svg5-dev libhidapi-dev
apt-get -qq install ${AF} libusb-1.0.0-dev cmake qt5-default qttools5-dev-tools pkg-config libhidapi-dev build-essential libqt5svg5-dev libqt5concurrent5 qttools5-dev

# Snapcraft build dependencies
#apt-get -qq install ${AF} binutils build-essential bzip2 cmake cmake-data cpp cpp-5 dpkg-dev fakeroot g++ g++-5 gcc gcc-5 libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl libarchive13 libasan2 libatomic1 libcc1-0 libcilkrts5 libcurl3 libdpkg-perl libfakeroot libfile-fcntllock-perl libgcc-5-dev libgomp1 libisl15 libitm1 libjsoncpp1 liblsan0 libmpc3 libmpfr6 libmpx0 libquadmath0 libstdc++-5-dev libtsan0 libubsan0 make patch xz-utils


apt-get -qq install -yq --no-install-suggests --no-install-recommends ca-certificates snapcraft git libhidapi-dev pkg-config qt5-default qttools5-dev-tools libqt5svg5-dev
# Snapcraft build dependencies
apt-get -qq install -yq --no-install-suggests --no-install-recommends binutils build-essential bzip2 cmake cmake-data cpp cpp-5 dpkg-dev fakeroot g++ g++-5 gcc gcc-5 libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl libarchive13 libasan2 
apt-get -qq install -yq libatomic1 libcc1-0 libcilkrts5 libcurl3 libdpkg-perl libfakeroot libfile-fcntllock-perl libgcc-5-dev libgomp1 libisl15 libitm1 libjsoncpp1 liblsan0 libmpc3 libmpx0 libquadmath0 libstdc++-5-dev libtsan0 libubsan0 make patch xz-utils
apt-get -qq install -yq libmpfr6
apt-get -qq install -yq cmake libcurl4

