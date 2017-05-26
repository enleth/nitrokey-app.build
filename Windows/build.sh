#!/bin/bash

# Build script for Windows binary
# Needs prebuilt MXE envirnoment with posix threads
# codesigning has to be done separately on Windows machine
# TBD use alternative utils for codesigning to stay on one platform
# http://ilostmynotes.blogspot.com/2014/10/authenticode-signing-windows.html

# Usage example:
# bash ../build.sh ../../standalone/bin  v1.1 enable_log 

set -x
MXEPATH=`realpath $1`
BRANCH=$2
CONFIG=$3

DIRNAME=nitrokey-app.$BRANCH.$CONFIG
MXEPREFIX=i686-w64-mingw32.static.posix-
# link MXE binaries
QMAKE="${MXEPATH}"/${MXEPREFIX}qmake-qt5
CMAKE="${MXEPATH}"/${MXEPREFIX}cmake


git clone https://github.com/Nitrokey/nitrokey-app --recursive -b $BRANCH --depth 10 $DIRNAME
cd $DIRNAME

pushd libnitrokey/build
$CMAKE ..
make -j4
popd

mkdir build-qmake
cd build-qmake
$QMAKE .. CONFIG+=$CONFIG
PATH=$MXEPATH:$PATH make -j4

FNDMG=nitrokey-app-`git describe`-$BRANCH.$CONFIG.exe
mv -v release/nitrokey-app.exe $FNDMG 
ls -lh $FNDMG
sha512sum "$FNDMG" | tee "${FNDMG}.sha512"
cp ${FNDMG}* ../../                                                   


