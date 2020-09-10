# C include directories

import os
import strformat

const root = currentSourcePath.parentDir
const sourceInclude = root/"sources"/"lib"/"includes"
const buildInclude = root/"build"/"lib"/"includes"

{.passC: fmt"-I{sourceInclude} -I{buildInclude}".}

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

# Generated @ 2020-09-10T16:49:03+02:00
# Command line:
#   /home/user/.nimble/pkgs/nimterop-0.6.11/nimterop/toast --compile=./sources/lib/ngtcp2_acktr.c --compile=./sources/lib/ngtcp2_addr.c --compile=./sources/lib/ngtcp2_buf.c --compile=./sources/lib/ngtcp2_cc.c --compile=./sources/lib/ngtcp2_cid.c --compile=./sources/lib/ngtcp2_conn.c --compile=./sources/lib/ngtcp2_conv.c --compile=./sources/lib/ngtcp2_crypto.c --compile=./sources/lib/ngtcp2_err.c --compile=./sources/lib/ngtcp2_gaptr.c --compile=./sources/lib/ngtcp2_idtr.c --compile=./sources/lib/ngtcp2_ksl.c --compile=./sources/lib/ngtcp2_log.c --compile=./sources/lib/ngtcp2_map.c --compile=./sources/lib/ngtcp2_mem.c --compile=./sources/lib/ngtcp2_path.c --compile=./sources/lib/ngtcp2_pkt.c --compile=./sources/lib/ngtcp2_ppe.c --compile=./sources/lib/ngtcp2_pq.c --compile=./sources/lib/ngtcp2_pv.c --compile=./sources/lib/ngtcp2_qlog.c --compile=./sources/lib/ngtcp2_range.c --compile=./sources/lib/ngtcp2_ringbuf.c --compile=./sources/lib/ngtcp2_rob.c --compile=./sources/lib/ngtcp2_rst.c --compile=./sources/lib/ngtcp2_rtb.c --compile=./sources/lib/ngtcp2_str.c --compile=./sources/lib/ngtcp2_strm.c --compile=./sources/lib/ngtcp2_vec.c --compile=./sources/lib/ngtcp2_version.c --pnim --preprocess --noHeader --defines=NGTCP2_STATICLIB --includeDirs=./sources/lib/includes --includeDirs=./build/lib/includes ./sources/lib/includes/ngtcp2/ngtcp2.h

# const 'NGTCP2_PROTO_VER_MAX' has unsupported value 'NGTCP2_PROTO_VER'
# const 'NGTCP2_INITIAL_SALT' has unsupported value '"\xaf\xbf\xec\x28\x99\x93\xd2\x4c\x9e\x97\x86\xf1\x9c\x61\x11\xe0\x43\x90" "\xa8\x99"'
{.push hint[ConvFromXtoItselfNotNeeded]: off.}
import macros

macro defineEnum(typ: untyped): untyped =
  result = newNimNode(nnkStmtList)

  # Enum mapped to distinct cint
  result.add quote do:
    type `typ`* = distinct cint

  for i in ["+", "-", "*", "div", "mod", "shl", "shr", "or", "and", "xor", "<", "<=", "==", ">", ">="]:
    let
      ni = newIdentNode(i)
      typout = if i[0] in "<=>": newIdentNode("bool") else: typ # comparisons return bool
    if i[0] == '>': # cannot borrow `>` and `>=` from templates
      let
        nopp = if i.len == 2: newIdentNode("<=") else: newIdentNode("<")
      result.add quote do:
        proc `ni`*(x: `typ`, y: cint): `typout` = `nopp`(y, x)
        proc `ni`*(x: cint, y: `typ`): `typout` = `nopp`(y, x)
        proc `ni`*(x, y: `typ`): `typout` = `nopp`(y, x)
    else:
      result.add quote do:
        proc `ni`*(x: `typ`, y: cint): `typout` {.borrow.}
        proc `ni`*(x: cint, y: `typ`): `typout` {.borrow.}
        proc `ni`*(x, y: `typ`): `typout` {.borrow.}
    result.add quote do:
      proc `ni`*(x: `typ`, y: int): `typout` = `ni`(x, y.cint)
      proc `ni`*(x: int, y: `typ`): `typout` = `ni`(x.cint, y)

  let
    divop = newIdentNode("/")   # `/`()
    dlrop = newIdentNode("$")   # `$`()
    notop = newIdentNode("not") # `not`()
  result.add quote do:
    proc `divop`*(x, y: `typ`): `typ` = `typ`((x.float / y.float).cint)
    proc `divop`*(x: `typ`, y: cint): `typ` = `divop`(x, `typ`(y))
    proc `divop`*(x: cint, y: `typ`): `typ` = `divop`(`typ`(x), y)
    proc `divop`*(x: `typ`, y: int): `typ` = `divop`(x, y.cint)
    proc `divop`*(x: int, y: `typ`): `typ` = `divop`(x.cint, y)

    proc `dlrop`*(x: `typ`): string {.borrow.}
    proc `notop`*(x: `typ`): `typ` {.borrow.}


{.experimental: "codeReordering".}
{.passC: "-DNGTCP2_STATICLIB".}
{.passC: "-I./sources/lib/includes".}
{.passC: "-I./build/lib/includes".}
{.compile: "./sources/lib/ngtcp2_acktr.c".}
{.compile: "./sources/lib/ngtcp2_addr.c".}
{.compile: "./sources/lib/ngtcp2_buf.c".}
{.compile: "./sources/lib/ngtcp2_cc.c".}
{.compile: "./sources/lib/ngtcp2_cid.c".}
{.compile: "./sources/lib/ngtcp2_conn.c".}
{.compile: "./sources/lib/ngtcp2_conv.c".}
{.compile: "./sources/lib/ngtcp2_crypto.c".}
{.compile: "./sources/lib/ngtcp2_err.c".}
{.compile: "./sources/lib/ngtcp2_gaptr.c".}
{.compile: "./sources/lib/ngtcp2_idtr.c".}
{.compile: "./sources/lib/ngtcp2_ksl.c".}
{.compile: "./sources/lib/ngtcp2_log.c".}
{.compile: "./sources/lib/ngtcp2_map.c".}
{.compile: "./sources/lib/ngtcp2_mem.c".}
{.compile: "./sources/lib/ngtcp2_path.c".}
{.compile: "./sources/lib/ngtcp2_pkt.c".}
{.compile: "./sources/lib/ngtcp2_ppe.c".}
{.compile: "./sources/lib/ngtcp2_pq.c".}
{.compile: "./sources/lib/ngtcp2_pv.c".}
{.compile: "./sources/lib/ngtcp2_qlog.c".}
{.compile: "./sources/lib/ngtcp2_range.c".}
{.compile: "./sources/lib/ngtcp2_ringbuf.c".}
{.compile: "./sources/lib/ngtcp2_rob.c".}
{.compile: "./sources/lib/ngtcp2_rst.c".}
{.compile: "./sources/lib/ngtcp2_rtb.c".}
{.compile: "./sources/lib/ngtcp2_str.c".}
{.compile: "./sources/lib/ngtcp2_strm.c".}
{.compile: "./sources/lib/ngtcp2_vec.c".}
{.compile: "./sources/lib/ngtcp2_version.c".}
defineEnum(ngtcp2_ecn)
defineEnum(ngtcp2_lib_error)
defineEnum(ngtcp2_pkt_flag)
defineEnum(ngtcp2_pkt_type)
defineEnum(ngtcp2_path_validation_result)
defineEnum(ngtcp2_transport_param_id)
defineEnum(ngtcp2_transport_params_type)
defineEnum(ngtcp2_rand_usage)
defineEnum(ngtcp2_pktns_id)
defineEnum(ngtcp2_cc_algo)
defineEnum(ngtcp2_cc_event_type)
defineEnum(ngtcp2_qlog_write_flag) ## ```
                                  ##   @enum
                                  ##   
                                  ##    :type:ngtcp2_qlog_write_flag defines the set of flags passed to
                                  ##    :type:ngtcp2_qlog_write callback.
                                  ## ```
defineEnum(ngtcp2_crypto_level)
defineEnum(ngtcp2_stream_data_flag) ## ```
                                   ##   @enum
                                   ##   
                                   ##    ngtcp2_stream_data_flag defines the properties of the data emitted
                                   ##    via :type:ngtcp2_recv_stream_data callback function.
                                   ## ```
defineEnum(ngtcp2_connection_id_status_type)
defineEnum(ngtcp2_write_stream_flag) ## ```
                                    ##   @enum
                                    ##   
                                    ##    ngtcp2_write_stream_flag defines extra behaviour for
                                    ##    ngtcp2_conn_writev_stream().
                                    ## ```
defineEnum(ngtcp2_connection_close_error_code_type)
defineEnum(ngtcp2_log_event)
const
  NGTCP2_PROTO_VER* = 0xFF00001D'u
  NGTCP2_MAX_PKTLEN_IPV4* = 1252
  NGTCP2_MAX_PKTLEN_IPV6* = 1232
  NGTCP2_MIN_INITIAL_PKTLEN* = 1200
  NGTCP2_DEFAULT_MAX_PKTLEN* = 1200
  NGTCP2_STATELESS_RESET_TOKENLEN* = 16
  NGTCP2_MIN_STATELESS_RESET_RANDLEN* = 5
  NGTCP2_RETRY_KEY* = "ÌÎ\x18~Ðš\tÐW(\x15Zl¹ká"
  NGTCP2_RETRY_NONCE* = "åI0ù\x7F!6ðS\nŒ\x1C"
  NGTCP2_HP_MASKLEN* = 5
  NGTCP2_HP_SAMPLELEN* = 16
  NGTCP2_SECONDS* = (cast[uint64](1000000000'u64))
  NGTCP2_MILLISECONDS* = (cast[uint64](1000000'u64))
  NGTCP2_MICROSECONDS* = (cast[uint64](1000'u64))
  NGTCP2_NANOSECONDS* = (cast[uint64](1'u64))
  NGTCP2_DEFAULT_INITIAL_RTT* = (333 * typeof(333)(NGTCP2_MILLISECONDS))
  NGTCP2_ECN_NOT_ECT* = (0x00000000).ngtcp2_ecn
  NGTCP2_ECN_ECT_1* = (0x00000001).ngtcp2_ecn
  NGTCP2_ECN_ECT_0* = (0x00000002).ngtcp2_ecn
  NGTCP2_ECN_CE* = (0x00000003).ngtcp2_ecn
  NGTCP2_ECN_MASK* = (0x00000003).ngtcp2_ecn
  NGTCP2_ERR_INVALID_ARGUMENT* = (-201).ngtcp2_lib_error
  NGTCP2_ERR_NOBUF* = (-203).ngtcp2_lib_error
  NGTCP2_ERR_PROTO* = (-205).ngtcp2_lib_error
  NGTCP2_ERR_INVALID_STATE* = (-206).ngtcp2_lib_error
  NGTCP2_ERR_ACK_FRAME* = (-207).ngtcp2_lib_error
  NGTCP2_ERR_STREAM_ID_BLOCKED* = (-208).ngtcp2_lib_error
  NGTCP2_ERR_STREAM_IN_USE* = (-209).ngtcp2_lib_error
  NGTCP2_ERR_STREAM_DATA_BLOCKED* = (-210).ngtcp2_lib_error
  NGTCP2_ERR_FLOW_CONTROL* = (-211).ngtcp2_lib_error
  NGTCP2_ERR_CONNECTION_ID_LIMIT* = (-212).ngtcp2_lib_error
  NGTCP2_ERR_STREAM_LIMIT* = (-213).ngtcp2_lib_error
  NGTCP2_ERR_FINAL_SIZE* = (-214).ngtcp2_lib_error
  NGTCP2_ERR_CRYPTO* = (-215).ngtcp2_lib_error
  NGTCP2_ERR_PKT_NUM_EXHAUSTED* = (-216).ngtcp2_lib_error
  NGTCP2_ERR_REQUIRED_TRANSPORT_PARAM* = (-217).ngtcp2_lib_error
  NGTCP2_ERR_MALFORMED_TRANSPORT_PARAM* = (-218).ngtcp2_lib_error
  NGTCP2_ERR_FRAME_ENCODING* = (-219).ngtcp2_lib_error
  NGTCP2_ERR_TLS_DECRYPT* = (-220).ngtcp2_lib_error
  NGTCP2_ERR_STREAM_SHUT_WR* = (-221).ngtcp2_lib_error
  NGTCP2_ERR_STREAM_NOT_FOUND* = (-222).ngtcp2_lib_error
  NGTCP2_ERR_STREAM_STATE* = (-226).ngtcp2_lib_error
  NGTCP2_ERR_RECV_VERSION_NEGOTIATION* = (-229).ngtcp2_lib_error
  NGTCP2_ERR_CLOSING* = (-230).ngtcp2_lib_error
  NGTCP2_ERR_DRAINING* = (-231).ngtcp2_lib_error
  NGTCP2_ERR_TRANSPORT_PARAM* = (-234).ngtcp2_lib_error
  NGTCP2_ERR_DISCARD_PKT* = (-235).ngtcp2_lib_error
  NGTCP2_ERR_PATH_VALIDATION_FAILED* = (-236).ngtcp2_lib_error
  NGTCP2_ERR_CONN_ID_BLOCKED* = (-237).ngtcp2_lib_error
  NGTCP2_ERR_INTERNAL* = (-238).ngtcp2_lib_error
  NGTCP2_ERR_CRYPTO_BUFFER_EXCEEDED* = (-239).ngtcp2_lib_error
  NGTCP2_ERR_WRITE_MORE* = (-240).ngtcp2_lib_error
  NGTCP2_ERR_RETRY* = (-241).ngtcp2_lib_error
  NGTCP2_ERR_DROP_CONN* = (-242).ngtcp2_lib_error
  NGTCP2_ERR_FATAL* = (-500).ngtcp2_lib_error
  NGTCP2_ERR_NOMEM* = (-501).ngtcp2_lib_error
  NGTCP2_ERR_CALLBACK_FAILURE* = (-502).ngtcp2_lib_error
  NGTCP2_PKT_FLAG_NONE* = (0).ngtcp2_pkt_flag
  NGTCP2_PKT_FLAG_LONG_FORM* = (0x00000001).ngtcp2_pkt_flag
  NGTCP2_PKT_FLAG_KEY_PHASE* = (0x00000004).ngtcp2_pkt_flag
  NGTCP2_PKT_VERSION_NEGOTIATION* = (0x000000F0).ngtcp2_pkt_type ## ```
                                                              ##   NGTCP2_PKT_VERSION_NEGOTIATION is defined by libngtcp2 for
                                                              ##        convenience.
                                                              ## ```
  NGTCP2_PKT_INITIAL* = (0x00000000).ngtcp2_pkt_type
  NGTCP2_PKT_0RTT* = (0x00000001).ngtcp2_pkt_type
  NGTCP2_PKT_HANDSHAKE* = (0x00000002).ngtcp2_pkt_type
  NGTCP2_PKT_RETRY* = (0x00000003).ngtcp2_pkt_type ## ```
                                                ##   NGTCP2_PKT_SHORT is defined by libngtcp2 for convenience.
                                                ## ```
  NGTCP2_PKT_SHORT* = (0x00000070).ngtcp2_pkt_type ## ```
                                                ##   NGTCP2_PKT_SHORT is defined by libngtcp2 for convenience.
                                                ## ```
  NGTCP2_NO_ERROR* = 0x00000000'u
  NGTCP2_INTERNAL_ERROR* = 0x00000001'u
  NGTCP2_CONNECTION_REFUSED* = 0x00000002'u
  NGTCP2_FLOW_CONTROL_ERROR* = 0x00000003'u
  NGTCP2_STREAM_LIMIT_ERROR* = 0x00000004'u
  NGTCP2_STREAM_STATE_ERROR* = 0x00000005'u
  NGTCP2_FINAL_SIZE_ERROR* = 0x00000006'u
  NGTCP2_FRAME_ENCODING_ERROR* = 0x00000007'u
  NGTCP2_TRANSPORT_PARAMETER_ERROR* = 0x00000008'u
  NGTCP2_CONNECTION_ID_LIMIT_ERROR* = 0x00000009'u
  NGTCP2_PROTOCOL_VIOLATION* = 0x0000000A'u
  NGTCP2_INVALID_TOKEN* = 0x0000000B'u
  NGTCP2_APPLICATION_ERROR* = 0x0000000C'u
  NGTCP2_CRYPTO_BUFFER_EXCEEDED* = 0x0000000D'u
  NGTCP2_KEY_UPDATE_ERROR* = 0x0000000E'u
  NGTCP2_CRYPTO_ERROR* = 0x00000100'u
  NGTCP2_PATH_VALIDATION_RESULT_SUCCESS* = (0).ngtcp2_path_validation_result
  NGTCP2_PATH_VALIDATION_RESULT_FAILURE* = (
      NGTCP2_PATH_VALIDATION_RESULT_SUCCESS + 1).ngtcp2_path_validation_result
  NGTCP2_MAX_CIDLEN* = 20
  NGTCP2_MIN_CIDLEN* = 1
  NGTCP2_MIN_INITIAL_DCIDLEN* = 8
  NGTCP2_TRANSPORT_PARAM_ORIGINAL_DESTINATION_CONNECTION_ID* = (0x00000000).ngtcp2_transport_param_id
  NGTCP2_TRANSPORT_PARAM_MAX_IDLE_TIMEOUT* = (0x00000001).ngtcp2_transport_param_id
  NGTCP2_TRANSPORT_PARAM_STATELESS_RESET_TOKEN* = (0x00000002).ngtcp2_transport_param_id
  NGTCP2_TRANSPORT_PARAM_MAX_UDP_PAYLOAD_SIZE* = (0x00000003).ngtcp2_transport_param_id
  NGTCP2_TRANSPORT_PARAM_INITIAL_MAX_DATA* = (0x00000004).ngtcp2_transport_param_id
  NGTCP2_TRANSPORT_PARAM_INITIAL_MAX_STREAM_DATA_BIDI_LOCAL* = (0x00000005).ngtcp2_transport_param_id
  NGTCP2_TRANSPORT_PARAM_INITIAL_MAX_STREAM_DATA_BIDI_REMOTE* = (0x00000006).ngtcp2_transport_param_id
  NGTCP2_TRANSPORT_PARAM_INITIAL_MAX_STREAM_DATA_UNI* = (0x00000007).ngtcp2_transport_param_id
  NGTCP2_TRANSPORT_PARAM_INITIAL_MAX_STREAMS_BIDI* = (0x00000008).ngtcp2_transport_param_id
  NGTCP2_TRANSPORT_PARAM_INITIAL_MAX_STREAMS_UNI* = (0x00000009).ngtcp2_transport_param_id
  NGTCP2_TRANSPORT_PARAM_ACK_DELAY_EXPONENT* = (0x0000000A).ngtcp2_transport_param_id
  NGTCP2_TRANSPORT_PARAM_MAX_ACK_DELAY* = (0x0000000B).ngtcp2_transport_param_id
  NGTCP2_TRANSPORT_PARAM_DISABLE_ACTIVE_MIGRATION* = (0x0000000C).ngtcp2_transport_param_id
  NGTCP2_TRANSPORT_PARAM_PREFERRED_ADDRESS* = (0x0000000D).ngtcp2_transport_param_id
  NGTCP2_TRANSPORT_PARAM_ACTIVE_CONNECTION_ID_LIMIT* = (0x0000000E).ngtcp2_transport_param_id
  NGTCP2_TRANSPORT_PARAM_INITIAL_SOURCE_CONNECTION_ID* = (0x0000000F).ngtcp2_transport_param_id
  NGTCP2_TRANSPORT_PARAM_RETRY_SOURCE_CONNECTION_ID* = (0x00000010).ngtcp2_transport_param_id
  NGTCP2_TRANSPORT_PARAMS_TYPE_CLIENT_HELLO* = (0).ngtcp2_transport_params_type
  NGTCP2_TRANSPORT_PARAMS_TYPE_ENCRYPTED_EXTENSIONS* = (
      NGTCP2_TRANSPORT_PARAMS_TYPE_CLIENT_HELLO + 1).ngtcp2_transport_params_type
  NGTCP2_RAND_USAGE_NONE* = (0).ngtcp2_rand_usage ## ```
                                               ##   NGTCP2_RAND_USAGE_PATH_CHALLENGE indicates that random value is
                                               ##      used for PATH_CHALLENGE.
                                               ## ```
  NGTCP2_RAND_USAGE_PATH_CHALLENGE* = (NGTCP2_RAND_USAGE_NONE + 1).ngtcp2_rand_usage ## ```
                                                                                ##   NGTCP2_RAND_USAGE_PATH_CHALLENGE indicates that random value is
                                                                                ##      used for PATH_CHALLENGE.
                                                                                ## ```
  NGTCP2_DEFAULT_MAX_UDP_PAYLOAD_SIZE* = 65527
  NGTCP2_DEFAULT_ACK_DELAY_EXPONENT* = 3
  NGTCP2_DEFAULT_MAX_ACK_DELAY* = (25 * typeof(25)(NGTCP2_MILLISECONDS))
  NGTCP2_DEFAULT_ACTIVE_CONNECTION_ID_LIMIT* = 2
  NGTCP2_TLSEXT_QUIC_TRANSPORT_PARAMETERS* = 0x0000FFA5'u
  NGTCP2_PKTNS_ID_INITIAL* = (0).ngtcp2_pktns_id ## ```
                                              ##   NGTCP2_PKTNS_ID_INITIAL is the Initial packet number space.
                                              ## ```
  NGTCP2_PKTNS_ID_HANDSHAKE* = (NGTCP2_PKTNS_ID_INITIAL + 1).ngtcp2_pktns_id ## ```
                                                                        ##   NGTCP2_PKTNS_ID_INITIAL is the Handshake packet number space.
                                                                        ## ```
  NGTCP2_PKTNS_ID_APP* = (NGTCP2_PKTNS_ID_HANDSHAKE + 1).ngtcp2_pktns_id ## ```
                                                                    ##   NGTCP2_PKTNS_ID_INITIAL is the Application data packet number
                                                                    ##        space.
                                                                    ## ```
  NGTCP2_PKTNS_ID_MAX* = (NGTCP2_PKTNS_ID_APP + 1).ngtcp2_pktns_id ## ```
                                                              ##   NGTCP2_PKTNS_ID_MAX is defined to get the number of packet number
                                                              ##        spaces.
                                                              ## ```
  NGTCP2_CC_ALGO_RENO* = (0x00000000).ngtcp2_cc_algo
  NGTCP2_CC_ALGO_CUBIC* = (0x00000001).ngtcp2_cc_algo
  NGTCP2_CC_ALGO_CUSTOM* = (0x000000FF).ngtcp2_cc_algo
  NGTCP2_CC_EVENT_TYPE_TX_START* = (0).ngtcp2_cc_event_type ## ```
                                                         ##   NGTCP2_CC_EVENT_TX_START occurs when ack-eliciting packet is sent
                                                         ##        and no other ack-eliciting packet is present.
                                                         ## ```
  NGTCP2_QLOG_WRITE_FLAG_NONE* = (0).ngtcp2_qlog_write_flag ## ```
                                                         ##   NGTCP2_QLOG_WRITE_FLAG_FIN indicates that this is the final call
                                                         ##      to :type:ngtcp2_qlog_write in the current connection.
                                                         ## ```
  NGTCP2_QLOG_WRITE_FLAG_FIN* = (0x00000001).ngtcp2_qlog_write_flag ## ```
                                                                 ##   NGTCP2_QLOG_WRITE_FLAG_FIN indicates that this is the final call
                                                                 ##      to :type:ngtcp2_qlog_write in the current connection.
                                                                 ## ```
  NGTCP2_CRYPTO_LEVEL_INITIAL* = (0).ngtcp2_crypto_level ## ```
                                                      ##   NGTCP2_CRYPTO_LEVEL_INITIAL is Initial Keys encryption level.
                                                      ## ```
  NGTCP2_CRYPTO_LEVEL_HANDSHAKE* = (NGTCP2_CRYPTO_LEVEL_INITIAL + 1).ngtcp2_crypto_level ## ```
                                                                                    ##   NGTCP2_CRYPTO_LEVEL_HANDSHAKE is Handshake Keys encryption level.
                                                                                    ## ```
  NGTCP2_CRYPTO_LEVEL_APP* = (NGTCP2_CRYPTO_LEVEL_HANDSHAKE + 1).ngtcp2_crypto_level ## ```
                                                                                ##   NGTCP2_CRYPTO_LEVEL_APP is Application Data (1-RTT) Keys
                                                                                ##      encryption level.
                                                                                ## ```
  NGTCP2_CRYPTO_LEVEL_EARLY* = (NGTCP2_CRYPTO_LEVEL_APP + 1).ngtcp2_crypto_level ## ```
                                                                            ##   NGTCP2_CRYPTO_LEVEL_EARLY is Early Data (0-RTT) Keys encryption
                                                                            ##      level.
                                                                            ## ```
  NGTCP2_STREAM_DATA_FLAG_NONE* = (0x00000000).ngtcp2_stream_data_flag ## ```
                                                                    ##   NGTCP2_STREAM_DATA_FLAG_FIN indicates that this chunk of data is
                                                                    ##      final piece of an incoming stream.
                                                                    ## ```
  NGTCP2_STREAM_DATA_FLAG_FIN* = (0x00000001).ngtcp2_stream_data_flag ## ```
                                                                   ##   NGTCP2_STREAM_DATA_FLAG_FIN indicates that this chunk of data is
                                                                   ##      final piece of an incoming stream.
                                                                   ## ```
  NGTCP2_STREAM_DATA_FLAG_0RTT* = (0x00000002).ngtcp2_stream_data_flag ## ```
                                                                    ##   NGTCP2_STREAM_DATA_FLAG_0RTT indicates that this chunk of data
                                                                    ##      contains data received in 0RTT packet and the handshake has not
                                                                    ##      completed yet, which means that the data might be replayed.
                                                                    ## ```
  NGTCP2_CONNECTION_ID_STATUS_TYPE_ACTIVATE* = (0).ngtcp2_connection_id_status_type ## ```
                                                                                 ##   NGTCP2_CONNECTION_ID_STATUS_TYPE_ACTIVATE indicates that a local
                                                                                 ##        endpoint starts using new destination Connection ID.
                                                                                 ## ```
  NGTCP2_CONNECTION_ID_STATUS_TYPE_DEACTIVATE* = (
      NGTCP2_CONNECTION_ID_STATUS_TYPE_ACTIVATE + 1).ngtcp2_connection_id_status_type ## ```
                                                                                   ##   NGTCP2_CONNECTION_ID_STATUS_TYPE_DEACTIVATE indicates that a
                                                                                   ##        local endpoint stops using a given destination Connection ID.
                                                                                   ## ```
  NGTCP2_WRITE_STREAM_FLAG_NONE* = (0x00000000).ngtcp2_write_stream_flag ## ```
                                                                      ##   NGTCP2_WRITE_STREAM_FLAG_MORE indicates that more stream data may
                                                                      ##      come and should be coalesced into the same packet if possible.
                                                                      ## ```
  NGTCP2_WRITE_STREAM_FLAG_MORE* = (0x00000001).ngtcp2_write_stream_flag ## ```
                                                                      ##   NGTCP2_WRITE_STREAM_FLAG_MORE indicates that more stream data may
                                                                      ##      come and should be coalesced into the same packet if possible.
                                                                      ## ```
  NGTCP2_WRITE_STREAM_FLAG_FIN* = (0x00000002).ngtcp2_write_stream_flag ## ```
                                                                     ##   NGTCP2_WRITE_STREAM_FLAG_FIN indicates that the passed data is
                                                                     ##      the final part of a stream.
                                                                     ## ```
  NGTCP2_CONNECTION_CLOSE_ERROR_CODE_TYPE_TRANSPORT* = (0).ngtcp2_connection_close_error_code_type ## ```
                                                                                                ##   NGTCP2_CONNECTION_CLOSE_ERROR_CODE_TYPE_TRANSPORT indicates the
                                                                                                ##        error code is QUIC transport error code.
                                                                                                ## ```
  NGTCP2_CONNECTION_CLOSE_ERROR_CODE_TYPE_APPLICATION* = (
      NGTCP2_CONNECTION_CLOSE_ERROR_CODE_TYPE_TRANSPORT + 1).ngtcp2_connection_close_error_code_type ## ```
                                                                                                  ##   NGTCP2_CONNECTION_CLOSE_ERROR_CODE_TYPE_APPLICATION indicates the
                                                                                                  ##        error code is application error code.
                                                                                                  ## ```
  NGTCP2_VERSION_AGE* = 1
  NGTCP2_LOG_EVENT_NONE* = (0).ngtcp2_log_event ## ```
                                             ##   connection (catch-all) event
                                             ## ```
  NGTCP2_LOG_EVENT_CON* = (NGTCP2_LOG_EVENT_NONE + 1).ngtcp2_log_event ## ```
                                                                  ##   connection (catch-all) event
                                                                  ## ```
  NGTCP2_LOG_EVENT_PKT* = (NGTCP2_LOG_EVENT_CON + 1).ngtcp2_log_event ## ```
                                                                 ##   packet event
                                                                 ## ```
  NGTCP2_LOG_EVENT_FRM* = (NGTCP2_LOG_EVENT_PKT + 1).ngtcp2_log_event ## ```
                                                                 ##   frame event
                                                                 ## ```
  NGTCP2_LOG_EVENT_RCV* = (NGTCP2_LOG_EVENT_FRM + 1).ngtcp2_log_event ## ```
                                                                 ##   recovery event
                                                                 ## ```
  NGTCP2_LOG_EVENT_CRY* = (NGTCP2_LOG_EVENT_RCV + 1).ngtcp2_log_event ## ```
                                                                 ##   crypto event
                                                                 ## ```
  NGTCP2_LOG_EVENT_PTV* = (NGTCP2_LOG_EVENT_CRY + 1).ngtcp2_log_event ## ```
                                                                 ##   path validation event
                                                                 ## ```
type
  ngtcp2_ssize* = ByteAddress
  ngtcp2_malloc* = proc (size: uint; mem_user_data: pointer): pointer {.cdecl.}
  ngtcp2_free* = proc (`ptr`: pointer; mem_user_data: pointer) {.cdecl.}
  ngtcp2_calloc* = proc (nmemb: uint; size: uint; mem_user_data: pointer): pointer {.cdecl.}
  ngtcp2_realloc* = proc (`ptr`: pointer; size: uint; mem_user_data: pointer): pointer {.
      cdecl.}
  ngtcp2_mem* {.bycopy.} = object ## ```
                              ##   @struct
                              ##   
                              ##    Custom memory allocator functions and user defined pointer.  The
                              ##    |mem_user_data| member is passed to each allocator function.  This
                              ##    can be used, for example, to achieve per-session memory pool.
                              ##   
                              ##    In the following example code, my_malloc, my_free,
                              ##    my_calloc and my_realloc are the replacement of the
                              ##    standard allocators malloc, free, calloc and
                              ##    realloc respectively::
                              ##   
                              ##        voidmy_malloc_cb(size_t size, voidmem_user_data) {
                              ##          return my_malloc(size);
                              ##        }
                              ##   
                              ##        void my_free_cb(voidptr, voidmem_user_data) { my_free(ptr); }
                              ##   
                              ##        voidmy_calloc_cb(size_t nmemb, size_t size, voidmem_user_data) {
                              ##          return my_calloc(nmemb, size);
                              ##        }
                              ##   
                              ##        voidmy_realloc_cb(voidptr, size_t size, voidmem_user_data) {
                              ##          return my_realloc(ptr, size);
                              ##        }
                              ##   
                              ##        void conn_new() {
                              ##          ngtcp2_mem mem = {NULL, my_malloc_cb, my_free_cb, my_calloc_cb,
                              ##                             my_realloc_cb};
                              ##   
                              ##          ...
                              ##        }
                              ## ```
    mem_user_data*: pointer ## ```
                          ##   An arbitrary user supplied data.  This is passed to each
                          ##      allocator function.
                          ## ```
    malloc*: ngtcp2_malloc     ## ```
                         ##   Custom allocator function to replace malloc().
                         ## ```
    free*: ngtcp2_free         ## ```
                     ##   Custom allocator function to replace free().
                     ## ```
    calloc*: ngtcp2_calloc     ## ```
                         ##   Custom allocator function to replace calloc().
                         ## ```
    realloc*: ngtcp2_realloc   ## ```
                           ##   Custom allocator function to replace realloc().
                           ## ```
  
  ngtcp2_pkt_info* {.bycopy.} = object
    ecn*: uint32 ## ```
               ##   ecn is ECN marking and when passing ngtcp2_conn_read_pkt(), it
               ##      should be either :enum:NGTCP2_ECN_NOT_ECT,
               ##      :enum:NGTCP2_ECN_ECT_1, :enum:NGTCP2_ECN_ECT_0, or
               ##      :enum:NGTCP2_ECN_CE.
               ## ```
  
  ngtcp2_tstamp* = uint64 ## ```
                       ##   ngtcp2_tstamp is a timestamp with nanosecond resolution.
                       ## ```
  ngtcp2_duration* = uint64 ## ```
                         ##   ngtcp2_duration is a period of time in nanosecond resolution.
                         ## ```
  ngtcp2_cid* {.bycopy.} = object ## ```
                              ##   @struct
                              ##   
                              ##    ngtcp2_cid holds a Connection ID.
                              ## ```
    datalen*: uint
    data*: array[20, uint8]

  ngtcp2_vec* {.bycopy.} = object ## ```
                              ##   @struct
                              ##   
                              ##    ngtcp2_vec is struct iovec compatible structure to reference
                              ##    arbitrary array of bytes.
                              ## ```
    base*: ptr uint8            ## ```
                  ##   base points to the data.
                  ## ```
    len*: uint ## ```
             ##   len is the number of bytes which the buffer pointed by base
             ##        contains.
             ## ```
  
  ngtcp2_pkt_hd* {.bycopy.} = object
    dcid*: ngtcp2_cid
    scid*: ngtcp2_cid
    pkt_num*: int64
    token*: ngtcp2_vec ## ```
                     ##   pkt_numlen is the number of bytes spent to encode pkt_num.
                     ## ```
    pkt_numlen*: uint ## ```
                    ##   pkt_numlen is the number of bytes spent to encode pkt_num.
                    ## ```
    len*: uint ## ```
             ##   len is the sum of pkt_numlen and the length of QUIC packet
             ##      payload.
             ## ```
    version*: uint32
    `type`*: uint8
    flags*: uint8

  ngtcp2_pkt_stateless_reset* {.bycopy.} = object
    stateless_reset_token*: array[16, uint8]
    rand*: ptr uint8
    randlen*: uint

  ngtcp2_preferred_addr* {.bycopy.} = object
    cid*: ngtcp2_cid
    ipv4_port*: uint16
    ipv6_port*: uint16
    ipv4_addr*: array[4, uint8]
    ipv6_addr*: array[16, uint8]
    stateless_reset_token*: array[16, uint8]

  ngtcp2_transport_params* {.bycopy.} = object
    preferred_address*: ngtcp2_preferred_addr ## ```
                                            ##   original_dcid is the Destination Connection ID field from the
                                            ##        first Initial packet from client.  Server must specify this
                                            ##        field.  It is expected that application knows the original
                                            ##        Destination Connection ID even if it sends Retry packet, for
                                            ##        example, by including it in retry token.  Otherwise, application
                                            ##        should not specify this field.
                                            ## ```
    original_dcid*: ngtcp2_cid ## ```
                             ##   original_dcid is the Destination Connection ID field from the
                             ##        first Initial packet from client.  Server must specify this
                             ##        field.  It is expected that application knows the original
                             ##        Destination Connection ID even if it sends Retry packet, for
                             ##        example, by including it in retry token.  Otherwise, application
                             ##        should not specify this field.
                             ## ```
    initial_scid*: ngtcp2_cid ## ```
                            ##   initial_scid is the Source Connection ID field from the first
                            ##        Initial packet the endpoint sends.  Application should not
                            ##        specify this field.
                            ## ```
    retry_scid*: ngtcp2_cid ## ```
                          ##   retry_scid is the Source Connection ID field from Retry packet.
                          ##        Only server uses this field.  If server application received
                          ##        Initial packet with retry token from client and server verified
                          ##        its token, server application must set Destination Connection ID
                          ##        field from the Initial packet to this field and set
                          ##        retry_scid_present to nonzero.  Server application must verify
                          ##        that the Destination Connection ID from Initial packet was sent
                          ##        in Retry packet by, for example, including the Connection ID in a
                          ##        token, or including it in AAD when encrypting a token.
                          ## ```
    initial_max_stream_data_bidi_local*: uint64 ## ```
                                              ##   initial_max_stream_data_bidi_local is the size of flow control
                                              ##        window of locally initiated stream.  This is the number of bytes
                                              ##        that the remote endpoint can send and the local endpoint must
                                              ##        ensure that it has enough buffer to receive them.
                                              ## ```
    initial_max_stream_data_bidi_remote*: uint64 ## ```
                                               ##   initial_max_stream_data_bidi_remote is the size of flow control
                                               ##        window of remotely initiated stream.  This is the number of bytes
                                               ##        that the remote endpoint can send and the local endpoint must
                                               ##        ensure that it has enough buffer to receive them.
                                               ## ```
    initial_max_stream_data_uni*: uint64 ## ```
                                       ##   initial_max_stream_data_uni is the size of flow control window of
                                       ##        remotely initiated unidirectional stream.  This is the number of
                                       ##        bytes that the remote endpoint can send and the local endpoint
                                       ##        must ensure that it has enough buffer to receive them.
                                       ## ```
    initial_max_data*: uint64 ## ```
                            ##   initial_max_data is the connection level flow control window.
                            ## ```
    initial_max_streams_bidi*: uint64 ## ```
                                    ##   initial_max_streams_bidi is the number of concurrent streams that
                                    ##        the remote endpoint can create.
                                    ## ```
    initial_max_streams_uni*: uint64 ## ```
                                   ##   initial_max_streams_uni is the number of concurrent
                                   ##        unidirectional streams that the remote endpoint can create.
                                   ## ```
    max_idle_timeout*: ngtcp2_duration ## ```
                                     ##   max_idle_timeout is a duration during which sender allows
                                     ##        quiescent.
                                     ## ```
    max_udp_payload_size*: uint64 ## ```
                                ##   active_connection_id_limit is the maximum number of Connection ID
                                ##        that sender can store.
                                ## ```
    active_connection_id_limit*: uint64 ## ```
                                      ##   active_connection_id_limit is the maximum number of Connection ID
                                      ##        that sender can store.
                                      ## ```
    ack_delay_exponent*: uint64
    max_ack_delay*: ngtcp2_duration
    stateless_reset_token_present*: uint8
    disable_active_migration*: uint8
    retry_scid_present*: uint8
    preferred_address_present*: uint8
    stateless_reset_token*: array[16, uint8]

  ngtcp2_log* {.incompleteStruct.} = object
  ngtcp2_conn_stat* {.bycopy.} = object ## ```
                                    ##   @struct
                                    ##   
                                    ##    ngtcp2_conn_stat holds various connection statistics, and computed
                                    ##    data for recovery and congestion controller.
                                    ## ```
    latest_rtt*: ngtcp2_duration
    min_rtt*: ngtcp2_duration
    smoothed_rtt*: ngtcp2_duration
    rttvar*: ngtcp2_duration
    initial_rtt*: ngtcp2_duration
    pto_count*: uint
    loss_detection_timer*: ngtcp2_tstamp ## ```
                                       ##   last_tx_pkt_ts corresponds to
                                       ##        time_of_last_sent_ack_eliciting_packet in
                                       ##        draft-ietf-quic-recovery-25.
                                       ## ```
    last_tx_pkt_ts*: array[NGTCP2_PKTNS_ID_MAX, ngtcp2_tstamp] ## ```
                                                            ##   last_tx_pkt_ts corresponds to
                                                            ##        time_of_last_sent_ack_eliciting_packet in
                                                            ##        draft-ietf-quic-recovery-25.
                                                            ## ```
    loss_time*: array[NGTCP2_PKTNS_ID_MAX, ngtcp2_tstamp]
    cwnd*: uint64
    ssthresh*: uint64
    congestion_recovery_start_ts*: ngtcp2_tstamp
    bytes_in_flight*: uint64 ## ```
                           ##   max_udp_payload_size is the maximum size of UDP datagram payload
                           ##        that this endpoint transmits.  It is used by congestion
                           ##        controller to compute congestion window.
                           ## ```
    max_udp_payload_size*: uint ## ```
                              ##   max_udp_payload_size is the maximum size of UDP datagram payload
                              ##        that this endpoint transmits.  It is used by congestion
                              ##        controller to compute congestion window.
                              ## ```
    bytes_sent*: uint64 ## ```
                      ##   bytes_sent is the number of bytes sent in this particular
                      ##        connection.  It only includes data written by
                      ##        ngtcp2_conn_writev_stream() .
                      ## ```
    bytes_recv*: uint64 ## ```
                      ##   bytes_recv is the number of bytes received in this particular
                      ##        connection, including discarded packets.
                      ## ```
    delivery_rate_sec*: uint64 ## ```
                             ##   delivery_rate_sec is the current sending rate measured per
                             ##        second.
                             ## ```
    recv_rate_sec*: uint64 ## ```
                         ##   recv_rate_sec is the current receiving rate of application data
                         ##        measured in per second.
                         ## ```
  
  ngtcp2_cc_base* {.bycopy.} = object
    log*: ptr ngtcp2_log

  ngtcp2_cc_pkt* {.bycopy.} = object ## ```
                                 ##   ngtcp2_cc_pkt is a convenient structure to include acked/lost/sent
                                 ##      packet.
                                 ## ```
    pkt_num*: int64            ## ```
                  ##   pkt_num is the packet number
                  ## ```
    pktlen*: uint              ## ```
                ##   pktlen is the length of packet.
                ## ```
    pktns_id*: ngtcp2_pktns_id ## ```
                             ##   pktns_id is the ID of packet number space which this packet
                             ##        belongs to.
                             ## ```
    ts_sent*: ngtcp2_tstamp    ## ```
                          ##   ts_sent is the timestamp when packet is sent.
                          ## ```
  
  ngtcp2_cc* {.bycopy.} = object
    ccb*: ptr ngtcp2_cc_base
    on_pkt_acked*: ngtcp2_cc_on_pkt_acked
    congestion_event*: ngtcp2_cc_congestion_event
    on_persistent_congestion*: ngtcp2_cc_on_persistent_congestion
    on_ack_recv*: ngtcp2_cc_on_ack_recv
    on_pkt_sent*: ngtcp2_cc_on_pkt_sent
    new_rtt_sample*: ngtcp2_cc_new_rtt_sample
    reset*: ngtcp2_cc_reset
    event*: ngtcp2_cc_event

  ngtcp2_cc_on_pkt_acked* = proc (cc: ptr ngtcp2_cc; cstat: ptr ngtcp2_conn_stat;
                               pkt: ptr ngtcp2_cc_pkt; ts: ngtcp2_tstamp) {.cdecl.}
  ngtcp2_cc_congestion_event* = proc (cc: ptr ngtcp2_cc; cstat: ptr ngtcp2_conn_stat;
                                   ts_sent: ngtcp2_tstamp; ts: ngtcp2_tstamp) {.
      cdecl.}
  ngtcp2_cc_on_persistent_congestion* = proc (cc: ptr ngtcp2_cc;
      cstat: ptr ngtcp2_conn_stat; ts: ngtcp2_tstamp) {.cdecl.}
  ngtcp2_cc_on_ack_recv* = proc (cc: ptr ngtcp2_cc; cstat: ptr ngtcp2_conn_stat;
                              ts: ngtcp2_tstamp) {.cdecl.}
  ngtcp2_cc_on_pkt_sent* = proc (cc: ptr ngtcp2_cc; cstat: ptr ngtcp2_conn_stat;
                              pkt: ptr ngtcp2_cc_pkt) {.cdecl.}
  ngtcp2_cc_new_rtt_sample* = proc (cc: ptr ngtcp2_cc; cstat: ptr ngtcp2_conn_stat;
                                 ts: ngtcp2_tstamp) {.cdecl.}
  ngtcp2_cc_reset* = proc (cc: ptr ngtcp2_cc) {.cdecl.}
  ngtcp2_cc_event* = proc (cc: ptr ngtcp2_cc; cstat: ptr ngtcp2_conn_stat;
                        event: ngtcp2_cc_event_type; ts: ngtcp2_tstamp) {.cdecl.}
  ngtcp2_printf* = proc (user_data: pointer; format: cstring) {.cdecl, varargs.}
  ngtcp2_rand_ctx* {.bycopy.} = object ## ```
                                   ##   @struct
                                   ##   
                                   ##    ngtcp2_rand_ctx is a wrapper around native random number
                                   ##    generator.  It is opaque to the ngtcp2 library.  This might be
                                   ##    useful if application needs to specify random number generator per
                                   ##    thread or per connection.
                                   ## ```
    native_handle*: pointer

  ngtcp2_qlog_write* = proc (user_data: pointer; flags: uint32; data: pointer;
                          datalen: uint) {.cdecl.}
  ngtcp2_qlog_settings* {.bycopy.} = object
    odcid*: ngtcp2_cid ## ```
                     ##   odcid is Original Destination Connection ID sent by client.  It
                     ##        is used as group_id and ODCID fields.  Client ignores this field
                     ##        and uses dcid parameter passed to ngtcp2_conn_client_new().
                     ## ```
    write*: ngtcp2_qlog_write ## ```
                            ##   write is a callback function to write qlog.  Setting NULL
                            ##        disables qlog.
                            ## ```
  
  ngtcp2_settings* {.bycopy.} = object
    transport_params*: ngtcp2_transport_params ## ```
                                             ##   transport_params is the QUIC transport parameters to send.
                                             ## ```
    qlog*: ngtcp2_qlog_settings
    cc_algo*: ngtcp2_cc_algo
    cc*: ptr ngtcp2_cc ## ```
                    ##   initial_ts is an initial timestamp given to the library.
                    ## ```
    initial_ts*: ngtcp2_tstamp ## ```
                             ##   initial_ts is an initial timestamp given to the library.
                             ## ```
    initial_rtt*: ngtcp2_duration ## ```
                                ##   initial_rtt is an initial RTT.
                                ## ```
    log_printf*: ngtcp2_printf ## ```
                             ##   log_printf is a function that the library uses to write logs.
                             ##        NULL means no logging output.
                             ## ```
    max_udp_payload_size*: uint ## ```
                              ##   max_udp_payload_size is the maximum size of UDP datagram payload
                              ##        that this endpoint transmits.  It is used by congestion
                              ##        controller to compute congestion window.  If it is set to 0, it
                              ##        defaults to NGTCP2_DEFAULT_MAX_PKTLEN.
                              ## ```
    token*: ngtcp2_vec ## ```
                     ##   token is a token from Retry packet or NEW_TOKEN frame.
                     ##     
                     ##      Server sets this field if it received the token in Client Initial
                     ##      packet and successfully validated.
                     ##     
                     ##      Client sets this field if it intends to send token in its Initial
                     ##      packet.
                     ##     
                     ##      ngtcp2_conn_server_new and ngtcp2_conn_client_new make a copy
                     ##      of token.
                     ## ```
    rand_ctx*: ngtcp2_rand_ctx ## ```
                             ##   rand_ctx is an optional random number generator to be passed to
                             ##      :type:ngtcp2_rand callback.
                             ## ```
  
  ngtcp2_addr* {.bycopy.} = object ## ```
                               ##   @struct
                               ##   
                               ##    ngtcp2_addr is the endpoint address.
                               ## ```
    addrlen*: uint             ## ```
                 ##   addrlen is the length of addr.
                 ## ```
    `addr`*: ptr sockaddr ## ```
                       ##   addr points to the buffer which contains endpoint address.  It
                       ##        must not be NULL.
                       ## ```
    user_data*: pointer ## ```
                      ##   user_data is an arbitrary data and opaque to the library.
                      ## ```
  
  ngtcp2_path* {.bycopy.} = object ## ```
                               ##   @struct
                               ##   
                               ##    ngtcp2_path is the network endpoints where a packet is sent and
                               ##    received.
                               ## ```
    local*: ngtcp2_addr        ## ```
                      ##   local is the address of local endpoint.
                      ## ```
    remote*: ngtcp2_addr       ## ```
                       ##   remote is the address of remote endpoint.
                       ## ```
  
  ngtcp2_path_storage* {.bycopy.} = object ## ```
                                       ##   @struct
                                       ##   
                                       ##    ngtcp2_path_storage is a convenient struct to have buffers to store
                                       ##    the longest addresses.
                                       ## ```
    local_addrbuf*: sockaddr_storage
    remote_addrbuf*: sockaddr_storage
    path*: ngtcp2_path

  ngtcp2_crypto_md* {.bycopy.} = object ## ```
                                    ##   @struct
                                    ##   
                                    ##    ngtcp2_crypto_md is a wrapper around native message digest
                                    ##    object.
                                    ##   
                                    ##    If libngtcp2_crypto_openssl is linked, native_handle must be a
                                    ##    pointer to EVP_MD.
                                    ## ```
    native_handle*: pointer

  ngtcp2_crypto_aead* {.bycopy.} = object ## ```
                                      ##   @struct
                                      ##   
                                      ##    ngtcp2_crypto_aead is a wrapper around native AEAD object.
                                      ##   
                                      ##    If libngtcp2_crypto_openssl is linked, native_handle must be a
                                      ##    pointer to EVP_CIPHER.
                                      ## ```
    native_handle*: pointer

  ngtcp2_crypto_cipher* {.bycopy.} = object ## ```
                                        ##   @struct
                                        ##   
                                        ##    ngtcp2_crypto_cipher is a wrapper around native cipher object.
                                        ##   
                                        ##    If libngtcp2_crypto_openssl is linked, native_handle must be a
                                        ##    pointer to EVP_CIPHER.
                                        ## ```
    native_handle*: pointer

  ngtcp2_crypto_aead_ctx* {.bycopy.} = object ## ```
                                          ##   @struct
                                          ##   
                                          ##    ngtcp2_crypto_aead_ctx is a wrapper around native AEAD cipher
                                          ##    context object.  It should be initialized with a specific key.
                                          ##    ngtcp2 library reuses this context object to encrypt or decrypt
                                          ##    multiple packets.
                                          ## ```
    native_handle*: pointer

  ngtcp2_crypto_cipher_ctx* {.bycopy.} = object ## ```
                                            ##   @struct
                                            ##   
                                            ##    ngtcp2_crypto_cipher_ctx is a wrapper around native cipher
                                            ##    context object.  It should be initialized with a specific key.
                                            ##    ngtcp2 library reuses this context object to encrypt or decrypt
                                            ##    multiple packet headers.
                                            ## ```
    native_handle*: pointer

  ngtcp2_crypto_ctx* {.bycopy.} = object ## ```
                                     ##   @function
                                     ##   
                                     ##    ngtcp2_crypto_ctx is a convenient structure to bind all crypto
                                     ##    related objects in one place.  Use ngtcp2_crypto_ctx_initial to
                                     ##    initialize this struct for Initial packet encryption.  For
                                     ##    Handshake and Shortpackets, use ngtcp2_crypto_ctx_tls.
                                     ## ```
    aead*: ngtcp2_crypto_aead
    md*: ngtcp2_crypto_md
    hp*: ngtcp2_crypto_cipher ## ```
                            ##   max_encryption is the number of encryption which this key can be
                            ##        used with.
                            ## ```
    max_encryption*: uint64 ## ```
                          ##   max_encryption is the number of encryption which this key can be
                          ##        used with.
                          ## ```
    max_decryption_failure*: uint64 ## ```
                                  ##   max_decryption_failure is the number of decryption failure with
                                  ##        this key.
                                  ## ```
  
  ngtcp2_conn* {.incompleteStruct.} = object
  ngtcp2_client_initial* = proc (conn: ptr ngtcp2_conn; user_data: pointer): cint {.cdecl.}
  ngtcp2_recv_client_initial* = proc (conn: ptr ngtcp2_conn; dcid: ptr ngtcp2_cid;
                                   user_data: pointer): cint {.cdecl.}
  ngtcp2_recv_crypto_data* = proc (conn: ptr ngtcp2_conn;
                                crypto_level: ngtcp2_crypto_level; offset: uint64;
                                data: ptr uint8; datalen: uint; user_data: pointer): cint {.
      cdecl.}
  ngtcp2_handshake_completed* = proc (conn: ptr ngtcp2_conn; user_data: pointer): cint {.
      cdecl.}
  ngtcp2_handshake_confirmed* = proc (conn: ptr ngtcp2_conn; user_data: pointer): cint {.
      cdecl.}
  ngtcp2_recv_version_negotiation* = proc (conn: ptr ngtcp2_conn;
                                        hd: ptr ngtcp2_pkt_hd; sv: ptr uint32;
                                        nsv: uint; user_data: pointer): cint {.cdecl.}
  ngtcp2_recv_retry* = proc (conn: ptr ngtcp2_conn; hd: ptr ngtcp2_pkt_hd;
                          user_data: pointer): cint {.cdecl.}
  ngtcp2_encrypt* = proc (dest: ptr uint8; aead: ptr ngtcp2_crypto_aead;
                       aead_ctx: ptr ngtcp2_crypto_aead_ctx; plaintext: ptr uint8;
                       plaintextlen: uint; nonce: ptr uint8; noncelen: uint;
                       ad: ptr uint8; adlen: uint): cint {.cdecl.}
  ngtcp2_decrypt* = proc (dest: ptr uint8; aead: ptr ngtcp2_crypto_aead;
                       aead_ctx: ptr ngtcp2_crypto_aead_ctx; ciphertext: ptr uint8;
                       ciphertextlen: uint; nonce: ptr uint8; noncelen: uint;
                       ad: ptr uint8; adlen: uint): cint {.cdecl.}
  ngtcp2_hp_mask* = proc (dest: ptr uint8; hp: ptr ngtcp2_crypto_cipher;
                       hp_ctx: ptr ngtcp2_crypto_cipher_ctx; sample: ptr uint8): cint {.
      cdecl.}
  ngtcp2_recv_stream_data* = proc (conn: ptr ngtcp2_conn; flags: uint32;
                                stream_id: int64; offset: uint64; data: ptr uint8;
                                datalen: uint; user_data: pointer;
                                stream_user_data: pointer): cint {.cdecl.}
  ngtcp2_stream_open* = proc (conn: ptr ngtcp2_conn; stream_id: int64;
                           user_data: pointer): cint {.cdecl.}
  ngtcp2_stream_close* = proc (conn: ptr ngtcp2_conn; stream_id: int64;
                            app_error_code: uint64; user_data: pointer;
                            stream_user_data: pointer): cint {.cdecl.}
  ngtcp2_stream_reset* = proc (conn: ptr ngtcp2_conn; stream_id: int64;
                            final_size: uint64; app_error_code: uint64;
                            user_data: pointer; stream_user_data: pointer): cint {.
      cdecl.}
  ngtcp2_acked_stream_data_offset* = proc (conn: ptr ngtcp2_conn; stream_id: int64;
                                        offset: uint64; datalen: uint64;
                                        user_data: pointer;
                                        stream_user_data: pointer): cint {.cdecl.}
  ngtcp2_acked_crypto_offset* = proc (conn: ptr ngtcp2_conn;
                                   crypto_level: ngtcp2_crypto_level;
                                   offset: uint64; datalen: uint64;
                                   user_data: pointer): cint {.cdecl.}
  ngtcp2_recv_stateless_reset* = proc (conn: ptr ngtcp2_conn;
                                    sr: ptr ngtcp2_pkt_stateless_reset;
                                    user_data: pointer): cint {.cdecl.}
  ngtcp2_extend_max_streams* = proc (conn: ptr ngtcp2_conn; max_streams: uint64;
                                  user_data: pointer): cint {.cdecl.}
  ngtcp2_extend_max_stream_data* = proc (conn: ptr ngtcp2_conn; stream_id: int64;
                                      max_data: uint64; user_data: pointer;
                                      stream_user_data: pointer): cint {.cdecl.}
  ngtcp2_rand* = proc (dest: ptr uint8; destlen: uint; rand_ctx: ptr ngtcp2_rand_ctx;
                    usage: ngtcp2_rand_usage): cint {.cdecl.}
  ngtcp2_get_new_connection_id* = proc (conn: ptr ngtcp2_conn; cid: ptr ngtcp2_cid;
                                     token: ptr uint8; cidlen: uint;
                                     user_data: pointer): cint {.cdecl.}
  ngtcp2_remove_connection_id* = proc (conn: ptr ngtcp2_conn; cid: ptr ngtcp2_cid;
                                    user_data: pointer): cint {.cdecl.}
  ngtcp2_update_key* = proc (conn: ptr ngtcp2_conn; rx_secret: ptr uint8;
                          tx_secret: ptr uint8;
                          rx_aead_ctx: ptr ngtcp2_crypto_aead_ctx;
                          rx_iv: ptr uint8;
                          tx_aead_ctx: ptr ngtcp2_crypto_aead_ctx;
                          tx_iv: ptr uint8; current_rx_secret: ptr uint8;
                          current_tx_secret: ptr uint8; secretlen: uint;
                          user_data: pointer): cint {.cdecl.}
  ngtcp2_path_validation* = proc (conn: ptr ngtcp2_conn; path: ptr ngtcp2_path;
                               res: ngtcp2_path_validation_result;
                               user_data: pointer): cint {.cdecl.}
  ngtcp2_select_preferred_addr* = proc (conn: ptr ngtcp2_conn; dest: ptr ngtcp2_addr;
                                     paddr: ptr ngtcp2_preferred_addr;
                                     user_data: pointer): cint {.cdecl.}
  ngtcp2_connection_id_status* = proc (conn: ptr ngtcp2_conn; `type`: cint; seq: uint64;
                                    cid: ptr ngtcp2_cid; token: ptr uint8;
                                    user_data: pointer): cint {.cdecl.}
  ngtcp2_recv_new_token* = proc (conn: ptr ngtcp2_conn; token: ptr ngtcp2_vec;
                              user_data: pointer): cint {.cdecl.}
  ngtcp2_delete_crypto_aead_ctx* = proc (conn: ptr ngtcp2_conn;
                                      aead_ctx: ptr ngtcp2_crypto_aead_ctx;
                                      user_data: pointer) {.cdecl.}
  ngtcp2_delete_crypto_cipher_ctx* = proc (conn: ptr ngtcp2_conn; cipher_ctx: ptr ngtcp2_crypto_cipher_ctx;
                                        user_data: pointer) {.cdecl.}
  ngtcp2_conn_callbacks* {.bycopy.} = object
    client_initial*: ngtcp2_client_initial ## ```
                                         ##   client_initial is a callback function which is invoked when
                                         ##      client asks TLS stack to produce first TLS cryptographic
                                         ##      handshake message.  This callback function must be specified.
                                         ## ```
    recv_client_initial*: ngtcp2_recv_client_initial ## ```
                                                   ##   recv_client_initial is a callback function which is invoked when
                                                   ##      a server receives the first packet from client.  This callback
                                                   ##      function must be specified.
                                                   ## ```
    recv_crypto_data*: ngtcp2_recv_crypto_data ## ```
                                             ##   recv_crypto_data is a callback function which is invoked when
                                             ##      cryptographic data (CRYPTO frame, in other words, TLS message) is
                                             ##      received.  This callback function must be specified.
                                             ## ```
    handshake_completed*: ngtcp2_handshake_completed ## ```
                                                   ##   handshake_completed is a callback function which is invoked when
                                                   ##      QUIC cryptographic handshake has completed.  This callback
                                                   ##      function is optional.
                                                   ## ```
    recv_version_negotiation*: ngtcp2_recv_version_negotiation ## ```
                                                             ##   recv_version_negotiation is a callback function which is invoked
                                                             ##      when Version Negotiation packet is received by a client.  This
                                                             ##      callback function is optional.
                                                             ## ```
    encrypt*: ngtcp2_encrypt ## ```
                           ##   encrypt is a callback function which is invoked to encrypt a QUIC
                           ##      packet.  This callback function must be specified.
                           ## ```
    decrypt*: ngtcp2_decrypt ## ```
                           ##   decrypt is a callback function which is invoked to decrypt a QUIC
                           ##      packet.  This callback function must be specified.
                           ## ```
    hp_mask*: ngtcp2_hp_mask ## ```
                           ##   hp_mask is a callback function which is invoked to get a mask to
                           ##      encrypt or decrypt packet header.  This callback function must be
                           ##      specified.
                           ## ```
    recv_stream_data*: ngtcp2_recv_stream_data ## ```
                                             ##   recv_stream_data is a callback function which is invoked when
                                             ##      STREAM data, which includes application data, is received.  This
                                             ##      callback function is optional.
                                             ## ```
    acked_crypto_offset*: ngtcp2_acked_crypto_offset ## ```
                                                   ##   acked_crypto_offset is a callback function which is invoked when
                                                   ##      CRYPTO data is acknowledged by a remote endpoint.  It tells an
                                                   ##      application the largest offset of acknowledged CRYPTO data
                                                   ##      without a gap so that the application can free memory for the
                                                   ##      data.  This callback function is optional.
                                                   ## ```
    acked_stream_data_offset*: ngtcp2_acked_stream_data_offset ## ```
                                                             ##   acked_stream_data_offset is a callback function which is invoked
                                                             ##      when STREAM data, which includes application data, is
                                                             ##      acknowledged by a remote endpoint.  It tells an application the
                                                             ##      largest offset of acknowledged STREAM data without a gap so that
                                                             ##      application can free memory for the data.  This callback function
                                                             ##      is optional.
                                                             ## ```
    stream_open*: ngtcp2_stream_open ## ```
                                   ##   stream_open is a callback function which is invoked when new
                                   ##      remote stream is opened by a remote endpoint.  This callback
                                   ##      function is optional.
                                   ## ```
    stream_close*: ngtcp2_stream_close ## ```
                                     ##   stream_close is a callback function which is invoked when a
                                     ##      stream is closed.  This callback function is optional.
                                     ## ```
    recv_stateless_reset*: ngtcp2_recv_stateless_reset ## ```
                                                     ##   recv_stateless_reset is a callback function which is invoked when
                                                     ##      Stateless Reset packet is received.  This callback function is
                                                     ##      optional.
                                                     ## ```
    recv_retry*: ngtcp2_recv_retry ## ```
                                 ##   recv_retry is a callback function which is invoked when a client
                                 ##      receives Retry packet.  For client, this callback function must
                                 ##      be specified.  Server never receive Retry packet.
                                 ## ```
    extend_max_local_streams_bidi*: ngtcp2_extend_max_streams ## ```
                                                            ##   extend_max_local_streams_bidi is a callback function which is
                                                            ##      invoked when the number of bidirectional stream which a local
                                                            ##      endpoint can open is increased.  This callback function is
                                                            ##      optional.
                                                            ## ```
    extend_max_local_streams_uni*: ngtcp2_extend_max_streams ## ```
                                                           ##   extend_max_local_streams_uni is a callback function which is
                                                           ##      invoked when the number of unidirectional stream which a local
                                                           ##      endpoint can open is increased.  This callback function is
                                                           ##      optional.
                                                           ## ```
    rand*: ngtcp2_rand ## ```
                     ##   rand is a callback function which is invoked when the library
                     ##      needs unpredictable sequence of random data.  This callback
                     ##      function must be specified.
                     ## ```
    get_new_connection_id*: ngtcp2_get_new_connection_id ## ```
                                                       ##   get_new_connection_id is a callback function which is invoked
                                                       ##      when the library needs new connection ID.  This callback function
                                                       ##      must be specified.
                                                       ## ```
    remove_connection_id*: ngtcp2_remove_connection_id ## ```
                                                     ##   remove_connection_id is a callback function which notifies an
                                                     ##      application that connection ID is no longer used by a remote
                                                     ##      endpoint.  This callback function is optional.
                                                     ## ```
    update_key*: ngtcp2_update_key ## ```
                                 ##   update_key is a callback function which is invoked when the
                                 ##      library tells an application that it must update keying materials
                                 ##      and install new keys.  This function must be specified.
                                 ## ```
    path_validation*: ngtcp2_path_validation ## ```
                                           ##   path_validation is a callback function which is invoked when path
                                           ##      validation completed.  This function is optional.
                                           ## ```
    select_preferred_addr*: ngtcp2_select_preferred_addr ## ```
                                                       ##   select_preferred_addr is a callback function which is invoked
                                                       ##      when the library asks a client to select preferred address
                                                       ##      presented by a server.  This function is optional.
                                                       ## ```
    stream_reset*: ngtcp2_stream_reset ## ```
                                     ##   stream_reset is a callback function which is invoked when a
                                     ##      stream is reset by a remote endpoint.  This callback function is
                                     ##      optional.
                                     ## ```
    extend_max_remote_streams_bidi*: ngtcp2_extend_max_streams ## ```
                                                             ##   extend_max_remote_streams_bidi is a callback function which is
                                                             ##      invoked when the number of bidirectional streams which a remote
                                                             ##      endpoint can open is increased.  This callback function is
                                                             ##      optional.
                                                             ## ```
    extend_max_remote_streams_uni*: ngtcp2_extend_max_streams ## ```
                                                            ##   extend_max_remote_streams_uni is a callback function which is
                                                            ##      invoked when the number of unidirectional streams which a remote
                                                            ##      endpoint can open is increased.  This callback function is
                                                            ##      optional.
                                                            ## ```
    extend_max_stream_data*: ngtcp2_extend_max_stream_data ## ```
                                                         ##   extend_max_stream_data is callback function which is invoked when
                                                         ##      the maximum offset of STREAM data that a local endpoint can send
                                                         ##      is increased.  This callback function is optional.
                                                         ## ```
    dcid_status*: ngtcp2_connection_id_status ## ```
                                            ##   dcid_status is a callback function which is invoked when the new
                                            ##      destination Connection ID is activated or the activated
                                            ##      destination Connection ID is now deactivated.
                                            ## ```
    handshake_confirmed*: ngtcp2_handshake_confirmed ## ```
                                                   ##   handshake_confirmed is a callback function which is invoked when
                                                   ##      both endpoints agree that handshake has finished.  This field is
                                                   ##      ignored by server because handshake_completed indicates the
                                                   ##      handshake confirmation for server.
                                                   ## ```
    recv_new_token*: ngtcp2_recv_new_token ## ```
                                         ##   recv_new_token is a callback function which is invoked when new
                                         ##      token is received from server.  This field is ignored by server.
                                         ## ```
    delete_crypto_aead_ctx*: ngtcp2_delete_crypto_aead_ctx ## ```
                                                         ##   delete_crypto_aead_ctx is a callback function which deletes a
                                                         ##      given AEAD cipher context object.
                                                         ## ```
    delete_crypto_cipher_ctx*: ngtcp2_delete_crypto_cipher_ctx ## ```
                                                             ##   delete_crypto_cipher_ctx is a callback function which deletes a
                                                             ##      given cipher context object.
                                                             ## ```
  
  ngtcp2_cid_token* {.bycopy.} = object ## ```
                                    ##   @struct
                                    ##   
                                    ##    :type:ngtcp2_cid_token is the convenient struct to store
                                    ##    Connection ID, its associated path, and stateless reset token.
                                    ## ```
    seq*: uint64 ## ```
               ##   seq is the sequence number of this Connection ID.
               ## ```
    cid*: ngtcp2_cid           ## ```
                   ##   cid is Connection ID.
                   ## ```
    ps*: ngtcp2_path_storage ## ```
                           ##   ps is the path which is associated to this Connection ID.
                           ## ```
    token*: array[16, uint8] ## ```
                          ##   token is the stateless reset token for this Connection ID.
                          ## ```
    token_present*: uint8 ## ```
                        ##   token_resent is nonzero if token contains stateless reset
                        ##        token.
                        ## ```
  
  ngtcp2_connection_close_error_code* {.bycopy.} = object
    error_code*: uint64 ## ```
                      ##   error_code is the error code for connection closure.
                      ## ```
    `type`*: ngtcp2_connection_close_error_code_type ## ```
                                                   ##   type is the type of error_code.
                                                   ## ```
  
  ngtcp2_info* {.bycopy.} = object ## ```
                               ##   @struct
                               ##   
                               ##    This struct is what ngtcp2_version() returns.  It holds
                               ##    information about the particular ngtcp2 version.
                               ## ```
    age*: cint ## ```
             ##   Age of this struct.  This instance of ngtcp2 sets it to
             ##      :macro:NGTCP2_VERSION_AGE but a future version may bump it and
             ##      add more struct fields at the bottom
             ## ```
    version_num*: cint ## ```
                     ##   the :macro:NGTCP2_VERSION_NUM number (since age ==1)
                     ## ```
    version_str*: cstring ## ```
                        ##   points to the :macro:NGTCP2_VERSION string (since age ==1)
                        ## ```
  
proc ngtcp2_cid_init*(cid: ptr ngtcp2_cid; data: ptr uint8; datalen: uint) {.importc,
    cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_cid_init initializes Connection ID |cid| with the byte
  ##    string pointed by |data| and its length is |datalen|.  |datalen|
  ##    must be at least :enum:NGTCP2_MIN_CIDLEN, and at most
  ##    :enum:NGTCP2_MAX_CIDLEN.
  ## ```
proc ngtcp2_encode_transport_params*(dest: ptr uint8; destlen: uint;
                                    exttype: ngtcp2_transport_params_type;
                                    params: ptr ngtcp2_transport_params): ngtcp2_ssize {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_encode_transport_params encodes |params| in |dest| of
  ##    length |destlen|.
  ##   
  ##    This function returns the number of written, or one of the
  ##    following negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_NOBUF
  ##        Buffer is too small.
  ##    :enum:NGTCP2_ERR_INVALID_ARGUMENT:
  ##        |exttype| is invalid.
  ## ```
proc ngtcp2_decode_transport_params*(params: ptr ngtcp2_transport_params;
                                    exttype: ngtcp2_transport_params_type;
                                    data: ptr uint8; datalen: uint): cint {.importc,
    cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_decode_transport_params decodes transport parameters in
  ##    |data| of length |datalen|, and stores the result in the object
  ##    pointed by |params|.
  ##   
  ##    If the optional parameters are missing, the default value is
  ##    assigned.
  ##   
  ##    This function returns 0 if it succeeds, or one of the following
  ##    negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_REQUIRED_TRANSPORT_PARAM
  ##        The required parameter is missing.
  ##    :enum:NGTCP2_ERR_MALFORMED_TRANSPORT_PARAM
  ##        The input is malformed.
  ##    :enum:NGTCP2_ERR_INVALID_ARGUMENT:
  ##        |exttype| is invalid.
  ## ```
proc ngtcp2_pkt_decode_version_cid*(pversion: ptr uint32; pdcid: ptr ptr uint8;
                                   pdcidlen: ptr uint; pscid: ptr ptr uint8;
                                   pscidlen: ptr uint; data: ptr uint8; datalen: uint;
                                   short_dcidlen: uint): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_pkt_decode_version_cid extracts QUIC version, Destination
  ##    Connection ID and Source Connection ID from the packet pointed by
  ##    |data| of length |datalen|.  This function can handle Connection ID
  ##    up to 255 bytes unlike ngtcp2_pkt_decode_hd_long or
  ##    ngtcp2_pkt_decode_hd_short which are only capable of handling
  ##    Connection ID less than or equal to :macro:NGTCP2_MAX_CIDLEN.
  ##    Longer Connection ID is only valid if the version is unsupported
  ##    QUIC version.
  ##   
  ##    If the given packet is Long packet, this function extracts the
  ##    version from the packet and assigns it to |*pversion|.  It also
  ##    extracts the pointer to the Destination Connection ID and its
  ##    length and assigns them to |*pdcid| and |*pdcidlen| respectively.
  ##    Similarly, it extracts the pointer to the Source Connection ID and
  ##    its length and assigns them to |*pscid| and |*pscidlen|
  ##    respectively.
  ##   
  ##    If the given packet is Short packet, |*pversion| will be
  ##    :macro:NGTCP2_PROTO_VER, |*pscid| will be NULL, and |*pscidlen|
  ##    will be 0.  Because the Short packet does not have the length of
  ##    Destination Connection ID, the caller has to pass the length in
  ##    |short_dcidlen|.  This function extracts the pointer to the
  ##    Destination Connection ID and assigns it to |*pdcid|.
  ##    |short_dcidlen| is assigned to |*pdcidlen|.
  ##   
  ##    This function returns 0 or 1 if it succeeds.  It returns 1 if
  ##    Version Negotiation packet should be sent.  Otherwise, one of the
  ##    following negative error code:
  ##   
  ##    :enum:NGTCP2_ERR_INVALID_ARGUMENT
  ##        The function could not decode the packet header.
  ## ```
proc ngtcp2_pkt_decode_hd_long*(dest: ptr ngtcp2_pkt_hd; pkt: ptr uint8; pktlen: uint): ngtcp2_ssize {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_pkt_decode_hd_long decodes QUIC long packet header in
  ##    |pkt| of length |pktlen|.  This function only parses the input just
  ##    before packet number field.
  ##   
  ##    This function does not verify that length field is correct.  In
  ##    other words, this function succeeds even if length > |pktlen|.
  ##   
  ##    This function can handle Connection ID up to
  ##    :enum:NGTCP2_MAX_CIDLEN.  Consider to use
  ##    ngtcp2_pkt_decode_version_cid to get longer Connection ID.
  ##   
  ##    This function handles Version Negotiation specially.  If version
  ##    field is 0, |pkt| must contain Version Negotiation packet.  Version
  ##    Negotiation packet has random type in wire format.  For
  ##    convenience, this function sets
  ##    :enum:NGTCP2_PKT_VERSION_NEGOTIATION to dest->type, and set
  ##    dest->payloadlen and dest->pkt_num to 0.  Version Negotiation
  ##    packet occupies a single packet.
  ##   
  ##    It stores the result in the object pointed by |dest|, and returns
  ##    the number of bytes decoded to read the packet header if it
  ##    succeeds, or one of the following error codes:
  ##   
  ##    :enum:NGTCP2_ERR_INVALID_ARGUMENT
  ##        Packet is too short; or it is not a long header
  ## ```
proc ngtcp2_pkt_decode_hd_short*(dest: ptr ngtcp2_pkt_hd; pkt: ptr uint8; pktlen: uint;
                                dcidlen: uint): ngtcp2_ssize {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_pkt_decode_hd_short decodes QUIC short packet header in
  ##    |pkt| of length |pktlen|.  |dcidlen| is the length of DCID in
  ##    packet header.  Short packet does not encode the length of
  ##    connection ID, thus we need the input from the outside.  This
  ##    function only parses the input just before packet number field.
  ##    This function can handle Connection ID up to
  ##    :enum:NGTCP2_MAX_CIDLEN.  Consider to use
  ##    ngtcp2_pkt_decode_version_cid to get longer Connection ID.  It
  ##    stores the result in the object pointed by |dest|, and returns the
  ##    number of bytes decoded to read the packet header if it succeeds,
  ##    or one of the following error codes:
  ##   
  ##    :enum:NGTCP2_ERR_INVALID_ARGUMENT
  ##        Packet is too short; or it is not a short header
  ## ```
proc ngtcp2_pkt_write_stateless_reset*(dest: ptr uint8; destlen: uint;
                                      stateless_reset_token: ptr uint8;
                                      rand: ptr uint8; randlen: uint): ngtcp2_ssize {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_pkt_write_stateless_reset writes Stateless Reset packet in
  ##    the buffer pointed by |dest| whose length is |destlen|.
  ##    |stateless_reset_token| is a pointer to the Stateless Reset Token,
  ##    and its length must be :macro:NGTCP2_STATELESS_RESET_TOKENLEN
  ##    bytes long.  |rand| specifies the random octets preceding Stateless
  ##    Reset Token.  The length of |rand| is specified by |randlen| which
  ##    must be at least :macro:NGTCP2_MIN_STATELESS_RETRY_RANDLEN bytes
  ##    long.
  ##   
  ##    If |randlen| is too long to write them all in the buffer, |rand| is
  ##    written to the buffer as much as possible, and is truncated.
  ##   
  ##    This function returns the number of bytes written to the buffer, or
  ##    one of the following negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_NOBUF
  ##        Buffer is too small.
  ##    :enum:NGTCP2_ERR_INVALID_ARGUMENT
  ##        |randlen| is strictly less than
  ##        :macro:NGTCP2_MIN_STATELESS_RETRY_RANDLEN.
  ## ```
proc ngtcp2_pkt_write_version_negotiation*(dest: ptr uint8; destlen: uint;
    unused_random: uint8; dcid: ptr uint8; dcidlen: uint; scid: ptr uint8; scidlen: uint;
    sv: ptr uint32; nsv: uint): ngtcp2_ssize {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_pkt_write_version_negotiation writes Version Negotiation
  ##    packet in the buffer pointed by |dest| whose length is |destlen|.
  ##    |unused_random| should be generated randomly.  |dcid| is the
  ##    destination connection ID which appears in a packet as a source
  ##    connection ID sent by client which caused version negotiation.
  ##    Similarly, |scid| is the source connection ID which appears in a
  ##    packet as a destination connection ID sent by client.  |sv| is a
  ##    list of supported versions, and |nsv| specifies the number of
  ##    supported versions included in |sv|.
  ##   
  ##    This function returns the number of bytes written to the buffer, or
  ##    one of the following negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_NOBUF
  ##        Buffer is too small.
  ## ```
proc ngtcp2_pkt_get_type_long*(c: uint8): uint8 {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_pkt_get_type_long returns the long packet type.  |c| is
  ##    the first byte of Long packet header.
  ## ```
proc ngtcp2_pkt_write_connection_close*(dest: ptr uint8; destlen: uint;
                                       dcid: ptr ngtcp2_cid; scid: ptr ngtcp2_cid;
                                       error_code: uint64;
                                       encrypt: ngtcp2_encrypt;
                                       aead: ptr ngtcp2_crypto_aead;
                                       aead_ctx: ptr ngtcp2_crypto_aead_ctx;
                                       iv: ptr uint8; hp_mask: ngtcp2_hp_mask;
                                       hp: ptr ngtcp2_crypto_cipher;
                                       hp_ctx: ptr ngtcp2_crypto_cipher_ctx): ngtcp2_ssize {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_pkt_write_connection_close writes Initial packet
  ##    containing CONNECTION_CLOSE frame with the given |error_code| to
  ##    the buffer pointed by |dest| of length |destlen|.  All encryption
  ##    parameters are for Initial packet encryption.  The packet number is
  ##    always 0.
  ##   
  ##    The primary use case of this function is for server to send
  ##    CONNECTION_CLOSE frame in Initial packet to close connection
  ##    without committing the state when validating Retry token fails.
  ##   
  ##    This function returns the number of bytes written if it succeeds,
  ##    or one of the following negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_NOBUF
  ##        Buffer is too small.
  ##    :enum:NGTCP2_ERR_CALLBACK_FAILURE
  ##        Callback function failed.
  ## ```
proc ngtcp2_pkt_write_retry*(dest: ptr uint8; destlen: uint; dcid: ptr ngtcp2_cid;
                            scid: ptr ngtcp2_cid; odcid: ptr ngtcp2_cid;
                            token: ptr uint8; tokenlen: uint;
                            encrypt: ngtcp2_encrypt; aead: ptr ngtcp2_crypto_aead;
                            aead_ctx: ptr ngtcp2_crypto_aead_ctx): ngtcp2_ssize {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_pkt_write_retry writes Retry packet in the buffer pointed
  ##    by |dest| whose length is |destlen|.  |odcid| specifies Original
  ##    Destination Connection ID.  |token| specifies Retry Token, and
  ##    |tokenlen| specifies its length.  |aead| must be AEAD_AES_128_GCM.
  ##    |aead_ctx| must be initialized with :macro:NGTCP2_RETRY_KEY as an
  ##    encryption key.
  ##   
  ##    This function returns the number of bytes written to the buffer, or
  ##    one of the following negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_NOBUF
  ##        Buffer is too small.
  ##    :enum:NGTCP2_ERR_CALLBACK_FAILURE
  ##        Callback function failed.
  ## ```
proc ngtcp2_accept*(dest: ptr ngtcp2_pkt_hd; pkt: ptr uint8; pktlen: uint): cint {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_accept is used by server implementation, and decides
  ##    whether packet |pkt| of length |pktlen| is acceptable for initial
  ##    packet from client.
  ##   
  ##    If it is acceptable, it returns 0.  If it is not acceptable, and
  ##    Version Negotiation packet is required to send, it returns 1.
  ##    Otherwise, it returns -1.
  ##   
  ##    If |dest| is not NULL, and the return value is 0 or 1, the decoded
  ##    packet header is stored to the object pointed by |dest|.
  ## ```
proc ngtcp2_conn_client_new*(pconn: ptr ptr ngtcp2_conn; dcid: ptr ngtcp2_cid;
                            scid: ptr ngtcp2_cid; path: ptr ngtcp2_path;
                            version: uint32; callbacks: ptr ngtcp2_conn_callbacks;
                            settings: ptr ngtcp2_settings; mem: ptr ngtcp2_mem;
                            user_data: pointer): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_client_new creates new :type:ngtcp2_conn, and
  ##    initializes it as client.  |dcid| is randomized destination
  ##    connection ID.  |scid| is source connection ID.  |version| is a
  ##    QUIC version to use.  |path| is the network path where this QUIC
  ##    connection is being established and must not be NULL.  |callbacks|,
  ##    and |settings| must not be NULL, and the function make a copy of
  ##    each of them.  |user_data| is the arbitrary pointer which is passed
  ##    to the user-defined callback functions.  If |mem| is NULL, the
  ##    memory allocator returned by ngtcp2_mem_default() is used.
  ##   
  ##    This function returns 0 if it succeeds, or one of the following
  ##    negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_NOMEM
  ##        Out of memory.
  ## ```
proc ngtcp2_conn_server_new*(pconn: ptr ptr ngtcp2_conn; dcid: ptr ngtcp2_cid;
                            scid: ptr ngtcp2_cid; path: ptr ngtcp2_path;
                            version: uint32; callbacks: ptr ngtcp2_conn_callbacks;
                            settings: ptr ngtcp2_settings; mem: ptr ngtcp2_mem;
                            user_data: pointer): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_server_new creates new :type:ngtcp2_conn, and
  ##    initializes it as server.  |dcid| is a destination connection ID.
  ##    |scid| is a source connection ID.  |path| is the network path where
  ##    this QUIC connection is being established and must not be NULL.
  ##    |version| is a QUIC version to use.  |callbacks|, and |settings|
  ##    must not be NULL, and the function make a copy of each of them.
  ##    |user_data| is the arbitrary pointer which is passed to the
  ##    user-defined callback functions.  If |mem| is NULL, the memory
  ##    allocator returned by ngtcp2_mem_default() is used.
  ##   
  ##    This function returns 0 if it succeeds, or one of the following
  ##    negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_NOMEM
  ##        Out of memory.
  ## ```
proc ngtcp2_conn_del*(conn: ptr ngtcp2_conn) {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_del frees resources allocated for |conn|.  It also
  ##    frees memory pointed by |conn|.
  ## ```
proc ngtcp2_conn_read_pkt*(conn: ptr ngtcp2_conn; path: ptr ngtcp2_path;
                          pi: ptr ngtcp2_pkt_info; pkt: ptr uint8; pktlen: uint;
                          ts: ngtcp2_tstamp): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_read_pkt decrypts QUIC packet given in |pkt| of
  ##    length |pktlen| and processes it.  |path| is the network path the
  ##    packet is delivered and must not be NULL.  |pi| is packet metadata
  ##    and must not be NULL. This function performs QUIC handshake as
  ##    well.
  ##   
  ##    This function must not be called from inside the callback
  ##    functions.
  ##   
  ##    This function returns 0 if it succeeds, or negative error codes.
  ##    In general, if the error code which satisfies
  ##    ngtcp2_erro_is_fatal(err) != 0 is returned, the application should
  ##    just close the connection by calling
  ##    ngtcp2_conn_write_connection_close or just delete the QUIC
  ##    connection using ngtcp2_conn_del.  It is undefined to call the
  ##    other library functions.  If :enum:NGTCP2_ERR_RETRY is returned,
  ##    application must be a server and it must perform address validation
  ##    by sending Retry packet and close the connection.  If
  ##    :enum:NGTCP2_ERR_DROP_CONN is returned, server application must
  ##    drop the connection silently (without sending any CONNECTION_CLOSE
  ##    frame) and discard connection state.
  ## ```
proc ngtcp2_conn_write_pkt*(conn: ptr ngtcp2_conn; path: ptr ngtcp2_path;
                           pi: ptr ngtcp2_pkt_info; dest: ptr uint8; destlen: uint;
                           ts: ngtcp2_tstamp): ngtcp2_ssize {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_write_pkt is equivalent to calling
  ##    ngtcp2_conn_writev_stream without specifying stream data and
  ##    :enum:NGTCP2_WRITE_STREAM_FLAG_NONE as flags.
  ## ```
proc ngtcp2_conn_handshake_completed*(conn: ptr ngtcp2_conn) {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_handshake_completed tells |conn| that the QUIC
  ##    handshake has completed.
  ## ```
proc ngtcp2_conn_get_handshake_completed*(conn: ptr ngtcp2_conn): cint {.importc,
    cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_handshake_completed returns nonzero if handshake
  ##    has completed.
  ## ```
proc ngtcp2_conn_install_initial_key*(conn: ptr ngtcp2_conn;
                                     rx_aead_ctx: ptr ngtcp2_crypto_aead_ctx;
                                     rx_iv: ptr uint8;
                                     rx_hp_ctx: ptr ngtcp2_crypto_cipher_ctx;
                                     tx_aead_ctx: ptr ngtcp2_crypto_aead_ctx;
                                     tx_iv: ptr uint8;
                                     tx_hp_ctx: ptr ngtcp2_crypto_cipher_ctx;
                                     ivlen: uint): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_install_initial_key installs packet protection keying
  ##    materials for Initial packets.  |rx_aead_ctx| is AEAD cipher
  ##    context object and must be initialized with decryption key, IV
  ##    |rx_iv| of length |rx_ivlen|, and packet header protection cipher
  ##    context object |rx_hp_ctx| to decrypt incoming Initial packets.
  ##    Similarly, |tx_aead_ctx|, |tx_iv| and |tx_hp_ctx| are for
  ##    encrypting outgoing packets and are the same length with the
  ##    decryption counterpart .  If they have already been set, they are
  ##    overwritten.
  ##   
  ##    If this function succeeds, |conn| takes ownership of |rx_aead_ctx|,
  ##    |rx_hp_ctx|, |tx_aead_ctx|, and |tx_hp_ctx|.
  ##    :type:ngtcp2_delete_crypto_aead_ctx and
  ##    :type:ngtcp2_delete_crypto_cipher_ctx will be called to delete
  ##    these objects when they are no longer used.  If this function
  ##    fails, the caller is responsible to delete them.
  ##   
  ##    After receiving Retry packet, the DCID most likely changes.  In
  ##    that case, client application must generate these keying materials
  ##    again based on new DCID and install them again.
  ##   
  ##    This function returns 0 if it succeeds, or one of the following
  ##    negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_NOMEM
  ##        Out of memory.
  ## ```
proc ngtcp2_conn_install_rx_handshake_key*(conn: ptr ngtcp2_conn;
    aead_ctx: ptr ngtcp2_crypto_aead_ctx; iv: ptr uint8; ivlen: uint;
    hp_ctx: ptr ngtcp2_crypto_cipher_ctx): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_install_rx_handshake_key installs packet protection
  ##    keying materials for decrypting incoming Handshake packets.
  ##    |aead_ctx| is AEAD cipher context object which must be initialized
  ##    with decryption key, IV |iv| of length |ivlen|, and packet header
  ##    protection cipher context object |hp_ctx| to decrypt incoming
  ##    Handshake packets.
  ##   
  ##    If this function succeeds, |conn| takes ownership of |aead_ctx|,
  ##    and |hp_ctx|.  :type:ngtcp2_delete_crypto_aead_ctx and
  ##    :type:ngtcp2_delete_crypto_cipher_ctx will be called to delete
  ##    these objects when they are no longer used.  If this function
  ##    fails, the caller is responsible to delete them.
  ##   
  ##    This function returns 0 if it succeeds, or one of the following
  ##    negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_NOMEM
  ##        Out of memory.
  ## ```
proc ngtcp2_conn_install_tx_handshake_key*(conn: ptr ngtcp2_conn;
    aead_ctx: ptr ngtcp2_crypto_aead_ctx; iv: ptr uint8; ivlen: uint;
    hp_ctx: ptr ngtcp2_crypto_cipher_ctx): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_install_tx_handshake_key installs packet protection
  ##    keying materials for encrypting outgoing Handshake packets.
  ##    |aead_ctx| is AEAD cipher context object which must be initialized
  ##    with encryption key, IV |iv| of length |ivlen|, and packet header
  ##    protection cipher context object |hp_ctx| to encrypt outgoing
  ##    Handshake packets.
  ##   
  ##    If this function succeeds, |conn| takes ownership of |aead_ctx| and
  ##    |hp_ctx|.  :type:ngtcp2_delete_crypto_aead_ctx and
  ##    :type:ngtcp2_delete_crypto_cipher_ctx will be called to delete
  ##    these objects when they are no longer used.  If this function
  ##    fails, the caller is responsible to delete them.
  ##   
  ##    This function returns 0 if it succeeds, or one of the following
  ##    negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_NOMEM
  ##        Out of memory.
  ## ```
proc ngtcp2_conn_set_aead_overhead*(conn: ptr ngtcp2_conn; aead_overhead: uint) {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_set_aead_overhead tells the ngtcp2 library the length
  ##    of AEAD tag which the negotiated cipher suites defines.  This
  ##    function must be called before encrypting or decrypting the
  ##    incoming packets other than Initial packets.
  ## ```
proc ngtcp2_conn_get_aead_overhead*(conn: ptr ngtcp2_conn): uint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_aead_overhead returns the aead overhead passed to
  ##    ngtcp2_conn_set_aead_overhead. If ngtcp2_conn_set_aead_overhead hasn't
  ##    been called yet this function returns 0.
  ## ```
proc ngtcp2_conn_install_early_key*(conn: ptr ngtcp2_conn;
                                   aead_ctx: ptr ngtcp2_crypto_aead_ctx;
                                   iv: ptr uint8; ivlen: uint;
                                   hp_ctx: ptr ngtcp2_crypto_cipher_ctx): cint {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_install_early_key installs packet protection AEAD
  ##    cipher context object |aead_ctx|, IV |iv| of length |ivlen|, and
  ##    packet header protection cipher context object |hp_ctx| to encrypt
  ##    (for client) or decrypt (for server) 0RTT packets.
  ##   
  ##    If this function succeeds, |conn| takes ownership of |aead_ctx| and
  ##    |hp_ctx|.  :type:ngtcp2_delete_crypto_aead_ctx and
  ##    :type:ngtcp2_delete_crypto_cipher_ctx will be called to delete
  ##    these objects when they are no longer used.  If this function
  ##    fails, the caller is responsible to delete them.
  ##   
  ##    This function returns 0 if it succeeds, or one of the following
  ##    negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_NOMEM
  ##        Out of memory.
  ## ```
proc ngtcp2_conn_install_rx_key*(conn: ptr ngtcp2_conn; secret: ptr uint8;
                                secretlen: uint;
                                aead_ctx: ptr ngtcp2_crypto_aead_ctx;
                                iv: ptr uint8; ivlen: uint;
                                hp_ctx: ptr ngtcp2_crypto_cipher_ctx): cint {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_install_rx_key installs packet protection keying
  ##    materials for decrypting Short packets.  |secret| of length
  ##    |secretlen| is the decryption secret which is used to derive keying
  ##    materials passed to this function.  |aead_ctx| is AEAD cipher
  ##    context object which must be initialized with decryption key, IV
  ##    |iv| of length |ivlen|, and packet header protection cipher context
  ##    object |hp_ctx| to decrypt incoming Short packets.
  ##   
  ##    If this function succeeds, |conn| takes ownership of |aead_ctx| and
  ##    |hp_ctx|.  :type:ngtcp2_delete_crypto_aead_ctx and
  ##    :type:ngtcp2_delete_crypto_cipher_ctx will be called to delete
  ##    these objects when they are no longer used.  If this function
  ##    fails, the caller is responsible to delete them.
  ##   
  ##    This function returns 0 if it succeeds, or one of the following
  ##    negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_NOMEM
  ##        Out of memory.
  ## ```
proc ngtcp2_conn_install_tx_key*(conn: ptr ngtcp2_conn; secret: ptr uint8;
                                secretlen: uint;
                                aead_ctx: ptr ngtcp2_crypto_aead_ctx;
                                iv: ptr uint8; ivlen: uint;
                                hp_ctx: ptr ngtcp2_crypto_cipher_ctx): cint {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_install_tx_key installs packet protection keying
  ##    materials for encrypting Short packets.  |secret| of length
  ##    |secretlen| is the encryption secret which is used to derive keying
  ##    materials passed to this function.  |aead_ctx| is AEAD cipher
  ##    context object which must be initialized with encryption key, IV
  ##    |iv| of length |ivlen|, and packet header protection cipher context
  ##    object |hp_ctx| to encrypt outgoing Short packets.
  ##   
  ##    If this function succeeds, |conn| takes ownership of |aead_ctx| and
  ##    |hp_ctx|.  :type:ngtcp2_delete_crypto_aead_ctx and
  ##    :type:ngtcp2_delete_crypto_cipher_ctx will be called to delete
  ##    these objects when they are no longer used.  If this function
  ##    fails, the caller is responsible to delete them.
  ##   
  ##    This function returns 0 if it succeeds, or one of the following
  ##    negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_NOMEM
  ##        Out of memory.
  ## ```
proc ngtcp2_conn_initiate_key_update*(conn: ptr ngtcp2_conn; ts: ngtcp2_tstamp): cint {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_initiate_key_update initiates the key update.
  ##   
  ##    This function returns 0 if it succeeds, or one of the following
  ##    negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_INVALID_STATE
  ##        The previous key update has not been confirmed yet; or key
  ##        update is too frequent; or new keys are not available yet.
  ## ```
proc ngtcp2_conn_set_tls_error*(conn: ptr ngtcp2_conn; liberr: cint) {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_set_tls_error sets the TLS related error in |conn|.
  ##    In general, error code should be propagated via return value, but
  ##    sometimes ngtcp2 API is called inside callback function of TLS
  ##    stack and it does not allow to return ngtcp2 error code directly.
  ##    In this case, implementation can set the error code (e.g.,
  ##    NGTCP2_ERR_MALFORMED_TRANSPORT_PARAM) using this function.
  ## ```
proc ngtcp2_conn_get_tls_error*(conn: ptr ngtcp2_conn): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_tls_error returns the value set by
  ##    ngtcp2_conn_set_tls_error.  If no value is set, this function
  ##    returns 0.
  ## ```
proc ngtcp2_conn_loss_detection_expiry*(conn: ptr ngtcp2_conn): ngtcp2_tstamp {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_loss_detection_expiry returns the expiry time point
  ##    of loss detection timer.  Application should call
  ##    ngtcp2_conn_on_loss_detection_timer and ngtcp2_conn_write_pkt
  ##    (or ngtcp2_conn_writev_stream) when it expires.  It returns
  ##    UINT64_MAX if loss detection timer is not armed.
  ## ```
proc ngtcp2_conn_ack_delay_expiry*(conn: ptr ngtcp2_conn): ngtcp2_tstamp {.importc,
    cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_ack_delay_expiry returns the expiry time point of
  ##    delayed protected ACK.  Application should call
  ##    ngtcp2_conn_cancel_expired_ack_delay_timer() and
  ##    ngtcp2_conn_write_pkt (or ngtcp2_conn_writev_stream) when it
  ##    expires.  It returns UINT64_MAX if there is no expiry.
  ## ```
proc ngtcp2_conn_get_expiry*(conn: ptr ngtcp2_conn): ngtcp2_tstamp {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_expiry returns the next expiry time.  This
  ##    function returns the timestamp such that
  ##    min(ngtcp2_conn_loss_detection_expiry(conn),
  ##    ngtcp2_conn_ack_delay_expiry(conn), other timers in |conn|).
  ##   
  ##    Call ngtcp2_conn_handle_expiry() and ngtcp2_conn_write_pkt (or
  ##    ngtcp2_conn_writev_stream) if expiry time is passed.
  ## ```
proc ngtcp2_conn_handle_expiry*(conn: ptr ngtcp2_conn; ts: ngtcp2_tstamp): cint {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_handle_expiry handles expired timer.  It does nothing
  ##    if timer is not expired.
  ## ```
proc ngtcp2_conn_cancel_expired_ack_delay_timer*(conn: ptr ngtcp2_conn;
    ts: ngtcp2_tstamp) {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_cancel_expired_ack_delay_timer stops expired ACK
  ##    delay timer.  |ts| is the current time.  This function must be
  ##    called when ngtcp2_conn_ack_delay_expiry() <= ts.
  ## ```
proc ngtcp2_conn_get_idle_expiry*(conn: ptr ngtcp2_conn): ngtcp2_tstamp {.importc,
    cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_idle_expiry returns the time when a connection
  ##    should be closed if it continues to be idle.  If idle timeout is
  ##    disabled, this function returns UINT64_MAX.
  ## ```
proc ngtcp2_conn_get_pto*(conn: ptr ngtcp2_conn): ngtcp2_duration {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_pto returns Probe Timeout (PTO).
  ## ```
proc ngtcp2_conn_set_remote_transport_params*(conn: ptr ngtcp2_conn;
    params: ptr ngtcp2_transport_params): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_set_remote_transport_params sets transport parameter
  ##    |params| to |conn|.
  ##   
  ##    This function returns 0 if it succeeds, or one of the following
  ##    negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_PROTO
  ##        If |conn| is server, and negotiated_version field is not the
  ##        same as the used version.
  ## ```
proc ngtcp2_conn_get_remote_transport_params*(conn: ptr ngtcp2_conn;
    params: ptr ngtcp2_transport_params) {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_remote_transport_params fills settings values in
  ##    |params|.  original_connection_id and
  ##    original_connection_id_present are always zero filled.
  ## ```
proc ngtcp2_conn_set_early_remote_transport_params*(conn: ptr ngtcp2_conn;
    params: ptr ngtcp2_transport_params) {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_set_early_remote_transport_params sets |params| as
  ##    transport parameter previously received from a server.  The
  ##    parameters are used to send 0-RTT data.  QUIC requires that client
  ##    application should remember transport parameter as well as session
  ##    ticket.
  ##   
  ##    At least following fields must be set:
  ##   
  ##    initial_max_stream_id_bidi
  ##    initial_max_stream_id_uni
  ##    initial_max_stream_data_bidi_local
  ##    initial_max_stream_data_bidi_remote
  ##    initial_max_stream_data_uni
  ##    initial_max_data
  ## ```
proc ngtcp2_conn_set_local_transport_params*(conn: ptr ngtcp2_conn;
    params: ptr ngtcp2_transport_params): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_set_local_transport_params sets the local transport
  ##    parameters |params|.  This function can only be called by server.
  ##    Although the local transport parameters are passed to
  ##    ngtcp2_conn_server_new, server might want to update them after
  ##    ALPN is chosen.  In that case, server can update the transport
  ##    parameter with this function.  Server must call this function
  ##    before calling ngtcp2_conn_install_tx_handshake_key.
  ##   
  ##    This function returns 0 if it succeeds, or one of the following
  ##    negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_INVALID_STATE
  ##        ngtcp2_conn_install_tx_handshake_key has been called.
  ## ```
proc ngtcp2_conn_get_local_transport_params*(conn: ptr ngtcp2_conn;
    params: ptr ngtcp2_transport_params) {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_local_transport_params fills settings values in
  ##    |params|.
  ## ```
proc ngtcp2_conn_open_bidi_stream*(conn: ptr ngtcp2_conn; pstream_id: ptr int64;
                                  stream_user_data: pointer): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_open_bidi_stream opens new bidirectional stream.  The
  ##    |stream_user_data| is the user data specific to the stream.  The
  ##    open stream ID is stored in |*pstream_id|.
  ##   
  ##    This function returns 0 if it succeeds, or one of the following
  ##    negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_NOMEM
  ##        Out of memory
  ##    :enum:NGTCP2_ERR_STREAM_ID_BLOCKED
  ##        The remote peer does not allow |stream_id| yet.
  ## ```
proc ngtcp2_conn_open_uni_stream*(conn: ptr ngtcp2_conn; pstream_id: ptr int64;
                                 stream_user_data: pointer): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_open_uni_stream opens new unidirectional stream.  The
  ##    |stream_user_data| is the user data specific to the stream.  The
  ##    open stream ID is stored in |*pstream_id|.
  ##   
  ##    This function returns 0 if it succeeds, or one of the following
  ##    negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_NOMEM
  ##        Out of memory
  ##    :enum:NGTCP2_ERR_STREAM_ID_BLOCKED
  ##        The remote peer does not allow |stream_id| yet.
  ## ```
proc ngtcp2_conn_shutdown_stream*(conn: ptr ngtcp2_conn; stream_id: int64;
                                 app_error_code: uint64): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_shutdown_stream closes stream denoted by |stream_id|
  ##    abruptly.  |app_error_code| is one of application error codes, and
  ##    indicates the reason of shutdown.  Successful call of this function
  ##    does not immediately erase the state of the stream.  The actual
  ##    deletion is done when the remote endpoint sends acknowledgement.
  ##    Calling this function is equivalent to call
  ##    ngtcp2_conn_shutdown_stream_read, and
  ##    ngtcp2_conn_shutdown_stream_write sequentially.
  ##   
  ##    This function returns 0 if it succeeds, or one of the following
  ##    negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_NOMEM
  ##        Out of memory
  ##    :enum:NGTCP2_ERR_STREAM_NOT_FOUND
  ##        Stream does not exist
  ## ```
proc ngtcp2_conn_shutdown_stream_write*(conn: ptr ngtcp2_conn; stream_id: int64;
                                       app_error_code: uint64): cint {.importc,
    cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_shutdown_stream_write closes write-side of stream
  ##    denoted by |stream_id| abruptly.  |app_error_code| is one of
  ##    application error codes, and indicates the reason of shutdown.  If
  ##    this function succeeds, no application data is sent to the remote
  ##    endpoint.  It discards all data which has not been acknowledged
  ##    yet.
  ##   
  ##    This function returns 0 if it succeeds, or one of the following
  ##    negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_NOMEM
  ##        Out of memory
  ##    :enum:NGTCP2_ERR_STREAM_NOT_FOUND
  ##        Stream does not exist
  ## ```
proc ngtcp2_conn_shutdown_stream_read*(conn: ptr ngtcp2_conn; stream_id: int64;
                                      app_error_code: uint64): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_shutdown_stream_read closes read-side of stream
  ##    denoted by |stream_id| abruptly.  |app_error_code| is one of
  ##    application error codes, and indicates the reason of shutdown.  If
  ##    this function succeeds, no application data is forwarded to an
  ##    application layer.
  ##   
  ##    This function returns 0 if it succeeds, or one of the following
  ##    negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_NOMEM
  ##        Out of memory
  ##    :enum:NGTCP2_ERR_STREAM_NOT_FOUND
  ##        Stream does not exist
  ## ```
proc ngtcp2_conn_write_stream*(conn: ptr ngtcp2_conn; path: ptr ngtcp2_path;
                              pi: ptr ngtcp2_pkt_info; dest: ptr uint8; destlen: uint;
                              pdatalen: ptr ngtcp2_ssize; flags: uint32;
                              stream_id: int64; data: ptr uint8; datalen: uint;
                              ts: ngtcp2_tstamp): ngtcp2_ssize {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_write_stream is just like
  ##    ngtcp2_conn_writev_stream.  The only difference is that it
  ##    conveniently accepts a single buffer.
  ## ```
proc ngtcp2_conn_writev_stream*(conn: ptr ngtcp2_conn; path: ptr ngtcp2_path;
                               pi: ptr ngtcp2_pkt_info; dest: ptr uint8;
                               destlen: uint; pdatalen: ptr ngtcp2_ssize;
                               flags: uint32; stream_id: int64;
                               datav: ptr ngtcp2_vec; datavcnt: uint;
                               ts: ngtcp2_tstamp): ngtcp2_ssize {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_writev_stream writes a packet containing stream data
  ##    of stream denoted by |stream_id|.  The buffer of the packet is
  ##    pointed by |dest| of length |destlen|.  This function performs QUIC
  ##    handshake as well.
  ##   
  ##    Specifying -1 to |stream_id| means no new stream data to send.
  ##   
  ##    If |path| is not NULL, this function stores the network path with
  ##    which the packet should be sent.  Each addr field must point to the
  ##    buffer which is at least 128 bytes.  sizeof(struct
  ##    sockaddr_storage) is enough.  The assignment might not be done if
  ##    nothing is written to |dest|.
  ##   
  ##    If |pi| is not NULL, this function stores packet metadata in it if
  ##    it succeeds.  The metadata includes ECN markings.
  ##   
  ##    If the all given data is encoded as STREAM frame in |dest|, and if
  ##    |flags| & NGTCP2_WRITE_STREAM_FLAG_FIN is nonzero, fin flag is set
  ##    to outgoing STREAM frame.  Otherwise, fin flag in STREAM frame is
  ##    not set.
  ##   
  ##    This packet may contain frames other than STREAM frame.  The packet
  ##    might not contain STREAM frame if other frames occupy the packet.
  ##    In that case, |*pdatalen| would be -1 if |pdatalen| is not NULL.
  ##   
  ##    If |flags| & NGTCP2_WRITE_STREAM_FLAG_FIN is nonzero, and 0 length
  ##    STREAM frame is successfully serialized, |*pdatalen| would be 0.
  ##   
  ##    The number of data encoded in STREAM frame is stored in |*pdatalen|
  ##    if it is not NULL.  The caller must keep the portion of data
  ##    covered by |*pdatalen| bytes in tact until
  ##    :type:ngtcp2_acked_stream_data_offset indicates that they are
  ##    acknowledged by a remote endpoint or the stream is closed.
  ##   
  ##    If |flags| equals to :enum:NGTCP2_WRITE_STREAM_FLAG_NONE, this
  ##    function produces a single payload of UDP packet.  If the given
  ##    stream data is small (e.g., few bytes), the packet might be
  ##    severely under filled.  Too many small packet might increase
  ##    overall packet processing costs.  Unless there are retransmissions,
  ##    by default, application can only send 1 STREAM frame in one QUIC
  ##    packet.  In order to include more than 1 STREAM frame in one QUIC
  ##    packet, specify :enum:NGTCP2_WRITE_STREAM_FLAG_MORE in |flags|.
  ##    This is analogous to MSG_MORE flag in send(2).  If the
  ##    :enum:NGTCP2_WRITE_STREAM_FLAG_MORE is used, there are 4
  ##    outcomes:
  ##   
  ##    - The function returns the written length of packet just like
  ##      without :enum:NGTCP2_WRITE_STREAM_FLAG_MORE.  This is because
  ##      packet is nearly full and the library decided to make a complete
  ##      packet.  In this case, |*pdatalen| == -1 is asserted.
  ##   
  ##    - The function returns :enum:NGTCP2_ERR_WRITE_MORE.  In this
  ##      case, |*pdatalen| >= 0 is asserted.  This indicates that
  ##      application can call this function with different stream data to
  ##      pack them into the same packet.  Application has to specify the
  ##      same |conn|, |path|, |dest|, |destlen|, |pdatalen|, and |ts|
  ##      parameters, otherwise the behaviour is undefined.  The
  ##      application can change |flags|.
  ##   
  ##    - The function returns :enum:NGTCP2_ERR_STREAM_DATA_BLOCKED which
  ##      indicates that stream is blocked because of flow control.
  ##   
  ##    - The other error might be returned just like without
  ##      :enum:NGTCP2_WRITE_STREAM_FLAG_MORE.
  ##   
  ##    When application sees :enum:NGTCP2_ERR_WRITE_MORE, it must not
  ##    call other ngtcp2 API functions (application can still call
  ##    ngtcp2_conn_write_connection_close or
  ##    ngtcp2_conn_write_application_close to handle error from this
  ##    function).  Just keep calling ngtcp2_conn_writev_stream or
  ##    ngtcp2_conn_write_pkt until it returns a positive number (which
  ##    indicates a complete packet is ready).  If |*pdatalen| >= 0, the
  ##    function always return :enum:NGTCP2_ERR_WRITE_MORE.
  ##   
  ##    This function returns 0 if it cannot write any frame because buffer
  ##    is too small, or packet is congestion limited.  Application should
  ##    keep reading and wait for congestion window to grow.
  ##   
  ##    This function must not be called from inside the callback
  ##    functions.
  ##   
  ##    This function returns the number of bytes written in |dest| if it
  ##    succeeds, or one of the following negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_NOMEM
  ##        Out of memory
  ##    :enum:NGTCP2_ERR_STREAM_NOT_FOUND
  ##        Stream does not exist
  ##    :enum:NGTCP2_ERR_STREAM_SHUT_WR
  ##        Stream is half closed (local); or stream is being reset.
  ##    :enum:NGTCP2_ERR_PKT_NUM_EXHAUSTED
  ##        Packet number is exhausted, and cannot send any more packet.
  ##    :enum:NGTCP2_ERR_CALLBACK_FAILURE
  ##        User callback failed
  ##    :enum:NGTCP2_ERR_STREAM_DATA_BLOCKED
  ##        Stream is blocked because of flow control.
  ##    :enum:NGTCP2_ERR_WRITE_MORE
  ##        (Only when :enum:NGTCP2_WRITE_STREAM_FLAG_MORE is specified)
  ##        Application can call this function to pack more stream data
  ##        into the same packet.  See above to know how it works.
  ##   
  ##    In general, if the error code which satisfies
  ##    ngtcp2_err_is_fatal(err) != 0 is returned, the application should
  ##    just close the connection by calling
  ##    ngtcp2_conn_write_connection_close or just delete the QUIC
  ##    connection using ngtcp2_conn_del.  It is undefined to call the
  ##    other library functions.
  ## ```
proc ngtcp2_conn_write_connection_close*(conn: ptr ngtcp2_conn;
                                        path: ptr ngtcp2_path; dest: ptr uint8;
                                        destlen: uint; error_code: uint64;
                                        ts: ngtcp2_tstamp): ngtcp2_ssize {.importc,
    cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_write_connection_close writes a packet which contains
  ##    a CONNECTION_CLOSE frame (type 0x1c) in the buffer pointed by
  ##    |dest| whose capacity is |datalen|.
  ##   
  ##    If |path| is not NULL, this function stores the network path with
  ##    which the packet should be sent.  Each addr field must point to the
  ##    buffer which is at least 128 bytes.  sizeof(struct
  ##    sockaddr_storage) is enough.  The assignment might not be done if
  ##    nothing is written to |dest|.
  ##   
  ##    This function must not be called from inside the callback
  ##    functions.
  ##   
  ##    At the moment, successful call to this function makes connection
  ##    close.  We may change this behaviour in the future to allow
  ##    graceful shutdown.
  ##   
  ##    :enum:NGTCP2_ERR_NOMEM
  ##        Out of memory
  ##    :enum:NGTCP2_ERR_NOBUF
  ##        Buffer is too small
  ##    :enum:NGTCP2_ERR_INVALID_STATE
  ##        The current state does not allow sending CONNECTION_CLOSE.
  ##    :enum:NGTCP2_ERR_PKT_NUM_EXHAUSTED
  ##        Packet number is exhausted, and cannot send any more packet.
  ##    :enum:NGTCP2_ERR_CALLBACK_FAILURE
  ##        User callback failed
  ## ```
proc ngtcp2_conn_write_application_close*(conn: ptr ngtcp2_conn;
    path: ptr ngtcp2_path; dest: ptr uint8; destlen: uint; app_error_code: uint64;
    ts: ngtcp2_tstamp): ngtcp2_ssize {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_write_application_close writes a packet which
  ##    contains a CONNECTION_CLOSE frame (type 0x1d) in the buffer pointed
  ##    by |dest| whose capacity is |datalen|.
  ##   
  ##    If |path| is not NULL, this function stores the network path with
  ##    which the packet should be sent.  Each addr field must point to the
  ##    buffer which is at least 128 bytes.  sizeof(struct
  ##    sockaddr_storage) is enough.  The assignment might not be done if
  ##    nothing is written to |dest|.
  ##   
  ##    If handshake has not been confirmed yet, CONNECTION_CLOSE (type
  ##    0x1c) with error code :macro:NGTCP2_APPLICATION_ERROR is written
  ##    instead.
  ##   
  ##    This function must not be called from inside the callback
  ##    functions.
  ##   
  ##    At the moment, successful call to this function makes connection
  ##    close.  We may change this behaviour in the future to allow
  ##    graceful shutdown.
  ##   
  ##    :enum:NGTCP2_ERR_NOMEM
  ##        Out of memory
  ##    :enum:NGTCP2_ERR_NOBUF
  ##        Buffer is too small
  ##    :enum:NGTCP2_ERR_INVALID_STATE
  ##        The current state does not allow sending CONNECTION_CLOSE.
  ##    :enum:NGTCP2_ERR_PKT_NUM_EXHAUSTED
  ##        Packet number is exhausted, and cannot send any more packet.
  ##    :enum:NGTCP2_ERR_CALLBACK_FAILURE
  ##        User callback failed
  ## ```
proc ngtcp2_conn_is_in_closing_period*(conn: ptr ngtcp2_conn): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_is_in_closing_period returns nonzero if |conn| is in
  ##    closing period.
  ## ```
proc ngtcp2_conn_is_in_draining_period*(conn: ptr ngtcp2_conn): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_is_in_draining_period returns nonzero if |conn| is in
  ##    draining period.
  ## ```
proc ngtcp2_conn_extend_max_stream_offset*(conn: ptr ngtcp2_conn; stream_id: int64;
    datalen: uint64): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_extend_max_stream_offset extends stream's max stream
  ##    data value by |datalen|.
  ##   
  ##    This function returns 0 if it succeeds, or one of the following
  ##    negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_STREAM_NOT_FOUND
  ##        Stream was not found
  ## ```
proc ngtcp2_conn_extend_max_offset*(conn: ptr ngtcp2_conn; datalen: uint64) {.importc,
    cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_extend_max_offset extends max data offset by
  ##    |datalen|.
  ## ```
proc ngtcp2_conn_extend_max_streams_bidi*(conn: ptr ngtcp2_conn; n: uint) {.importc,
    cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_extend_max_streams_bidi extends the number of maximum
  ##    local bidirectional streams that a remote endpoint can open by |n|.
  ##   
  ##    The library does not increase maximum stream limit automatically.
  ##    The exception is when a stream is closed without
  ##    :type:ngtcp2_stream_open callback being called.  In this case,
  ##    stream limit is increased automatically.
  ## ```
proc ngtcp2_conn_extend_max_streams_uni*(conn: ptr ngtcp2_conn; n: uint) {.importc,
    cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_extend_max_streams_uni extends the number of maximum
  ##    local unidirectional streams that a remote endpoint can open by
  ##    |n|.
  ##   
  ##    The library does not increase maximum stream limit automatically.
  ##    The exception is when a stream is closed without
  ##    :type:ngtcp2_stream_open callback being called.  In this case,
  ##    stream limit is increased automatically.
  ## ```
proc ngtcp2_conn_get_dcid*(conn: ptr ngtcp2_conn): ptr ngtcp2_cid {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_dcid returns the non-NULL pointer to destination
  ##    connection ID.  If no destination connection ID is present, the
  ##    return value is not NULL, and its datalen field is 0.
  ## ```
proc ngtcp2_conn_get_num_scid*(conn: ptr ngtcp2_conn): uint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_num_scid returns the number of source connection
  ##    IDs which the local endpoint has provided to the peer and have not
  ##    retired.
  ## ```
proc ngtcp2_conn_get_scid*(conn: ptr ngtcp2_conn; dest: ptr ngtcp2_cid): uint {.importc,
    cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_scid writes the all source connection IDs which
  ##    the local endpoint has provided to the peer and have not retired in
  ##    |dest|.  The buffer pointed by |dest| must have
  ##    sizeof(ngtcp2_cid) n bytes available, where n is the return
  ##    value of ngtcp2_conn_get_num_scid().
  ## ```
proc ngtcp2_conn_get_num_active_dcid*(conn: ptr ngtcp2_conn): uint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_num_active_dcid returns the number of the active
  ##    destination connection ID.
  ## ```
proc ngtcp2_conn_get_active_dcid*(conn: ptr ngtcp2_conn; dest: ptr ngtcp2_cid_token): uint {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_active_dcid writes the all active destination
  ##    connection IDs and tokens to |dest|.  The buffer pointed by |dest|
  ##    must have sizeof(ngtcp2_cid_token) n bytes available, where n
  ##    is the return value of ngtcp2_conn_get_num_active_dcid().
  ## ```
proc ngtcp2_conn_get_negotiated_version*(conn: ptr ngtcp2_conn): uint32 {.importc,
    cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_negotiated_version returns the negotiated version.
  ## ```
proc ngtcp2_conn_early_data_rejected*(conn: ptr ngtcp2_conn): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_early_data_rejected tells |conn| that 0-RTT data was
  ##    rejected by a server.
  ## ```
proc ngtcp2_conn_get_conn_stat*(conn: ptr ngtcp2_conn; cstat: ptr ngtcp2_conn_stat) {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_conn_stat assigns connection statistics data to
  ##    |*cstat|.
  ## ```
proc ngtcp2_conn_on_loss_detection_timer*(conn: ptr ngtcp2_conn; ts: ngtcp2_tstamp): cint {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_on_loss_detection_timer should be called when a timer
  ##    returned from ngtcp2_conn_earliest_expiry fires.
  ##   
  ##    Application should call ngtcp2_conn_handshake if handshake has
  ##    not completed, otherwise ngtcp2_conn_write_pkt (or
  ##    ngtcp2_conn_write_stream if it has data to send) to send TLP/RTO
  ##    probe packets.
  ##   
  ##    This function must not be called from inside the callback
  ##    functions.
  ##   
  ##    This function returns 0 if it succeeds, or one of the following
  ##    negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_NOMEM
  ##        Out of memory
  ## ```
proc ngtcp2_conn_submit_crypto_data*(conn: ptr ngtcp2_conn;
                                    crypto_level: ngtcp2_crypto_level;
                                    data: ptr uint8; datalen: uint): cint {.importc,
    cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_submit_crypto_data submits crypto stream data |data|
  ##    of length |datalen| to the library for transmission.  The
  ##    encryption level is given in |crypto_level|.
  ##   
  ##    Application should keep the buffer pointed by |data| alive until
  ##    the data is acknowledged.  The acknowledgement is notified by
  ##    :type:ngtcp2_acked_crypto_offset callback.
  ## ```
proc ngtcp2_conn_submit_new_token*(conn: ptr ngtcp2_conn; token: ptr uint8;
                                  tokenlen: uint): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_submit_new_token submits address validation token.
  ##    It is sent in NEW_TOKEN frame.  Only server can call this function.
  ##    |tokenlen| must not be 0.
  ##   
  ##    This function makes a copy of the buffer pointed by |token| of
  ##    length |tokenlen|.
  ##   
  ##    This function returns 0 if it succeeds, or one of the following
  ##    negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_NOMEM
  ##        Out of memory.
  ## ```
proc ngtcp2_conn_set_local_addr*(conn: ptr ngtcp2_conn; `addr`: ptr ngtcp2_addr) {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_set_local_addr sets local endpoint address |addr| to
  ##    |conn|.
  ## ```
proc ngtcp2_conn_set_remote_addr*(conn: ptr ngtcp2_conn; `addr`: ptr ngtcp2_addr) {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_set_remote_addr sets remote endpoint address |addr|
  ##    to |conn|.
  ## ```
proc ngtcp2_conn_get_remote_addr*(conn: ptr ngtcp2_conn): ptr ngtcp2_addr {.importc,
    cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_remote_addr returns the remote endpoint address
  ##    set in |conn|.
  ## ```
proc ngtcp2_conn_initiate_migration*(conn: ptr ngtcp2_conn; path: ptr ngtcp2_path;
                                    ts: ngtcp2_tstamp): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_initiate_migration starts connection migration to the
  ##    given |path| which must not be NULL.  Only client can initiate
  ##    migration.  This function does immediate migration; it does not
  ##    probe peer reachability from a new local address.
  ##   
  ##    This function returns 0 if it succeeds, or one of the following
  ##    negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_INVALID_STATE
  ##        Migration is disabled.
  ##    :enum:NGTCP2_ERR_CONN_ID_BLOCKED
  ##        No unused connection ID is available.
  ##    :enum:NGTCP2_ERR_INVALID_ARGUMENT
  ##        |path| equals the current path.
  ##    :enum:NGTCP2_ERR_NOMEM
  ##        Out of memory
  ## ```
proc ngtcp2_conn_get_max_local_streams_uni*(conn: ptr ngtcp2_conn): uint64 {.importc,
    cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_max_local_streams_uni returns the cumulative
  ##    number of streams which local endpoint can open.
  ## ```
proc ngtcp2_conn_get_max_data_left*(conn: ptr ngtcp2_conn): uint64 {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_max_data_left returns the number of bytes that
  ##    this local endpoint can send in this connection.
  ## ```
proc ngtcp2_conn_get_streams_bidi_left*(conn: ptr ngtcp2_conn): uint64 {.importc,
    cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_streams_bidi_left returns the number of
  ##    bidirectional streams which the local endpoint can open without
  ##    violating stream concurrency limit.
  ## ```
proc ngtcp2_conn_get_streams_uni_left*(conn: ptr ngtcp2_conn): uint64 {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_streams_uni_left returns the number of
  ##    unidirectional streams which the local endpoint can open without
  ##    violating stream concurrency limit.
  ## ```
proc ngtcp2_conn_set_initial_crypto_ctx*(conn: ptr ngtcp2_conn;
                                        ctx: ptr ngtcp2_crypto_ctx) {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_set_initial_crypto_ctx sets |ctx| for Initial packet
  ##    encryption.  The passed data will be passed to
  ##    :type:ngtcp2_encrypt, :type:ngtcp2_decrypt and
  ##    :type:ngtcp2_hp_mask callbacks.
  ## ```
proc ngtcp2_conn_get_initial_crypto_ctx*(conn: ptr ngtcp2_conn): ptr ngtcp2_crypto_ctx {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_initial_crypto_ctx returns
  ##    :type:ngtcp2_crypto_ctx object for Initial packet encryption.
  ## ```
proc ngtcp2_conn_set_crypto_ctx*(conn: ptr ngtcp2_conn; ctx: ptr ngtcp2_crypto_ctx) {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_set_initial_crypto_ctx sets |ctx| for
  ##    0RTT/Handshake/Short packet encryption.  In other words, this
  ##    crypto context is used for all packets except for Initial packets.
  ##    The passed data will be passed to :type:ngtcp2_encrypt,
  ##    :type:ngtcp2_decrypt and :type:ngtcp2_hp_mask callbacks.
  ## ```
proc ngtcp2_conn_get_tls_native_handle*(conn: ptr ngtcp2_conn): pointer {.importc,
    cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_tls_native_handle returns TLS native handle set by
  ##    ngtcp2_conn_set_tls_native_handle().
  ## ```
proc ngtcp2_conn_set_tls_native_handle*(conn: ptr ngtcp2_conn;
                                       tls_native_handle: pointer) {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_set_tls_native_handle sets TLS native handle
  ##    |tls_native_handle| to |conn|.  Internally, it is used as an opaque
  ##    pointer.
  ## ```
proc ngtcp2_conn_set_retry_aead*(conn: ptr ngtcp2_conn;
                                aead: ptr ngtcp2_crypto_aead;
                                aead_ctx: ptr ngtcp2_crypto_aead_ctx) {.importc,
    cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_set_retry_aead sets |aead| and |aead_ctx| for Retry
  ##    integrity tag verification.  |aead| must be AEAD_AES_128_GCM.
  ##    |aead_ctx| must be initialized with :macro:NGTCP2_RETRY_KEY as
  ##    encryption key.  This function must be called if |conn| is
  ##    initialized as client.  Server does not verify the tag and has no
  ##    need to call this function.
  ##   
  ##    If this function succeeds, |conn| takes ownership of |aead_ctx|.
  ##    :type:ngtcp2_delete_crypto_aead_ctx will be called to delete this
  ##    object when it is no longer used.  If this function fails, the
  ##    caller is responsible to delete it.
  ## ```
proc ngtcp2_conn_get_crypto_ctx*(conn: ptr ngtcp2_conn): ptr ngtcp2_crypto_ctx {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_crypto_ctx returns :type:ngtcp2_crypto_ctx
  ##    object for 0RTT/Handshake/Short packet encryption.
  ## ```
proc ngtcp2_conn_get_connection_close_error_code*(conn: ptr ngtcp2_conn;
    ccec: ptr ngtcp2_connection_close_error_code) {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_get_connection_close_error_code stores the received
  ##    connection close error code in |ccec|.
  ## ```
proc ngtcp2_conn_is_local_stream*(conn: ptr ngtcp2_conn; stream_id: int64): cint {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_is_local_stream returns nonzero if |stream_id| denotes the
  ##    stream which a local endpoint issues.
  ## ```
proc ngtcp2_conn_is_server*(conn: ptr ngtcp2_conn): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_is_server returns nonzero if |conn| is initialized as
  ##    server.
  ## ```
proc ngtcp2_conn_after_retry*(conn: ptr ngtcp2_conn): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_after_retry returns nonzero if |conn| as a client has
  ##    received Retry packet from server and successfully validated it.
  ## ```
proc ngtcp2_conn_set_stream_user_data*(conn: ptr ngtcp2_conn; stream_id: int64;
                                      stream_user_data: pointer): cint {.importc,
    cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_conn_set_stream_user_data sets |stream_user_data| to the
  ##    stream identified by |stream_id|.
  ##   
  ##    This function returns 0 if it succeeds, or one of the following
  ##    negative error codes:
  ##   
  ##    :enum:NGTCP2_ERR_STREAM_NOT_FOUND
  ##        Stream does not exist
  ## ```
proc ngtcp2_strerror*(liberr: cint): cstring {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_strerror returns the text representation of |liberr|.
  ## ```
proc ngtcp2_err_is_fatal*(liberr: cint): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_err_is_fatal returns nonzero if |liberr| is a fatal error.
  ## ```
proc ngtcp2_err_infer_quic_transport_error_code*(liberr: cint): uint64 {.importc,
    cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_err_infer_quic_transport_error_code returns a QUIC
  ##    transport error code which corresponds to |liberr|.
  ## ```
proc ngtcp2_addr_init*(dest: ptr ngtcp2_addr; `addr`: ptr sockaddr; addrlen: uint;
                      user_data: pointer): ptr ngtcp2_addr {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_addr_init initializes |dest| with the given arguments and
  ##    returns |dest|.
  ## ```
proc ngtcp2_path_storage_init*(ps: ptr ngtcp2_path_storage;
                              local_addr: ptr sockaddr; local_addrlen: uint;
                              local_user_data: pointer; remote_addr: ptr sockaddr;
                              remote_addrlen: uint; remote_user_data: pointer) {.
    importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_path_storage_init initializes |ps| with the given
  ##    arguments.  This function copies |local_addr| and |remote_addr|.
  ## ```
proc ngtcp2_path_storage_zero*(ps: ptr ngtcp2_path_storage) {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_path_storage_zero initializes |ps| with the zero length
  ##    addresses.
  ## ```
proc ngtcp2_settings_default*(settings: ptr ngtcp2_settings) {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_settings_default initializes |settings| with the default
  ##    values.  First this function fills |settings| with 0 and set the
  ##    default value to the following fields:
  ##   
  ##    cc_algo = NGTCP2_CC_ALGO_CUBIC
  ##    initial_rtt = NGTCP2_DEFAULT_INITIAL_RTT
  ##    transport_params.max_udp_payload_size = NGTCP2_DEFAULT_MAX_UDP_PAYLOAD_SIZE
  ##    transport_params.ack_delay_component = NGTCP2_DEFAULT_ACK_DELAY_EXPONENT
  ##    transport_params.max_ack_delay = NGTCP2_DEFAULT_MAX_ACK_DELAY
  ##    transport_params.active_connection_id_limit =
  ##      NGTCP2_DEFAULT_ACTIVE_CONNECTION_ID_LIMIT
  ## ```
proc ngtcp2_mem_default*(): ptr ngtcp2_mem {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_mem_default returns the default, system standard memory
  ##    allocator.
  ## ```
proc ngtcp2_version*(least_version: cint): ptr ngtcp2_info {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    Returns a pointer to a ngtcp2_info struct with version information
  ##    about the run-time library in use.  The |least_version| argument
  ##    can be set to a 24 bit numerical value for the least accepted
  ##    version number and if the condition is not met, this function will
  ##    return a NULL.  Pass in 0 to skip the version checking.
  ## ```
proc ngtcp2_is_bidi_stream*(stream_id: int64): cint {.importc, cdecl.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_is_bidi_stream returns nonzero if |stream_id| denotes
  ##    bidirectional stream.
  ## ```
proc ngtcp2_log_info*(log: ptr ngtcp2_log; ev: ngtcp2_log_event; fmt: cstring) {.
    importc, cdecl, varargs.}
  ## ```
  ##   @function
  ##   
  ##    ngtcp2_log_info writes info level log.
  ## ```
{.pop.}
