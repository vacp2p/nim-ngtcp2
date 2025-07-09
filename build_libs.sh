#!/bin/bash
set -euo pipefail

root=$(dirname "$0")
sources=${root}/libs
tmpdir=$(mktemp -d)

force_i386=false

# check args
for arg in "$@"; do
  case "$arg" in
    --i386)
      force_i386=true
      ;;
    *)
      echo "unknown arg: $arg" >&2
      exit 1
      ;;
  esac
done

cmake_args=(
  -DCMAKE_BUILD_TYPE=Release
  -DBUILD_SHARED_LIBS=OFF
  -DBUILD_TESTING=OFF
  -DFIPS=OFF
  -DBUILD_TOOL=OFF
  -DDISABLE_GO=ON
)

# optionally inject i386 toolchain
if [ "$force_i386" = true ]; then
  toolchain_file=$(mktemp)
  cat > "$toolchain_file" <<EOF
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR i386)
set(CMAKE_C_FLAGS "\${CMAKE_C_FLAGS} -m32")
set(CMAKE_CXX_FLAGS "\${CMAKE_CXX_FLAGS} -m32")
EOF
  cmake_args+=("-DCMAKE_TOOLCHAIN_FILE=$toolchain_file")
fi

# build aws-lc
cmake -S ./libs/aws-lc -B "$tmpdir" "${cmake_args[@]}"
cmake --build "$tmpdir" --target all
cp "$tmpdir"/ssl/libssl.a ./build/.
cp "$tmpdir"/crypto/libcrypto.a ./build/.