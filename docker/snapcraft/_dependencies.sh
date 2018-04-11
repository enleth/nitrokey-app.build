#!/usr/bin/env bash

AF="-yq --no-install-suggests --no-install-recommends --force-yes"
apt-get update -qq
apt-get -qq install ${AF} snapcraft qt5-default qttools5-dev-tools libqt5svg5-dev

