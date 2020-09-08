#!/bin/bash
root=$(dirname "$0")

# install nimterop, if not already installed
if ! [ -x "$(command -v toast)" ]; then
  nimble install -y nimterop@0.6.11
fi

# run cmake on ngtcp2 sources
cmake -S "${root}/sources" -B "${root}/build"

# socket definitions
cat "${root}/sockets.nim" > "${root}/ngtcp2.nim"

# dividing line
echo >> "${root}/ngtcp2.nim"

# generate nim wrapper with nimterop
toast \
  --pnim \
  --preprocess \
  --includeDirs="${root}/sources/lib/includes" \
  --includeDirs="${root}/build/lib/includes" \
  "${root}/sources/lib/includes/ngtcp2/ngtcp2.h" >> "${root}/ngtcp2.nim"
