import os
import strformat

# Socket definitions
import nativesockets

when defined(windows):
  {.passl: "-lws2_32".}
else:
  {.passc: "-DHAVE_UNISTD_H".}

# C include directories
const root = currentSourcePath.parentDir
const sourceInclude = root/"sources"/"lib"/"includes"
const buildInclude = root/"build"/"lib"/"includes"

{.passc: fmt"-I{sourceInclude} -I{buildInclude}".}

# Generated @ 2024-07-03T20:14:17+02:00
# Command line:
#   /nim/1.6.20/nimble/pkgs/nimterop-0.6.11/nimterop/toast --compile=./sources/lib/ngtcp2_acktr.c --compile=./sources/lib/ngtcp2_addr.c --compile=./sources/lib/ngtcp2_balloc.c --compile=./sources/lib/ngtcp2_bbr.c --compile=./sources/lib/ngtcp2_buf.c --compile=./sources/lib/ngtcp2_cc.c --compile=./sources/lib/ngtcp2_cid.c --compile=./sources/lib/ngtcp2_conn.c --compile=./sources/lib/ngtcp2_conv.c --compile=./sources/lib/ngtcp2_crypto.c --compile=./sources/lib/ngtcp2_err.c --compile=./sources/lib/ngtcp2_frame_chain.c --compile=./sources/lib/ngtcp2_gaptr.c --compile=./sources/lib/ngtcp2_idtr.c --compile=./sources/lib/ngtcp2_ksl.c --compile=./sources/lib/ngtcp2_log.c --compile=./sources/lib/ngtcp2_map.c --compile=./sources/lib/ngtcp2_mem.c --compile=./sources/lib/ngtcp2_objalloc.c --compile=./sources/lib/ngtcp2_opl.c --compile=./sources/lib/ngtcp2_path.c --compile=./sources/lib/ngtcp2_pkt.c --compile=./sources/lib/ngtcp2_pmtud.c --compile=./sources/lib/ngtcp2_ppe.c --compile=./sources/lib/ngtcp2_pq.c --compile=./sources/lib/ngtcp2_pv.c --compile=./sources/lib/ngtcp2_qlog.c --compile=./sources/lib/ngtcp2_range.c --compile=./sources/lib/ngtcp2_ringbuf.c --compile=./sources/lib/ngtcp2_rob.c --compile=./sources/lib/ngtcp2_rst.c --compile=./sources/lib/ngtcp2_rtb.c --compile=./sources/lib/ngtcp2_settings.c --compile=./sources/lib/ngtcp2_str.c --compile=./sources/lib/ngtcp2_strm.c --compile=./sources/lib/ngtcp2_transport_params.c --compile=./sources/lib/ngtcp2_unreachable.c --compile=./sources/lib/ngtcp2_vec.c --compile=./sources/lib/ngtcp2_version.c --compile=./sources/lib/ngtcp2_window_filter.c --pnim --preprocess --noHeader --defines=NGTCP2_STATICLIB --replace=sockaddr=SockAddr,SockAddr_storage=Sockaddr_storage,socklen_t=SockLen --includeDirs=./sources/lib/includes --includeDirs=./build/lib/includes ./sources/lib/includes/ngtcp2/ngtcp2.h

# const 'NGTCP2_PROTO_VER_MAX' has unsupported value 'NGTCP2_PROTO_VER_V1'
# const 'NGTCP2_PROTO_VER_MIN' has unsupported value 'NGTCP2_PROTO_VER_V1'
# const 'NGTCP2_PKT_INFO_VERSION' has unsupported value 'NGTCP2_PKT_INFO_V1'
# const 'NGTCP2_AF_INET' has unsupported value 'AF_INET'
# const 'NGTCP2_AF_INET6' has unsupported value 'AF_INET6'
# const 'NGTCP2_TRANSPORT_PARAMS_VERSION' has unsupported value 'NGTCP2_TRANSPORT_PARAMS_V1'
# const 'NGTCP2_CONN_INFO_VERSION' has unsupported value 'NGTCP2_CONN_INFO_V1'
# const 'NGTCP2_SETTINGS_VERSION' has unsupported value 'NGTCP2_SETTINGS_V2'
# const 'NGTCP2_CALLBACKS_VERSION' has unsupported value 'NGTCP2_CALLBACKS_V1'
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
{.passc: "-DNGTCP2_STATICLIB".}
{.passc: "-I./sources/lib/includes".}
{.passc: "-I./build/lib/includes".}
{.compile: "./sources/lib/ngtcp2_acktr.c".}
{.compile: "./sources/lib/ngtcp2_addr.c".}
{.compile: "./sources/lib/ngtcp2_balloc.c".}
{.compile: "./sources/lib/ngtcp2_bbr.c".}
{.compile: "./sources/lib/ngtcp2_buf.c".}
{.compile: "./sources/lib/ngtcp2_cc.c".}
{.compile: "./sources/lib/ngtcp2_cid.c".}
{.compile: "./sources/lib/ngtcp2_conn.c".}
{.compile: "./sources/lib/ngtcp2_conv.c".}
{.compile: "./sources/lib/ngtcp2_crypto.c".}
{.compile: "./sources/lib/ngtcp2_err.c".}
{.compile: "./sources/lib/ngtcp2_frame_chain.c".}
{.compile: "./sources/lib/ngtcp2_gaptr.c".}
{.compile: "./sources/lib/ngtcp2_idtr.c".}
{.compile: "./sources/lib/ngtcp2_ksl.c".}
{.compile: "./sources/lib/ngtcp2_log.c".}
{.compile: "./sources/lib/ngtcp2_map.c".}
{.compile: "./sources/lib/ngtcp2_mem.c".}
{.compile: "./sources/lib/ngtcp2_objalloc.c".}
{.compile: "./sources/lib/ngtcp2_opl.c".}
{.compile: "./sources/lib/ngtcp2_path.c".}
{.compile: "./sources/lib/ngtcp2_pkt.c".}
{.compile: "./sources/lib/ngtcp2_pmtud.c".}
{.compile: "./sources/lib/ngtcp2_ppe.c".}
{.compile: "./sources/lib/ngtcp2_pq.c".}
{.compile: "./sources/lib/ngtcp2_pv.c".}
{.compile: "./sources/lib/ngtcp2_qlog.c".}
{.compile: "./sources/lib/ngtcp2_range.c".}
{.compile: "./sources/lib/ngtcp2_ringbuf.c".}
{.compile: "./sources/lib/ngtcp2_rob.c".}
{.compile: "./sources/lib/ngtcp2_rst.c".}
{.compile: "./sources/lib/ngtcp2_rtb.c".}
{.compile: "./sources/lib/ngtcp2_settings.c".}
{.compile: "./sources/lib/ngtcp2_str.c".}
{.compile: "./sources/lib/ngtcp2_strm.c".}
{.compile: "./sources/lib/ngtcp2_transport_params.c".}
{.compile: "./sources/lib/ngtcp2_unreachable.c".}
{.compile: "./sources/lib/ngtcp2_vec.c".}
{.compile: "./sources/lib/ngtcp2_version.c".}
{.compile: "./sources/lib/ngtcp2_window_filter.c".}
defineEnum(ngtcp2_pkt_type) ## ```
                            ##   @enum
                            ##
                            ##    :type:ngtcp2_pkt_type defines QUIC version-independent QUIC
                            ##    packet types.
                            ## ```
defineEnum(ngtcp2_path_validation_result) ## ```
                                          ##   @enum
                                          ##
                                          ##    :type:ngtcp2_path_validation_result defines path validation
                                          ##    result code.
                                          ## ```
defineEnum(ngtcp2_cc_algo) ## ```
                           ##   @enum
                           ##
                           ##    :type:ngtcp2_cc_algo defines congestion control algorithms.
                           ## ```
defineEnum(ngtcp2_token_type) ## ```
                              ##   @enum
                              ##
                              ##    :type:ngtcp2_token_type defines the type of token.
                              ## ```
defineEnum(ngtcp2_encryption_level) ## ```
                                    ##   @enum
                                    ##
                                    ##    :type:ngtcp2_encryption_level is QUIC encryption level.
                                    ## ```
defineEnum(ngtcp2_connection_id_status_type) ## ```
                                             ##   @enum
                                             ##
                                             ##    :type:ngtcp2_connection_id_status_type defines a set of status
                                             ##    for Destination Connection ID.
                                             ## ```
defineEnum(ngtcp2_ccerr_type) ## ```
                              ##   @enum
                              ##
                              ##    :type:ngtcp2_ccerr_type defines connection error type.
                              ## ```
const
  NGTCP2_SECONDS* = (cast[ngtcp2_duration](1000000000'u64))
  NGTCP2_MILLISECONDS* = (cast[ngtcp2_duration](1000000'u64))
  NGTCP2_MICROSECONDS* = (cast[ngtcp2_duration](1000'u64))
  NGTCP2_NANOSECONDS* = (cast[ngtcp2_duration](1'u64))
  NGTCP2_PROTO_VER_V1* = (cast[uint32](0x00000001'u))
  NGTCP2_PROTO_VER_V2* = (cast[uint32](0x6B3343CF'u))
  NGTCP2_RESERVED_VERSION_MASK* = 0x0A0A0A0A'u
  NGTCP2_MAX_UDP_PAYLOAD_SIZE* = 1200
  NGTCP2_MAX_PMTUD_UDP_PAYLOAD_SIZE* = 1452
  NGTCP2_MAX_VARINT* = ((1'u64 shl typeof(1'u64)(62)) - typeof(1'u64)(1))
  NGTCP2_STATELESS_RESET_TOKENLEN* = 16
  NGTCP2_MIN_STATELESS_RESET_RANDLEN* = 5
  NGTCP2_PATH_CHALLENGE_DATALEN* = 8
  NGTCP2_RETRY_KEY_V1* = "�\fi\v�fWZ\x1DvkT�h�N"
  NGTCP2_RETRY_NONCE_V1* = "F\x15��]c+�#�%�"
  NGTCP2_RETRY_KEY_V2* = "���\eV�H�`��έ|̒"
  NGTCP2_RETRY_NONCE_V2* = "�ii�-|m���J"
  NGTCP2_HP_MASKLEN* = 5
  NGTCP2_HP_SAMPLELEN* = 16
  NGTCP2_DEFAULT_INITIAL_RTT* = (333 * typeof(333)(NGTCP2_MILLISECONDS))
  NGTCP2_MAX_CIDLEN* = 20
  NGTCP2_MIN_CIDLEN* = 1
  NGTCP2_MIN_INITIAL_DCIDLEN* = 8
  NGTCP2_ECN_NOT_ECT* = 0x00000000
  NGTCP2_ECN_ECT_1* = 0x00000001
  NGTCP2_ECN_ECT_0* = 0x00000002
  NGTCP2_ECN_CE* = 0x00000003
  NGTCP2_ECN_MASK* = 0x00000003
  NGTCP2_PKT_INFO_V1* = 1
  NGTCP2_ERR_INVALID_ARGUMENT* = -201
  NGTCP2_ERR_NOBUF* = -202
  NGTCP2_ERR_PROTO* = -203
  NGTCP2_ERR_INVALID_STATE* = -204
  NGTCP2_ERR_ACK_FRAME* = -205
  NGTCP2_ERR_STREAM_ID_BLOCKED* = -206
  NGTCP2_ERR_STREAM_IN_USE* = -207
  NGTCP2_ERR_STREAM_DATA_BLOCKED* = -208
  NGTCP2_ERR_FLOW_CONTROL* = -209
  NGTCP2_ERR_CONNECTION_ID_LIMIT* = -210
  NGTCP2_ERR_STREAM_LIMIT* = -211
  NGTCP2_ERR_FINAL_SIZE* = -212
  NGTCP2_ERR_CRYPTO* = -213
  NGTCP2_ERR_PKT_NUM_EXHAUSTED* = -214
  NGTCP2_ERR_REQUIRED_TRANSPORT_PARAM* = -215
  NGTCP2_ERR_MALFORMED_TRANSPORT_PARAM* = -216
  NGTCP2_ERR_FRAME_ENCODING* = -217
  NGTCP2_ERR_DECRYPT* = -218
  NGTCP2_ERR_STREAM_SHUT_WR* = -219
  NGTCP2_ERR_STREAM_NOT_FOUND* = -220
  NGTCP2_ERR_STREAM_STATE* = -221
  NGTCP2_ERR_RECV_VERSION_NEGOTIATION* = -222
  NGTCP2_ERR_CLOSING* = -223
  NGTCP2_ERR_DRAINING* = -224
  NGTCP2_ERR_TRANSPORT_PARAM* = -225
  NGTCP2_ERR_DISCARD_PKT* = -226
  NGTCP2_ERR_CONN_ID_BLOCKED* = -227
  NGTCP2_ERR_INTERNAL* = -228
  NGTCP2_ERR_CRYPTO_BUFFER_EXCEEDED* = -229
  NGTCP2_ERR_WRITE_MORE* = -230
  NGTCP2_ERR_RETRY* = -231
  NGTCP2_ERR_DROP_CONN* = -232
  NGTCP2_ERR_AEAD_LIMIT_REACHED* = -233
  NGTCP2_ERR_NO_VIABLE_PATH* = -234
  NGTCP2_ERR_VERSION_NEGOTIATION* = -235
  NGTCP2_ERR_HANDSHAKE_TIMEOUT* = -236
  NGTCP2_ERR_VERSION_NEGOTIATION_FAILURE* = -237
  NGTCP2_ERR_IDLE_CLOSE* = -238
  NGTCP2_ERR_FATAL* = -500
  NGTCP2_ERR_NOMEM* = -501
  NGTCP2_ERR_CALLBACK_FAILURE* = -502
  NGTCP2_PKT_FLAG_NONE* = 0x00000000'u
  NGTCP2_PKT_FLAG_LONG_FORM* = 0x00000001'u
  NGTCP2_PKT_FLAG_FIXED_BIT_CLEAR* = 0x00000002'u
  NGTCP2_PKT_FLAG_KEY_PHASE* = 0x00000004'u
  NGTCP2_PKT_VERSION_NEGOTIATION* = (0x00000080).ngtcp2_pkt_type ## ```
                                                                 ##   :enum:NGTCP2_PKT_VERSION_NEGOTIATION is defined by libngtcp2
                                                                 ##      for convenience.
                                                                 ## ```
  NGTCP2_PKT_STATELESS_RESET* = (0x00000081).ngtcp2_pkt_type ## ```
                                                             ##   :enum:NGTCP2_PKT_STATELESS_RESET is defined by libngtcp2 for
                                                             ##      convenience.
                                                             ## ```
  NGTCP2_PKT_INITIAL* = (0x00000010).ngtcp2_pkt_type ## ```
                                                     ##   :enum:NGTCP2_PKT_INITIAL indicates Initial packet.
                                                     ## ```
  NGTCP2_PKT_0RTT* = (0x00000011).ngtcp2_pkt_type ## ```
                                                  ##   :enum:NGTCP2_PKT_0RTT indicates 0-RTT packet.
                                                  ## ```
  NGTCP2_PKT_HANDSHAKE* = (0x00000012).ngtcp2_pkt_type ## ```
                                                       ##   :enum:NGTCP2_PKT_HANDSHAKE indicates Handshake packet.
                                                       ## ```
  NGTCP2_PKT_RETRY* = (0x00000013).ngtcp2_pkt_type ## ```
                                                   ##   :enum:NGTCP2_PKT_RETRY indicates Retry packet.
                                                   ## ```
  NGTCP2_PKT_1RTT* = (0x00000040).ngtcp2_pkt_type ## ```
                                                  ##   :enum:NGTCP2_PKT_1RTT is defined by libngtcp2 for convenience.
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
  NGTCP2_AEAD_LIMIT_REACHED* = 0x0000000F'u
  NGTCP2_NO_VIABLE_PATH* = 0x00000010'u
  NGTCP2_CRYPTO_ERROR* = 0x00000100'u
  NGTCP2_VERSION_NEGOTIATION_ERROR* = 0x00000011
  NGTCP2_PATH_VALIDATION_RESULT_SUCCESS* = (0).ngtcp2_path_validation_result ## ```
                                                                             ##   :enum:NGTCP2_PATH_VALIDATION_RESULT_SUCCESS indicates
                                                                             ##      successful validation.
                                                                             ## ```
  NGTCP2_PATH_VALIDATION_RESULT_FAILURE* = (
      NGTCP2_PATH_VALIDATION_RESULT_SUCCESS + 1).ngtcp2_path_validation_result ## ```
                                                                               ##   :enum:NGTCP2_PATH_VALIDATION_RESULT_FAILURE indicates
                                                                               ##      validation failure.
                                                                               ## ```
  NGTCP2_PATH_VALIDATION_RESULT_ABORTED* = (
      NGTCP2_PATH_VALIDATION_RESULT_FAILURE + 1).ngtcp2_path_validation_result ## ```
                                                                               ##   :enum:NGTCP2_PATH_VALIDATION_RESULT_ABORTED indicates that path
                                                                               ##      validation was aborted.
                                                                               ## ```
  NGTCP2_DEFAULT_MAX_RECV_UDP_PAYLOAD_SIZE* = 65527
  NGTCP2_DEFAULT_ACK_DELAY_EXPONENT* = 3
  NGTCP2_DEFAULT_MAX_ACK_DELAY* = (25 * typeof(25)(NGTCP2_MILLISECONDS))
  NGTCP2_DEFAULT_ACTIVE_CONNECTION_ID_LIMIT* = 2
  NGTCP2_TLSEXT_QUIC_TRANSPORT_PARAMETERS_V1* = 0x00000039'u
  NGTCP2_TRANSPORT_PARAMS_V1* = 1
  NGTCP2_CONN_INFO_V1* = 1
  NGTCP2_CC_ALGO_RENO* = (0x00000000).ngtcp2_cc_algo ## ```
                                                     ##   :enum:NGTCP2_CC_ALGO_RENO represents Reno.
                                                     ## ```
  NGTCP2_CC_ALGO_CUBIC* = (0x00000001).ngtcp2_cc_algo ## ```
                                                      ##   :enum:NGTCP2_CC_ALGO_CUBIC represents Cubic.
                                                      ## ```
  NGTCP2_CC_ALGO_BBR* = (0x00000002).ngtcp2_cc_algo ## ```
                                                    ##   :enum:NGTCP2_CC_ALGO_BBR represents BBR v2.
                                                    ## ```
  NGTCP2_QLOG_WRITE_FLAG_NONE* = 0x00000000'u
  NGTCP2_QLOG_WRITE_FLAG_FIN* = 0x00000001'u
  NGTCP2_TOKEN_TYPE_UNKNOWN* = (0).ngtcp2_token_type ## ```
                                                     ##   :enum:NGTCP2_TOKEN_TYPE_UNKNOWN indicates that the type of
                                                     ##      token is unknown.
                                                     ## ```
  NGTCP2_TOKEN_TYPE_RETRY* = (NGTCP2_TOKEN_TYPE_UNKNOWN + 1).ngtcp2_token_type ## ```
                                                                               ##   :enum:NGTCP2_TOKEN_TYPE_RETRY indicates that a token comes from
                                                                               ##      Retry packet.
                                                                               ## ```
  NGTCP2_TOKEN_TYPE_NEW_TOKEN* = (NGTCP2_TOKEN_TYPE_RETRY + 1).ngtcp2_token_type ## ```
                                                                                 ##   :enum:NGTCP2_TOKEN_TYPE_NEW_TOKEN indicates that a token comes
                                                                                 ##      from NEW_TOKEN frame.
                                                                                 ## ```
  NGTCP2_SETTINGS_V1* = 1
  NGTCP2_SETTINGS_V2* = 2
  NGTCP2_ENCRYPTION_LEVEL_INITIAL* = (0).ngtcp2_encryption_level ## ```
                                                                 ##   :enum:NGTCP2_ENCRYPTION_LEVEL_INITIAL is Initial encryption
                                                                 ##      level.
                                                                 ## ```
  NGTCP2_ENCRYPTION_LEVEL_HANDSHAKE* = (NGTCP2_ENCRYPTION_LEVEL_INITIAL + 1).ngtcp2_encryption_level ## ```
                                                                                                     ##   :enum:NGTCP2_ENCRYPTION_LEVEL_HANDSHAKE is Handshake encryption
                                                                                                     ##      level.
                                                                                                     ## ```
  NGTCP2_ENCRYPTION_LEVEL_1RTT* = (NGTCP2_ENCRYPTION_LEVEL_HANDSHAKE + 1).ngtcp2_encryption_level ## ```
                                                                                                  ##   :enum:NGTCP2_ENCRYPTION_LEVEL_1RTT is 1-RTT encryption level.
                                                                                                  ## ```
  NGTCP2_ENCRYPTION_LEVEL_0RTT* = (NGTCP2_ENCRYPTION_LEVEL_1RTT + 1).ngtcp2_encryption_level ## ```
                                                                                             ##   :enum:NGTCP2_ENCRYPTION_LEVEL_0RTT is 0-RTT encryption level.
                                                                                             ## ```
  NGTCP2_STREAM_DATA_FLAG_NONE* = 0x00000000'u
  NGTCP2_STREAM_DATA_FLAG_FIN* = 0x00000001'u
  NGTCP2_STREAM_DATA_FLAG_0RTT* = 0x00000002'u
  NGTCP2_STREAM_CLOSE_FLAG_NONE* = 0x00000000'u
  NGTCP2_STREAM_CLOSE_FLAG_APP_ERROR_CODE_SET* = 0x00000001'u
  NGTCP2_PATH_VALIDATION_FLAG_NONE* = 0x00000000'u
  NGTCP2_PATH_VALIDATION_FLAG_PREFERRED_ADDR* = 0x00000001'u
  NGTCP2_PATH_VALIDATION_FLAG_NEW_TOKEN* = 0x00000002'u
  NGTCP2_CONNECTION_ID_STATUS_TYPE_ACTIVATE* = (0).ngtcp2_connection_id_status_type ## ```
                                                                                    ##   :enum:NGTCP2_CONNECTION_ID_STATUS_TYPE_ACTIVATE indicates that
                                                                                    ##      a local endpoint starts using new Destination Connection ID.
                                                                                    ## ```
  NGTCP2_CONNECTION_ID_STATUS_TYPE_DEACTIVATE* = (
      NGTCP2_CONNECTION_ID_STATUS_TYPE_ACTIVATE + 1).ngtcp2_connection_id_status_type ## ```
                                                                                      ##   :enum:NGTCP2_CONNECTION_ID_STATUS_TYPE_DEACTIVATE indicates
                                                                                      ##      that a local endpoint stops using a given Destination Connection
                                                                                      ##      ID.
                                                                                      ## ```
  NGTCP2_DATAGRAM_FLAG_NONE* = 0x00000000'u
  NGTCP2_DATAGRAM_FLAG_0RTT* = 0x00000001'u
  NGTCP2_CALLBACKS_V1* = 1
  NGTCP2_WRITE_STREAM_FLAG_NONE* = 0x00000000'u
  NGTCP2_WRITE_STREAM_FLAG_MORE* = 0x00000001'u
  NGTCP2_WRITE_STREAM_FLAG_FIN* = 0x00000002'u
  NGTCP2_WRITE_DATAGRAM_FLAG_NONE* = 0x00000000'u
  NGTCP2_WRITE_DATAGRAM_FLAG_MORE* = 0x00000001'u
  NGTCP2_CCERR_TYPE_TRANSPORT* = (0).ngtcp2_ccerr_type ## ```
                                                       ##   :enum:NGTCP2_CCERR_TYPE_TRANSPORT indicates the QUIC transport
                                                       ##      error, and the error code is QUIC transport error code.
                                                       ## ```
  NGTCP2_CCERR_TYPE_APPLICATION* = (NGTCP2_CCERR_TYPE_TRANSPORT + 1).ngtcp2_ccerr_type ## ```
                                                                                       ##   :enum:NGTCP2_CCERR_TYPE_APPLICATION indicates an application
                                                                                       ##      error, and the error code is application error code.
                                                                                       ## ```
  NGTCP2_CCERR_TYPE_VERSION_NEGOTIATION* = (NGTCP2_CCERR_TYPE_APPLICATION + 1).ngtcp2_ccerr_type ## ```
                                                                                                 ##   :enum:NGTCP2_CCERR_TYPE_VERSION_NEGOTIATION is a special case
                                                                                                 ##      of QUIC transport error, and it indicates that client receives
                                                                                                 ##      Version Negotiation packet.
                                                                                                 ## ```
  NGTCP2_CCERR_TYPE_IDLE_CLOSE* = (NGTCP2_CCERR_TYPE_VERSION_NEGOTIATION + 1).ngtcp2_ccerr_type ## ```
                                                                                                ##   :enum:NGTCP2_CCERR_TYPE_IDLE_CLOSE is a special case of QUIC
                                                                                                ##      transport error, and it indicates that connection is closed
                                                                                                ##      because of idle timeout.
                                                                                                ## ```
  NGTCP2_CCERR_TYPE_DROP_CONN* = (NGTCP2_CCERR_TYPE_IDLE_CLOSE + 1).ngtcp2_ccerr_type ## ```
                                                                                      ##   :enum:NGTCP2_CCERR_TYPE_DROP_CONN is a special case of QUIC
                                                                                      ##      transport error, and it indicates that connection should be
                                                                                      ##      dropped without sending a CONNECTION_CLOSE frame.
                                                                                      ## ```
  NGTCP2_CCERR_TYPE_RETRY* = (NGTCP2_CCERR_TYPE_DROP_CONN + 1).ngtcp2_ccerr_type ## ```
                                                                                 ##   :enum:NGTCP2_CCERR_TYPE_RETRY is a special case of QUIC
                                                                                 ##      transport error, and it indicates that RETRY packet should be
                                                                                 ##      sent to a client.
                                                                                 ## ```
  NGTCP2_VERSION_AGE* = 1
type
  ngtcp2_ssize* = ByteAddress ## ```
                              ##   @typedef
                              ##
                              ##    :type:ngtcp2_ssize is signed counterpart of size_t.
                              ## ```
  ngtcp2_malloc* = proc (size: uint; user_data: pointer): pointer {.cdecl.}
  ngtcp2_free* = proc (`ptr`: pointer; user_data: pointer) {.cdecl.}
  ngtcp2_calloc* = proc (nmemb: uint; size: uint; user_data: pointer): pointer {.
      cdecl.}
  ngtcp2_realloc* = proc (`ptr`: pointer; size: uint; user_data: pointer): pointer {.
      cdecl.}
  ngtcp2_mem* {.bycopy.} = object ## ```
                                   ##   @struct
                                   ##
                                   ##    :type:ngtcp2_mem is a custom memory allocator.  The
                                   ##    :member:user_data field is passed to each allocator function.
                                   ##    This can be used, for example, to achieve per-connection memory
                                   ##    pool.
                                   ##
                                   ##    In the following example code, my_malloc, my_free,
                                   ##    my_calloc and my_realloc are the replacement of the
                                   ##    standard allocators :manpage:malloc(3), :manpage:free(3),
                                   ##    :manpage:calloc(3) and :manpage:realloc(3) respectively::
                                   ##
                                   ##        voidmy_malloc_cb(size_t size, voiduser_data) {
                                   ##          (void)user_data;
                                   ##          return my_malloc(size);
                                   ##        }
                                   ##
                                   ##        void my_free_cb(voidptr, voiduser_data) {
                                   ##          (void)user_data;
                                   ##          my_free(ptr);
                                   ##        }
                                   ##
                                   ##        voidmy_calloc_cb(size_t nmemb, size_t size, voiduser_data) {
                                   ##          (void)user_data;
                                   ##          return my_calloc(nmemb, size);
                                   ##        }
                                   ##
                                   ##        voidmy_realloc_cb(voidptr, size_t size, voiduser_data) {
                                   ##          (void)user_data;
                                   ##          return my_realloc(ptr, size);
                                   ##        }
                                   ##
                                   ##        void conn_new() {
                                   ##          ngtcp2_mem mem = {NULL, my_malloc_cb, my_free_cb, my_calloc_cb,
                                   ##                            my_realloc_cb};
                                   ##
                                   ##          ...
                                   ##        }
                                   ## ```
    user_data*: pointer ## ```
                        ##   :member:user_data is an arbitrary user supplied data.  This
                        ##      is passed to each allocator function.
                        ## ```
    malloc*: ngtcp2_malloc ## ```
                           ##   :member:malloc is a custom allocator function to replace
                           ##      :manpage:malloc(3).
                           ## ```
    free*: ngtcp2_free ## ```
                       ##   :member:free is a custom allocator function to replace
                       ##      :manpage:free(3).
                       ## ```
    calloc*: ngtcp2_calloc ## ```
                           ##   :member:calloc is a custom allocator function to replace
                           ##      :manpage:calloc(3).
                           ## ```
    realloc*: ngtcp2_realloc ## ```
                             ##   :member:realloc is a custom allocator function to replace
                             ##      :manpage:realloc(3).
                             ## ```

  ngtcp2_pkt_info* {.bycopy.} = object ## ```
                                        ##   @struct
                                        ##
                                        ##    :type:ngtcp2_pkt_info is a packet metadata.
                                        ## ```
    ecn*: uint8 ## ```
                ##   :member:ecn is ECN marking, and when it is passed to
                ##      ngtcp2_conn_read_pkt(), it should be either
                ##      :macro:NGTCP2_ECN_NOT_ECT, :macro:NGTCP2_ECN_ECT_1,
                ##      :macro:NGTCP2_ECN_ECT_0, or :macro:NGTCP2_ECN_CE.
                ## ```

  ngtcp2_tstamp* = uint64 ## ```
                          ##   @typedef
                          ##
                          ##    :type:ngtcp2_tstamp is a timestamp with nanosecond resolution.
                          ##    UINT64_MAX is an invalid value, and it is often used to
                          ##    indicate that no value is set.
                          ## ```
  ngtcp2_duration* = uint64 ## ```
                            ##   @typedef
                            ##
                            ##    :type:ngtcp2_duration is a period of time in nanosecond
                            ##    resolution.  UINT64_MAX is an invalid value, and it is often
                            ##    used to indicate that no value is set.
                            ## ```
  ngtcp2_cid* {.bycopy.} = object ## ```
                                   ##   @struct
                                   ##
                                   ##    :type:ngtcp2_cid holds a Connection ID.
                                   ## ```
    datalen*: uint           ## ```
                             ##   :member:datalen is the length of Connection ID.
                             ## ```
    data*: array[20, uint8] ## ```
                            ##   :member:data is the buffer to store Connection ID.
                            ## ```

  ngtcp2_vec* {.bycopy.} = object ## ```
                                   ##   @struct
                                   ##
                                   ##    :type:ngtcp2_vec is struct iovec compatible structure to
                                   ##    reference arbitrary array of bytes.
                                   ## ```
    base*: ptr uint8         ## ```
                             ##   :member:base points to the data.
                             ## ```
    len*: uint ## ```
               ##   :member:len is the number of bytes which the buffer pointed by
               ##      base contains.
               ## ```

  ngtcp2_pkt_hd* {.bycopy.} = object ## ```
                                      ##   @struct
                                      ##
                                      ##    :type:ngtcp2_pkt_hd represents QUIC packet header.
                                      ## ```
    dcid*: ngtcp2_cid        ## ```
                             ##   :member:dcid is Destination Connection ID.
                             ## ```
    scid*: ngtcp2_cid        ## ```
                             ##   :member:scid is Source Connection ID.
                             ## ```
    pkt_num*: int64          ## ```
                             ##   :member:pkt_num is a packet number.
                             ## ```
    token*: ptr uint8 ## ```
                      ##   :member:token contains token.  Only Initial packet may contain
                      ##      token.  NULL if no token is present.
                      ## ```
    tokenlen*: uint ## ```
                    ##   :member:tokenlen is the length of :member:token.  0 if no
                    ##      token is present.
                    ## ```
    pkt_numlen*: uint ## ```
                      ##   :member:pkt_numlen is the number of bytes spent to encode
                      ##      :member:pkt_num.
                      ## ```
    len*: uint ## ```
               ##   :member:len is the sum of :member:pkt_numlen and the length
               ##      of QUIC packet payload.
               ## ```
    version*: uint32         ## ```
                             ##   :member:version is QUIC version.
                             ## ```
    `type`*: uint8 ## ```
                   ##   :member:type is a type of QUIC packet.  This field does not
                   ##      have a QUIC packet type defined for a specific QUIC version.
                   ##      Instead, it contains version independent packet type defined by
                   ##      this library.  See :type:ngtcp2_pkt_type.
                   ## ```
    flags*: uint8 ## ```
                  ##   :member:flags is zero or more of :macro:NGTCP2_PKT_FLAG_*
                  ##      <NGTCP2_PKT_FLAG_NONE>.
                  ## ```

  ngtcp2_pkt_stateless_reset* {.bycopy.} = object ## ```
                                                   ##   @struct
                                                   ##
                                                   ##    :type:ngtcp2_pkt_stateless_reset represents Stateless Reset.
                                                   ## ```
    stateless_reset_token*: array[16, uint8] ## ```
                                             ##   :member:stateless_reset_token contains stateless reset token.
                                             ## ```
    rand*: ptr uint8 ## ```
                     ##   :member:rand points a buffer which contains random bytes
                     ##      section.
                     ## ```
    randlen*: uint           ## ```
                             ##   :member:randlen is the number of random bytes.
                             ## ```

  ngtcp2_SockAddr* = SockAddr ## ```
                              ##   @typedef
                              ##
                              ##    :type:ngtcp2_sockaddr is typedefed to struct sockaddr.  If
                              ##    :macro:NGTCP2_USE_GENERIC_SOCKADDR is defined, it is typedefed to
                              ##    the generic struct sockaddr defined in ngtcp2.h.
                              ## ```
  ngtcp2_SockAddr_in* = SockAddr_in ## ```
                                    ##   @typedef
                                    ##
                                    ##    :type:ngtcp2_sockaddr_in is typedefed to struct sockaddr_in.  If
                                    ##    :macro:NGTCP2_USE_GENERIC_SOCKADDR is defined, it is typedefed to
                                    ##    the generic struct sockaddr_in defined in ngtcp2.h.
                                    ## ```
  ngtcp2_SockAddr_in6* = SockAddr_in6 ## ```
                                      ##   @typedef
                                      ##
                                      ##    :type:ngtcp2_sockaddr_in6 is typedefed to struct sockaddr_in6.
                                      ##    If :macro:NGTCP2_USE_GENERIC_SOCKADDR is defined, it is typedefed
                                      ##    to the generic struct sockaddr_in6 defined in ngtcp2.h.
                                      ## ```
  ngtcp2_socklen* = SockLen ## ```
                            ##   @typedef
                            ##
                            ##    :type:ngtcp2_socklen is typedefed to socklen_t.  If
                            ##    :macro:NGTCP2_USE_GENERIC_SOCKADDR is defined, it is typedefed to
                            ##    uint32_t.
                            ## ```
  ngtcp2_SockAddr_union* {.union, bycopy.} = object ## ```
                                                     ##   @struct
                                                     ##
                                                     ##    :type:ngtcp2_sockaddr_union conveniently includes all supported
                                                     ##    address types.
                                                     ## ```
    sa*: ngtcp2_SockAddr
    `in`*: ngtcp2_SockAddr_in
    in6*: ngtcp2_SockAddr_in6

  ngtcp2_preferred_addr* {.bycopy.} = object ## ```
                                              ##   @struct
                                              ##
                                              ##    :type:ngtcp2_preferred_addr represents preferred address
                                              ##    structure.
                                              ## ```
    cid*: ngtcp2_cid         ## ```
                             ##   :member:cid is a Connection ID.
                             ## ```
    ipv4*: ngtcp2_SockAddr_in ## ```
                              ##   :member:ipv4 contains IPv4 address and port.
                              ## ```
    ipv6*: ngtcp2_SockAddr_in6 ## ```
                               ##   :member:ipv6 contains IPv6 address and port.
                               ## ```
    ipv4_present*: uint8 ## ```
                         ##   :member:ipv4_present indicates that :member:ipv4 contains
                         ##      IPv4 address and port.
                         ## ```
    ipv6_present*: uint8 ## ```
                         ##   :member:ipv6_present indicates that :member:ipv6 contains
                         ##      IPv6 address and port.
                         ## ```
    stateless_reset_token*: array[16, uint8] ## ```
                                             ##   :member:stateless_reset_token contains stateless reset token.
                                             ## ```

  ngtcp2_version_info* {.bycopy.} = object ## ```
                                            ##   @struct
                                            ##
                                            ##    :type:ngtcp2_version_info represents version_information
                                            ##    structure.  See :rfc:9368.
                                            ## ```
    chosen_version*: uint32 ## ```
                            ##   :member:chosen_version is the version chosen by the sender.
                            ## ```
    available_versions*: ptr uint8 ## ```
                                   ##   :member:available_versions points the wire image of
                                   ##      available_versions field.  The each version is therefore in
                                   ##      network byte order.
                                   ## ```
    available_versionslen*: uint ## ```
                                 ##   :member:available_versionslen is the number of bytes pointed by
                                 ##      :member:available_versions, not the number of versions
                                 ##      included.
                                 ## ```

  ngtcp2_transport_params* {.bycopy.} = object ## ```
                                                ##   @struct
                                                ##
                                                ##    :type:ngtcp2_transport_params represents QUIC transport
                                                ##    parameters.
                                                ## ```
    preferred_addr*: ngtcp2_preferred_addr ## ```
                                           ##   :member:preferred_addr contains preferred address if
                                           ##      :member:preferred_addr_present is nonzero.
                                           ## ```
    original_dcid*: ngtcp2_cid ## ```
                               ##   :member:original_dcid is the Destination Connection ID field
                               ##      from the first Initial packet from client.  Server must specify
                               ##      this field and set :member:original_dcid_present to nonzero.
                               ##      It is expected that application knows the original Destination
                               ##      Connection ID even if it sends Retry packet, for example, by
                               ##      including it in retry token.  Otherwise, application should not
                               ##      specify this field.
                               ## ```
    initial_scid*: ngtcp2_cid ## ```
                              ##   :member:initial_scid is the Source Connection ID field from the
                              ##      first Initial packet the local endpoint sends.  Application
                              ##      should not specify this field.  If :member:initial_scid_present
                              ##      is set to nonzero, it indicates this field is set.
                              ## ```
    retry_scid*: ngtcp2_cid ## ```
                            ##   :member:retry_scid is the Source Connection ID field from Retry
                            ##      packet.  Only server uses this field.  If server application
                            ##      received Initial packet with retry token from client, and server
                            ##      successfully verified its token, server application must set
                            ##      Destination Connection ID field from the Initial packet to this
                            ##      field, and set :member:retry_scid_present to nonzero.  Server
                            ##      application must verify that the Destination Connection ID from
                            ##      Initial packet was sent in Retry packet by, for example,
                            ##      including the Connection ID in a token, or including it in AAD
                            ##      when encrypting a token.
                            ## ```
    initial_max_stream_data_bidi_local*: uint64 ## ```
                                                ##   :member:initial_max_stream_data_bidi_local is the size of flow
                                                ##      control window of locally initiated stream.  This is the number
                                                ##      of bytes that the remote endpoint can send, and the local
                                                ##      endpoint must ensure that it has enough buffer to receive them.
                                                ## ```
    initial_max_stream_data_bidi_remote*: uint64 ## ```
                                                 ##   :member:initial_max_stream_data_bidi_remote is the size of flow
                                                 ##      control window of remotely initiated stream.  This is the number
                                                 ##      of bytes that the remote endpoint can send, and the local
                                                 ##      endpoint must ensure that it has enough buffer to receive them.
                                                 ## ```
    initial_max_stream_data_uni*: uint64 ## ```
                                         ##   :member:initial_max_stream_data_uni is the size of flow control
                                         ##      window of remotely initiated unidirectional stream.  This is the
                                         ##      number of bytes that the remote endpoint can send, and the local
                                         ##      endpoint must ensure that it has enough buffer to receive them.
                                         ## ```
    initial_max_data*: uint64 ## ```
                              ##   :member:initial_max_data is the connection level flow control
                              ##      window.
                              ## ```
    initial_max_streams_bidi*: uint64 ## ```
                                      ##   :member:initial_max_streams_bidi is the number of concurrent
                                      ##      streams that the remote endpoint can create.
                                      ## ```
    initial_max_streams_uni*: uint64 ## ```
                                     ##   :member:initial_max_streams_uni is the number of concurrent
                                     ##      unidirectional streams that the remote endpoint can create.
                                     ## ```
    max_idle_timeout*: ngtcp2_duration ## ```
                                       ##   :member:max_idle_timeout is a duration during which sender
                                       ##      allows quiescent.  0 means no idle timeout.  It must not be
                                       ##      UINT64_MAX.
                                       ## ```
    max_udp_payload_size*: uint64 ## ```
                                  ##   :member:max_udp_payload_size is the maximum UDP payload size
                                  ##      that the local endpoint can receive.
                                  ## ```
    active_connection_id_limit*: uint64 ## ```
                                        ##   :member:active_connection_id_limit is the maximum number of
                                        ##      Connection ID that sender can store.
                                        ## ```
    ack_delay_exponent*: uint64 ## ```
                                ##   :member:ack_delay_exponent is the exponent used in ACK Delay
                                ##      field in ACK frame.
                                ## ```
    max_ack_delay*: ngtcp2_duration ## ```
                                    ##   :member:max_ack_delay is the maximum acknowledgement delay by
                                    ##      which the local endpoint will delay sending acknowledgements.  It
                                    ##      must be strictly less than (1 << 14) milliseconds.
                                    ##      Sub-millisecond part is dropped when sending it in a QUIC
                                    ##      transport parameter.
                                    ## ```
    max_datagram_frame_size*: uint64 ## ```
                                     ##   :member:max_datagram_frame_size is the maximum size of DATAGRAM
                                     ##      frame that the local endpoint willingly receives.  Specifying 0
                                     ##      disables DATAGRAM support.  See :rfc:9221.
                                     ## ```
    stateless_reset_token_present*: uint8 ## ```
                                          ##   :member:stateless_reset_token_present is nonzero if
                                          ##      :member:stateless_reset_token field is set.
                                          ## ```
    disable_active_migration*: uint8 ## ```
                                     ##   :member:disable_active_migration is nonzero if the local
                                     ##      endpoint does not support active connection migration.
                                     ## ```
    original_dcid_present*: uint8 ## ```
                                  ##   :member:original_dcid_present is nonzero if
                                  ##      :member:original_dcid field is set.
                                  ## ```
    initial_scid_present*: uint8 ## ```
                                 ##   :member:initial_scid_present is nonzero if
                                 ##      :member:initial_scid field is set.
                                 ## ```
    retry_scid_present*: uint8 ## ```
                               ##   :member:retry_scid_present is nonzero if :member:retry_scid
                               ##      field is set.
                               ## ```
    preferred_addr_present*: uint8 ## ```
                                   ##   :member:preferred_addr_present is nonzero if
                                   ##      :member:preferred_address is set.
                                   ## ```
    stateless_reset_token*: array[16, uint8] ## ```
                                             ##   :member:stateless_reset_token contains stateless reset token.
                                             ## ```
    grease_quic_bit*: uint8 ## ```
                            ##   :member:grease_quic_bit is nonzero if sender supports "Greasing
                            ##      the QUIC Bit" extension.  See :rfc:9287.
                            ## ```
    version_info*: ngtcp2_version_info ## ```
                                       ##   :member:version_info contains version_information field if
                                       ##      :member:version_info_present is nonzero.  Application should
                                       ##      not specify this field.
                                       ## ```
    version_info_present*: uint8 ## ```
                                 ##   :member:version_info_present is nonzero if
                                 ##      :member:version_info is set.  Application should not specify
                                 ##      this field.
                                 ## ```

  ngtcp2_conn_info* {.bycopy.} = object ## ```
                                         ##   @struct
                                         ##
                                         ##    :type:ngtcp2_conn_info holds various connection statistics.
                                         ## ```
    latest_rtt*: ngtcp2_duration ## ```
                                 ##   :member:latest_rtt is the latest RTT sample which is not
                                 ##      adjusted by acknowledgement delay.
                                 ## ```
    min_rtt*: ngtcp2_duration ## ```
                              ##   :member:min_rtt is the minimum RTT seen so far.  It is not
                              ##      adjusted by acknowledgement delay.
                              ## ```
    smoothed_rtt*: ngtcp2_duration ## ```
                                   ##   :member:smoothed_rtt is the smoothed RTT.
                                   ## ```
    rttvar*: ngtcp2_duration ## ```
                             ##   :member:rttvar is a mean deviation of observed RTT.
                             ## ```
    cwnd*: uint64            ## ```
                             ##   :member:cwnd is the size of congestion window.
                             ## ```
    ssthresh*: uint64        ## ```
                             ##   :member:ssthresh is slow start threshold.
                             ## ```
    bytes_in_flight*: uint64 ## ```
                             ##   :member:bytes_in_flight is the number in bytes of all sent
                             ##      packets which have not been acknowledged.
                             ## ```

  ngtcp2_printf* = proc (user_data: pointer; format: cstring) {.cdecl, varargs.}
  ngtcp2_rand_ctx* {.bycopy.} = object ## ```
                                        ##   @struct
                                        ##
                                        ##    :type:ngtcp2_rand_ctx is a wrapper around native random number
                                        ##    generator.  It is opaque to the ngtcp2 library.  This might be
                                        ##    useful if application needs to specify random number generator per
                                        ##    thread or per connection.
                                        ## ```
    native_handle*: pointer ## ```
                            ##   :member:native_handle is a pointer to an underlying random
                            ##      number generator.
                            ## ```

  ngtcp2_qlog_write* = proc (user_data: pointer; flags: uint32; data: pointer;
                             datalen: uint) {.cdecl.}
  ngtcp2_settings* {.bycopy.} = object ## ```
                                        ##   @struct
                                        ##
                                        ##    :type:ngtcp2_settings defines QUIC connection settings.
                                        ## ```
    qlog_write*: ngtcp2_qlog_write ## ```
                                   ##   :member:qlog_write is a callback function to write qlog.
                                   ##      Setting NULL disables qlog.
                                   ## ```
    cc_algo*: ngtcp2_cc_algo ## ```
                             ##   :member:cc_algo specifies congestion control algorithm.
                             ## ```
    initial_ts*: ngtcp2_tstamp ## ```
                               ##   :member:initial_ts is an initial timestamp given to the
                               ##      library.
                               ## ```
    initial_rtt*: ngtcp2_duration ## ```
                                  ##   :member:initial_rtt is an initial RTT.
                                  ## ```
    log_printf*: ngtcp2_printf ## ```
                               ##   :member:log_printf is a function that the library uses to write
                               ##      logs.  NULL means no logging output.  It is nothing to do
                               ##      with qlog.
                               ## ```
    max_tx_udp_payload_size*: uint ## ```
                                   ##   :member:max_tx_udp_payload_size is the maximum size of UDP
                                   ##      datagram payload that the local endpoint transmits.
                                   ## ```
    token*: ptr uint8 ## ```
                      ##   :member:token is a token from Retry packet or NEW_TOKEN frame.
                      ##
                      ##      Server sets this field if it received the token in Client Initial
                      ##      packet and successfully validated.  It should also set
                      ##      :member:token_type field.
                      ##
                      ##      Client sets this field if it intends to send token in its Initial
                      ##      packet.
                      ##
                      ##      ngtcp2_conn_server_new and ngtcp2_conn_client_new make a copy
                      ##      of token.
                      ##
                      ##      Set NULL if there is no token.
                      ## ```
    tokenlen*: uint ## ```
                    ##   :member:tokenlen is the length of :member:token.  Set 0 if
                    ##      there is no token.
                    ## ```
    token_type*: ngtcp2_token_type ## ```
                                   ##   :member:token_type is the type of token.  Server application
                                   ##      should set this field.
                                   ## ```
    rand_ctx*: ngtcp2_rand_ctx ## ```
                               ##   :member:rand_ctx is an optional random number generator to be
                               ##      passed to :type:ngtcp2_rand callback.
                               ## ```
    max_window*: uint64 ## ```
                        ##   :member:max_window is the maximum connection-level flow control
                        ##      window if connection-level window auto-tuning is enabled.  The
                        ##      connection-level window auto tuning is enabled if nonzero value
                        ##      is specified in this field.  The initial value of window size is
                        ##      :member:ngtcp2_transport_params.initial_max_data.  The window
                        ##      size is scaled up to the value specified in this field.
                        ## ```
    max_stream_window*: uint64 ## ```
                               ##   :member:max_stream_window is the maximum stream-level flow
                               ##      control window if stream-level window auto-tuning is enabled.
                               ##      The stream-level window auto-tuning is enabled if nonzero value
                               ##      is specified in this field.  The initial value of window size is
                               ##      :member:ngtcp2_transport_params.initial_max_stream_data_bidi_remote,
                               ##      :member:ngtcp2_transport_params.initial_max_stream_data_bidi_local,
                               ##      or :member:ngtcp2_transport_params.initial_max_stream_data_uni,
                               ##      depending on the type of stream.  The window size is scaled up to
                               ##      the value specified in this field.
                               ## ```
    ack_thresh*: uint ## ```
                      ##   :member:ack_thresh is the minimum number of the received ACK
                      ##      eliciting packets that trigger the immediate acknowledgement from
                      ##      the local endpoint.
                      ## ```
    no_tx_udp_payload_size_shaping*: uint8 ## ```
                                           ##   :member:no_tx_udp_payload_size_shaping, if set to nonzero,
                                           ##      instructs the library not to limit the UDP payload size to
                                           ##      :macro:NGTCP2_MAX_UDP_PAYLOAD_SIZE (which can be extended by
                                           ##      Path MTU Discovery), and instead use the minimum size among the
                                           ##      given buffer size, :member:max_tx_udp_payload_size, and the
                                           ##      received max_udp_payload_size QUIC transport parameter.
                                           ## ```
    handshake_timeout*: ngtcp2_duration ## ```
                                        ##   :member:handshake_timeout is the period of time before giving
                                        ##      up QUIC connection establishment.  If QUIC handshake is not
                                        ##      complete within this period, ngtcp2_conn_handle_expiry returns
                                        ##      :macro:NGTCP2_ERR_HANDSHAKE_TIMEOUT error.  The deadline is
                                        ##      :member:initial_ts + :member:handshake_timeout.  If this
                                        ##      field is set to UINT64_MAX, no handshake timeout is set.
                                        ## ```
    preferred_versions*: ptr uint32 ## ```
                                    ##   :member:preferred_versions is the array of versions that are
                                    ##      preferred by the local endpoint.  All versions set in this array
                                    ##      must be supported by the library, and compatible to QUIC v1.  The
                                    ##      reserved versions are not allowed.  They are sorted in the order
                                    ##      of preference.
                                    ##
                                    ##      On compatible version negotiation, server will negotiate one of
                                    ##      those versions contained in this array if there is some overlap
                                    ##      between these versions and the versions offered by the client.
                                    ##      If there is no overlap, but the client chosen version is
                                    ##      supported by the library, the server chooses the client chosen
                                    ##      version as the negotiated version.  This version set corresponds
                                    ##      to Offered Versions described in :rfc:9368, and it should be
                                    ##      included in Version Negotiation packet.
                                    ##
                                    ##      Client uses this field and :member:original_version to prevent
                                    ##      version downgrade attack if it reacted upon Version Negotiation
                                    ##      packet.  If this field is specified, client must include
                                    ##      |client_chosen_version| passed to ngtcp2_conn_client_new unless
                                    ##      |client_chosen_version| is a reserved version.
                                    ## ```
    preferred_versionslen*: uint ## ```
                                 ##   :member:preferred_versionslen is the number of versions that
                                 ##      are contained in the array pointed by
                                 ##      :member:preferred_versions.
                                 ## ```
    available_versions*: ptr uint32 ## ```
                                    ##   :member:available_versions is the array of versions that are
                                    ##      going to be set in :member:available_versions
                                    ##      <ngtcp2_version_info.available_versions> field of outgoing
                                    ##      version_information QUIC transport parameter.
                                    ##
                                    ##      For server, this corresponds to Fully-Deployed Versions described
                                    ##      in :rfc:9368.  If this field is not set, it is set to
                                    ##      :member:preferred_versions internally if
                                    ##      :member:preferred_versionslen is not zero.  If this field is
                                    ##      not set, and :member:preferred_versionslen is zero, this field
                                    ##      is set to :macro:NGTCP2_PROTO_VER_V1 internally.
                                    ##
                                    ##      Client must include |client_chosen_version| passed to
                                    ##      ngtcp2_conn_client_new in this array if this field is set and
                                    ##      |client_chosen_version| is not a reserved version.  If this field
                                    ##      is not set, |client_chosen_version| passed to
                                    ##      ngtcp2_conn_client_new will be set in this field internally
                                    ##      unless |client_chosen_version| is a reserved version.
                                    ## ```
    available_versionslen*: uint ## ```
                                 ##   :member:available_versionslen is the number of versions that
                                 ##      are contained in the array pointed by
                                 ##      :member:available_versions.
                                 ## ```
    original_version*: uint32 ## ```
                              ##   :member:original_version is the original version that client
                              ##      initially used to make a connection attempt.  If it is set, and
                              ##      it differs from |client_chosen_version| passed to
                              ##      ngtcp2_conn_client_new, the library assumes that client reacted
                              ##      upon Version Negotiation packet.  Server does not use this field.
                              ## ```
    no_pmtud*: uint8 ## ```
                     ##   :member:no_pmtud, if set to nonzero, disables Path MTU
                     ##      Discovery.
                     ## ```
    initial_pkt_num*: uint32 ## ```
                             ##   :member:pkt_num is the initial packet number for each packet
                             ##      number space.  It must be in range [0, INT32_MAX], inclusive.
                             ## ```
    pmtud_probes*: ptr uint16 ## ```
                              ##   The following fields have been added since NGTCP2_SETTINGS_V2.
                              ##
                              ##      :member:pmtud_probes is the array of UDP datagram payload size
                              ##      to probe during Path MTU Discovery.  The discovery is done in the
                              ##      order appeared in this array.  The size must be strictly larger
                              ##      than 1200, otherwise the behavior is undefined.  The maximum
                              ##      value in this array should be set to
                              ##      :member:max_tx_udp_payload_size.  If this field is not set, the
                              ##      predefined PMTUD probes are made.  This field has been available
                              ##      since v1.4.0.
                              ## ```
    pmtud_probeslen*: uint ## ```
                           ##   :member:pmtud_probeslen is the number of elements that are
                           ##      contained in the array pointed by :member:pmtud_probes.  This
                           ##      field has been available since v1.4.0.
                           ## ```

  ngtcp2_addr* {.bycopy.} = object ## ```
                                    ##   @struct
                                    ##
                                    ##    :type:ngtcp2_addr is the endpoint address.
                                    ## ```
    `addr`*: ptr ngtcp2_SockAddr ## ```
                                 ##   :member:addr points to the buffer which contains endpoint
                                 ##      address.  It must not be NULL.
                                 ## ```
    addrlen*: ngtcp2_socklen ## ```
                             ##   :member:addrlen is the length of :member:addr.  It must not
                             ##      be longer than sizeof(:type:ngtcp2_sockaddr_union).
                             ## ```

  ngtcp2_path* {.bycopy.} = object ## ```
                                    ##   @struct
                                    ##
                                    ##    :type:ngtcp2_path is the network endpoints where a packet is sent
                                    ##    and received.
                                    ## ```
    local*: ngtcp2_addr      ## ```
                             ##   :member:local is the address of local endpoint.
                             ## ```
    remote*: ngtcp2_addr ## ```
                         ##   :member:remote is the address of remote endpoint.
                         ## ```
    user_data*: pointer ## ```
                        ##   :member:user_data is an arbitrary data and opaque to the
                        ##      library.
                        ##
                        ##      Note that :type:ngtcp2_path is generally passed to
                        ##      :type:ngtcp2_conn by an application, and :type:ngtcp2_conn
                        ##      stores their copies.  Unfortunately, there is no way for the
                        ##      application to know when :type:ngtcp2_conn finished using a
                        ##      specific :type:ngtcp2_path object in mid connection, which
                        ##      means that the application cannot free the data pointed by this
                        ##      field.  Therefore, it is advised to use this field only when the
                        ##      data pointed by this field persists in an entire lifetime of the
                        ##      connection.
                        ## ```

  ngtcp2_path_storage* {.bycopy.} = object ## ```
                                            ##   @struct
                                            ##
                                            ##    :type:ngtcp2_path_storage is a convenient struct to have buffers
                                            ##    to store the longest addresses.
                                            ## ```
    path*: ngtcp2_path       ## ```
                             ##   :member:path stores network path.
                             ## ```
    local_addrbuf*: ngtcp2_SockAddr_union ## ```
                                          ##   :member:local_addrbuf is a buffer to store local address.
                                          ## ```
    remote_addrbuf*: ngtcp2_SockAddr_union ## ```
                                           ##   :member:remote_addrbuf is a buffer to store remote address.
                                           ## ```

  ngtcp2_crypto_md* {.bycopy.} = object ## ```
                                         ##   @struct
                                         ##
                                         ##    :type:ngtcp2_crypto_md is a wrapper around native message digest
                                         ##    object.
                                         ## ```
    native_handle*: pointer ## ```
                            ##   :member:native_handle is a pointer to an underlying message
                            ##      digest object.
                            ## ```

  ngtcp2_crypto_aead* {.bycopy.} = object ## ```
                                           ##   @struct
                                           ##
                                           ##    :type:ngtcp2_crypto_aead is a wrapper around native AEAD object.
                                           ## ```
    native_handle*: pointer ## ```
                            ##   :member:native_handle is a pointer to an underlying AEAD
                            ##      object.
                            ## ```
    max_overhead*: uint ## ```
                        ##   :member:max_overhead is the number of additional bytes which
                        ##      AEAD encryption needs on encryption.
                        ## ```

  ngtcp2_crypto_cipher* {.bycopy.} = object ## ```
                                             ##   @struct
                                             ##
                                             ##    :type:ngtcp2_crypto_cipher is a wrapper around native cipher
                                             ##    object.
                                             ## ```
    native_handle*: pointer ## ```
                            ##   :member:native_handle is a pointer to an underlying cipher
                            ##      object.
                            ## ```

  ngtcp2_crypto_aead_ctx* {.bycopy.} = object ## ```
                                               ##   @struct
                                               ##
                                               ##    :type:ngtcp2_crypto_aead_ctx is a wrapper around native AEAD
                                               ##    cipher context object.  It should be initialized with a specific
                                               ##    key.  ngtcp2 library reuses this context object to encrypt or
                                               ##    decrypt multiple packets.
                                               ## ```
    native_handle*: pointer ## ```
                            ##   :member:native_handle is a pointer to an underlying AEAD
                            ##      context object.
                            ## ```

  ngtcp2_crypto_cipher_ctx* {.bycopy.} = object ## ```
                                                 ##   @struct
                                                 ##
                                                 ##    :type:ngtcp2_crypto_cipher_ctx is a wrapper around native cipher
                                                 ##    context object.  It should be initialized with a specific key.
                                                 ##    ngtcp2 library reuses this context object to encrypt or decrypt
                                                 ##    multiple packet headers.
                                                 ## ```
    native_handle*: pointer ## ```
                            ##   :member:native_handle is a pointer to an underlying cipher
                            ##      context object.
                            ## ```

  ngtcp2_crypto_ctx* {.bycopy.} = object ## ```
                                          ##   @struct
                                          ##
                                          ##    :type:ngtcp2_crypto_ctx is a convenient structure to bind all
                                          ##    crypto related objects in one place.  Use
                                          ##    ngtcp2_crypto_ctx_initial to initialize this struct for Initial
                                          ##    packet encryption.  For Handshake and 1-RTT packets, use
                                          ##    ngtcp2_crypto_ctx_tls.  For 0-RTT packets, use
                                          ##    ngtcp2_crypto_ctx_tls_early.
                                          ## ```
    aead*: ngtcp2_crypto_aead ## ```
                              ##   :member:aead is AEAD object.
                              ## ```
    md*: ngtcp2_crypto_md    ## ```
                             ##   :member:md is message digest object.
                             ## ```
    hp*: ngtcp2_crypto_cipher ## ```
                              ##   :member:hp is header protection cipher.
                              ## ```
    max_encryption*: uint64 ## ```
                            ##   :member:max_encryption is the number of encryption which this
                            ##      key can be used with.
                            ## ```
    max_decryption_failure*: uint64 ## ```
                                    ##   :member:max_decryption_failure is the number of decryption
                                    ##      failure with this key.
                                    ## ```

  ngtcp2_version_cid* {.bycopy.} = object ## ```
                                           ##   @struct
                                           ##
                                           ##    :type:ngtcp2_version_cid is a convenient struct to store the
                                           ##    result of ngtcp2_pkt_decode_version_cid.
                                           ## ```
    version*: uint32         ## ```
                             ##   :member:version stores QUIC version.
                             ## ```
    dcid*: ptr uint8 ## ```
                     ##   :member:dcid points to the Destination Connection ID.
                     ## ```
    dcidlen*: uint ## ```
                   ##   :member:dcidlen is the length of the Destination Connection ID
                   ##      pointed by :member:dcid.
                   ## ```
    scid*: ptr uint8         ## ```
                             ##   :member:scid points to the Source Connection ID.
                             ## ```
    scidlen*: uint ## ```
                   ##   :member:scidlen is the length of the Source Connection ID
                   ##      pointed by :member:scid.
                   ## ```

  ngtcp2_conn* {.incompleteStruct.} = object
  ngtcp2_client_initial* = proc (conn: ptr ngtcp2_conn; user_data: pointer): cint {.
      cdecl.}
  ngtcp2_recv_client_initial* = proc (conn: ptr ngtcp2_conn;
                                      dcid: ptr ngtcp2_cid; user_data: pointer): cint {.
      cdecl.}
  ngtcp2_recv_crypto_data* = proc (conn: ptr ngtcp2_conn;
                                   encryption_level: ngtcp2_encryption_level;
                                   offset: uint64; data: ptr uint8;
                                   datalen: uint; user_data: pointer): cint {.
      cdecl.}
  ngtcp2_handshake_completed* = proc (conn: ptr ngtcp2_conn; user_data: pointer): cint {.
      cdecl.}
  ngtcp2_handshake_confirmed* = proc (conn: ptr ngtcp2_conn; user_data: pointer): cint {.
      cdecl.}
  ngtcp2_recv_version_negotiation* = proc (conn: ptr ngtcp2_conn;
      hd: ptr ngtcp2_pkt_hd; sv: ptr uint32; nsv: uint; user_data: pointer): cint {.
      cdecl.}
  ngtcp2_recv_retry* = proc (conn: ptr ngtcp2_conn; hd: ptr ngtcp2_pkt_hd;
                             user_data: pointer): cint {.cdecl.}
  ngtcp2_encrypt* = proc (dest: ptr uint8; aead: ptr ngtcp2_crypto_aead;
                          aead_ctx: ptr ngtcp2_crypto_aead_ctx;
                          plaintext: ptr uint8; plaintextlen: uint;
                          nonce: ptr uint8; noncelen: uint; aad: ptr uint8;
                          aadlen: uint): cint {.cdecl.}
  ngtcp2_decrypt* = proc (dest: ptr uint8; aead: ptr ngtcp2_crypto_aead;
                          aead_ctx: ptr ngtcp2_crypto_aead_ctx;
                          ciphertext: ptr uint8; ciphertextlen: uint;
                          nonce: ptr uint8; noncelen: uint; aad: ptr uint8;
                          aadlen: uint): cint {.cdecl.}
  ngtcp2_hp_mask* = proc (dest: ptr uint8; hp: ptr ngtcp2_crypto_cipher;
                          hp_ctx: ptr ngtcp2_crypto_cipher_ctx;
                          sample: ptr uint8): cint {.cdecl.}
  ngtcp2_recv_stream_data* = proc (conn: ptr ngtcp2_conn; flags: uint32;
                                   stream_id: int64; offset: uint64;
                                   data: ptr uint8; datalen: uint;
                                   user_data: pointer; stream_user_data: pointer): cint {.
      cdecl.}
  ngtcp2_stream_open* = proc (conn: ptr ngtcp2_conn; stream_id: int64;
                              user_data: pointer): cint {.cdecl.}
  ngtcp2_stream_close* = proc (conn: ptr ngtcp2_conn; flags: uint32;
                               stream_id: int64; app_error_code: uint64;
                               user_data: pointer; stream_user_data: pointer): cint {.
      cdecl.}
  ngtcp2_stream_reset* = proc (conn: ptr ngtcp2_conn; stream_id: int64;
                               final_size: uint64; app_error_code: uint64;
                               user_data: pointer; stream_user_data: pointer): cint {.
      cdecl.}
  ngtcp2_acked_stream_data_offset* = proc (conn: ptr ngtcp2_conn;
      stream_id: int64; offset: uint64; datalen: uint64; user_data: pointer;
      stream_user_data: pointer): cint {.cdecl.}
  ngtcp2_recv_stateless_reset* = proc (conn: ptr ngtcp2_conn;
                                       sr: ptr ngtcp2_pkt_stateless_reset;
                                       user_data: pointer): cint {.cdecl.}
  ngtcp2_extend_max_streams* = proc (conn: ptr ngtcp2_conn; max_streams: uint64;
                                     user_data: pointer): cint {.cdecl.}
  ngtcp2_extend_max_stream_data* = proc (conn: ptr ngtcp2_conn;
      stream_id: int64; max_data: uint64; user_data: pointer;
      stream_user_data: pointer): cint {.cdecl.}
  ngtcp2_rand* = proc (dest: ptr uint8; destlen: uint;
                       rand_ctx: ptr ngtcp2_rand_ctx) {.cdecl.}
  ngtcp2_get_new_connection_id* = proc (conn: ptr ngtcp2_conn;
                                        cid: ptr ngtcp2_cid; token: ptr uint8;
                                        cidlen: uint; user_data: pointer): cint {.
      cdecl.}
  ngtcp2_remove_connection_id* = proc (conn: ptr ngtcp2_conn;
                                       cid: ptr ngtcp2_cid; user_data: pointer): cint {.
      cdecl.}
  ngtcp2_update_key* = proc (conn: ptr ngtcp2_conn; rx_secret: ptr uint8;
                             tx_secret: ptr uint8;
                             rx_aead_ctx: ptr ngtcp2_crypto_aead_ctx;
                             rx_iv: ptr uint8;
                             tx_aead_ctx: ptr ngtcp2_crypto_aead_ctx;
                             tx_iv: ptr uint8; current_rx_secret: ptr uint8;
                             current_tx_secret: ptr uint8; secretlen: uint;
                             user_data: pointer): cint {.cdecl.}
  ngtcp2_path_validation* = proc (conn: ptr ngtcp2_conn; flags: uint32;
                                  path: ptr ngtcp2_path;
                                  old_path: ptr ngtcp2_path;
                                  res: ngtcp2_path_validation_result;
                                  user_data: pointer): cint {.cdecl.}
  ngtcp2_select_preferred_addr* = proc (conn: ptr ngtcp2_conn;
                                        dest: ptr ngtcp2_path;
                                        paddr: ptr ngtcp2_preferred_addr;
                                        user_data: pointer): cint {.cdecl.}
  ngtcp2_connection_id_status* = proc (conn: ptr ngtcp2_conn; `type`: ngtcp2_connection_id_status_type;
                                       seq: uint64; cid: ptr ngtcp2_cid;
                                       token: ptr uint8; user_data: pointer): cint {.
      cdecl.}
  ngtcp2_recv_new_token* = proc (conn: ptr ngtcp2_conn; token: ptr uint8;
                                 tokenlen: uint; user_data: pointer): cint {.
      cdecl.}
  ngtcp2_delete_crypto_aead_ctx* = proc (conn: ptr ngtcp2_conn;
      aead_ctx: ptr ngtcp2_crypto_aead_ctx; user_data: pointer) {.cdecl.}
  ngtcp2_delete_crypto_cipher_ctx* = proc (conn: ptr ngtcp2_conn;
      cipher_ctx: ptr ngtcp2_crypto_cipher_ctx; user_data: pointer) {.cdecl.}
  ngtcp2_recv_datagram* = proc (conn: ptr ngtcp2_conn; flags: uint32;
                                data: ptr uint8; datalen: uint;
                                user_data: pointer): cint {.cdecl.}
  ngtcp2_ack_datagram* = proc (conn: ptr ngtcp2_conn; dgram_id: uint64;
                               user_data: pointer): cint {.cdecl.}
  ngtcp2_lost_datagram* = proc (conn: ptr ngtcp2_conn; dgram_id: uint64;
                                user_data: pointer): cint {.cdecl.}
  ngtcp2_get_path_challenge_data* = proc (conn: ptr ngtcp2_conn;
      data: ptr uint8; user_data: pointer): cint {.cdecl.}
  ngtcp2_stream_stop_sending* = proc (conn: ptr ngtcp2_conn; stream_id: int64;
                                      app_error_code: uint64;
                                      user_data: pointer;
                                      stream_user_data: pointer): cint {.cdecl.}
  ngtcp2_version_negotiation* = proc (conn: ptr ngtcp2_conn; version: uint32;
                                      client_dcid: ptr ngtcp2_cid;
                                      user_data: pointer): cint {.cdecl.}
  ngtcp2_recv_key* = proc (conn: ptr ngtcp2_conn;
                           level: ngtcp2_encryption_level; user_data: pointer): cint {.
      cdecl.}
  ngtcp2_tls_early_data_rejected* = proc (conn: ptr ngtcp2_conn;
      user_data: pointer): cint {.cdecl.}
  ngtcp2_callbacks* {.bycopy.} = object ## ```
                                         ##   @struct
                                         ##
                                         ##    :type:ngtcp2_callbacks holds a set of callback functions.
                                         ## ```
    client_initial*: ngtcp2_client_initial ## ```
                                           ##   :member:client_initial is a callback function which is invoked
                                           ##      when client asks TLS stack to produce first TLS cryptographic
                                           ##      handshake message.  This callback function must be specified for
                                           ##      a client application.
                                           ## ```
    recv_client_initial*: ngtcp2_recv_client_initial ## ```
                                                     ##   :member:recv_client_initial is a callback function which is
                                                     ##      invoked when a server receives the first Initial packet from
                                                     ##      client.  This callback function must be specified for a server
                                                     ##      application.
                                                     ## ```
    recv_crypto_data*: ngtcp2_recv_crypto_data ## ```
                                               ##   :member:recv_crypto_data is a callback function which is
                                               ##      invoked when cryptographic data (CRYPTO frame, in other words,
                                               ##      TLS message) is received.  This callback function must be
                                               ##      specified.
                                               ## ```
    handshake_completed*: ngtcp2_handshake_completed ## ```
                                                     ##   :member:handshake_completed is a callback function which is
                                                     ##      invoked when QUIC cryptographic handshake has completed.  This
                                                     ##      callback function is optional.
                                                     ## ```
    recv_version_negotiation*: ngtcp2_recv_version_negotiation ## ```
                                                               ##   :member:recv_version_negotiation is a callback function which
                                                               ##      is invoked when Version Negotiation packet is received by a
                                                               ##      client.  This callback function is optional.
                                                               ## ```
    encrypt*: ngtcp2_encrypt ## ```
                             ##   :member:encrypt is a callback function which is invoked to
                             ##      encrypt a QUIC packet.  This callback function must be specified.
                             ## ```
    decrypt*: ngtcp2_decrypt ## ```
                             ##   :member:decrypt is a callback function which is invoked to
                             ##      decrypt a QUIC packet.  This callback function must be specified.
                             ## ```
    hp_mask*: ngtcp2_hp_mask ## ```
                             ##   :member:hp_mask is a callback function which is invoked to get
                             ##      a mask to encrypt or decrypt QUIC packet header.  This callback
                             ##      function must be specified.
                             ## ```
    recv_stream_data*: ngtcp2_recv_stream_data ## ```
                                               ##   :member:recv_stream_data is a callback function which is
                                               ##      invoked when stream data, which includes application data, is
                                               ##      received.  This callback function is optional.
                                               ## ```
    acked_stream_data_offset*: ngtcp2_acked_stream_data_offset ## ```
                                                               ##   :member:acked_stream_data_offset is a callback function which
                                                               ##      is invoked when stream data, which includes application data, is
                                                               ##      acknowledged by a remote endpoint.  It tells an application the
                                                               ##      largest offset of acknowledged stream data without a gap so that
                                                               ##      application can free memory for the data up to that offset.  This
                                                               ##      callback function is optional.
                                                               ## ```
    stream_open*: ngtcp2_stream_open ## ```
                                     ##   :member:stream_open is a callback function which is invoked
                                     ##      when new remote stream is opened by a remote endpoint.  This
                                     ##      callback function is optional.
                                     ## ```
    stream_close*: ngtcp2_stream_close ## ```
                                       ##   :member:stream_close is a callback function which is invoked
                                       ##      when a stream is closed.  This callback function is optional.
                                       ## ```
    recv_stateless_reset*: ngtcp2_recv_stateless_reset ## ```
                                                       ##   :member:recv_stateless_reset is a callback function which is
                                                       ##      invoked when Stateless Reset packet is received.  This callback
                                                       ##      function is optional.
                                                       ## ```
    recv_retry*: ngtcp2_recv_retry ## ```
                                   ##   :member:recv_retry is a callback function which is invoked when
                                   ##      a client receives Retry packet.  For client, this callback
                                   ##      function must be specified.  Server never receive Retry packet.
                                   ## ```
    extend_max_local_streams_bidi*: ngtcp2_extend_max_streams ## ```
                                                              ##   :member:extend_max_local_streams_bidi is a callback function
                                                              ##      which is invoked when the number of bidirectional stream which a
                                                              ##      local endpoint can open is increased.  This callback function is
                                                              ##      optional.
                                                              ## ```
    extend_max_local_streams_uni*: ngtcp2_extend_max_streams ## ```
                                                             ##   :member:extend_max_local_streams_uni is a callback function
                                                             ##      which is invoked when the number of unidirectional stream which a
                                                             ##      local endpoint can open is increased.  This callback function is
                                                             ##      optional.
                                                             ## ```
    rand*: ngtcp2_rand ## ```
                       ##   :member:rand is a callback function which is invoked when the
                       ##      library needs random data.  This callback function must be
                       ##      specified.
                       ## ```
    get_new_connection_id*: ngtcp2_get_new_connection_id ## ```
                                                         ##   :member:get_new_connection_id is a callback function which is
                                                         ##      invoked when the library needs new connection ID.  This callback
                                                         ##      function must be specified.
                                                         ## ```
    remove_connection_id*: ngtcp2_remove_connection_id ## ```
                                                       ##   :member:remove_connection_id is a callback function which
                                                       ##      notifies an application that connection ID is no longer used by a
                                                       ##      remote endpoint.  This callback function is optional.
                                                       ## ```
    update_key*: ngtcp2_update_key ## ```
                                   ##   :member:update_key is a callback function which is invoked when
                                   ##      the library tells an application that it must update keying
                                   ##      materials, and install new keys.  This callback function must be
                                   ##      specified.
                                   ## ```
    path_validation*: ngtcp2_path_validation ## ```
                                             ##   :member:path_validation is a callback function which is invoked
                                             ##      when path validation completed.  This callback function is
                                             ##      optional.
                                             ## ```
    select_preferred_addr*: ngtcp2_select_preferred_addr ## ```
                                                         ##   :member:select_preferred_addr is a callback function which is
                                                         ##      invoked when the library asks a client to select preferred
                                                         ##      address presented by a server.  If not set, client ignores
                                                         ##      preferred addresses.  This callback function is optional.
                                                         ## ```
    stream_reset*: ngtcp2_stream_reset ## ```
                                       ##   :member:stream_reset is a callback function which is invoked
                                       ##      when a stream is reset by a remote endpoint.  This callback
                                       ##      function is optional.
                                       ## ```
    extend_max_remote_streams_bidi*: ngtcp2_extend_max_streams ## ```
                                                               ##   :member:extend_max_remote_streams_bidi is a callback function
                                                               ##      which is invoked when the number of bidirectional streams which a
                                                               ##      remote endpoint can open is increased.  This callback function is
                                                               ##      optional.
                                                               ## ```
    extend_max_remote_streams_uni*: ngtcp2_extend_max_streams ## ```
                                                              ##   :member:extend_max_remote_streams_uni is a callback function
                                                              ##      which is invoked when the number of unidirectional streams which
                                                              ##      a remote endpoint can open is increased.  This callback function
                                                              ##      is optional.
                                                              ## ```
    extend_max_stream_data*: ngtcp2_extend_max_stream_data ## ```
                                                           ##   :member:extend_max_stream_data is callback function which is
                                                           ##      invoked when the maximum offset of stream data that a local
                                                           ##      endpoint can send is increased.  This callback function is
                                                           ##      optional.
                                                           ## ```
    dcid_status*: ngtcp2_connection_id_status ## ```
                                              ##   :member:dcid_status is a callback function which is invoked
                                              ##      when the new Destination Connection ID is activated, or the
                                              ##      activated Destination Connection ID is now deactivated.  This
                                              ##      callback function is optional.
                                              ## ```
    handshake_confirmed*: ngtcp2_handshake_confirmed ## ```
                                                     ##   :member:handshake_confirmed is a callback function which is
                                                     ##      invoked when both endpoints agree that handshake has finished.
                                                     ##      This field is ignored by server because
                                                     ##      :member:handshake_completed also indicates the handshake
                                                     ##      confirmation for server.  This callback function is optional.
                                                     ## ```
    recv_new_token*: ngtcp2_recv_new_token ## ```
                                           ##   :member:recv_new_token is a callback function which is invoked
                                           ##      when new token is received from server.  This field is ignored by
                                           ##      server.  This callback function is optional.
                                           ## ```
    delete_crypto_aead_ctx*: ngtcp2_delete_crypto_aead_ctx ## ```
                                                           ##   :member:delete_crypto_aead_ctx is a callback function which
                                                           ##      deletes a given AEAD cipher context object.  This callback
                                                           ##      function must be specified.
                                                           ## ```
    delete_crypto_cipher_ctx*: ngtcp2_delete_crypto_cipher_ctx ## ```
                                                               ##   :member:delete_crypto_cipher_ctx is a callback function which
                                                               ##      deletes a given cipher context object.  This callback function
                                                               ##      must be specified.
                                                               ## ```
    recv_datagram*: ngtcp2_recv_datagram ## ```
                                         ##   :member:recv_datagram is a callback function which is invoked
                                         ##      when DATAGRAM frame is received.  This callback function is
                                         ##      optional.
                                         ## ```
    ack_datagram*: ngtcp2_ack_datagram ## ```
                                       ##   :member:ack_datagram is a callback function which is invoked
                                       ##      when a QUIC packet containing DATAGRAM frame is acknowledged by a
                                       ##      remote endpoint.  This callback function is optional.
                                       ## ```
    lost_datagram*: ngtcp2_lost_datagram ## ```
                                         ##   :member:lost_datagram is a callback function which is invoked
                                         ##      when a QUIC packet containing DATAGRAM frame is declared lost.
                                         ##      This callback function is optional.
                                         ## ```
    get_path_challenge_data*: ngtcp2_get_path_challenge_data ## ```
                                                             ##   :member:get_path_challenge_data is a callback function which is
                                                             ##      invoked when the library needs new data sent along with
                                                             ##      PATH_CHALLENGE frame.  This callback must be specified.
                                                             ## ```
    stream_stop_sending*: ngtcp2_stream_stop_sending ## ```
                                                     ##   :member:stream_stop_sending is a callback function which is
                                                     ##      invoked when a local endpoint no longer reads from a stream
                                                     ##      before it receives all stream data.  This callback function is
                                                     ##      optional.
                                                     ## ```
    version_negotiation*: ngtcp2_version_negotiation ## ```
                                                     ##   :member:version_negotiation is a callback function which is
                                                     ##      invoked when the compatible version negotiation takes place.
                                                     ##      This callback function must be specified.
                                                     ## ```
    recv_rx_key*: ngtcp2_recv_key ## ```
                                  ##   :member:recv_rx_key is a callback function which is invoked
                                  ##      when a new key for decrypting packets is installed during QUIC
                                  ##      cryptographic handshake.  It is not called for
                                  ##      :enum:ngtcp2_encryption_level.NGTCP2_ENCRYPTION_LEVEL_INITIAL.
                                  ## ```
    recv_tx_key*: ngtcp2_recv_key ## ```
                                  ##   :member:recv_tx_key is a callback function which is invoked
                                  ##      when a new key for encrypting packets is installed during QUIC
                                  ##      cryptographic handshake.  It is not called for
                                  ##      :enum:ngtcp2_encryption_level.NGTCP2_ENCRYPTION_LEVEL_INITIAL.
                                  ## ```
    tls_early_data_rejected*: ngtcp2_tls_early_data_rejected ## ```
                                                             ##   :member:tls_early_data_rejected is a callback function which is
                                                             ##      invoked when server rejected early data during TLS handshake, or
                                                             ##      client decided not to attempt early data.  This callback function
                                                             ##      is only used by client.
                                                             ## ```

  ngtcp2_cid_token* {.bycopy.} = object ## ```
                                         ##   @struct
                                         ##
                                         ##    :type:ngtcp2_cid_token is the convenient struct to store
                                         ##    Connection ID, its associated path, and stateless reset token.
                                         ## ```
    seq*: uint64 ## ```
                 ##   :member:seq is the sequence number of this Connection ID.
                 ## ```
    cid*: ngtcp2_cid         ## ```
                             ##   :member:cid is Connection ID.
                             ## ```
    ps*: ngtcp2_path_storage ## ```
                             ##   :member:ps is the path which this Connection ID is associated
                             ##      with.
                             ## ```
    token*: array[16, uint8] ## ```
                             ##   :member:token is the stateless reset token for this Connection
                             ##      ID.
                             ## ```
    token_present*: uint8 ## ```
                          ##   :member:token_present is nonzero if token contains stateless
                          ##      reset token.
                          ## ```

  ngtcp2_ccerr* {.bycopy.} = object ## ```
                                     ##   @struct
                                     ##
                                     ##    :type:ngtcp2_ccerr contains connection error code, its type, a
                                     ##    frame type that caused this error, and the optional reason phrase.
                                     ## ```
    `type`*: ngtcp2_ccerr_type ## ```
                               ##   :member:type is the type of this error.
                               ## ```
    error_code*: uint64 ## ```
                        ##   :member:error_code is the error code for connection closure.
                        ##      Its interpretation depends on :member:type.
                        ## ```
    frame_type*: uint64 ## ```
                        ##   :member:frame_type is the type of QUIC frame which triggers
                        ##      this connection error.  This field is set to 0 if the frame type
                        ##      is unknown.
                        ## ```
    reason*: ptr uint8 ## ```
                       ##   :member:reason points to the buffer which contains a reason
                       ##      phrase.  It may be NULL if there is no reason phrase.  If it is
                       ##      received from a remote endpoint, it is truncated to at most 1024
                       ##      bytes.
                       ## ```
    reasonlen*: uint ## ```
                     ##   :member:reasonlen is the length of data pointed by
                     ##      :member:reason.
                     ## ```

  ngtcp2_info* {.bycopy.} = object ## ```
                                    ##   @struct
                                    ##
                                    ##    :type:ngtcp2_info is what ngtcp2_version returns.  It holds
                                    ##    information about the particular ngtcp2 version.
                                    ## ```
    age*: cint ## ```
               ##   :member:age is the age of this struct.  This instance of ngtcp2
               ##      sets it to :macro:NGTCP2_VERSION_AGE but a future version may
               ##      bump it and add more struct fields at the bottom
               ## ```
    version_num*: cint ## ```
                       ##   :member:version_num is the :macro:NGTCP2_VERSION_NUM number
                       ##      (since :member:age ==1)
                       ## ```
    version_str*: cstring ## ```
                          ##   :member:version_str points to the :macro:NGTCP2_VERSION
                          ##      string (since :member:age ==1)
                          ## ```

proc ngtcp2_cid_init*(cid: ptr ngtcp2_cid; data: ptr uint8; datalen: uint) {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_cid_init initializes Connection ID |cid| with the byte
                    ##    string pointed by |data| and its length is |datalen|.  |datalen|
                    ##    must be at most :macro:NGTCP2_MAX_CIDLEN.
                    ## ```
proc ngtcp2_cid_eq*(a: ptr ngtcp2_cid; b: ptr ngtcp2_cid): cint {.importc, cdecl.}
  ## ```
                                                                                  ##   @function
                                                                                  ##
                                                                                  ##    ngtcp2_cid_eq returns nonzero if |a| and |b| share the same
                                                                                  ##    Connection ID.
                                                                                  ## ```
proc ngtcp2_transport_params_encode_versioned*(dest: ptr uint8; destlen: uint;
    transport_params_version: cint; params: ptr ngtcp2_transport_params): ngtcp2_ssize {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_transport_params_encode encodes |params| in |dest| of
                    ##    length |destlen|.
                    ##
                    ##    If |dest| is NULL, and |destlen| is zero, this function just
                    ##    returns the number of bytes required to store the encoded transport
                    ##    parameters.
                    ##
                    ##    This function returns the number of bytes written, or one of the
                    ##    following negative error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_NOBUF
                    ##        Buffer is too small.
                    ## ```
proc ngtcp2_transport_params_decode_versioned*(transport_params_version: cint;
    params: ptr ngtcp2_transport_params; data: ptr uint8; datalen: uint): cint {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_transport_params_decode decodes transport parameters in
                    ##    |data| of length |datalen|, and stores the result in the object
                    ##    pointed by |params|.
                    ##
                    ##    If an optional parameter is missing, the default value is assigned.
                    ##
                    ##    The following fields may point to somewhere inside the buffer
                    ##    pointed by |data| of length |datalen|:
                    ##
                    ##    - :member:ngtcp2_transport_params.version_info.available_versions
                    ##      <ngtcp2_version_info.available_versions>
                    ##
                    ##    This function returns 0 if it succeeds, or one of the following
                    ##    negative error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_MALFORMED_TRANSPORT_PARAM
                    ##        The input is malformed.
                    ## ```
proc ngtcp2_transport_params_decode_new*(
    pparams: ptr ptr ngtcp2_transport_params; data: ptr uint8; datalen: uint;
    mem: ptr ngtcp2_mem): cint {.importc, cdecl.}
  ## ```
                                                 ##   @function
                                                 ##
                                                 ##    ngtcp2_transport_params_decode_new decodes transport parameters
                                                 ##    in |data| of length |datalen|, and stores the result in the object
                                                 ##    allocated dynamically.  The pointer to the allocated object is
                                                 ##    assigned to |*pparams|.  Unlike ngtcp2_transport_params_decode,
                                                 ##    all direct and indirect fields are also allocated dynamically if
                                                 ##    needed.
                                                 ##
                                                 ##    |mem| is a memory allocator to allocate memory.  If |mem| is
                                                 ##    NULL, the memory allocator returned by ngtcp2_mem_default()
                                                 ##    is used.
                                                 ##
                                                 ##    If the optional parameters are missing, the default value is
                                                 ##    assigned.
                                                 ##
                                                 ##    ngtcp2_transport_params_del frees the memory allocated by this
                                                 ##    function.
                                                 ##
                                                 ##    This function returns 0 if it succeeds, or one of the following
                                                 ##    negative error codes:
                                                 ##
                                                 ##    :macro:NGTCP2_ERR_MALFORMED_TRANSPORT_PARAM
                                                 ##        The input is malformed.
                                                 ##    :macro:NGTCP2_ERR_NOMEM
                                                 ##        Out of memory.
                                                 ## ```
proc ngtcp2_transport_params_del*(params: ptr ngtcp2_transport_params;
                                  mem: ptr ngtcp2_mem) {.importc, cdecl.}
  ## ```
                                                                         ##   @function
                                                                         ##
                                                                         ##    ngtcp2_transport_params_del frees the |params| which must be
                                                                         ##    dynamically allocated by ngtcp2_transport_params_decode_new.
                                                                         ##
                                                                         ##    |mem| is a memory allocator that allocated |params|.  If |mem| is
                                                                         ##    NULL, the memory allocator returned by ngtcp2_mem_default()
                                                                         ##    is used.
                                                                         ##
                                                                         ##    If |params| is NULL, this function does nothing.
                                                                         ## ```
proc ngtcp2_pkt_decode_version_cid*(dest: ptr ngtcp2_version_cid;
                                    data: ptr uint8; datalen: uint;
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
                                                                                 ##    If the given packet is Long header packet, this function extracts
                                                                                 ##    the version from the packet, and assigns it to
                                                                                 ##    :member:dest->version <ngtcp2_version_cid.version>.  It also
                                                                                 ##    extracts the pointer to the Destination Connection ID and its
                                                                                 ##    length, and assigns them to :member:dest->dcid
                                                                                 ##    <ngtcp2_version_cid.dcid> and :member:dest->dcidlen
                                                                                 ##    <ngtcp2_version_cid.dcidlen> respectively.  Similarly, it extracts
                                                                                 ##    the pointer to the Source Connection ID and its length, and assigns
                                                                                 ##    them to :member:dest->scid <ngtcp2_version_cid.scid> and
                                                                                 ##    :member:dest->scidlen <ngtcp2_version_cid.scidlen> respectively.
                                                                                 ##    |short_dcidlen| is ignored.
                                                                                 ##
                                                                                 ##    If the given packet is Short header packet, :member:dest->version
                                                                                 ##    <ngtcp2_version_cid.version> will be 0, :member:dest->scid
                                                                                 ##    <ngtcp2_version_cid.scid> will be NULL, and
                                                                                 ##    :member:dest->scidlen <ngtcp2_version_cid.scidlen> will be 0.
                                                                                 ##    Because the Short header packet does not have the length of
                                                                                 ##    Destination Connection ID, the caller has to pass the length in
                                                                                 ##    |short_dcidlen|.  This function extracts the pointer to the
                                                                                 ##    Destination Connection ID, and assigns it to :member:dest->dcid
                                                                                 ##    <ngtcp2_version_cid.dcid>.  |short_dcidlen| is assigned to
                                                                                 ##    :member:dest->dcidlen <ngtcp2_version_cid.dcidlen>.
                                                                                 ##
                                                                                 ##    If Version Negotiation is required, this function returns
                                                                                 ##    :macro:NGTCP2_ERR_VERSION_NEGOTIATION.  Unlike the other error
                                                                                 ##    cases, all fields of |dest| are assigned as described above.
                                                                                 ##
                                                                                 ##    This function returns 0 if it succeeds.  Otherwise, one of the
                                                                                 ##    following negative error code:
                                                                                 ##
                                                                                 ##    :macro:NGTCP2_ERR_INVALID_ARGUMENT
                                                                                 ##        The function could not decode the packet header.
                                                                                 ##    :macro:NGTCP2_ERR_VERSION_NEGOTIATION
                                                                                 ##        Version Negotiation packet should be sent.
                                                                                 ## ```
proc ngtcp2_pkt_decode_hd_long*(dest: ptr ngtcp2_pkt_hd; pkt: ptr uint8;
                                pktlen: uint): ngtcp2_ssize {.importc, cdecl.}
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
                                                                              ##    :macro:NGTCP2_MAX_CIDLEN.  Consider to use
                                                                              ##    ngtcp2_pkt_decode_version_cid to get longer Connection ID.
                                                                              ##
                                                                              ##    This function handles Version Negotiation specially.  If version
                                                                              ##    field is 0, |pkt| must contain Version Negotiation packet.  Version
                                                                              ##    Negotiation packet has random type in wire format.  For
                                                                              ##    convenience, this function sets
                                                                              ##    :enum:ngtcp2_pkt_type.NGTCP2_PKT_VERSION_NEGOTIATION to
                                                                              ##    :member:dest->type <ngtcp2_pkt_hd.type>, clears
                                                                              ##    :macro:NGTCP2_PKT_FLAG_LONG_FORM flag from :member:dest->flags
                                                                              ##    <ngtcp2_pkt_hd.flags>, and sets 0 to :member:dest->len
                                                                              ##    <ngtcp2_pkt_hd.len>.  Version Negotiation packet occupies a single
                                                                              ##    packet.
                                                                              ##
                                                                              ##    It stores the result in the object pointed by |dest|, and returns
                                                                              ##    the number of bytes decoded to read the packet header if it
                                                                              ##    succeeds, or one of the following error codes:
                                                                              ##
                                                                              ##    :macro:NGTCP2_ERR_INVALID_ARGUMENT
                                                                              ##        Packet is too short; or it is not a long header
                                                                              ## ```
proc ngtcp2_pkt_decode_hd_short*(dest: ptr ngtcp2_pkt_hd; pkt: ptr uint8;
                                 pktlen: uint; dcidlen: uint): ngtcp2_ssize {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_pkt_decode_hd_short decodes QUIC short header in |pkt| of
                    ##    length |pktlen|.  Short header packet does not encode the length of
                    ##    Connection ID, thus we need the input from the outside.  |dcidlen|
                    ##    is the length of Destination Connection ID in packet header.  This
                    ##    function only parses the input just before packet number field.
                    ##    This function can handle Connection ID up to
                    ##    :macro:NGTCP2_MAX_CIDLEN.  Consider to use
                    ##    ngtcp2_pkt_decode_version_cid to get longer Connection ID.  It
                    ##    stores the result in the object pointed by |dest|, and returns the
                    ##    number of bytes decoded to read the packet header if it succeeds,
                    ##    or one of the following error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_INVALID_ARGUMENT
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
                    ##    must be at least :macro:NGTCP2_MIN_STATELESS_RESET_RANDLEN bytes
                    ##    long.
                    ##
                    ##    If |randlen| is too long to write them all in the buffer, |rand| is
                    ##    written to the buffer as much as possible, and is truncated.
                    ##
                    ##    This function returns the number of bytes written to the buffer, or
                    ##    one of the following negative error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_NOBUF
                    ##        Buffer is too small.
                    ##    :macro:NGTCP2_ERR_INVALID_ARGUMENT
                    ##        |randlen| is strictly less than
                    ##        :macro:NGTCP2_MIN_STATELESS_RESET_RANDLEN.
                    ## ```
proc ngtcp2_pkt_write_version_negotiation*(dest: ptr uint8; destlen: uint;
    unused_random: uint8; dcid: ptr uint8; dcidlen: uint; scid: ptr uint8;
    scidlen: uint; sv: ptr uint32; nsv: uint): ngtcp2_ssize {.importc, cdecl.}
  ## ```
                                                                              ##   @function
                                                                              ##
                                                                              ##    ngtcp2_pkt_write_version_negotiation writes Version Negotiation
                                                                              ##    packet in the buffer pointed by |dest| whose length is |destlen|.
                                                                              ##    |unused_random| should be generated randomly.  |dcid| is a
                                                                              ##    Connection ID which appeared in a packet as a Source Connection ID
                                                                              ##    sent by client which caused version negotiation.  Similarly, |scid|
                                                                              ##    is a Connection ID which appeared in a packet as a Destination
                                                                              ##    Connection ID sent by client.  |sv| is a list of supported
                                                                              ##    versions, and |nsv| specifies the number of supported versions
                                                                              ##    included in |sv|.
                                                                              ##
                                                                              ##    This function returns the number of bytes written to the buffer, or
                                                                              ##    one of the following negative error codes:
                                                                              ##
                                                                              ##    :macro:NGTCP2_ERR_NOBUF
                                                                              ##        Buffer is too small.
                                                                              ## ```
proc ngtcp2_pkt_write_connection_close*(dest: ptr uint8; destlen: uint;
                                        version: uint32; dcid: ptr ngtcp2_cid;
                                        scid: ptr ngtcp2_cid;
                                        error_code: uint64; reason: ptr uint8;
                                        reasonlen: uint;
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
                    ##    containing CONNECTION_CLOSE frame with the given |error_code| and
                    ##    the optional |reason| of length |reasonlen| to the buffer pointed
                    ##    by |dest| of length |destlen|.  All encryption parameters are for
                    ##    Initial packet encryption.  The packet number is always 0.
                    ##
                    ##    The primary use case of this function is for server to send
                    ##    CONNECTION_CLOSE frame in Initial packet to close connection
                    ##    without committing any state when validating Retry token fails.
                    ##
                    ##    This function returns the number of bytes written if it succeeds,
                    ##    or one of the following negative error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_NOBUF
                    ##        Buffer is too small.
                    ##    :macro:NGTCP2_ERR_CALLBACK_FAILURE
                    ##        Callback function failed.
                    ## ```
proc ngtcp2_pkt_write_retry*(dest: ptr uint8; destlen: uint; version: uint32;
                             dcid: ptr ngtcp2_cid; scid: ptr ngtcp2_cid;
                             odcid: ptr ngtcp2_cid; token: ptr uint8;
                             tokenlen: uint; encrypt: ngtcp2_encrypt;
                             aead: ptr ngtcp2_crypto_aead;
                             aead_ctx: ptr ngtcp2_crypto_aead_ctx): ngtcp2_ssize {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_pkt_write_retry writes Retry packet in the buffer pointed
                    ##    by |dest| whose length is |destlen|.  |dcid| is the Connection ID
                    ##    which appeared in a packet as a Source Connection ID sent by
                    ##    client.  |scid| is a server chosen Source Connection ID.  |odcid|
                    ##    specifies Original Destination Connection ID which appeared in a
                    ##    packet as a Destination Connection ID sent by client.  |token|
                    ##    specifies Retry Token, and |tokenlen| specifies its length.  |aead|
                    ##    must be AEAD_AES_128_GCM.  |aead_ctx| must be initialized with
                    ##    :macro:NGTCP2_RETRY_KEY as an encryption key.
                    ##
                    ##    This function returns the number of bytes written to the buffer, or
                    ##    one of the following negative error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_NOBUF
                    ##        Buffer is too small.
                    ##    :macro:NGTCP2_ERR_CALLBACK_FAILURE
                    ##        Callback function failed.
                    ##    :macro:NGTCP2_ERR_INVALID_ARGUMENT
                    ##        :member:odcid->datalen <ngtcp2_cid.datalen> is less than
                    ##        :macro:NGTCP2_MIN_INITIAL_DCIDLEN.
                    ## ```
proc ngtcp2_accept*(dest: ptr ngtcp2_pkt_hd; pkt: ptr uint8; pktlen: uint): cint {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_accept is used by server implementation, and decides
                    ##    whether packet |pkt| of length |pktlen| from client is acceptable
                    ##    for the very first packet to a connection.
                    ##
                    ##    If |dest| is not NULL and the function returns 0, the decoded
                    ##    packet header is stored in the object pointed by |dest|.
                    ##
                    ##    This function returns 0 if it succeeds, or one of the following
                    ##    negative error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_INVALID_ARGUMENT
                    ##        The packet is not acceptable for the very first packet to a new
                    ##        connection; or the function failed to parse the packet header.
                    ## ```
proc ngtcp2_conn_client_new_versioned*(pconn: ptr ptr ngtcp2_conn;
                                       dcid: ptr ngtcp2_cid;
                                       scid: ptr ngtcp2_cid;
                                       path: ptr ngtcp2_path;
                                       client_chosen_version: uint32;
                                       callbacks_version: cint;
                                       callbacks: ptr ngtcp2_callbacks;
                                       settings_version: cint;
                                       settings: ptr ngtcp2_settings;
                                       transport_params_version: cint;
                                       params: ptr ngtcp2_transport_params;
                                       mem: ptr ngtcp2_mem; user_data: pointer): cint {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_client_new creates new :type:ngtcp2_conn, and
                    ##    initializes it as client.  On success, it stores the pointer to the
                    ##    newly allocated object in |*pconn|.  |dcid| is a randomized
                    ##    Destination Connection ID which must be longer than or equal to
                    ##    :macro:NGTCP2_MIN_INITIAL_DCIDLEN.  |scid| is a Source Connection
                    ##    ID chosen by client.  |client_chosen_version| is a QUIC version
                    ##    that a client chooses.  |path| is the network path where this QUIC
                    ##    connection is being established, and must not be NULL.
                    ##    |callbacks|, |settings|, and |params| must not be NULL, and the
                    ##    function makes a copy of each of them.  |params| is a local QUIC
                    ##    transport parameters, and sent to a remote endpoint during
                    ##    handshake.  |user_data| is the arbitrary pointer which is passed to
                    ##    the user-defined callback functions.  If |mem| is NULL, the
                    ##    memory allocator returned by ngtcp2_mem_default() is used.
                    ##
                    ##    Call ngtcp2_conn_del to free memory allocated for |*pconn|.
                    ##
                    ##    This function returns 0 if it succeeds, or one of the following
                    ##    negative error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_NOMEM
                    ##        Out of memory.
                    ## ```
proc ngtcp2_conn_server_new_versioned*(pconn: ptr ptr ngtcp2_conn;
                                       dcid: ptr ngtcp2_cid;
                                       scid: ptr ngtcp2_cid;
                                       path: ptr ngtcp2_path;
                                       client_chosen_version: uint32;
                                       callbacks_version: cint;
                                       callbacks: ptr ngtcp2_callbacks;
                                       settings_version: cint;
                                       settings: ptr ngtcp2_settings;
                                       transport_params_version: cint;
                                       params: ptr ngtcp2_transport_params;
                                       mem: ptr ngtcp2_mem; user_data: pointer): cint {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_server_new creates new :type:ngtcp2_conn, and
                    ##    initializes it as server.  On success, it stores the pointer to the
                    ##    newly allocated object in |*pconn|.  |dcid| is a Destination
                    ##    Connection ID, and is usually the Connection ID that appears in
                    ##    client Initial packet as Source Connection ID.  |scid| is a Source
                    ##    Connection ID chosen by server.  |path| is the network path where
                    ##    this QUIC connection is being established, and must not be
                    ##    NULL.  |client_chosen_version| is a QUIC version that a client
                    ##    chooses.  |callbacks|, |settings|, and |params| must not be
                    ##    NULL, and the function makes a copy of each of them.  |params|
                    ##    is a local QUIC transport parameters, and sent to a remote endpoint
                    ##    during handshake.  |user_data| is the arbitrary pointer which is
                    ##    passed to the user-defined callback functions.  If |mem| is
                    ##    NULL, the memory allocator returned by ngtcp2_mem_default()
                    ##    is used.
                    ##
                    ##    Call ngtcp2_conn_del to free memory allocated for |*pconn|.
                    ##
                    ##    This function returns 0 if it succeeds, or one of the following
                    ##    negative error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_NOMEM
                    ##        Out of memory.
                    ## ```
proc ngtcp2_conn_del*(conn: ptr ngtcp2_conn) {.importc, cdecl.}
  ## ```
                                                               ##   @function
                                                               ##
                                                               ##    ngtcp2_conn_del frees resources allocated for |conn|.  It also
                                                               ##    frees memory pointed by |conn|.
                                                               ## ```
proc ngtcp2_conn_read_pkt_versioned*(conn: ptr ngtcp2_conn;
                                     path: ptr ngtcp2_path;
                                     pkt_info_version: cint;
                                     pi: ptr ngtcp2_pkt_info; pkt: ptr uint8;
                                     pktlen: uint; ts: ngtcp2_tstamp): cint {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_read_pkt decrypts QUIC packet given in |pkt| of
                    ##    length |pktlen| and processes it.  |path| is the network path the
                    ##    packet is delivered and must not be NULL.  |pi| is packet
                    ##    metadata and may be NULL. This function performs QUIC handshake
                    ##    as well.
                    ##
                    ##    This function must not be called from inside the callback
                    ##    functions.
                    ##
                    ##    This function returns 0 if it succeeds, or one of the following
                    ##    negative error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_RETRY
                    ##       Server must perform address validation by sending Retry packet
                    ##       (see ngtcp2_crypto_write_retry and ngtcp2_pkt_write_retry),
                    ##       and discard the connection state.  Client application does not
                    ##       get this error code.
                    ##    :macro:NGTCP2_ERR_DROP_CONN
                    ##       Server application must drop the connection silently (without
                    ##       sending any CONNECTION_CLOSE frame), and discard connection
                    ##       state.  Client application does not get this error code.
                    ##    :macro:NGTCP2_ERR_DRAINING
                    ##       A connection has entered the draining state, and no further
                    ##       packet transmission is allowed.
                    ##    :macro:NGTCP2_ERR_CLOSING
                    ##       A connection has entered the closing state, and no further
                    ##       packet transmission is allowed.  Calling
                    ##       ngtcp2_conn_write_connection_close makes a connection enter
                    ##       this state.
                    ##    :macro:NGTCP2_ERR_CRYPTO
                    ##       An error happened in TLS stack.  ngtcp2_conn_get_tls_alert
                    ##       returns TLS alert if set.
                    ##
                    ##    If any other negative error is returned, call
                    ##    ngtcp2_conn_write_connection_close to get terminal packet, and
                    ##    sending it makes QUIC connection enter the closing state.
                    ## ```
proc ngtcp2_conn_write_pkt_versioned*(conn: ptr ngtcp2_conn;
                                      path: ptr ngtcp2_path;
                                      pkt_info_version: cint;
                                      pi: ptr ngtcp2_pkt_info; dest: ptr uint8;
                                      destlen: uint; ts: ngtcp2_tstamp): ngtcp2_ssize {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_write_pkt is equivalent to calling
                    ##    ngtcp2_conn_writev_stream with -1 as |stream_id|, no stream data,
                    ##    and :macro:NGTCP2_WRITE_STREAM_FLAG_NONE as flags.
                    ## ```
proc ngtcp2_conn_tls_handshake_completed*(conn: ptr ngtcp2_conn) {.importc,
    cdecl.}
  ## ```
           ##   @function
           ##
           ##    ngtcp2_conn_tls_handshake_completed tells |conn| that the TLS
           ##    stack declares TLS handshake completion.  This does not mean QUIC
           ##    handshake has completed.  The library needs extra conditions to be
           ##    met.
           ## ```
proc ngtcp2_conn_get_handshake_completed*(conn: ptr ngtcp2_conn): cint {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_get_handshake_completed returns nonzero if QUIC
                    ##    handshake has completed.
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
                                                                           ##    context object, and must be initialized with a decryption key.
                                                                           ##    |rx_iv| is IV of length |rx_ivlen| for decryption.  |rx_hp_ctx| is
                                                                           ##    a packet header protection cipher context object for decryption.
                                                                           ##    Similarly, |tx_aead_ctx|, |tx_iv| and |tx_hp_ctx| are for
                                                                           ##    encrypting outgoing packets, and are the same length with the
                                                                           ##    decryption counterpart .  If they have already been set, they are
                                                                           ##    overwritten.
                                                                           ##
                                                                           ##    |ivlen| must be the minimum length of AEAD nonce, or 8 bytes if
                                                                           ##    that is larger.
                                                                           ##
                                                                           ##    If this function succeeds, |conn| takes ownership of |rx_aead_ctx|,
                                                                           ##    |rx_hp_ctx|, |tx_aead_ctx|, and |tx_hp_ctx|.
                                                                           ##    :member:ngtcp2_callbacks.delete_crypto_aead_ctx and
                                                                           ##    :member:ngtcp2_callbacks.delete_crypto_cipher_ctx will be called
                                                                           ##    to delete these objects when they are no longer used.  If this
                                                                           ##    function fails, the caller is responsible to delete them.
                                                                           ##
                                                                           ##    After receiving Retry packet, a Destination Connection ID that
                                                                           ##    client sends in Initial packet most likely changes.  In that case,
                                                                           ##    client application must generate these keying materials again based
                                                                           ##    on new Destination Connection ID, and install them again with this
                                                                           ##    function.
                                                                           ##
                                                                           ##    This function returns 0 if it succeeds, or one of the following
                                                                           ##    negative error codes:
                                                                           ##
                                                                           ##    :macro:NGTCP2_ERR_NOMEM
                                                                           ##        Out of memory.
                                                                           ## ```
proc ngtcp2_conn_install_vneg_initial_key*(conn: ptr ngtcp2_conn;
    version: uint32; rx_aead_ctx: ptr ngtcp2_crypto_aead_ctx; rx_iv: ptr uint8;
    rx_hp_ctx: ptr ngtcp2_crypto_cipher_ctx;
    tx_aead_ctx: ptr ngtcp2_crypto_aead_ctx; tx_iv: ptr uint8;
    tx_hp_ctx: ptr ngtcp2_crypto_cipher_ctx; ivlen: uint): cint {.importc, cdecl.}
  ## ```
                                                                                  ##   @function
                                                                                  ##
                                                                                  ##    ngtcp2_conn_install_vneg_initial_key installs packet protection
                                                                                  ##    keying materials for Initial packets on compatible version
                                                                                  ##    negotiation for |version|.  |rx_aead_ctx| is AEAD cipher context
                                                                                  ##    object, and must be initialized with a decryption key.  |rx_iv| is
                                                                                  ##    IV of length |rx_ivlen| for decryption.  |rx_hp_ctx| is a packet
                                                                                  ##    header protection cipher context object for decryption.  Similarly,
                                                                                  ##    |tx_aead_ctx|, |tx_iv| and |tx_hp_ctx| are for encrypting outgoing
                                                                                  ##    packets, and are the same length with the decryption counterpart.
                                                                                  ##    If they have already been set, they are overwritten.
                                                                                  ##
                                                                                  ##    |ivlen| must be the minimum length of AEAD nonce, or 8 bytes if
                                                                                  ##    that is larger.
                                                                                  ##
                                                                                  ##    If this function succeeds, |conn| takes ownership of |rx_aead_ctx|,
                                                                                  ##    |rx_hp_ctx|, |tx_aead_ctx|, and |tx_hp_ctx|.
                                                                                  ##    :member:ngtcp2_callbacks.delete_crypto_aead_ctx and
                                                                                  ##    :member:ngtcp2_callbacks.delete_crypto_cipher_ctx will be called
                                                                                  ##    to delete these objects when they are no longer used.  If this
                                                                                  ##    function fails, the caller is responsible to delete them.
                                                                                  ##
                                                                                  ##    This function returns 0 if it succeeds, or one of the following
                                                                                  ##    negative error codes:
                                                                                  ##
                                                                                  ##    :macro:NGTCP2_ERR_NOMEM
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
                                                                  ##    with a decryption key.  |iv| is IV of length |ivlen|.  |hp_ctx| is
                                                                  ##    a packet header protection cipher context object.
                                                                  ##
                                                                  ##    |ivlen| must be the minimum length of AEAD nonce, or 8 bytes if
                                                                  ##    that is larger.
                                                                  ##
                                                                  ##    If this function succeeds, |conn| takes ownership of |aead_ctx|,
                                                                  ##    and |hp_ctx|.  :member:ngtcp2_callbacks.delete_crypto_aead_ctx
                                                                  ##    and :member:ngtcp2_callbacks.delete_crypto_cipher_ctx will be
                                                                  ##    called to delete these objects when they are no longer used.  If
                                                                  ##    this function fails, the caller is responsible to delete them.
                                                                  ##
                                                                  ##    This function returns 0 if it succeeds, or one of the following
                                                                  ##    negative error codes:
                                                                  ##
                                                                  ##    :macro:NGTCP2_ERR_NOMEM
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
                                                                  ##    with an encryption key.  |iv| is IV of length |ivlen|.  |hp_ctx| is
                                                                  ##    a packet header protection cipher context object.
                                                                  ##
                                                                  ##    |ivlen| must be the minimum length of AEAD nonce, or 8 bytes if
                                                                  ##    that is larger.
                                                                  ##
                                                                  ##    If this function succeeds, |conn| takes ownership of |aead_ctx| and
                                                                  ##    |hp_ctx|.  :member:ngtcp2_callbacks.delete_crypto_aead_ctx and
                                                                  ##    :member:ngtcp2_callbacks.delete_crypto_cipher_ctx will be called
                                                                  ##    to delete these objects when they are no longer used.  If this
                                                                  ##    function fails, the caller is responsible to delete them.
                                                                  ##
                                                                  ##    This function returns 0 if it succeeds, or one of the following
                                                                  ##    negative error codes:
                                                                  ##
                                                                  ##    :macro:NGTCP2_ERR_NOMEM
                                                                  ##        Out of memory.
                                                                  ## ```
proc ngtcp2_conn_install_0rtt_key*(conn: ptr ngtcp2_conn;
                                   aead_ctx: ptr ngtcp2_crypto_aead_ctx;
                                   iv: ptr uint8; ivlen: uint;
                                   hp_ctx: ptr ngtcp2_crypto_cipher_ctx): cint {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_install_0rtt_key installs packet protection AEAD
                    ##    cipher context object |aead_ctx|, IV |iv| of length |ivlen|, and
                    ##    packet header protection cipher context object |hp_ctx| to encrypt
                    ##    (for client) or decrypt (for server) 0-RTT packets.
                    ##
                    ##    |ivlen| must be the minimum length of AEAD nonce, or 8 bytes if
                    ##    that is larger.
                    ##
                    ##    If this function succeeds, |conn| takes ownership of |aead_ctx| and
                    ##    |hp_ctx|.  :member:ngtcp2_callbacks.delete_crypto_aead_ctx and
                    ##    :member:ngtcp2_callbacks.delete_crypto_cipher_ctx will be called
                    ##    to delete these objects when they are no longer used.  If this
                    ##    function fails, the caller is responsible to delete them.
                    ##
                    ##    This function returns 0 if it succeeds, or one of the following
                    ##    negative error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_NOMEM
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
                    ##    materials for decrypting 1-RTT packets.  |secret| of length
                    ##    |secretlen| is the decryption secret which is used to derive keying
                    ##    materials passed to this function.  |aead_ctx| is AEAD cipher
                    ##    context object which must be initialized with a decryption key.
                    ##    |iv| is IV of length |ivlen|.  |hp_ctx| is a packet header
                    ##    protection cipher context object.
                    ##
                    ##    |ivlen| must be the minimum length of AEAD nonce, or 8 bytes if
                    ##    that is larger.
                    ##
                    ##    If this function succeeds, |conn| takes ownership of |aead_ctx| and
                    ##    |hp_ctx|.  :member:ngtcp2_callbacks.delete_crypto_aead_ctx and
                    ##    :member:ngtcp2_callbacks.delete_crypto_cipher_ctx will be called
                    ##    to delete these objects when they are no longer used.  If this
                    ##    function fails, the caller is responsible to delete them.
                    ##
                    ##    This function returns 0 if it succeeds, or one of the following
                    ##    negative error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_NOMEM
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
                    ##    materials for encrypting 1-RTT packets.  |secret| of length
                    ##    |secretlen| is the encryption secret which is used to derive keying
                    ##    materials passed to this function.  |aead_ctx| is AEAD cipher
                    ##    context object which must be initialized with an encryption key.
                    ##    |iv| is IV of length |ivlen|.  |hp_ctx| is a packet header
                    ##    protection cipher context object.
                    ##
                    ##    |ivlen| must be the minimum length of AEAD nonce, or 8 bytes if
                    ##    that is larger.
                    ##
                    ##    If this function succeeds, |conn| takes ownership of |aead_ctx| and
                    ##    |hp_ctx|.  :member:ngtcp2_callbacks.delete_crypto_aead_ctx and
                    ##    :member:ngtcp2_callbacks.delete_crypto_cipher_ctx will be called
                    ##    to delete these objects when they are no longer used.  If this
                    ##    function fails, the caller is responsible to delete them.
                    ##
                    ##    This function returns 0 if it succeeds, or one of the following
                    ##    negative error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_NOMEM
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
                    ##    :macro:NGTCP2_ERR_INVALID_STATE
                    ##        The previous key update has not been confirmed yet; or key
                    ##        update is too frequent; or new keys are not available yet.
                    ## ```
proc ngtcp2_conn_set_tls_error*(conn: ptr ngtcp2_conn; liberr: cint) {.importc,
    cdecl.}
  ## ```
           ##   @function
           ##
           ##    ngtcp2_conn_set_tls_error sets the TLS related error |liberr| in
           ##    |conn|.  |liberr| must be one of ngtcp2 library error codes (which
           ##    is defined as NGTCP2_ERR_* macro, such as
           ##    :macro:NGTCP2_ERR_DECRYPT).  In general, error code should be
           ##    propagated via return value, but sometimes ngtcp2 API is called
           ##    inside callback function of TLS stack, and it does not allow to
           ##    return ngtcp2 error code directly.  In this case, implementation
           ##    can set the error code (e.g.,
           ##    :macro:NGTCP2_ERR_MALFORMED_TRANSPORT_PARAM) using this function.
           ##
           ##    See also ngtcp2_conn_get_tls_error.
           ## ```
proc ngtcp2_conn_get_tls_error*(conn: ptr ngtcp2_conn): cint {.importc, cdecl.}
  ## ```
                                                                               ##   @function
                                                                               ##
                                                                               ##    ngtcp2_conn_get_tls_error returns the value set by
                                                                               ##    ngtcp2_conn_set_tls_error.  If no value is set, this function
                                                                               ##    returns 0.
                                                                               ## ```
proc ngtcp2_conn_set_tls_alert*(conn: ptr ngtcp2_conn; alert: uint8) {.importc,
    cdecl.}
  ## ```
           ##   @function
           ##
           ##    ngtcp2_conn_set_tls_alert sets a TLS alert |alert| generated by a
           ##    TLS stack of a local endpoint to |conn|.
           ##
           ##    See also ngtcp2_conn_get_tls_alert.
           ## ```
proc ngtcp2_conn_get_tls_alert*(conn: ptr ngtcp2_conn): uint8 {.importc, cdecl.}
  ## ```
                                                                                ##   @function
                                                                                ##
                                                                                ##    ngtcp2_conn_get_tls_alert returns the value set by
                                                                                ##    ngtcp2_conn_set_tls_alert.  If no value is set, this function
                                                                                ##    returns 0.
                                                                                ## ```
proc ngtcp2_conn_set_keep_alive_timeout*(conn: ptr ngtcp2_conn;
    timeout: ngtcp2_duration) {.importc, cdecl.}
  ## ```
                                                ##   @function
                                                ##
                                                ##    ngtcp2_conn_set_keep_alive_timeout sets keep-alive timeout.  If
                                                ##    nonzero value is given, after a connection is idle at least in a
                                                ##    given amount of time, a keep-alive packet is sent.  If UINT64_MAX
                                                ##    is set, keep-alive functionality is disabled, and this is the
                                                ##    default.  Specifying 0 in |timeout| is reserved for a future
                                                ##    extension, and for now it is treated as if UINT64_MAX is given.
                                                ## ```
proc ngtcp2_conn_get_expiry*(conn: ptr ngtcp2_conn): ngtcp2_tstamp {.importc,
    cdecl.}
  ## ```
           ##   @function
           ##
           ##    ngtcp2_conn_get_expiry returns the next expiry time.  It returns
           ##    UINT64_MAX if there is no next expiry.
           ##
           ##    Call ngtcp2_conn_handle_expiry and then
           ##    ngtcp2_conn_writev_stream (or ngtcp2_conn_writev_datagram) when
           ##    the expiry time has passed.
           ## ```
proc ngtcp2_conn_handle_expiry*(conn: ptr ngtcp2_conn; ts: ngtcp2_tstamp): cint {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_handle_expiry handles expired timer.
                    ## ```
proc ngtcp2_conn_get_pto*(conn: ptr ngtcp2_conn): ngtcp2_duration {.importc,
    cdecl.}
  ## ```
           ##   @function
           ##
           ##    ngtcp2_conn_get_pto returns Probe Timeout (PTO).
           ## ```
proc ngtcp2_conn_decode_and_set_remote_transport_params*(conn: ptr ngtcp2_conn;
    data: ptr uint8; datalen: uint): cint {.importc, cdecl.}
  ## ```
                                                            ##   @function
                                                            ##
                                                            ##    ngtcp2_conn_decode_and_set_remote_transport_params decodes QUIC
                                                            ##    transport parameters from the buffer pointed by |data| of length
                                                            ##    |datalen|, and sets the result to |conn|.
                                                            ##
                                                            ##    This function returns 0 if it succeeds, or one of the following
                                                            ##    negative error codes:
                                                            ##
                                                            ##    :macro:NGTCP2_ERR_REQUIRED_TRANSPORT_PARAM
                                                            ##        The required parameter is missing.
                                                            ##    :macro:NGTCP2_ERR_MALFORMED_TRANSPORT_PARAM
                                                            ##        The input is malformed.
                                                            ##    :macro:NGTCP2_ERR_TRANSPORT_PARAM
                                                            ##        Failed to validate the remote QUIC transport parameters.
                                                            ##    :macro:NGTCP2_ERR_VERSION_NEGOTIATION_FAILURE
                                                            ##        Version negotiation failure.
                                                            ##    :macro:NGTCP2_ERR_CALLBACK_FAILURE
                                                            ##        User callback failed
                                                            ## ```
proc ngtcp2_conn_get_remote_transport_params*(conn: ptr ngtcp2_conn): ptr ngtcp2_transport_params {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_get_remote_transport_params returns a pointer to the
                    ##    remote QUIC transport parameters.  If no remote transport
                    ##    parameters are set, it returns NULL.
                    ## ```
proc ngtcp2_conn_encode_0rtt_transport_params*(conn: ptr ngtcp2_conn;
    dest: ptr uint8; destlen: uint): ngtcp2_ssize {.importc, cdecl.}
proc ngtcp2_conn_decode_and_set_0rtt_transport_params*(conn: ptr ngtcp2_conn;
    data: ptr uint8; datalen: uint): cint {.importc, cdecl.}
  ## ```
                                                            ##   @function
                                                            ##
                                                            ##    ngtcp2_conn_decode_and_set_0rtt_transport_params decodes QUIC
                                                            ##    transport parameters from |data| of length |datalen|, which is
                                                            ##    assumed to be the parameters received from the server in the
                                                            ##    previous connection, and sets it to |conn|.  These parameters are
                                                            ##    used to send 0-RTT data.  QUIC requires that client application
                                                            ##    should remember transport parameters along with a session ticket.
                                                            ##
                                                            ##    At least following fields should be included:
                                                            ##
                                                            ##    - :member:ngtcp2_transport_params.initial_max_streams_bidi
                                                            ##    - :member:ngtcp2_transport_params.initial_max_streams_uni
                                                            ##    - :member:ngtcp2_transport_params.initial_max_stream_data_bidi_local
                                                            ##    - :member:ngtcp2_transport_params.initial_max_stream_data_bidi_remote
                                                            ##    - :member:ngtcp2_transport_params.initial_max_stream_data_uni
                                                            ##    - :member:ngtcp2_transport_params.initial_max_data
                                                            ##    - :member:ngtcp2_transport_params.active_connection_id_limit
                                                            ##    - :member:ngtcp2_transport_params.max_datagram_frame_size (if
                                                            ##      DATAGRAM extension was negotiated)
                                                            ##
                                                            ##    This function must only be used by client.
                                                            ##
                                                            ##    This function returns 0 if it succeeds, or one of the following
                                                            ##    negative error codes:
                                                            ##
                                                            ##    :macro:NGTCP2_ERR_NOMEM
                                                            ##        Out of memory.
                                                            ##    :macro:NGTCP2_ERR_MALFORMED_TRANSPORT_PARAM
                                                            ##        The input is malformed.
                                                            ## ```
proc ngtcp2_conn_set_local_transport_params_versioned*(conn: ptr ngtcp2_conn;
    transport_params_version: cint; params: ptr ngtcp2_transport_params): cint {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_set_local_transport_params sets the local transport
                    ##    parameters |params|.  This function can only be called by server.
                    ##    Although the local transport parameters are passed to
                    ##    ngtcp2_conn_server_new, server might want to update them after
                    ##    ALPN is chosen.  In that case, server can update the transport
                    ##    parameters with this function.  Server must call this function
                    ##    before calling ngtcp2_conn_install_tx_handshake_key.
                    ##
                    ##    This function returns 0 if it succeeds, or one of the following
                    ##    negative error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_INVALID_STATE
                    ##        ngtcp2_conn_install_tx_handshake_key has been called.
                    ## ```
proc ngtcp2_conn_get_local_transport_params*(conn: ptr ngtcp2_conn): ptr ngtcp2_transport_params {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_get_local_transport_params returns a pointer to the
                    ##    local QUIC transport parameters.
                    ## ```
proc ngtcp2_conn_encode_local_transport_params*(conn: ptr ngtcp2_conn;
    dest: ptr uint8; destlen: uint): ngtcp2_ssize {.importc, cdecl.}
  ## ```
                                                                    ##   @function
                                                                    ##
                                                                    ##    ngtcp2_conn_encode_local_transport_params encodes the local QUIC
                                                                    ##    transport parameters in |dest| of length |destlen|.
                                                                    ##
                                                                    ##    This function returns the number of bytes written, or one of the
                                                                    ##    following negative error codes:
                                                                    ##
                                                                    ##    :macro:NGTCP2_ERR_NOBUF
                                                                    ##        Buffer is too small.
                                                                    ## ```
proc ngtcp2_conn_open_bidi_stream*(conn: ptr ngtcp2_conn; pstream_id: ptr int64;
                                   stream_user_data: pointer): cint {.importc,
    cdecl.}
  ## ```
           ##   @function
           ##
           ##    ngtcp2_conn_open_bidi_stream opens new bidirectional stream.  The
           ##    |stream_user_data| is the user data specific to the stream.  The
           ##    stream ID of the opened stream is stored in |*pstream_id|.
           ##
           ##    Application can call this function before handshake completes.  For
           ##    0-RTT packet, application can call this function after calling
           ##    ngtcp2_conn_decode_and_set_0rtt_transport_params.  For 1-RTT
           ##    packet, application can call this function after calling
           ##    ngtcp2_conn_decode_and_set_remote_transport_params and
           ##    ngtcp2_conn_install_tx_key.  If ngtcp2 crypto support library is
           ##    used, application can call this function after calling
           ##    ngtcp2_crypto_derive_and_install_tx_key for 1-RTT packet.
           ##
           ##    This function returns 0 if it succeeds, or one of the following
           ##    negative error codes:
           ##
           ##    :macro:NGTCP2_ERR_NOMEM
           ##        Out of memory
           ##    :macro:NGTCP2_ERR_STREAM_ID_BLOCKED
           ##        The remote endpoint does not allow |stream_id| yet.
           ## ```
proc ngtcp2_conn_open_uni_stream*(conn: ptr ngtcp2_conn; pstream_id: ptr int64;
                                  stream_user_data: pointer): cint {.importc,
    cdecl.}
  ## ```
           ##   @function
           ##
           ##    ngtcp2_conn_open_uni_stream opens new unidirectional stream.  The
           ##    |stream_user_data| is the user data specific to the stream.  The
           ##    stream ID of the opened stream is stored in |*pstream_id|.
           ##
           ##    Application can call this function before handshake completes.  For
           ##    0-RTT packet, application can call this function after calling
           ##    ngtcp2_conn_decode_and_set_0rtt_transport_params.  For 1-RTT
           ##    packet, application can call this function after calling
           ##    ngtcp2_conn_decode_and_set_remote_transport_params and
           ##    ngtcp2_conn_install_tx_key.  If ngtcp2 crypto support library is
           ##    used, application can call this function after calling
           ##    ngtcp2_crypto_derive_and_install_tx_key for 1-RTT packet.
           ##
           ##    This function returns 0 if it succeeds, or one of the following
           ##    negative error codes:
           ##
           ##    :macro:NGTCP2_ERR_NOMEM
           ##        Out of memory
           ##    :macro:NGTCP2_ERR_STREAM_ID_BLOCKED
           ##        The remote endpoint does not allow |stream_id| yet.
           ## ```
proc ngtcp2_conn_shutdown_stream*(conn: ptr ngtcp2_conn; flags: uint32;
                                  stream_id: int64; app_error_code: uint64): cint {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_shutdown_stream closes a stream denoted by
                    ##    |stream_id| abruptly.  |app_error_code| is one of application error
                    ##    codes, and indicates the reason of shutdown.  Successful call of
                    ##    this function does not immediately erase the state of the stream.
                    ##    The actual deletion is done when the remote endpoint sends
                    ##    acknowledgement.  Calling this function is equivalent to call
                    ##    ngtcp2_conn_shutdown_stream_read, and
                    ##    ngtcp2_conn_shutdown_stream_write sequentially with the following
                    ##    differences.  If |stream_id| refers to a local unidirectional
                    ##    stream, this function only shutdowns write side of the stream.  If
                    ##    |stream_id| refers to a remote unidirectional stream, this function
                    ##    only shutdowns read side of the stream.
                    ##
                    ##    |flags| is currently unused, and should be set to 0.
                    ##
                    ##    This function returns 0 if a stream denoted by |stream_id| is not
                    ##    found.
                    ##
                    ##    This function returns 0 if it succeeds, or one of the following
                    ##    negative error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_NOMEM
                    ##        Out of memory
                    ## ```
proc ngtcp2_conn_shutdown_stream_write*(conn: ptr ngtcp2_conn; flags: uint32;
                                        stream_id: int64; app_error_code: uint64): cint {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_shutdown_stream_write closes write-side of a stream
                    ##    denoted by |stream_id| abruptly.  |app_error_code| is one of
                    ##    application error codes, and indicates the reason of shutdown.  If
                    ##    this function succeeds, no further application data is sent to the
                    ##    remote endpoint.  It discards all data which has not been
                    ##    acknowledged yet.
                    ##
                    ##    |flags| is currently unused, and should be set to 0.
                    ##
                    ##    This function returns 0 if a stream denoted by |stream_id| is not
                    ##    found.
                    ##
                    ##    This function returns 0 if it succeeds, or one of the following
                    ##    negative error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_NOMEM
                    ##        Out of memory
                    ##    :macro:NGTCP2_ERR_INVALID_ARGUMENT
                    ##        |stream_id| refers to a remote unidirectional stream.
                    ## ```
proc ngtcp2_conn_shutdown_stream_read*(conn: ptr ngtcp2_conn; flags: uint32;
                                       stream_id: int64; app_error_code: uint64): cint {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_shutdown_stream_read closes read-side of a stream
                    ##    denoted by |stream_id| abruptly.  |app_error_code| is one of
                    ##    application error codes, and indicates the reason of shutdown.  If
                    ##    this function succeeds, no further application data is forwarded to
                    ##    an application layer.
                    ##
                    ##    |flags| is currently unused, and should be set to 0.
                    ##
                    ##    This function returns 0 if a stream denoted by |stream_id| is not
                    ##    found.
                    ##
                    ##    This function returns 0 if it succeeds, or one of the following
                    ##    negative error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_NOMEM
                    ##        Out of memory
                    ##    :macro:NGTCP2_ERR_INVALID_ARGUMENT
                    ##        |stream_id| refers to a local unidirectional stream.
                    ## ```
proc ngtcp2_conn_write_stream_versioned*(conn: ptr ngtcp2_conn;
    path: ptr ngtcp2_path; pkt_info_version: cint; pi: ptr ngtcp2_pkt_info;
    dest: ptr uint8; destlen: uint; pdatalen: ptr ngtcp2_ssize; flags: uint32;
    stream_id: int64; data: ptr uint8; datalen: uint; ts: ngtcp2_tstamp): ngtcp2_ssize {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_write_stream is just like
                    ##    ngtcp2_conn_writev_stream.  The only difference is that it
                    ##    conveniently accepts a single buffer.
                    ## ```
proc ngtcp2_conn_writev_stream_versioned*(conn: ptr ngtcp2_conn;
    path: ptr ngtcp2_path; pkt_info_version: cint; pi: ptr ngtcp2_pkt_info;
    dest: ptr uint8; destlen: uint; pdatalen: ptr ngtcp2_ssize; flags: uint32;
    stream_id: int64; datav: ptr ngtcp2_vec; datavcnt: uint; ts: ngtcp2_tstamp): ngtcp2_ssize {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_writev_stream writes a packet containing stream data
                    ##    of a stream denoted by |stream_id|.  The buffer of the packet is
                    ##    pointed by |dest| of length |destlen|.  This function performs QUIC
                    ##    handshake as well.
                    ##
                    ##    |destlen| should be at least
                    ##    :member:ngtcp2_settings.max_tx_udp_payload_size.  It must be at
                    ##    least :macro:NGTCP2_MAX_UDP_PAYLOAD_SIZE.
                    ##
                    ##    Specifying -1 to |stream_id| means no new stream data to send.
                    ##
                    ##    If |path| is not NULL, this function stores the network path
                    ##    with which the packet should be sent.  Each addr field
                    ##    (:member:ngtcp2_path.local and :member:ngtcp2_path.remote) must
                    ##    point to the buffer which should be at least
                    ##    sizeof(:type:sockaddr_union) bytes long.  The assignment might
                    ##    not be done if nothing is written to |dest|.
                    ##
                    ##    If |pi| is not NULL, this function stores packet metadata in it
                    ##    if it succeeds.  The metadata includes ECN markings.  When calling
                    ##    this function again after it returns
                    ##    :macro:NGTCP2_ERR_WRITE_MORE, caller must pass the same |pi| to
                    ##    this function.
                    ##
                    ##    Stream data is specified as vector of data |datav|.  |datavcnt|
                    ##    specifies the number of :type:ngtcp2_vec that |datav| includes.
                    ##
                    ##    If all given data is encoded as STREAM frame in |dest|, and if
                    ##    |flags| & :macro:NGTCP2_WRITE_STREAM_FLAG_FIN is nonzero, fin
                    ##    flag is set to outgoing STREAM frame.  Otherwise, fin flag in
                    ##    STREAM frame is not set.
                    ##
                    ##    This packet may contain frames other than STREAM frame.  The packet
                    ##    might not contain STREAM frame if other frames occupy the packet.
                    ##    In that case, |*pdatalen| would be -1 if |pdatalen| is not
                    ##    NULL.
                    ##
                    ##    Empty data is treated specially, and it is only accepted if no
                    ##    data, including the empty data, is submitted to a stream or
                    ##    :macro:NGTCP2_WRITE_STREAM_FLAG_FIN is set in |flags|.  If 0
                    ##    length STREAM frame is successfully serialized, |*pdatalen| would
                    ##    be 0.
                    ##
                    ##    The number of data encoded in STREAM frame is stored in |*pdatalen|
                    ##    if it is not NULL.  The caller must keep the portion of data
                    ##    covered by |*pdatalen| bytes in tact until
                    ##    :member:ngtcp2_callbacks.acked_stream_data_offset indicates that
                    ##    they are acknowledged by a remote endpoint or the stream is closed.
                    ##
                    ##    If the given stream data is small (e.g., few bytes), the packet
                    ##    might be severely under filled.  Too many small packet might
                    ##    increase overall packet processing costs.  Unless there are
                    ##    retransmissions, by default, application can only send 1 STREAM
                    ##    frame in one QUIC packet.  In order to include more than 1 STREAM
                    ##    frame in one QUIC packet, specify
                    ##    :macro:NGTCP2_WRITE_STREAM_FLAG_MORE in |flags|.  This is
                    ##    analogous to MSG_MORE flag in :manpage:send(2).  If the
                    ##    :macro:NGTCP2_WRITE_STREAM_FLAG_MORE is used, there are 4
                    ##    outcomes:
                    ##
                    ##    - The function returns the written length of packet just like
                    ##      without :macro:NGTCP2_WRITE_STREAM_FLAG_MORE.  This is because
                    ##      packet is nearly full, and the library decided to make a complete
                    ##      packet.  |*pdatalen| might be -1 or >= 0.  It may return 0 which
                    ##      indicates that no packet transmission is possible at the moment
                    ##      for some reason.
                    ##
                    ##    - The function returns :macro:NGTCP2_ERR_WRITE_MORE.  In this
                    ##      case, |*pdatalen| >= 0 is asserted.  It indicates that
                    ##      application can still call this function with different stream
                    ##      data (or ngtcp2_conn_writev_datagram if it has data to send in
                    ##      unreliable datagram) to pack them into the same packet.
                    ##      Application has to specify the same |conn|, |path|, |pi|, |dest|,
                    ##      |destlen|, and |ts| parameters, otherwise the behaviour is
                    ##      undefined.  The application can change |flags|.
                    ##
                    ##    - The function returns one of the following negative error codes:
                    ##      :macro:NGTCP2_ERR_STREAM_DATA_BLOCKED,
                    ##      :macro:NGTCP2_ERR_STREAM_NOT_FOUND, or
                    ##      :macro:NGTCP2_ERR_STREAM_SHUT_WR.  In this case, |*pdatalen| ==
                    ##      -1 is asserted.  Application can still write the stream data of
                    ##      the other streams by calling this function (or
                    ##      ngtcp2_conn_writev_datagram if it has data to send in
                    ##      unreliable datagram) to pack them into the same packet.
                    ##      Application has to specify the same |conn|, |path|, |pi|, |dest|,
                    ##      |destlen|, and |ts| parameters, otherwise the behaviour is
                    ##      undefined.  The application can change |flags|.
                    ##
                    ##    - The other negative error codes might be returned just like
                    ##      without :macro:NGTCP2_WRITE_STREAM_FLAG_MORE.  These errors
                    ##      should be treated as a connection error.
                    ##
                    ##    When application uses :macro:NGTCP2_WRITE_STREAM_FLAG_MORE at
                    ##    least once, it must not call other ngtcp2 API functions
                    ##    (application can still call ngtcp2_conn_write_connection_close to
                    ##    handle error from this function.  It can also call
                    ##    ngtcp2_conn_shutdown_stream_read,
                    ##    ngtcp2_conn_shutdown_stream_write, and
                    ##    ngtcp2_conn_shutdown_stream), just keep calling this function (or
                    ##    ngtcp2_conn_writev_datagram) until it returns 0, a positive
                    ##    number (which indicates a complete packet is ready), or the error
                    ##    codes other than :macro:NGTCP2_ERR_WRITE_MORE,
                    ##    :macro:NGTCP2_ERR_STREAM_DATA_BLOCKED,
                    ##    :macro:NGTCP2_ERR_STREAM_NOT_FOUND, and
                    ##    :macro:NGTCP2_ERR_STREAM_SHUT_WR.  If there is no stream data to
                    ##    include, call this function with |stream_id| as -1 to stop
                    ##    coalescing and write a packet.
                    ##
                    ##    This function returns 0 if it cannot write any frame because buffer
                    ##    is too small, or packet is congestion limited.  Application should
                    ##    keep reading and wait for congestion window to grow.
                    ##
                    ##    This function must not be called from inside the callback
                    ##    functions.
                    ##
                    ##    ngtcp2_conn_update_pkt_tx_time must be called after this
                    ##    function.  Application may call this function multiple times before
                    ##    calling ngtcp2_conn_update_pkt_tx_time.
                    ##
                    ##    This function returns the number of bytes written in |dest| if it
                    ##    succeeds, or one of the following negative error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_NOMEM
                    ##        Out of memory
                    ##    :macro:NGTCP2_ERR_STREAM_NOT_FOUND
                    ##        Stream does not exist
                    ##    :macro:NGTCP2_ERR_STREAM_SHUT_WR
                    ##        Stream is half closed (local); or stream is being reset.
                    ##    :macro:NGTCP2_ERR_PKT_NUM_EXHAUSTED
                    ##        Packet number is exhausted, and cannot send any more packet.
                    ##    :macro:NGTCP2_ERR_CALLBACK_FAILURE
                    ##        User callback failed
                    ##    :macro:NGTCP2_ERR_INVALID_ARGUMENT
                    ##        The total length of stream data is too large.
                    ##    :macro:NGTCP2_ERR_STREAM_DATA_BLOCKED
                    ##        Stream is blocked because of flow control.
                    ##    :macro:NGTCP2_ERR_WRITE_MORE
                    ##        (Only when :macro:NGTCP2_WRITE_STREAM_FLAG_MORE is specified)
                    ##        Application can call this function to pack more stream data
                    ##        into the same packet.  See above to know how it works.
                    ##
                    ##    If any other negative error is returned, call
                    ##    ngtcp2_conn_write_connection_close to get terminal packet, and
                    ##    sending it makes QUIC connection enter the closing state.
                    ## ```
proc ngtcp2_conn_write_datagram_versioned*(conn: ptr ngtcp2_conn;
    path: ptr ngtcp2_path; pkt_info_version: cint; pi: ptr ngtcp2_pkt_info;
    dest: ptr uint8; destlen: uint; paccepted: ptr cint; flags: uint32;
    dgram_id: uint64; data: ptr uint8; datalen: uint; ts: ngtcp2_tstamp): ngtcp2_ssize {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_write_datagram is just like
                    ##    ngtcp2_conn_writev_datagram.  The only difference is that it
                    ##    conveniently accepts a single buffer.
                    ## ```
proc ngtcp2_conn_writev_datagram_versioned*(conn: ptr ngtcp2_conn;
    path: ptr ngtcp2_path; pkt_info_version: cint; pi: ptr ngtcp2_pkt_info;
    dest: ptr uint8; destlen: uint; paccepted: ptr cint; flags: uint32;
    dgram_id: uint64; datav: ptr ngtcp2_vec; datavcnt: uint; ts: ngtcp2_tstamp): ngtcp2_ssize {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_writev_datagram writes a packet containing unreliable
                    ##    data in DATAGRAM frame.  The buffer of the packet is pointed by
                    ##    |dest| of length |destlen|.  This function performs QUIC handshake
                    ##    as well.
                    ##
                    ##    |destlen| should be at least
                    ##    :member:ngtcp2_settings.max_tx_udp_payload_size.  It must be at
                    ##    least :macro:NGTCP2_MAX_UDP_PAYLOAD_SIZE.
                    ##
                    ##    For |path| and |pi| parameters, refer to
                    ##    ngtcp2_conn_writev_stream.
                    ##
                    ##    Stream data is specified as vector of data |datav|.  |datavcnt|
                    ##    specifies the number of :type:ngtcp2_vec that |datav| includes.
                    ##
                    ##    If the given data is written to the buffer, nonzero value is
                    ##    assigned to |*paccepted| if it is not NULL.  The data in DATAGRAM
                    ##    frame cannot be fragmented; writing partial data is not possible.
                    ##
                    ##    |dgram_id| is an opaque identifier which should uniquely identify
                    ##    the given DATAGRAM data.  It is passed to
                    ##    :member:ngtcp2_callbacks.ack_datagram callback when a packet that
                    ##    contains DATAGRAM frame is acknowledged.  It is also passed to
                    ##    :member:ngtcp2_callbacks.lost_datagram callback when a packet
                    ##    that contains DATAGRAM frame is declared lost.  If an application
                    ##    uses neither of those callbacks, it can sets 0 to this parameter.
                    ##
                    ##    This function might write other frames other than DATAGRAM frame,
                    ##    just like ngtcp2_conn_writev_stream.
                    ##
                    ##    If the function returns 0, it means that no more data cannot be
                    ##    sent because of congestion control limit; or, data does not fit
                    ##    into the provided buffer; or, a local endpoint, as a server, is
                    ##    unable to send data because of its amplification limit.  In this
                    ##    case, |*paccepted| is assigned zero if it is not NULL.
                    ##
                    ##    If :macro:NGTCP2_WRITE_DATAGRAM_FLAG_MORE is set in |flags|,
                    ##    there are 3 outcomes:
                    ##
                    ##    - The function returns the written length of packet just like
                    ##      without :macro:NGTCP2_WRITE_DATAGRAM_FLAG_MORE.  This is
                    ##      because packet is nearly full and the library decided to make a
                    ##      complete packet.  |*paccepted| might be zero or nonzero.
                    ##
                    ##    - The function returns :macro:NGTCP2_ERR_WRITE_MORE.  In this
                    ##      case, |*paccepted| != 0 is asserted.  This indicates that
                    ##      application can call this function with another unreliable data
                    ##      (or ngtcp2_conn_writev_stream if it has stream data to send) to
                    ##      pack them into the same packet.  Application has to specify the
                    ##      same |conn|, |path|, |pi|, |dest|, |destlen|, and |ts|
                    ##      parameters, otherwise the behaviour is undefined.  The
                    ##      application can change |flags|.
                    ##
                    ##    - The other error might be returned just like without
                    ##      :macro:NGTCP2_WRITE_DATAGRAM_FLAG_MORE.
                    ##
                    ##    When application sees :macro:NGTCP2_ERR_WRITE_MORE, it must not
                    ##    call other ngtcp2 API functions (application can still call
                    ##    ngtcp2_conn_write_connection_close to handle error from this
                    ##    function.  It can also call ngtcp2_conn_shutdown_stream_read,
                    ##    ngtcp2_conn_shutdown_stream_write, and
                    ##    ngtcp2_conn_shutdown_stream).  Just keep calling this function
                    ##    (or ngtcp2_conn_writev_stream) until it returns a positive number
                    ##    (which indicates a complete packet is ready).
                    ##
                    ##    This function returns the number of bytes written in |dest| if it
                    ##    succeeds, or one of the following negative error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_NOMEM
                    ##        Out of memory
                    ##    :macro:NGTCP2_ERR_PKT_NUM_EXHAUSTED
                    ##        Packet number is exhausted, and cannot send any more packet.
                    ##    :macro:NGTCP2_ERR_CALLBACK_FAILURE
                    ##        User callback failed
                    ##    :macro:NGTCP2_ERR_WRITE_MORE
                    ##        (Only when :macro:NGTCP2_WRITE_DATAGRAM_FLAG_MORE is
                    ##        specified) Application can call this function to pack more data
                    ##        into the same packet.  See above to know how it works.
                    ##    :macro:NGTCP2_ERR_INVALID_STATE
                    ##        A remote endpoint did not express the DATAGRAM frame support.
                    ##    :macro:NGTCP2_ERR_INVALID_ARGUMENT
                    ##        The provisional DATAGRAM frame size exceeds the maximum
                    ##        DATAGRAM frame size that a remote endpoint can receive.
                    ##
                    ##    If any other negative error is returned, call
                    ##    ngtcp2_conn_write_connection_close to get terminal packet, and
                    ##    sending it makes QUIC connection enter the closing state.
                    ## ```
proc ngtcp2_conn_in_closing_period*(conn: ptr ngtcp2_conn): cint {.importc,
    cdecl.}
  ## ```
           ##   @function
           ##
           ##    ngtcp2_conn_in_closing_period returns nonzero if |conn| is in the
           ##    closing period.
           ## ```
proc ngtcp2_conn_in_draining_period*(conn: ptr ngtcp2_conn): cint {.importc,
    cdecl.}
  ## ```
           ##   @function
           ##
           ##    ngtcp2_conn_in_draining_period returns nonzero if |conn| is in
           ##    the draining period.
           ## ```
proc ngtcp2_conn_extend_max_stream_offset*(conn: ptr ngtcp2_conn;
    stream_id: int64; datalen: uint64): cint {.importc, cdecl.}
  ## ```
                                                               ##   @function
                                                               ##
                                                               ##    ngtcp2_conn_extend_max_stream_offset extends the maximum stream
                                                               ##    data that a remote endpoint can send by |datalen|.  |stream_id|
                                                               ##    specifies the stream ID.  This function only extends stream-level
                                                               ##    flow control window.
                                                               ##
                                                               ##    This function returns 0 if a stream denoted by |stream_id| is not
                                                               ##    found.
                                                               ##
                                                               ##    This function returns 0 if it succeeds, or one of the following
                                                               ##    negative error codes:
                                                               ##
                                                               ##    :macro:NGTCP2_ERR_NOMEM
                                                               ##        Out of memory.
                                                               ##    :macro:NGTCP2_ERR_INVALID_ARGUMENT
                                                               ##        |stream_id| refers to a local unidirectional stream.
                                                               ## ```
proc ngtcp2_conn_extend_max_offset*(conn: ptr ngtcp2_conn; datalen: uint64) {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_extend_max_offset extends max data offset by
                    ##    |datalen|.  This function only extends connection-level flow
                    ##    control window.
                    ## ```
proc ngtcp2_conn_extend_max_streams_bidi*(conn: ptr ngtcp2_conn; n: uint) {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_extend_max_streams_bidi extends the number of maximum
                    ##    remote bidirectional streams that a remote endpoint can open by
                    ##    |n|.
                    ##
                    ##    The library does not increase maximum stream limit automatically.
                    ##    The exception is when a stream is closed without
                    ##    :member:ngtcp2_callbacks.stream_open callback being called.  In
                    ##    this case, stream limit is increased automatically.
                    ## ```
proc ngtcp2_conn_extend_max_streams_uni*(conn: ptr ngtcp2_conn; n: uint) {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_extend_max_streams_uni extends the number of maximum
                    ##    remote unidirectional streams that a remote endpoint can open by
                    ##    |n|.
                    ##
                    ##    The library does not increase maximum stream limit automatically.
                    ##    The exception is when a stream is closed without
                    ##    :member:ngtcp2_callbacks.stream_open callback being called.  In
                    ##    this case, stream limit is increased automatically.
                    ## ```
proc ngtcp2_conn_get_dcid*(conn: ptr ngtcp2_conn): ptr ngtcp2_cid {.importc,
    cdecl.}
  ## ```
           ##   @function
           ##
           ##    ngtcp2_conn_get_dcid returns the non-NULL pointer to the current
           ##    Destination Connection ID.  If no Destination Connection ID is
           ##    present, the return value is not NULL, and its :member:datalen
           ##    <ngtcp2_cid.datalen> field is 0.
           ## ```
proc ngtcp2_conn_get_client_initial_dcid*(conn: ptr ngtcp2_conn): ptr ngtcp2_cid {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_get_client_initial_dcid returns the non-NULL pointer
                    ##    to the Destination Connection ID that client sent in its Initial
                    ##    packet.  If the Destination Connection ID is not present, the
                    ##    return value is not NULL, and its :member:datalen
                    ##    <ngtcp2_cid.datalen> field is 0.
                    ## ```
proc ngtcp2_conn_get_scid*(conn: ptr ngtcp2_conn; dest: ptr ngtcp2_cid): uint {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_get_scid writes the all Source Connection IDs which a
                    ##    local endpoint has provided to a remote endpoint, and are not
                    ##    retired in |dest|.  If |dest| is NULL, this function does not write
                    ##    anything, and returns the number of Source Connection IDs that
                    ##    would otherwise be written to the provided buffer.  The buffer
                    ##    pointed by |dest| must have sizeof(:type:ngtcp2_cid) n bytes
                    ##    available, where n is the return value of ngtcp2_conn_get_scid
                    ##    with |dest| == NULL.
                    ## ```
proc ngtcp2_conn_get_active_dcid*(conn: ptr ngtcp2_conn;
                                  dest: ptr ngtcp2_cid_token): uint {.importc,
    cdecl.}
  ## ```
           ##   @function
           ##
           ##    ngtcp2_conn_get_active_dcid writes the all active Destination
           ##    Connection IDs and their tokens to |dest|.  Before handshake
           ##    completes, this function returns 0.  If |dest| is NULL, this
           ##    function does not write anything, and returns the number of
           ##    Destination Connection IDs that would otherwise be written to the
           ##    provided buffer.  The buffer pointed by |dest| must have
           ##    sizeof(:type:ngtcp2_cid_token) n bytes available, where n is
           ##    the return value of ngtcp2_conn_get_active_dcid with |dest| ==
           ##    NULL.
           ## ```
proc ngtcp2_conn_get_client_chosen_version*(conn: ptr ngtcp2_conn): uint32 {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_get_client_chosen_version returns the client chosen
                    ##    version.
                    ## ```
proc ngtcp2_conn_get_negotiated_version*(conn: ptr ngtcp2_conn): uint32 {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_get_negotiated_version returns the negotiated
                    ##    version.
                    ##
                    ##    Until the version is negotiated, this function returns 0.
                    ## ```
proc ngtcp2_conn_tls_early_data_rejected*(conn: ptr ngtcp2_conn): cint {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_tls_early_data_rejected tells |conn| that early data
                    ##    was rejected by a server during TLS handshake, or client decided
                    ##    not to attempt early data for some reason.  |conn| discards the
                    ##    following connection states:
                    ##
                    ##    - Any opened streams.
                    ##    - Stream identifier allocations.
                    ##    - Max data extended by ngtcp2_conn_extend_max_offset.
                    ##    - Max bidi streams extended by ngtcp2_conn_extend_max_streams_bidi.
                    ##    - Max uni streams extended by ngtcp2_conn_extend_max_streams_uni.
                    ##
                    ##    Application which wishes to retransmit early data, it has to open
                    ##    streams, and send stream data again.
                    ##
                    ##    This function returns 0 if it succeeds, or one of the following
                    ##    negative error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_CALLBACK_FAILURE
                    ##        User callback failed
                    ## ```
proc ngtcp2_conn_get_tls_early_data_rejected*(conn: ptr ngtcp2_conn): cint {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_get_tls_early_data_rejected returns nonzero if
                    ##    ngtcp2_conn_tls_early_data_rejected has been called.
                    ## ```
proc ngtcp2_conn_get_conn_info_versioned*(conn: ptr ngtcp2_conn;
    conn_info_version: cint; cinfo: ptr ngtcp2_conn_info) {.importc, cdecl.}
  ## ```
                                                                            ##   @function
                                                                            ##
                                                                            ##    ngtcp2_conn_get_conn_info assigns connection statistics data to
                                                                            ##    |*cinfo|.
                                                                            ## ```
proc ngtcp2_conn_submit_crypto_data*(conn: ptr ngtcp2_conn;
                                     encryption_level: ngtcp2_encryption_level;
                                     data: ptr uint8; datalen: uint): cint {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_submit_crypto_data submits crypto data |data| of
                    ##    length |datalen| to the library for transmission.
                    ##    |encryption_level| specifies the encryption level of data.
                    ##
                    ##    The library makes a copy of the buffer pointed by |data| of length
                    ##    |datalen|.  Application can discard |data|.
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
                                                                           ##    :macro:NGTCP2_ERR_NOMEM
                                                                           ##        Out of memory.
                                                                           ## ```
proc ngtcp2_conn_set_local_addr*(conn: ptr ngtcp2_conn; `addr`: ptr ngtcp2_addr) {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_set_local_addr sets local endpoint address |addr| to
                    ##    the current path of |conn|.  This function is provided for testing
                    ##    purpose only.
                    ## ```
proc ngtcp2_conn_set_path_user_data*(conn: ptr ngtcp2_conn;
                                     path_user_data: pointer) {.importc, cdecl.}
  ## ```
                                                                                ##   @function
                                                                                ##
                                                                                ##    ngtcp2_conn_set_path_user_data sets the |path_user_data| to the
                                                                                ##    current path (see :member:ngtcp2_path.user_data).
                                                                                ## ```
proc ngtcp2_conn_get_path*(conn: ptr ngtcp2_conn): ptr ngtcp2_path {.importc,
    cdecl.}
  ## ```
           ##   @function
           ##
           ##    ngtcp2_conn_get_path returns the current path.
           ## ```
proc ngtcp2_conn_get_max_tx_udp_payload_size*(conn: ptr ngtcp2_conn): uint {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_get_max_tx_udp_payload_size returns the maximum UDP
                    ##    payload size that this local endpoint would send.  This is the
                    ##    value of :member:ngtcp2_settings.max_tx_udp_payload_size that is
                    ##    passed to ngtcp2_conn_client_new or ngtcp2_conn_server_new.
                    ## ```
proc ngtcp2_conn_get_path_max_tx_udp_payload_size*(conn: ptr ngtcp2_conn): uint {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_get_path_max_tx_udp_payload_size returns the maximum
                    ##    UDP payload size for the current path.  If
                    ##    :member:ngtcp2_settings.no_tx_udp_payload_size_shaping is set to
                    ##    nonzero, this function is equivalent to
                    ##    ngtcp2_conn_get_max_tx_udp_payload_size.  Otherwise, it returns
                    ##    the maximum UDP payload size that is probed for the current path.
                    ## ```
proc ngtcp2_conn_initiate_immediate_migration*(conn: ptr ngtcp2_conn;
    path: ptr ngtcp2_path; ts: ngtcp2_tstamp): cint {.importc, cdecl.}
  ## ```
                                                                      ##   @function
                                                                      ##
                                                                      ##    ngtcp2_conn_initiate_immediate_migration starts connection
                                                                      ##    migration to the given |path|.  Only client can initiate migration.
                                                                      ##    This function does immediate migration; while the path validation
                                                                      ##    is nonetheless performed, this function does not wait for it to
                                                                      ##    succeed.
                                                                      ##
                                                                      ##    This function returns 0 if it succeeds, or one of the following
                                                                      ##    negative error codes:
                                                                      ##
                                                                      ##    :macro:NGTCP2_ERR_INVALID_STATE
                                                                      ##        Migration is disabled; or handshake is not yet confirmed; or
                                                                      ##        client is migrating to server's preferred address.
                                                                      ##    :macro:NGTCP2_ERR_CONN_ID_BLOCKED
                                                                      ##        No unused connection ID is available.
                                                                      ##    :macro:NGTCP2_ERR_INVALID_ARGUMENT
                                                                      ##        :member:local <ngtcp2_path.local> field of |path| equals the
                                                                      ##        current local address.
                                                                      ##    :macro:NGTCP2_ERR_NOMEM
                                                                      ##        Out of memory
                                                                      ## ```
proc ngtcp2_conn_initiate_migration*(conn: ptr ngtcp2_conn;
                                     path: ptr ngtcp2_path; ts: ngtcp2_tstamp): cint {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_initiate_migration starts connection migration to the
                    ##    given |path|.  Only client can initiate migration.  Unlike
                    ##    ngtcp2_conn_initiate_immediate_migration, this function starts a
                    ##    path validation with a new path, and migrate to the new path after
                    ##    successful path validation.
                    ##
                    ##    This function returns 0 if it succeeds, or one of the following
                    ##    negative error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_INVALID_STATE
                    ##        Migration is disabled; or handshake is not yet confirmed; or
                    ##        client is migrating to server's preferred address.
                    ##    :macro:NGTCP2_ERR_CONN_ID_BLOCKED
                    ##        No unused connection ID is available.
                    ##    :macro:NGTCP2_ERR_INVALID_ARGUMENT
                    ##        :member:local <ngtcp2_path.local> field of |path| equals the
                    ##        current local address.
                    ##    :macro:NGTCP2_ERR_NOMEM
                    ##        Out of memory
                    ## ```
proc ngtcp2_conn_get_max_data_left*(conn: ptr ngtcp2_conn): uint64 {.importc,
    cdecl.}
  ## ```
           ##   @function
           ##
           ##    ngtcp2_conn_get_max_data_left returns the number of bytes that
           ##    this local endpoint can send in this connection without violating
           ##    connection-level flow control.
           ## ```
proc ngtcp2_conn_get_max_stream_data_left*(conn: ptr ngtcp2_conn;
    stream_id: int64): uint64 {.importc, cdecl.}
  ## ```
                                                ##   @function
                                                ##
                                                ##    ngtcp2_conn_get_max_stream_data_left returns the number of bytes
                                                ##    that this local endpoint can send to a stream identified by
                                                ##    |stream_id| without violating stream-level flow control.  If no
                                                ##    such stream is found, this function returns 0.
                                                ## ```
proc ngtcp2_conn_get_streams_bidi_left*(conn: ptr ngtcp2_conn): uint64 {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_get_streams_bidi_left returns the number of
                    ##    bidirectional streams which the local endpoint can open without
                    ##    violating stream concurrency limit.
                    ## ```
proc ngtcp2_conn_get_streams_uni_left*(conn: ptr ngtcp2_conn): uint64 {.importc,
    cdecl.}
  ## ```
           ##   @function
           ##
           ##    ngtcp2_conn_get_streams_uni_left returns the number of
           ##    unidirectional streams which the local endpoint can open without
           ##    violating stream concurrency limit.
           ## ```
proc ngtcp2_conn_get_cwnd_left*(conn: ptr ngtcp2_conn): uint64 {.importc, cdecl.}
  ## ```
                                                                                 ##   @function
                                                                                 ##
                                                                                 ##    ngtcp2_conn_get_cwnd_left returns the cwnd minus the number of
                                                                                 ##    bytes in flight on the current path.  If the former is smaller than
                                                                                 ##    the latter, this function returns 0.
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
proc ngtcp2_conn_set_crypto_ctx*(conn: ptr ngtcp2_conn;
                                 ctx: ptr ngtcp2_crypto_ctx) {.importc, cdecl.}
  ## ```
                                                                               ##   @function
                                                                               ##
                                                                               ##    ngtcp2_conn_set_crypto_ctx sets |ctx| for Handshake/1-RTT packet
                                                                               ##    encryption.  The passed data will be passed to
                                                                               ##    :type:ngtcp2_encrypt, :type:ngtcp2_decrypt and
                                                                               ##    :type:ngtcp2_hp_mask callbacks.
                                                                               ## ```
proc ngtcp2_conn_get_crypto_ctx*(conn: ptr ngtcp2_conn): ptr ngtcp2_crypto_ctx {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_get_crypto_ctx returns :type:ngtcp2_crypto_ctx
                    ##    object for Handshake/1-RTT packet encryption.
                    ## ```
proc ngtcp2_conn_set_0rtt_crypto_ctx*(conn: ptr ngtcp2_conn;
                                      ctx: ptr ngtcp2_crypto_ctx) {.importc,
    cdecl.}
  ## ```
           ##   @function
           ##
           ##    ngtcp2_conn_set_0rtt_crypto_ctx sets |ctx| for 0-RTT packet
           ##    encryption.  The passed data will be passed to
           ##    :type:ngtcp2_encrypt, :type:ngtcp2_decrypt and
           ##    :type:ngtcp2_hp_mask callbacks.
           ## ```
proc ngtcp2_conn_get_0rtt_crypto_ctx*(conn: ptr ngtcp2_conn): ptr ngtcp2_crypto_ctx {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_get_0rtt_crypto_ctx returns :type:ngtcp2_crypto_ctx
                    ##    object for 0-RTT packet encryption.
                    ## ```
proc ngtcp2_conn_get_tls_native_handle*(conn: ptr ngtcp2_conn): pointer {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_get_tls_native_handle returns TLS native handle set
                    ##    by ngtcp2_conn_set_tls_native_handle.
                    ## ```
proc ngtcp2_conn_set_tls_native_handle*(conn: ptr ngtcp2_conn;
                                        tls_native_handle: pointer) {.importc,
    cdecl.}
  ## ```
           ##   @function
           ##
           ##    ngtcp2_conn_set_tls_native_handle sets TLS native handle
           ##    |tls_native_handle| to |conn|.  Internally, it is used as an opaque
           ##    pointer.
           ## ```
proc ngtcp2_conn_set_retry_aead*(conn: ptr ngtcp2_conn;
                                 aead: ptr ngtcp2_crypto_aead;
                                 aead_ctx: ptr ngtcp2_crypto_aead_ctx) {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_set_retry_aead sets |aead| and |aead_ctx| for Retry
                    ##    integrity tag verification.  |aead| must be AEAD_AES_128_GCM.
                    ##    |aead_ctx| must be initialized with :macro:NGTCP2_RETRY_KEY as
                    ##    encryption key.  This function must be called if |conn| is
                    ##    initialized as client.  Server does not verify the tag, and has no
                    ##    need to call this function.
                    ##
                    ##    |conn| takes ownership of |aead_ctx|.
                    ##    :member:ngtcp2_callbacks.delete_crypto_aead_ctx will be called to
                    ##    delete this object when it is no longer used.
                    ## ```
proc ngtcp2_ccerr_default*(ccerr: ptr ngtcp2_ccerr) {.importc, cdecl.}
  ## ```
                                                                      ##   @function
                                                                      ##
                                                                      ##    ngtcp2_ccerr_default initializes |ccerr| with the default values.
                                                                      ##    It sets the following fields:
                                                                      ##
                                                                      ##    - :member:type <ngtcp2_ccerr.type> =
                                                                      ##      :enum:ngtcp2_ccerr_type.NGTCP2_CCERR_TYPE_TRANSPORT
                                                                      ##    - :member:error_code <ngtcp2_ccerr.error_code> =
                                                                      ##      :macro:NGTCP2_NO_ERROR.
                                                                      ##    - :member:frame_type <ngtcp2_ccerr.frame_type> = 0
                                                                      ##    - :member:reason <ngtcp2_ccerr.reason> = NULL
                                                                      ##    - :member:reasonlen <ngtcp2_ccerr.reasonlen> = 0
                                                                      ## ```
proc ngtcp2_ccerr_set_transport_error*(ccerr: ptr ngtcp2_ccerr;
                                       error_code: uint64; reason: ptr uint8;
                                       reasonlen: uint) {.importc, cdecl.}
  ## ```
                                                                          ##   @function
                                                                          ##
                                                                          ##    ngtcp2_ccerr_set_transport_error sets :member:ccerr->type
                                                                          ##    <ngtcp2_ccerr.type> to
                                                                          ##    :enum:ngtcp2_ccerr_type.NGTCP2_CCERR_TYPE_TRANSPORT, and
                                                                          ##    :member:ccerr->error_code <ngtcp2_ccerr.error_code> to
                                                                          ##    |error_code|.  |reason| is the reason phrase of length |reasonlen|.
                                                                          ##    This function does not make a copy of the reason phrase.
                                                                          ## ```
proc ngtcp2_ccerr_set_liberr*(ccerr: ptr ngtcp2_ccerr; liberr: cint;
                              reason: ptr uint8; reasonlen: uint) {.importc,
    cdecl.}
  ## ```
           ##   @function
           ##
           ##    ngtcp2_ccerr_set_liberr sets type and error_code based on
           ##    |liberr|.
           ##
           ##    |reason| is the reason phrase of length |reasonlen|.  This function
           ##    does not make a copy of the reason phrase.
           ##
           ##    If |liberr| is :macro:NGTCP2_ERR_RECV_VERSION_NEGOTIATION,
           ##    :member:ccerr->type <ngtcp2_ccerr.type> is set to
           ##    :enum:ngtcp2_ccerr_type.NGTCP2_CCERR_TYPE_VERSION_NEGOTIATION,
           ##    and :member:ccerr->error_code <ngtcp2_ccerr.error_code> to
           ##    :macro:NGTCP2_NO_ERROR.
           ##
           ##    If |liberr| is :macro:NGTCP2_ERR_IDLE_CLOSE, :member:ccerr->type
           ##    <ngtcp2_ccerr.type> is set to
           ##    :enum:ngtcp2_ccerr_type.NGTCP2_CCERR_TYPE_IDLE_CLOSE, and
           ##    :member:ccerr->error_code <ngtcp2_ccerr.error_code> to
           ##    :macro:NGTCP2_NO_ERROR.
           ##
           ##    If |liberr| is :macro:NGTCP2_ERR_DROP_CONN, :member:ccerr->type
           ##    <ngtcp2_ccerr.type> is set to
           ##    :enum:ngtcp2_ccerr_type.NGTCP2_CCERR_TYPE_DROP_CONN, and
           ##    :member:ccerr->error_code <ngtcp2_ccerr.error_code> to
           ##    :macro:NGTCP2_NO_ERROR.
           ##
           ##    If |liberr| is :macro:NGTCP2_ERR_RETRY, :member:ccerr->type
           ##    <ngtcp2_ccerr.type> is set to
           ##    :enum:ngtcp2_ccerr_type.NGTCP2_CCERR_TYPE_RETRY, and
           ##    :member:ccerr->error_type <ngtcp2_ccerr.error_code> to
           ##    :macro:NGTCP2_NO_ERROR.
           ##
           ##    Otherwise, :member:ccerr->type <ngtcp2_ccerr.type> is set to
           ##    :enum:ngtcp2_ccerr_type.NGTCP2_CCERR_TYPE_TRANSPORT, and
           ##    :member:ccerr->error_code <ngtcp2_ccerr.error_code> is set to an
           ##    error code inferred by |liberr| (see
           ##    ngtcp2_err_infer_quic_transport_error_code).
           ## ```
proc ngtcp2_ccerr_set_tls_alert*(ccerr: ptr ngtcp2_ccerr; tls_alert: uint8;
                                 reason: ptr uint8; reasonlen: uint) {.importc,
    cdecl.}
  ## ```
           ##   @function
           ##
           ##    ngtcp2_ccerr_set_tls_alert sets :member:ccerr->type
           ##    <ngtcp2_ccerr.type> to
           ##    :enum:ngtcp2_ccerr_type.NGTCP2_CCERR_TYPE_TRANSPORT, and
           ##    :member:ccerr->error_code <ngtcp2_ccerr.error_code> to bitwise-OR
           ##    of :macro:NGTCP2_CRYPTO_ERROR and |tls_alert|.  |reason| is the
           ##    reason phrase of length |reasonlen|.  This function does not make a
           ##    copy of the reason phrase.
           ## ```
proc ngtcp2_ccerr_set_application_error*(ccerr: ptr ngtcp2_ccerr;
    error_code: uint64; reason: ptr uint8; reasonlen: uint) {.importc, cdecl.}
  ## ```
                                                                              ##   @function
                                                                              ##
                                                                              ##    ngtcp2_ccerr_set_application_error sets :member:ccerr->type
                                                                              ##    <ngtcp2_ccerr.type> to
                                                                              ##    :enum:ngtcp2_ccerr_type.NGTCP2_CCERR_TYPE_APPLICATION, and
                                                                              ##    :member:ccerr->error_code <ngtcp2_ccerr.error_code> to
                                                                              ##    |error_code|.  |reason| is the reason phrase of length |reasonlen|.
                                                                              ##    This function does not make a copy of the reason phrase.
                                                                              ## ```
proc ngtcp2_conn_write_connection_close_versioned*(conn: ptr ngtcp2_conn;
    path: ptr ngtcp2_path; pkt_info_version: cint; pi: ptr ngtcp2_pkt_info;
    dest: ptr uint8; destlen: uint; ccerr: ptr ngtcp2_ccerr; ts: ngtcp2_tstamp): ngtcp2_ssize {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_write_connection_close writes a packet which contains
                    ##    CONNECTION_CLOSE frame(s) (type 0x1c or 0x1d) in the buffer pointed
                    ##    by |dest| whose capacity is |destlen|.
                    ##
                    ##    For client, |destlen| should be at least
                    ##    :macro:NGTCP2_MAX_UDP_PAYLOAD_SIZE.
                    ##
                    ##    If |path| is not NULL, this function stores the network path
                    ##    with which the packet should be sent.  Each addr field must point
                    ##    to the buffer which should be at least
                    ##    sizeof(:type:ngtcp2_sockaddr_union) bytes long.  The assignment
                    ##    might not be done if nothing is written to |dest|.
                    ##
                    ##    If |pi| is not NULL, this function stores packet metadata in it
                    ##    if it succeeds.  The metadata includes ECN markings.
                    ##
                    ##    If :member:ccerr->type <ngtcp2_ccerr.type> ==
                    ##    :enum:ngtcp2_ccerr_type.NGTCP2_CCERR_TYPE_TRANSPORT, this
                    ##    function sends CONNECTION_CLOSE (type 0x1c) frame.  If
                    ##    :member:ccerr->type <ngtcp2_ccerr.type> ==
                    ##    :enum:ngtcp2_ccerr_type.NGTCP2_CCERR_TYPE_APPLICATION, it sends
                    ##    CONNECTION_CLOSE (type 0x1d) frame.  Otherwise, it does not produce
                    ##    any data, and returns 0.
                    ##
                    ##    |destlen| could be shorten by some factors (e.g., server side
                    ##    amplification limit).  This function returns
                    ##    :macro:NGTCP2_ERR_NOBUF if the resulting buffer is too small even
                    ##    if the given buffer has enough space.
                    ##
                    ##    This function must not be called from inside the callback
                    ##    functions.
                    ##
                    ##    At the moment, successful call to this function makes connection
                    ##    close.  We may change this behaviour in the future to allow
                    ##    graceful shutdown.
                    ##
                    ##    This function returns the number of bytes written in |dest| if it
                    ##    succeeds, or one of the following negative error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_NOMEM
                    ##        Out of memory
                    ##    :macro:NGTCP2_ERR_NOBUF
                    ##        Buffer is too small
                    ##    :macro:NGTCP2_ERR_INVALID_STATE
                    ##        The current state does not allow sending CONNECTION_CLOSE
                    ##        frame.
                    ##    :macro:NGTCP2_ERR_PKT_NUM_EXHAUSTED
                    ##        Packet number is exhausted, and cannot send any more packet.
                    ##    :macro:NGTCP2_ERR_CALLBACK_FAILURE
                    ##        User callback failed
                    ## ```
proc ngtcp2_conn_get_ccerr*(conn: ptr ngtcp2_conn): ptr ngtcp2_ccerr {.importc,
    cdecl.}
  ## ```
           ##   @function
           ##
           ##    ngtcp2_conn_get_ccerr returns the received connection close
           ##    error.  If no connection error is received, it returns
           ##    :type:ngtcp2_ccerr that is initialized by ngtcp2_ccerr_default.
           ## ```
proc ngtcp2_conn_is_local_stream*(conn: ptr ngtcp2_conn; stream_id: int64): cint {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_is_local_stream returns nonzero if |stream_id|
                    ##    denotes a locally initiated stream.
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
                                                                             ##    received Retry packet from server, and successfully validated it.
                                                                             ## ```
proc ngtcp2_conn_set_stream_user_data*(conn: ptr ngtcp2_conn; stream_id: int64;
                                       stream_user_data: pointer): cint {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_set_stream_user_data sets |stream_user_data| to the
                    ##    stream identified by |stream_id|.
                    ##
                    ##    This function returns 0 if it succeeds, or one of the following
                    ##    negative error codes:
                    ##
                    ##    :macro:NGTCP2_ERR_STREAM_NOT_FOUND
                    ##        Stream does not exist
                    ## ```
proc ngtcp2_conn_update_pkt_tx_time*(conn: ptr ngtcp2_conn; ts: ngtcp2_tstamp) {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_update_pkt_tx_time sets the time instant of the next
                    ##    packet transmission to pace packets.  This function must be called
                    ##    after (multiple invocation of) ngtcp2_conn_writev_stream.  If
                    ##    packet aggregation (e.g., packet batching, GSO) is used, call this
                    ##    function after all aggregated datagrams are sent, which indicates
                    ##    multiple invocation of ngtcp2_conn_writev_stream.
                    ## ```
proc ngtcp2_conn_get_send_quantum*(conn: ptr ngtcp2_conn): uint {.importc, cdecl.}
  ## ```
                                                                                  ##   @function
                                                                                  ##
                                                                                  ##    ngtcp2_conn_get_send_quantum returns the maximum number of bytes
                                                                                  ##    that can be sent in one go without packet spacing.
                                                                                  ## ```
proc ngtcp2_conn_get_stream_loss_count*(conn: ptr ngtcp2_conn; stream_id: int64): uint {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_conn_get_stream_loss_count returns the number of packets
                    ##    that contain STREAM frame for a stream identified by |stream_id|
                    ##    and are declared to be lost.  The number may include the spurious
                    ##    losses.  If no stream identified by |stream_id| is found, this
                    ##    function returns 0.
                    ## ```
proc ngtcp2_strerror*(liberr: cint): cstring {.importc, cdecl.}
  ## ```
                                                               ##   @function
                                                               ##
                                                               ##    ngtcp2_strerror returns the text representation of |liberr|.
                                                               ##    |liberr| must be one of ngtcp2 library error codes (which is
                                                               ##    defined as :macro:NGTCP2_ERR_* <NGTCP2_ERR_INVALID_ARGUMENT>
                                                               ##    macros).
                                                               ## ```
proc ngtcp2_err_is_fatal*(liberr: cint): cint {.importc, cdecl.}
  ## ```
                                                                ##   @function
                                                                ##
                                                                ##    ngtcp2_err_is_fatal returns nonzero if |liberr| is a fatal error.
                                                                ##    |liberr| must be one of ngtcp2 library error codes (which is
                                                                ##    defined as :macro:NGTCP2_ERR_* <NGTCP2_ERR_INVALID_ARGUMENT>
                                                                ##    macros).
                                                                ## ```
proc ngtcp2_err_infer_quic_transport_error_code*(liberr: cint): uint64 {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_err_infer_quic_transport_error_code returns a QUIC
                    ##    transport error code which corresponds to |liberr|.  |liberr| must
                    ##    be one of ngtcp2 library error codes (which is defined as
                    ##    :macro:NGTCP2_ERR_* <NGTCP2_ERR_INVALID_ARGUMENT> macros).
                    ## ```
proc ngtcp2_addr_init*(dest: ptr ngtcp2_addr; `addr`: ptr ngtcp2_SockAddr;
                       addrlen: ngtcp2_socklen): ptr ngtcp2_addr {.importc,
    cdecl.}
  ## ```
           ##   @function
           ##
           ##    ngtcp2_addr_init initializes |dest| with the given arguments and
           ##    returns |dest|.
           ## ```
proc ngtcp2_addr_copy_byte*(dest: ptr ngtcp2_addr; `addr`: ptr ngtcp2_SockAddr;
                            addrlen: ngtcp2_socklen) {.importc, cdecl.}
  ## ```
                                                                       ##   @function
                                                                       ##
                                                                       ##    ngtcp2_addr_copy_byte copies |addr| of length |addrlen| into the
                                                                       ##    buffer pointed by :member:dest->addr <ngtcp2_addr.addr>.
                                                                       ##    :member:dest->addrlen <ngtcp2_addr.addrlen> is updated to have
                                                                       ##    |addrlen|.  This function assumes that :member:dest->addr
                                                                       ##    <ngtcp2_addr.addr> points to a buffer which has a sufficient
                                                                       ##    capacity to store the copy.
                                                                       ## ```
proc ngtcp2_path_storage_init*(ps: ptr ngtcp2_path_storage;
                               local_addr: ptr ngtcp2_SockAddr;
                               local_addrlen: ngtcp2_socklen;
                               remote_addr: ptr ngtcp2_SockAddr;
                               remote_addrlen: ngtcp2_socklen;
                               user_data: pointer) {.importc, cdecl.}
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
proc ngtcp2_settings_default_versioned*(settings_version: cint;
                                        settings: ptr ngtcp2_settings) {.
    importc, cdecl.}
  ## ```
                    ##   @function
                    ##
                    ##    ngtcp2_settings_default initializes |settings| with the default
                    ##    values.  First this function fills |settings| with 0, and set the
                    ##    default value to the following fields:
                    ##
                    ##    :type:cc_algo <ngtcp2_settings.cc_algo> =
                    ##      :enum:ngtcp2_cc_algo.NGTCP2_CC_ALGO_CUBIC
                    ##    :type:initial_rtt <ngtcp2_settings.initial_rtt> =
                    ##      :macro:NGTCP2_DEFAULT_INITIAL_RTT
                    ##    :type:ack_thresh <ngtcp2_settings.ack_thresh> = 2
                    ##    :type:max_tx_udp_payload_size
                    ##      <ngtcp2_settings.max_tx_udp_payload_size> = 1452
                    ##    :type:handshake_timeout <ngtcp2_settings.handshake_timeout> =
                    ##      UINT64_MAX
                    ## ```
proc ngtcp2_transport_params_default_versioned*(transport_params_version: cint;
    params: ptr ngtcp2_transport_params) {.importc, cdecl.}
  ## ```
                                                           ##   @function
                                                           ##
                                                           ##    ngtcp2_transport_params_default initializes |params| with the
                                                           ##    default values.  First this function fills |params| with 0, and set
                                                           ##    the default value to the following fields:
                                                           ##
                                                           ##    :type:max_udp_payload_size
                                                           ##      <ngtcp2_transport_params.max_udp_payload_size> =
                                                           ##      :macro:NGTCP2_DEFAULT_MAX_RECV_UDP_PAYLOAD_SIZE
                                                           ##    :type:ack_delay_exponent
                                                           ##      <ngtcp2_transport_params.ack_delay_exponent> =
                                                           ##      :macro:NGTCP2_DEFAULT_ACK_DELAY_EXPONENT
                                                           ##    :type:max_ack_delay <ngtcp2_transport_params.max_ack_delay> =
                                                           ##      :macro:NGTCP2_DEFAULT_MAX_ACK_DELAY
                                                           ##    :type:active_connection_id_limit
                                                           ##      <ngtcp2_transport_params.active_connection_id_limit> =
                                                           ##      :macro:NGTCP2_DEFAULT_ACTIVE_CONNECTION_ID_LIMIT
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
                                                                             ##    ngtcp2_version returns a pointer to a :type:ngtcp2_info struct
                                                                             ##    with version information about the run-time library in use.  The
                                                                             ##    |least_version| argument can be set to a 24 bit numerical value for
                                                                             ##    the least accepted version number, and if the condition is not met,
                                                                             ##    this function will return a NULL.  Pass in 0 to skip the
                                                                             ##    version checking.
                                                                             ## ```
proc ngtcp2_is_bidi_stream*(stream_id: int64): cint {.importc, cdecl.}
  ## ```
                                                                      ##   @function
                                                                      ##
                                                                      ##    ngtcp2_is_bidi_stream returns nonzero if |stream_id| denotes
                                                                      ##    bidirectional stream.
                                                                      ## ```
proc ngtcp2_path_copy*(dest: ptr ngtcp2_path; src: ptr ngtcp2_path) {.importc,
    cdecl.}
  ## ```
           ##   @function
           ##
           ##    ngtcp2_path_copy copies |src| into |dest|.  This function assumes
           ##    that |dest| has enough buffer to store the deep copy of
           ##    :member:src->local <ngtcp2_path.local> and :member:src->remote
           ##    <ngtcp2_path.remote>.
           ## ```
proc ngtcp2_path_eq*(a: ptr ngtcp2_path; b: ptr ngtcp2_path): cint {.importc,
    cdecl.}
  ## ```
           ##   @function
           ##
           ##    ngtcp2_path_eq returns nonzero if |a| and |b| shares the same
           ##    local and remote addresses.
           ## ```
proc ngtcp2_is_supported_version*(version: uint32): cint {.importc, cdecl.}
  ## ```
                                                                           ##   @function
                                                                           ##
                                                                           ##    ngtcp2_is_supported_version returns nonzero if the library
                                                                           ##    supports QUIC version |version|.
                                                                           ## ```
proc ngtcp2_is_reserved_version*(version: uint32): cint {.importc, cdecl.}
  ## ```
                                                                          ##   @function
                                                                          ##
                                                                          ##    ngtcp2_is_reserved_version returns nonzero if |version| is a
                                                                          ##    reserved version.
                                                                          ## ```
proc ngtcp2_select_version*(preferred_versions: ptr uint32;
                            preferred_versionslen: uint;
                            offered_versions: ptr uint32;
                            offered_versionslen: uint): uint32 {.importc, cdecl.}
  ## ```
                                                                                 ##   @function
                                                                                 ##
                                                                                 ##    ngtcp2_select_version selects and returns a version from the
                                                                                 ##    version set |offered_versions| of |offered_versionslen| elements.
                                                                                 ##    |preferred_versions| of |preferred_versionslen| elements specifies
                                                                                 ##    the preference of versions, which is sorted in the order of
                                                                                 ##    preference.  All versions included in |preferred_versions| must be
                                                                                 ##    supported by the library, that is, passing any version in the array
                                                                                 ##    to ngtcp2_is_supported_version must return nonzero.  This
                                                                                 ##    function is intended to be used by client when it receives Version
                                                                                 ##    Negotiation packet.  If no version is selected, this function
                                                                                 ##    returns 0.
                                                                                 ## ```
