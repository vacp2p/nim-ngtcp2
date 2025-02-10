import futhark, strformat
from os import parentDir, `/`

importc:
    outputPath currentSourcePath.parentDir / "ngtcp2_crypto_picotls.nim"
    path currentSourcePath.parentDir/"libs"/"picotls"/"include"
    path currentSourcePath.parentDir/"libs/ngtcp2/crypto/includes/ngtcp2"
    path currentSourcePath.parentDir/"libs/ngtcp2/lib/includes"
    path currentSourcePath.parentDir/"build/lib/includes"
    "ngtcp2_crypto_picotls.h"
