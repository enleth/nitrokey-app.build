#!/usr/bin/env bash

set -x

BRANCH=master
if [ "$1xxx" != "xxx" ] ; then
        BRANCH=$1
fi


pushd /app/nitrokey-app.snappy
git config --global user.email "app.build@nitrokey.com"
git config --global user.name "Nitrokey App Build"
git stash save
git pull
snapcraft update
snapcraft clean

snapcraft
#apply libnitrokey patch and install again
pushd /app/nitrokey-app.snappy/parts/application/src/libnitrokey && git apply /app/nitrokey-app.snappy/libnitrokey.patch && popd
snapcraft

ls -lh nitrokey-app*snap
cp -vb nitrokey-app*snap /build

#echo "Test snap installation"
#sudo snap install nitrokey-app --devmode
#nitrokey-app.dev --version
#xvfb-run nitrokey-app.dev --version


popd

