import os
import nimterop/cimport
import ngtcp2/sources

static:
  cCompile(ngtcp2src/"lib"/"*.c")

when defined(windows):
  const socketheader = "<winsock2.h>"
else:
  const socketheader = "<sys/socket.h>"

type
  sockaddr
    {.header: socketheader, importc: "sockaddr".} = object
  sockaddr_storage
    {.header: socketheader, importc: "sockaddr_storage".} = object

cIncludeDir(ngtcp2src/"lib"/"includes")
cImport(ngtcp2src/"lib"/"includes"/"ngtcp2"/"ngtcp2.h")
