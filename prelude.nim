import os
import strformat
import ngtcp2/sockets

# Socket definitions
export sockets

# C include directories
const root = currentSourcePath.parentDir
const sourceInclude = root/"sources"/"lib"/"includes"
const buildInclude = root/"build"/"lib"/"includes"

{.passC: fmt"-I{sourceInclude} -I{buildInclude}".}
