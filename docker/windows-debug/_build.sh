#!/bin/bash


BRANCH=master
if [ "$1xxx" != "xxx" ] ; then
	BRANCH=$1
fi
NAME=nitrokey-app.$BRANCH
export PATH=$PATH:/mxe/usr/bin


cd /build

git clone https://github.com/Nitrokey/nitrokey-app.git --recursive -b $BRANCH $NAME
cd $NAME
git pull
git checkout $BRANCH
git submodule update --init --recursive

for i in build-cmake build-qt; do
	mkdir -p $i
	rm -rf $i/*
done

# pushd build-cmake
#i686-w64-mingw32.static.posix-cmake ..
#make -j4
#cp nitrokey-app.exe /build/nitrokey-app-cmake.exe
#popd
#
#pushd build-cmake
#export PATH=$PATH:/build/mxe/bin
#i686-w64-mingw32.static.posix-cmake .. -DLOG_VOLATILE_DATA=ON
#make -j4
#cp nitrokey-app.exe /build/nitrokey-app-cmake-volatile.exe
#popd

CONFIG=qt-volatile
FNDMG=nitrokey-app-`git describe`-$BRANCH.$CONFIG.exe
pushd build-qt
i686-w64-mingw32.static.posix-qmake-qt5 .. CONFIG+=CONSOLE DEFINES+=LOG_VOLATILE_DATA
make -j4 -f Makefile.Release
cp release/nitrokey-app.exe /build/$FNDMG
popd

CONFIG=qt-release
FNDMG=nitrokey-app-`git describe`-$BRANCH.$CONFIG.exe
pushd build-qt
i686-w64-mingw32.static.posix-qmake-qt5 ..
make -j4 -f Makefile.Release
cp release/nitrokey-app.exe /build/$FNDMG
popd


cd /build/
mkdir -p upx
#rm -rf upx/*

for i in `ls *exe`; do
	upx $i -o upx/$i -l
	upx -t upx/$i
done
