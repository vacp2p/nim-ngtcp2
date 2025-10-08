import os
import strformat, strutils
import ./awslc

# Socket definitions
import nativesockets

{.passc: "-DNGTCP2_STATICLIB".}

when defined(windows):
  {.passl: "-lws2_32".}
  {.passc: "-D_WINDOWS".}
  {.passc: "-D__CRT__NO_INLINE".}
else:
  {.passc: "-DHAVE_UNISTD_H".}

const root = currentSourcePath.parentDir
const libIncludes = root / "build/lib/includes"
const ngtcp2Crypto = root / "libs/ngtcp2/crypto"
const ngtcp2CryptoIncludes = root / "libs/ngtcp2/crypto/includes"
const ngtcp2Lib = root / "libs/ngtcp2/lib"
const ngtcp2LibIncludes = root / "libs/ngtcp2/lib/includes"
const awsLcInclude = root / "libs/aws-lc/include"
const jitterEntropy =
  root / "libs/aws-lc/third_party/jitterentropy/jitterentropy-library"

{.passc: fmt"-I{libIncludes}".}
{.passc: fmt"-I{ngtcp2Crypto}".}
{.passc: fmt"-I{ngtcp2CryptoIncludes}".}
{.passc: fmt"-I{ngtcp2Lib}".}
{.passc: fmt"-I{ngtcp2LibIncludes}".}
{.passc: fmt"-I{awsLcInclude}".}
{.passc: fmt"-I{jitterEntropy}".}

when defined(ngtcp2_enable_quictls):
  # QuicTLS/OpenSSL crypto support
  {.passc: "-DNGTCP2_CRYPTO_QUICTLS".}
  {.passc: "-I/usr/include/openssl".}
