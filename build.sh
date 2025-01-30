#!/bin/bash
root=$(realpath "$(dirname "$0")")
sources=$(realpath "${root}/sources")

# install nimterop, if not already installed
if ! [ -x "$(command -v toast)" ]; then
  nimble install -y nimterop@0.6.13
fi

# add prelude
cat "${root}/prelude.nim" > "${root}/ngtcp2.nim"

# dividing line
echo >> "${root}/ngtcp2.nim"

# assemble list of C files to be compiled
picotls=(
  "${sources}/picotls/lib/pembase64.c"
  "${sources}/picotls/lib/hpke.c"
  "${sources}/picotls/lib/picotls.c"
  "${sources}/picotls/lib/openssl.c"
)
for file in "${picotls[@]}"; do
  compile="${compile} --compile=${file}"
done
for file in `ls "${sources}/ngtcp2/crypto"/*.c`; do
  compile="${compile} --compile=${file}"
done
for file in `ls "${sources}/ngtcp2/crypto/picotls"/*.c`; do
  compile="${compile} --compile=${file}"
done
for file in `ls "${sources}/ngtcp2/lib"/*.c`; do
  compile="${compile} --compile=${file}"
done

# generate nim wrapper with nimterop
toast \
  $compile \
  --pnim \
  --preprocess \
  --noHeader \
  --defines=NGTCP2_STATICLIB \
  --replace=sockaddr=SockAddr,SockAddr_storage=Sockaddr_storage,socklen_t=SockLen \
  --replace=clone_=ptlsXXclone,destroy_=ptlsXXdestroy,random_=ptlsXXrandom,_output=XXoutput,__=xXx \
  --includeDirs="${sources}/ngtcp2/crypto" \
  --includeDirs="${sources}/picotls/include" \
  --includeDirs="${sources}/ngtcp2/lib" \
  --includeDirs="${sources}/ngtcp2/crypto/includes" \
  --includeDirs="${sources}/ngtcp2/lib/includes" \
  "${sources}/picotls/include/picotls.h" \
  "${sources}/ngtcp2/lib/includes/ngtcp2/ngtcp2.h" \
  "${sources}/ngtcp2/crypto/includes/ngtcp2/ngtcp2_crypto_picotls.h" \
  >> "${root}/ngtcp2.nim"


sed -i 's/\bpassC\b/passc/g' ngtcp2.nim
