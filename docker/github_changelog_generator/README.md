# Description

This toolset allows to build changelog file using [github-changelog-generator](https://github.com/skywinder/github-changelog-generator).

## Building docker image
To build docker image run:
```
./docker-build.sh
```
It should result in a docker image tagged `github-changelog-generator. Needs 1GB of disk space for temporary files and in the end takes about 0.5GB of space.
Build takes about 5 minutes.

## Building Nitrokey App
To build Nitrokey App run:
```
./docker-run.sh
```
Builder will download latest github-changelog-generator sources and will execute the build.


