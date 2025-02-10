import futhark, strformat
from os import parentDir, `/`

importc:
    outputPath currentSourcePath.parentDir / "tmp_ngtcp2.nim"
    path currentSourcePath.parentDir/"libs/ngtcp2/lib/includes"
    path currentSourcePath.parentDir/"build/lib/includes"
    "ngtcp2/ngtcp2.h"
