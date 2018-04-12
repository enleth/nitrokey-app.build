FROM ubuntu:latest
RUN apt-get -q update
RUN apt-get install -qy --no-install-suggests --no-install-recommends ruby autopoint bison flex gperf scons libtool-bin intltool libgtk2.0-dev libtool
RUN apt-get install -qy --no-install-suggests --no-install-recommends upx-ucl git
RUN apt-get install -qy --no-install-suggests --no-install-recommends wget unzip p7zip-full cmake

RUN apt-get install -qy --no-install-suggests --no-install-recommends --force-yes pkg-config build-essential git file curl wget

# run setup
ADD . /app
WORKDIR /app/
RUN bash _dependencies.sh

# set final default run command
CMD ["/bin/bash","_build.sh"]
