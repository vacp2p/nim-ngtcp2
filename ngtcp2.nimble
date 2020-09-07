packageName = "ngtcp2"
version = "0.1.0"
author = "Status Research & Development GmbH"
description = "Nim wrapper around the ngtcp2 library"
license = "MIT"

requires "nim >= 1.2.6"
requires "nimterop >= 0.6.11 & < 0.7.0"

import os

after install:
  exec "nim c -r " & currentSourcePath.parentDir/"ngtcp2"/"make.nim"
