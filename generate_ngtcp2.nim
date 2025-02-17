import futhark, strformat
from os import parentDir, `/`

importc:
    outputPath currentSourcePath.parentDir / "tmp_ngtcp2.nim"
    path currentSourcePath.parentDir/"libs/ngtcp2/lib/includes"
    path currentSourcePath.parentDir/"build/lib/includes"
    path currentSourcePath.parentDir/"libs/ngtcp2/crypto/includes/"
    path currentSourcePath.parentDir/"libs"/"picotls"/"include"
    "ngtcp2/ngtcp2.h"
    "ngtcp2/ngtcp2_crypto.h"
    "picotls.h"
    "picotls/openssl.h"
    "ngtcp2/ngtcp2_crypto_picotls.h"
    "utils/cred_buffer.h"
    "utils/pem_utils.h"