# Clan-compiler minimal image for C, C++ project.

## Compiler
Current version use `clang` package with `clang` for C and `clang++` for C++

## Versioning: X.Y.Z (0.1.0) Major.Minor.Patch

**Major**
- Incompatible changes with previous version.
    - For example `WORKDIR=/app` changed and any script depends on it.

**Minor**:
- New Features

**Patch**
- Bug, and Security fixes
- Small changes

## Compile C/C++ files
Require `--privileged=true` on Fedora systems otherwise container fall back with `Permission Denied` error.

```sh
podman run --rm --privileged=true --volume ./src/:/app --name clang-compile localhost/clang-compiler:0.3.0 clang -o ./output/heloWorld.bin ./src/helloworld.c
```
