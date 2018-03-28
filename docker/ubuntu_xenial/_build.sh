#!/usr/bin/env bash

source /etc/os-release
OS=$ID.$VERSION_ID
SUFFIX=$OS-`date +"%Y%m%d.%H%M%S"`
BUILDDIR=build-appimage-$SUFFIX
APPDIR=$BUILDDIR/nitrokey-app.AppImage/usr
OUTDIR=/out/$SUFFIX

pushd /app
git clone https://github.com/Nitrokey/nitrokey-app --recursive $@
git pull
git submodule update --init --recursive

pushd nitrokey-app
GIT=`git describe`

mkdir $BUILDDIR -p
pushd $BUILDDIR
qmake .. PREFIX=$APPDIR
make -j4 install
popd

../linuxdeployqt-continuous-x86_64.AppImage $APPDIR/share/applications/nitrokey-app.desktop -bundle-non-qt-libs
../linuxdeployqt-continuous-x86_64.AppImage $APPDIR/share/applications/nitrokey-app.desktop -appimage

mkdir -p $OUTDIR
mv -v Nitrokey_App-x86_64.AppImage $OUTDIR/Nitrokey_App-x86_64-$GIT.AppImage

popd
popd
