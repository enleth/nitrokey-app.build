#!/usr/bin/env bash

AF="-yq --no-install-suggests --no-install-recommends --force-yes"
apt-get update -qq
# Nitrokey App dependencies
apt-get -qq install ${AF} snapcraft qt5-default qttools5-dev-tools libqt5svg5-dev libhidapi-dev
# Snapcraft build dependencies
apt-get -qq install ${AF} binutils build-essential bzip2 cmake cmake-data cpp cpp-5 dpkg-dev fakeroot g++ g++-5 gcc gcc-5 libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl libarchive13 libasan2 libatomic1 libcc1-0 libcilkrts5 libcurl3 libdpkg-perl libfakeroot libfile-fcntllock-perl libgcc-5-dev libgomp1 libisl15 libitm1 libjsoncpp1 liblsan0 libmpc3 libmpfr4 libmpx0 libquadmath0 libstdc++-5-dev libtsan0 libubsan0 make patch xz-utils

