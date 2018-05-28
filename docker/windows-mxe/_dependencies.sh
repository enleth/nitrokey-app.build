#echo "deb http://pkg.mxe.cc/repos/apt/debian wheezy main" > /etc/apt/sources.list.d/mxeapt.list
#apt-get update
#apt-get install gnupg2
#$apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D43A795B73B16ABE9643FE1AFD8FFF16DB45C6AB
#apt-get update
#apt-get install mxe-i686-w64-mingw32.static-qt
#apt-get install mxe-x86-64-w64-mingw32.static-qt mxe-x86-64-w64-mingw32.static-gcc
#apt install bash-completion # DEBUG package


#alias cp=cp -v

#apt-get update
#apt-get install -qy bison cmake flex intltool libtool scons
#apt-get install -qy ruby autopoint bison flex gperf scons libtool-bin intltool libgtk2.0-dev
#apt-get install -qy upx-ucl git

cd /

git clone https://github.com/mxe/mxe.git --depth=10
pushd mxe
make -j4 MXE_TARGETS=i686-w64-mingw32.static.posix MXE_PLUGIN_DIRS=plugins/gcc6 qtbase qtsvg libusb1
du -shc tmp* pkg log
rm -rf tmp* pkg/*

pushd log
  find  -type f -exec gzip {} \;
popd

popd
export PATH=$PATH:/mxe/usr/bin
ln -s /mxe/usr/bin mxe_bin



