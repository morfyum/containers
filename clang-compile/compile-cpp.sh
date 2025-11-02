#!/bin/bash

podman run --rm --privileged=true --volume ./src/:/app \
--name clang-compile localhost/clang-compiler:0.3.0 \
clang++ -o ./output/helloWorld.bin ./src/helloworld.cpp

echo "*** test ***"
./src/output/helloWorld.bin
