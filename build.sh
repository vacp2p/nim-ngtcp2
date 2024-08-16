#!/bin/bash
root=$(dirname "$0")

# install nimterop, if not already installed
if ! [ -x "$(command -v toast)" ]; then
  nimble install -y nimterop@2532ce0
fi

# run cmake on ngtcp2 sources
cmake -S "${root}/sources" -B "${root}/build"

# add prelude
cat "${root}/prelude.nim" > "${root}/ngtcp2.nim"

# dividing line
echo >> "${root}/ngtcp2.nim"

# assemble list of C files to be compiled
for file in `ls "${root}/sources/lib"/*.c`; do
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
  --includeDirs="${root}/sources/lib/includes" \
  --includeDirs="${root}/build/lib/includes" \
  "${root}/sources/lib/includes/ngtcp2/ngtcp2.h" >> "${root}/ngtcp2.nim"

sed -i 's/\bpassC\b/passc/g' ngtcp2.nim
