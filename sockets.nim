# Import socket definitions from system
import nativesockets
export Port

when defined(windows):
  {.passL: "-lws2_32".}
  {.
    pragma: import_in_addr,
    importc: "struct in_addr",
    header: "<winsock2.h>"
  .}
  {.
    pragma: import_in6_addr,
    importc: "struct in6_addr",
    header: "<in6addr.h>"
  .}
  {.
    pragma: import_sockaddr,
    importc: "struct sockaddr",
    header: "<ws2tcpip.h>"
  .}
  {.
    pragma: import_sockaddr_in,
    importc: "struct sockaddr_in",
    header: "<ws2tcpip.h>"
  .}
  {.
    pragma: import_sockaddr_in6,
    importc: "struct sockaddr_in6",
    header: "<ws2tcpip.h>"
  .}
  {.
    pragma: import_sockaddr_storage,
    importc: "struct sockaddr_storage",
    header: "<ws2tcpip.h>"
  .}
else:
  {.
    pragma: import_in_addr,
    importc: "struct in_addr",
    header: "<netinet/in.h>"
  .}
  {.
    pragma: import_in6_addr,
    importc: "struct in6_addr",
    header: "<netinet/in.h>"
  .}
  {.
    pragma: import_sockaddr
    importc: "struct sockaddr",
    header: "<sys/socket.h>"
  .}
  {.
    pragma: import_sockaddr_in,
    importc: "struct sockaddr_in",
    header: "<netinet/in.h>"
  .}
  {.
    pragma: import_sockaddr_in6,
    importc: "struct sockaddr_in6",
    header: "<netinet/in.h>"
  .}
  {.
    pragma: import_sockaddr_storage,
    importc: "struct sockaddr_storage",
    header: "<sys/socket.h>"
  .}

type
  AddressFamily* {.size: sizeof(uint16).} = enum
    AF_INET = nativesockets.AF_INET
    AF_INET6 = nativesockets.AF_INET6
  in_addr* {.import_in_addr.} = object
    s_addr*: uint32
  in6_addr* {.import_in6_addr.} = object
    s6_addr*: array[16, uint8]
  sockaddr_storage* {.import_sockaddr_storage.} = object
  sockaddr_in* {.import_sockaddr_in.} = object
    sin_family*: AddressFamily
    sin_port*: Port
    sin_addr*: in_addr
    sin_zero*: array[8, char]
  sockaddr_in6* {.import_sockaddr_in6.} = object
    sin6_family*: AddressFamily
    sin6_port*: Port
    sin6_flowinfo*: uint32
    sin6_address*: in6_addr
    sin6_scopy_id*: uint32
  sockaddr* {.import_sockaddr.} = object
    sa_family*: AddressFamily
    sa_data*: array[14, char]
  SocketAddress* {.union.} = object
    address*: sockaddr
    ipv4*: sockaddr_in
    ipv6*: sockaddr_in6
    storage*: sockaddr_storage
