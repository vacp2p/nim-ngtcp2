packageName = "ngtcp2"
version = "0.39.0"
author = "Status Research & Development GmbH"
description = "Nim wrapper around the ngtcp2 library"
license = "MIT"
installDirs = @["libs", "build"]
installFiles = @["ngtcp2.nim", "awslc.nim"]

requires "nim >= 2.0.0"

task format, "Format nim code using nph":
  exec "nimble install nph"
  exec "nph ."

task test, "Run tests":
  when defined(windows):
    exec "nim cpp -d:nimDebugDlOpen -r --threads:on tests/testNgtcp2.nim"
  else:
    exec "nim cpp -r --threads:on tests/testNgtcp2.nim"
