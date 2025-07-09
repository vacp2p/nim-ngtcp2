packageName = "ngtcp2"
version = "0.37.0"
author = "Status Research & Development GmbH"
description = "Nim wrapper around the ngtcp2 library"
license = "MIT"
installDirs = @["libs", "build"]
installFiles = @["ngtcp2.nim"]

requires "nim >= 1.6.0"

template build() =
  when defined(windows):
    exec "./build_libs.sh"
  else:
    let targetCpu = getEnv("TARGET_CPU", hostCPU)
    if targetCpu == "i386":
      exec "./build_libs.sh --i386"
    else:
      exec "./build_libs.sh"

before install:
  build()

task format, "Format nim code using nph":
  exec "nimble install nph"
  exec "nph ."

task test, "Run tests":
  build()
  when defined(windows):
    exec "nim c -d:nimDebugDlOpen -r --threads:on tests/testNgtcp2.nim"
  else:
    exec "nim c -r --threads:on tests/testNgtcp2.nim"
