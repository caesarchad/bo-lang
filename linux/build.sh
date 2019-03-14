#!/usr/bin/env bash
set -ex

cd "$(dirname "$0")"

docker build --no-cache -t bitconch/llvm .

rm -rf out
mkdir -p out
cd out

# Copy out and bundle release products
mkdir -p deploy
id=$(docker create bitconch/llvm)
docker cp "$id":/usr/local/version.md deploy
docker cp "$id":/usr/local/bin deploy
docker cp "$id":/usr/local/lib deploy
docker rm -v "$id"
tar -C deploy -jcf bitconch-llvm-linux.tar.bz2 .

docker push bitconch/llvm
