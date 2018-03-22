AF="-yq --no-install-suggests --no-install-recommends --force-yes"
apt-get update -qq
apt-get install $AF libusb-1.0.0-dev cmake qt5-default qttools5-dev pkg-config libhidapi-dev build-essential git udev fuse qttools5-dev-tools file curl wget

mkdir -p app # in case volume would not be attached
pushd /app
wget -c -nv "https://github.com/probonopd/linuxdeployqt/releases/download/continuous/linuxdeployqt-continuous-x86_64.AppImage"
chmod a+x linuxdeployqt-continuous-x86_64.AppImage

git clone https://github.com/Nitrokey/nitrokey-app --recursive

git pull
git submodule update --init --recursive

pushd nitrokey-app

source /etc/os-release
OS=$ID.$VERSION_ID
SUFFIX=$OS-`date +"%Y%m%d.%H%M%S"`
BUILDDIR=build-appimage-$SUFFIX
APPDIR=$BUILDDIR/nitrokey-app.AppImage/usr
OUTDIR=/out/$SUFFIX

mkdir $BUILDDIR -p
pushd $BUILDDIR
qmake .. PREFIX=$APPDIR
make -j4 install
popd

../linuxdeployqt-continuous-x86_64.AppImage $APPDIR/share/applications/nitrokey-app.desktop -bundle-non-qt-libs
../linuxdeployqt-continuous-x86_64.AppImage $APPDIR/share/applications/nitrokey-app.desktop -appimage

mkdir -p $OUTDIR
mv -v Nitrokey_App-x86_64.AppImage $OUTDIR/


popd
