import os
import strformat

# Socket definitions
import nativesockets

when defined(windows):
  {.passL: "-lws2_32".}

# C include directories
const root = currentSourcePath.parentDir
const sourceInclude = root/"sources"/"lib"/"includes"
const buildInclude = root/"build"/"lib"/"includes"

{.passC: fmt"-I{sourceInclude} -I{buildInclude}".}
