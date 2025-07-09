#!/bin/bash
root=$(dirname "$0")
sources=${root}/libs

rm -f ngtcp2.nim

# assemble list of C files to be compiled
toCompile=()

for file in `ls "${sources}/ngtcp2/crypto"/*.c`; do
  toCompile+=("$file")
done
for file in `ls "${sources}/ngtcp2/crypto/boringssl"/*.c`; do
  toCompile+=("$file")
done
for file in `ls "${sources}/ngtcp2/lib"/*.c`; do
  toCompile+=("$file")
done

# build aws-lc
tmpdir=$(mktemp -d)
cmake -S ./libs/aws-lc -B "$tmpdir" -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTING=OFF -DFIPS=OFF -DBUILD_TOOL=OFF -DDISABLE_GO=ON
cmake --build "$tmpdir" --target all
cp "$tmpdir"/ssl/libssl.a ./build/.
cp "$tmpdir"/crypto/libcrypto.a ./build/.

# futhark is required by generate_ngtcp2.nim
nimble install futhark@0.15.0

nim c --maxLoopIterationsVM:100000000 generate_ngtcp2.nim

cat "${root}/prelude.nim" > ngtcp2.nim

echo >> ngtcp2.nim # linebreak

for file in "${toCompile[@]}"; do
    echo "{.compile: \"$file\".}" >> ngtcp2.nim
done

# removes absolute path prefix from comments "Generated based on"
sed -i 's/Generated based on.*\/nim-ngtcp2\/libs\//Generated based on \/nim-ngtcp2\/libs\//g' tmp_ngtcp2.nim

cat tmp_ngtcp2.nim >> ngtcp2.nim

echo >> ngtcp2.nim # linebreak

cat "${root}/extras.nim" >> ngtcp2.nim

rm -f tmp_ngtcp2.nim
