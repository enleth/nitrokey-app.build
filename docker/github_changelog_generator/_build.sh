#!/usr/bin/env bash

set -x

mkdir -p /build
cd /build

github_changelog_generator --version
github_changelog_generator $@
