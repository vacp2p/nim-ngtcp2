# C include directories

import os
import strformat

const root = currentSourcePath.parentDir
const sourceInclude = root/"sources"/"lib"/"includes"
const buildInclude = root/"build"/"lib"/"includes"

{.passC: fmt"-I{sourceInclude} -I{buildInclude}".}
