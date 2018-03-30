FROM ubuntu:trusty
RUN apt-get -qq update

RUN apt-get install -yq --no-install-suggests --no-install-recommends --force-yes software-properties-common
RUN add-apt-repository -y ppa:ubuntu-toolchain-r/test
RUN add-apt-repository --yes ppa:beineri/opt-qt594-trusty
RUN apt-get -qq update -qq
RUN apt-get -qq install -yq --no-install-suggests --no-install-recommends --force-yes ca-certificates libusb-1.0.0-dev cmake pkg-config libhidapi-dev git udev fuse file curl wget
RUN apt-get -qq install -yq --no-install-suggests --no-install-recommends --force-yes g++-5
RUN apt-get -qq install -yq --no-install-suggests --no-install-recommends --force-yes qt59base qt59tools qt59svg
RUN apt-get -qq remove gcc-4.8 g++-4.8 --purge
RUN apt-get install -yq make
RUN apt-get install mesa-common-dev libglu1-mesa-dev -yq


# run setup
ADD . /app
WORKDIR /app/
RUN bash _dependencies.sh

# set final default run command
CMD ["/bin/bash","_build.sh"]
