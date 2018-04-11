#!/usr/bin/env bash
# Installs dependencies and builds Nitrokey App's AppImage.
# Uses /app for making builds and /out for writing results
# Tested on Ubuntu 16.04

git clone https://github.com/Nitrokey/nitrokey-app.snappy --recursive

docker build . -t nkapp:snapcraft
