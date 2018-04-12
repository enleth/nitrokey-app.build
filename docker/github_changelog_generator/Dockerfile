FROM ubuntu:rolling
RUN apt-get -qq update

RUN apt-get -qq install -yq --no-install-suggests --no-install-recommends --force-yes ruby
RUN gem install bundler
RUN apt-get -qq install -yq --no-install-suggests --no-install-recommends --force-yes wget unzip
RUN apt-get -qq install -yq --no-install-suggests --no-install-recommends --force-yes gcc
RUN apt-get -qq install -yq --no-install-suggests --no-install-recommends --force-yes ruby-dev
RUN apt-get -qq install -yq --no-install-suggests --no-install-recommends --force-yes build-essential
RUN apt-get -qq install -yq --no-install-suggests --no-install-recommends --force-yes ca-certificates

RUN mkdir -p /app
ADD _build.sh /app
ADD _dependencies.sh /app

WORKDIR /app/

RUN bash _dependencies.sh

# set final default run command
CMD ["/bin/bash","_build.sh"]
