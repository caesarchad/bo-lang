#!/usr/bin/env bash
set -ex

rm -rf docker_image
mkdir -p docker_image

(cd linux && ./build.sh )
cp linux/out/bitconch-llvm-linux.tar.bz2 docker_image

if [ "$(uname)" == "Darwin" ]; then
  echo "Building docker image for MacOS"
  (cd macos && ./build.sh )
  cp macos/out/bitconch-llvm-macos.tar.bz2 docker_image
else
  echo "Local machine is MacOS, skipping"
fi


