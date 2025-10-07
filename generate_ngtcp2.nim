import futhark
from os import parentDir, `/`

importc:
  outputPath currentSourcePath.parentDir / "tmp_ngtcp2.nim"
  path currentSourcePath.parentDir / "libs/ngtcp2/lib/includes"
  path currentSourcePath.parentDir / "build/lib/includes"
  path currentSourcePath.parentDir / "libs/ngtcp2/crypto/includes"
  path currentSourcePath.parentDir / "libs/aws-lc/include"
  rename FILE, CFile # Rename `FILE` that STB uses to `CFile` which is the Nim equivalent
  "ngtcp2/ngtcp2.h" 
  "ngtcp2/ngtcp2_crypto_boringssl.h"
  "openssl/ssl.h"
