import futhark, strutils
from os import parentDir, `/`

importc:
    outputPath currentSourcePath.parentDir / "picotls_openssl.nim"
    path currentSourcePath.parentDir/"libs"/"picotls"/"include"
    "picotls/openssl.h"

