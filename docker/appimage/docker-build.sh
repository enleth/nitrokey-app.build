#!/usr/bin/env bash
# Installs dependencies and builds Nitrokey App's AppImage.
# Uses /app for making builds and /out for writing results
# Tested on Ubuntu 16.04, should work on Debian 9 as well

#bash ./_dependencies.sh
#bash ./_build.sh

docker build . -t nkapp:appimage
