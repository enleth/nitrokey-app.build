# Description

This toolset allows to build AppImage binary of Nitrokey App using [linuxdeployqt](https://github.com/probonopd/linuxdeployqt) project.

## Building docker image
To build docker image run:
```
./docker-build.sh
```
It should result in a docker image tagged `nkapp:appimage`. Needs 2GB of disk space for temporary files and in the end takes about 2GB of space.
Build takes about 20 minutes.

## Building Nitrokey App
To build Nitrokey App run:
```
./docker-run.sh [BRANCH]
```
where BRANCH is the chosen branch or tag to build. If not given, master will be built. Available tags could be listed with git:
```
git tag
```
and available branches with:
```
git branch -a
```
.

### Build results
Build results and downloaded code will be placed in `../build` directory.

