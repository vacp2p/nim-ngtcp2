ngtcp2 for Nim
==============

Wrapper around the [ngtcp2](https://github.com/ngtcp2/ngtcp2) C library for
[Nim](https://nim-lang.org/).

Updating to a newer version
---------------------------

Follow these steps when updating the wrapper to a newer version of ngtcp2:

   1. update the git submodule in `sources/` to point to the new version
   2. run `build.sh` (requires Nim and CMake to be installed)
   3. update the version in `ngtcp2.nimble`
   4. commit the changes
