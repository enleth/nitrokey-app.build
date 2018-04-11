# Description

This toolset allows to build Snapcraft binary of Nitrokey App using [nitrokey-app.snappy](https://github.com/Nitrokey/nitrokey-app.snappy).

## Building docker image
To build docker image run:
```
./docker-build.sh
```
It should result in a docker image tagged `nkapp:snapcraft`. Needs 2GB of disk space for temporary files and in the end takes about 1GB of space.
Build takes about 10 minutes.

## Building Nitrokey App
To build Nitrokey App run:
```
./docker-run.sh
```
Builder will download latest nitrokey-app.snappy sources and will execute the build. Will also apply the patch where needed.

### Build results
Build results and downloaded code will be placed in `../build` directory.

