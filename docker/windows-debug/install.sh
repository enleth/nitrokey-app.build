#echo "deb http://pkg.mxe.cc/repos/apt/debian wheezy main" > /etc/apt/sources.list.d/mxeapt.list
#apt-get update
#apt-get install gnupg2
#$apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D43A795B73B16ABE9643FE1AFD8FFF16DB45C6AB
#apt-get update
#apt-get install mxe-i686-w64-mingw32.static-qt
#apt-get install mxe-x86-64-w64-mingw32.static-qt mxe-x86-64-w64-mingw32.static-gcc
#apt install bash-completion # DEBUG package

BRANCH=274-gnome-ui_change

#alias cp=cp -v

apt-get update
apt-get install -qy bison cmake flex intltool libtool scons
apt-get install -qy ruby autopoint bison flex gperf scons libtool-bin intltool libgtk2.0-dev
apt-get install -qy upx-ucl git

cd /
mkdir -p build
pushd build

git clone https://github.com/mxe/mxe.git
pushd mxe
make -j4 MXE_TARGETS=i686-w64-mingw32.static.posix MXE_PLUGIN_DIRS=plugins/gcc6  qtbase
popd
export PATH=$PATH:/build/mxe/usr/bin

git clone https://github.com/Nitrokey/nitrokey-app.git --recursive -b $BRANCH


cd nitrokey-app
git pull
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
rm -rf upx/*
#upx /build/nitrokey-app-cmake-volatile.exe -o /build/nitrokey-app-cmake-volatile-upx.exe
#upx /build/nitrokey-app-cmake.exe -o /build/nitrokey-app-cmake-upx.exe
for i in `ls *exe`; do
	upx $i -o upx/$i
done
#upx /build/nitrokey-app-qt.exe -o /build/nitrokey-app-qt-upx.exe
#upx /build/nitrokey-app-qt-volatile.exe -o /build/nitrokey-app-qt-volatile-upx.exe


