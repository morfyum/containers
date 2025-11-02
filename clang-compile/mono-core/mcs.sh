#!/bin/bash


if [ -z "$1" ]; then
    echo "Missing .cs file for compiler"
    echo "example: mcs.sh ./src/src/hello.cs hello.exe"
    exit 1
fi

if [ -z "$1" ]; then
    echo "Missing output filename!"
    echo "example: mcs.sh ./src/src/hello.cs hello.exe"
    exit 1
fi

echo "*** Build : [$1] to [$2] ***"
#podman run --rm --privileged=true --volume ./src/:/app --name mono-buildnrun localhost/mono-buildnrun:0.1.0 mcs ./src/hello.cs -out:./output/hello.exe
podman run --rm --privileged=true \
--volume ./src/:/app/src \
--volume ./out:/app/out \
--name mono-buildnrun localhost/mono-buildnrun:0.1.0 mcs $1 -out:$2

echo "*** Run   : [$2] ***"
./mono.sh $2
