#!/usr/bin/env bash

set -x

BRANCH=master
if [ "$1xxx" != "xxx" ] ; then
        BRANCH=$1
fi

source /opt/qt59/bin/qt59-env.sh 
export CC=gcc-5
export CCX=g++-5

update-alternatives --install /usr/bin/g++ g++ `which g++-5` 100
update-alternatives --install /usr/bin/gcc gcc `which gcc-5` 100

source /etc/os-release
OS=$ID.$VERSION_ID
SUFFIX=$OS-`date +"%Y%m%d.%H%M%S"`
SRCDIR=/build/
BUILDDIR=build-appimage-$SUFFIX/
APPDIRX=$BUILDDIR/nitrokey-app.AppImage/
APPDIR=$BUILDDIR/nitrokey-app.AppImage/usr
OUTDIR=/build/$SUFFIX
NAME=nitrokey-app.$BRANCH
OUTNAME=Nitrokey_App-x86_64.AppImage 

pushd $SRCDIR
git clone https://github.com/Nitrokey/nitrokey-app --recursive -b $BRANCH $NAME
pushd $NAME
git pull
git submodule update --init --recursive
GIT=`git describe`

mkdir $BUILDDIR -p
pushd $BUILDDIR
qmake .. PREFIX=$APPDIR
make -j4 install
popd

/linuxdeployqt-continuous-x86_64.AppImage $APPDIR/share/applications/nitrokey-app.desktop -bundle-non-qt-libs
#/linuxdeployqt-continuous-x86_64.AppImage $APPDIR/share/applications/nitrokey-app.desktop -appimage


# copy missing Qt librarires
cp /opt/qt59/plugins/imageformats/libqsvg.so $APPDIR/plugins/imageformats/ -v
mkdir -p $APPDIR/plugins/iconengines/ 
cp /opt/qt59/plugins/iconengines/libqsvgicon.so $APPDIR/plugins/iconengines/ -v
# Workaround to increase compatibility with older systems; see https://github.com/darealshinji/AppImageKit-checkrt for details
mkdir -p $APPDIRX/usr/optional/ ; wget -c https://github.com/darealshinji/AppImageKit-checkrt/releases/download/continuous/exec-x86_64.so -O ./$APPDIRX/usr/optional/exec.so
mkdir -p $APPDIRX/usr/optional/libstdc++/ ; cp /usr/lib/x86_64-linux-gnu/libstdc++.so.6 ./$APPDIRX/usr/optional/libstdc++/
( cd $APPDIRX ; rm AppRun ; wget -c https://github.com/darealshinji/AppImageKit-checkrt/releases/download/continuous/AppRun-patched-x86_64 -O AppRun ; chmod a+x AppRun)

# Manually invoke appimagetool so that libstdc++ gets bundled and the modified AppRun stays intact
pushd /
/linuxdeployqt*.AppImage --appimage-extract
export PATH=$(readlink -f /squashfs-root/usr/bin):$PATH
popd
/squashfs-root/usr/bin/appimagetool -g $APPDIR/.. $OUTNAME


mkdir -p $OUTDIR
mv -v $OUTNAME $OUTDIR/Nitrokey_App-x86_64-$GIT.AppImage
echo ===================================
ls -lh $OUTDIR/Nitrokey_App-x86_64-$GIT.AppImage
readlink -f $OUTDIR/Nitrokey_App-x86_64-$GIT.AppImage
readlink -f $APPDIRX

popd
popd
