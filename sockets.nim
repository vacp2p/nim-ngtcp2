# Import socket definitions from system

when defined(windows):
  {.passL: "-lws2_32".}
  const socketheader = "<winsock2.h>"
else:
  const socketheader = "<sys/socket.h>"

type
  sockaddr*
    {.header: socketheader, importc: "sockaddr".} = object
  sockaddr_storage*
    {.header: socketheader, importc: "sockaddr_storage".} = object
