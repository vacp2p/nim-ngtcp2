import nimterop/build
import sources

static:
  gitPull(
    "https://github.com/ngtcp2/ngtcp2",
    checkout="d234d50",
    outdir=ngtcp2src
  )
  cmake(
    ngtcp2src,
    check="lib"/"includes"/"ngtcp2"/"version.h",
    flags="."
  )
