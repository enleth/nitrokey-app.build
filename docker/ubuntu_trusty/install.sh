apt update -qq
apt install -qy software-properties-common
add-apt-repository ppa:beineri/opt-qt593-trusty -y
apt-get update -qq
apt-get -qy install qt59base qt59declarative qt59translations libgl-dev qt59tools libusb-1.0.0-dev pkg-config udev bash-completion libfuse2 kmod
source /opt/qt*/bin/qt*-env.sh
apt-get install make cmake g++ libhidapi-dev git

pushd /app
wget -c -nv "https://github.com/probonopd/linuxdeployqt/releases/download/continuous/linuxdeployqt-continuous-x86_64.AppImage"
chmod a+x linuxdeployqt-continuous-x86_64.AppImage
git clone https://github.com/Nitrokey/nitrokey-app --recursive
cd nitrokey-app
mkdir build -p
cd build
cmake ..
make -j4
popd
