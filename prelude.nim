import os
import strformat

# Socket definitions
import nativesockets

when defined(windows):
  {.passl: "-lws2_32".}
  {.passc: "-D_WINDOWS".}
else:
  {.passc: "-DHAVE_UNISTD_H".}

when defined(macosx):
  {.passl: "-L/opt/homebrew/opt/openssl@3/lib -lcrypto".}
else:
  {.passl: "-lcrypto".}

const root = currentSourcePath.parentDir
const libIncludes          = root/"build"/"lib"/"includes"
const ngtcp2Crypto         = root/"libs"/"ngtcp2"/"crypto"
const ngtcp2CryptoIncludes = root/"libs"/"ngtcp2"/"crypto"/"includes"
const ngtcp2Lib            = root/"libs"/"ngtcp2"/"lib"
const ngtcp2LibIncludes    = root/"libs"/"ngtcp2"/"lib"/"includes"
const picotlsInclude       = root/"libs"/"picotls"/"include"

{.passc: fmt"-I{libIncludes}".}
{.passc: fmt"-I{ngtcp2Crypto}".}
{.passc: fmt"-I{ngtcp2CryptoIncludes}".}
{.passc: fmt"-I{ngtcp2Lib}".}
{.passc: fmt"-I{ngtcp2LibIncludes}".}
{.passc: fmt"-I{picotlsInclude}".}

