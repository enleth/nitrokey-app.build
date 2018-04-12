#!/bin/bash


BRANCH=master
if [ "$1xxx" != "xxx" ] ; then
	BRANCH=$1
fi
REBUILD=0
if [ "$2xxx" == "rebuildxxx" ] ; then
	REBUILD=1
fi
NAME=nitrokey-app.$BRANCH
export PATH=$PATH:/mxe/usr/bin


cd /build

git clone https://github.com/Nitrokey/nitrokey-app.git --recursive -b $BRANCH $NAME
cd $NAME
git pull
git checkout $BRANCH
git submodule update --init --recursive

if [ $REBUILD -eq 1 ]; then
	for i in build-qt-release build-qt; do
		mkdir -p $i
		rm -rf $i/*
	done
fi

function mkdircd(){
	mkdir -p $1
	pushd $1
}

CONFIG=qt-volatile
FNDMG=nitrokey-app-`git describe`-$BRANCH.$CONFIG.exe
mkdircd build-qt
i686-w64-mingw32.static.posix-qmake-qt5 .. CONFIG+=CONSOLE DEFINES+=LOG_VOLATILE_DATA
make -j4 -f Makefile.Release
cp release/nitrokey-app.exe /build/$FNDMG
popd

CONFIG=qt-release
FNDMG=nitrokey-app-`git describe`-$BRANCH.$CONFIG.exe
mkdircd build-qt-release
i686-w64-mingw32.static.posix-qmake-qt5 ..
make -j4 -f Makefile.Release
cp release/nitrokey-app.exe /build/$FNDMG
popd


cd /build/
mkdir -p upx

for i in `ls *exe`; do
	make -f /app/Makefile.upx upx/$i
done
