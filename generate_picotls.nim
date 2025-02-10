import futhark, strutils
from os import parentDir, `/`

importc:
    outputPath currentSourcePath.parentDir / "picotls.nim"
    path currentSourcePath.parentDir/"libs"/"picotls"/"include"
    "picotls.h"

