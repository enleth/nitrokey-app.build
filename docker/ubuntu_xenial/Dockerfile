FROM ubuntu:latest
RUN apt-get -q update
RUN apt-get install -qy --no-install-suggests --no-install-recommends --force-yes libusb-1.0.0-dev cmake qt5-default qttools5-dev pkg-config libhidapi-dev build-essential git udev fuse qttools5-dev-tools file curl wget
RUN apt-get install -qy --no-install-suggests --no-install-recommends --force-yes libqt5svg5-dev

# run setup
ADD . /app
WORKDIR /app/
RUN bash _dependencies.sh

# set final default run command
CMD ["/bin/bash","_build.sh"]
