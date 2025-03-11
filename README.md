ngtcp2 for Nim
==============

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![License: Apache](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
![Github action](https://github.com/status-im/nim-bearssl/workflows/CI/badge.svg)
<img src="https://img.shields.io/badge/nim-%3E%3D1.2.0-orange.svg?style=flat-square" />



Wrapper around the [ngtcp2](https://github.com/ngtcp2/ngtcp2) C library for
[Nim](https://nim-lang.org/).

Updating to a newer version
---------------------------

Follow these steps when updating the wrapper to a newer version of ngtcp2:

- run `nimble install` (needed inly once for fresh clones)
  - requires `clang` to be installed on the system
- update the git submodule in `libs/` to point to the new version
  - `git submodule update --init --recursive`
- run `build.sh` (requires Nim and CMake to be installed)
- increase the `version` property in the `ngtcp2.nimble` file
- commit the changes
