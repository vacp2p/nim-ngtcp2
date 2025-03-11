#!/bin/bash
root=$(dirname "$0")
sources=${root}/libs

rm -f ngtcp2.nim

# assemble list of C files to be compiled
toCompile=(
  "${sources}/picotls/picotlsvs/picotls/wintimeofday.c"
  "${sources}/picotls/lib/pembase64.c"
  "${sources}/picotls/lib/hpke.c"
  "${sources}/picotls/lib/picotls.c"
  "${sources}/picotls/lib/openssl.c"
)

for file in `ls "${sources}/ngtcp2/crypto"/*.c`; do
  toCompile+=("$file")
done
for file in `ls "${sources}/ngtcp2/crypto/picotls"/*.c`; do
  toCompile+=("$file")
done
for file in `ls "${sources}/ngtcp2/lib"/*.c`; do
  toCompile+=("$file")
done
for file in `ls "${root}/build/lib"/*.c`; do
  toCompile+=("$file")
done

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
