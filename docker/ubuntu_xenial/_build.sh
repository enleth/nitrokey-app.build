#!/usr/bin/env bash

BRANCH=master
if [ "$1xxx" != "xxx" ] ; then
        BRANCH=$1
fi

source /etc/os-release
OS=$ID.$VERSION_ID
SUFFIX=$OS-`date +"%Y%m%d.%H%M%S"`
BUILDDIR=build-appimage-$SUFFIX
APPDIR=$BUILDDIR/nitrokey-app.AppImage/usr
OUTDIR=/build/$SUFFIX
NAME=nitrokey-app.$BRANCH

pushd /build
git clone https://github.com/Nitrokey/nitrokey-app --recursive -b $BRANCH $NAME
git pull
git submodule update --init --recursive

pushd $NAME
GIT=`git describe`

mkdir $BUILDDIR -p
pushd $BUILDDIR
qmake .. PREFIX=$APPDIR
make -j4 install
popd

/linuxdeployqt-continuous-x86_64.AppImage $APPDIR/share/applications/nitrokey-app.desktop -bundle-non-qt-libs
/linuxdeployqt-continuous-x86_64.AppImage $APPDIR/share/applications/nitrokey-app.desktop -appimage

mkdir -p $OUTDIR
mv -v Nitrokey_App-x86_64.AppImage $OUTDIR/Nitrokey_App-x86_64-$GIT.AppImage

popd
popd
