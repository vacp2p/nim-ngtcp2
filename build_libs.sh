#!/bin/bash
root=$(dirname "$0")
sources=${root}/libs


cmake -S . -B build


# build aws-lc
tmpdir=$(mktemp -d)
cmake -S ./libs/aws-lc -B "$tmpdir" -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTING=OFF -DFIPS=OFF -DBUILD_TOOL=OFF -DDISABLE_GO=ON
cmake --build "$tmpdir" --target all
cp "$tmpdir"/ssl/libssl.a ./build/.
cp "$tmpdir"/crypto/libcrypto.a ./build/.
