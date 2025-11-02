#!/bin/bash

#podman run --rm --privileged=true --volume ./src/:/app --name mono-buildnrun localhost/mono-buildnrun:0.1.0 mono ./output/hello.exe

if [ -z "$1" ]; then
    echo "Missing .exe to run."
    echo "example: mono.sh ./src/output/hello.exe"
    exit 1
fi

podman run --rm --privileged=true --volume ./out/:/app/out --name mono-buildnrun localhost/mono-buildnrun:0.1.0 mono $1
