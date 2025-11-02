#!/bin/bash

echo "Build Image..."

this_version="0.3.0"
this_image="clang-compiler"

echo " *** Image name and version: [$this_image]:[$this_version] ***"

podman build --no-cache --tag $this_image:$this_version .

echo "*** DONE - LIST IMAGES ***"
podman images

#podman run --rm --privileged=true --volume ./src/:/app --name clang-compile localhost/clang-compiler:0.3.0 clang -o ./output/helloWorld.bin ./src/helloworld.c
