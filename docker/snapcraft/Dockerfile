FROM ubuntu:latest
RUN apt-get -qq update

RUN apt-get -qq install -yq --no-install-suggests --no-install-recommends --force-yes ca-certificates snapcraft git
RUN apt-get -qq install -yq --no-install-suggests --no-install-recommends --force-yes qt5-default qttools5-dev-tools libqt5svg5-dev

# run setup
ADD . /app
WORKDIR /app/
RUN bash _dependencies.sh

# set final default run command
CMD ["/bin/bash","_build.sh"]
