FROM ubuntu:latest
RUN apt-get -qq update

RUN apt-get -qq install -yq --no-install-suggests --no-install-recommends --force-yes ca-certificates snapcraft git libhidapi-dev pkg-config qt5-default qttools5-dev-tools libqt5svg5-dev
# Snapcraft build dependencies
RUN apt-get -qq install -yq --no-install-suggests --no-install-recommends --force-yes binutils build-essential bzip2 cmake cmake-data cpp cpp-5 dpkg-dev fakeroot g++ g++-5 gcc gcc-5 libalgorithm-diff-perl libalgorithm-diff-xs-perl libalgorithm-merge-perl libarchive13 libasan2 libatomic1 libcc1-0 libcilkrts5 libcurl3 libdpkg-perl libfakeroot libfile-fcntllock-perl libgcc-5-dev libgomp1 libisl15 libitm1 libjsoncpp1 liblsan0 libmpc3 libmpfr4 libmpx0 libquadmath0 libstdc++-5-dev libtsan0 libubsan0 make patch xz-utils

# run setup
RUN mkdir -p /app
ADD _build.sh /app
ADD _dependencies.sh /app

WORKDIR /app/
RUN bash _dependencies.sh

# set final default run command
CMD ["/bin/bash","_build.sh"]
