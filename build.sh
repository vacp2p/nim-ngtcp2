#!/bin/bash
root=$(dirname "$0")
sources=${root}/libs

# install nimterop, if not already installed
if ! [ -x "$(command -v toast)" ]; then
  nimble install -y futhark@0.14.1
fi

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

# "/opt/homebrew/Cellar/openssl@3/3.4.0/include" 

nim c --maxLoopIterationsVM:100000000 generate_ngtcp2.nim

# add prelude
cat "${root}/prelude.nim" > ngtcp2.nim

for file in "${toCompile[@]}"; do
    echo "{.compile: \"$file\".}" >> ngtcp2.nim
done

cat tmp_ngtcp2.nim >> ngtcp2.nim
rm -f tmp_ngtcp2.nim
