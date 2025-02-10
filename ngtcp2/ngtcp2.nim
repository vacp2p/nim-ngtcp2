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

{.compile: "./libs/picotls/picotlsvs/picotls/wintimeofday.c".}
{.compile: "./libs/picotls/lib/pembase64.c".}
{.compile: "./libs/picotls/lib/hpke.c".}
{.compile: "./libs/picotls/lib/picotls.c".}
{.compile: "./libs/picotls/lib/openssl.c".}
{.compile: "./libs/ngtcp2/crypto/shared.c".}
{.compile: "./libs/ngtcp2/crypto/picotls/picotls.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_acktr.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_addr.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_balloc.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_bbr.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_buf.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_cc.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_cid.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_conn.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_conv.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_crypto.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_dcidtr.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_err.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_frame_chain.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_gaptr.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_idtr.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_ksl.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_log.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_map.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_mem.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_objalloc.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_opl.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_path.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_pkt.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_pmtud.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_ppe.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_pq.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_pv.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_qlog.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_range.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_ringbuf.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_rob.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_rst.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_rtb.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_settings.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_str.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_strm.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_transport_params.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_unreachable.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_vec.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_version.c".}
{.compile: "./libs/ngtcp2/lib/ngtcp2_window_filter.c".}

{.warning[UnusedImport]: off.}
{.hint[XDeclaredButNotUsed]: off.}
from macros import hint, warning, newLit, getSize

from os import parentDir

when not declared(ownSizeOf):
  macro ownSizeof(x: typed): untyped =
    newLit(x.getSize)

type
  enum_ngtcp2_pkt_type_536871387* {.size: sizeof(cuint).} = enum
    NGTCP2_PKT_INITIAL = 16, NGTCP2_PKT_0RTT = 17, NGTCP2_PKT_HANDSHAKE = 18,
    NGTCP2_PKT_RETRY = 19, NGTCP2_PKT_1RTT = 64,
    NGTCP2_PKT_VERSION_NEGOTIATION = 128, NGTCP2_PKT_STATELESS_RESET = 129
type
  enum_ngtcp2_path_validation_result_536871391* {.size: sizeof(cuint).} = enum
    NGTCP2_PATH_VALIDATION_RESULT_SUCCESS = 0,
    NGTCP2_PATH_VALIDATION_RESULT_FAILURE = 1,
    NGTCP2_PATH_VALIDATION_RESULT_ABORTED = 2
type
  enum_ngtcp2_cc_algo_536871451* {.size: sizeof(cuint).} = enum
    NGTCP2_CC_ALGO_RENO = 0, NGTCP2_CC_ALGO_CUBIC = 1, NGTCP2_CC_ALGO_BBR = 2
type
  enum_ngtcp2_token_type_536871470* {.size: sizeof(cuint).} = enum
    NGTCP2_TOKEN_TYPE_UNKNOWN = 0, NGTCP2_TOKEN_TYPE_RETRY = 1,
    NGTCP2_TOKEN_TYPE_NEW_TOKEN = 2
type
  enum_ngtcp2_encryption_level_536871524* {.size: sizeof(cuint).} = enum
    NGTCP2_ENCRYPTION_LEVEL_INITIAL = 0, NGTCP2_ENCRYPTION_LEVEL_HANDSHAKE = 1,
    NGTCP2_ENCRYPTION_LEVEL_1RTT = 2, NGTCP2_ENCRYPTION_LEVEL_0RTT = 3
type
  enum_ngtcp2_connection_id_status_type_536871572* {.size: sizeof(cuint).} = enum
    NGTCP2_CONNECTION_ID_STATUS_TYPE_ACTIVATE = 0,
    NGTCP2_CONNECTION_ID_STATUS_TYPE_DEACTIVATE = 1
type
  enum_ngtcp2_ccerr_type_536871608* {.size: sizeof(cuint).} = enum
    NGTCP2_CCERR_TYPE_TRANSPORT = 0, NGTCP2_CCERR_TYPE_APPLICATION = 1,
    NGTCP2_CCERR_TYPE_VERSION_NEGOTIATION = 2, NGTCP2_CCERR_TYPE_IDLE_CLOSE = 3,
    NGTCP2_CCERR_TYPE_DROP_CONN = 4, NGTCP2_CCERR_TYPE_RETRY = 5
when not declared(struct_ngtcp2_conn):
  type
    struct_ngtcp2_conn* = object
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_conn" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PROTO_VER_V1):
  type
    NGTCP2_PROTO_VER_V1* = object
else:
  static :
    hint("Declaration of " & "NGTCP2_PROTO_VER_V1" &
        " already exists, not redeclaring")
type
  ngtcp2_ssize_536871367 = ptrdiff_t_536871370 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:98:19
  ptrdiff_t_536871369 = clong ## Generated based on /usr/include/clang/18.1.3/include/__stddef_ptrdiff_t.h:18:26
  ngtcp2_malloc_536871371 = proc (a0: csize_t; a1: pointer): pointer {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:107:17
  ngtcp2_free_536871373 = proc (a0: pointer; a1: pointer): void {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:116:16
  ngtcp2_calloc_536871375 = proc (a0: csize_t; a1: csize_t; a2: pointer): pointer {.
      cdecl.}                ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:125:17
  ngtcp2_realloc_536871377 = proc (a0: pointer; a1: csize_t; a2: pointer): pointer {.
      cdecl.}                ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:134:17
  struct_ngtcp2_mem_536871379 {.pure, inheritable, bycopy.} = object
    user_data*: pointer      ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:180:16
    malloc*: ngtcp2_malloc_536871372
    free*: ngtcp2_free_536871374
    calloc*: ngtcp2_calloc_536871376
    realloc*: ngtcp2_realloc_536871378
  ngtcp2_mem_536871381 = struct_ngtcp2_mem_536871380 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:206:3
  struct_ngtcp2_pkt_info_536871383 {.pure, inheritable, bycopy.} = object
    ecn* {.align(8'i64).}: uint8 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:481:32
  ngtcp2_pkt_info_536871385 = struct_ngtcp2_pkt_info_536871384 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:489:3
  ngtcp2_pkt_type_536871389 = enum_ngtcp2_pkt_type_536871388 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:855:3
  ngtcp2_path_validation_result_536871393 = enum_ngtcp2_path_validation_result_536871392 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1036:3
  ngtcp2_tstamp_536871395 = uint64 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1045:18
  ngtcp2_duration_536871397 = uint64 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1054:18
  struct_ngtcp2_cid_536871399 {.pure, inheritable, bycopy.} = object
    datalen*: csize_t        ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1061:16
    data*: array[20'i64, uint8]
  ngtcp2_cid_536871401 = struct_ngtcp2_cid_536871400 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1070:3
  struct_ngtcp2_vec_536871403 {.pure, inheritable, bycopy.} = object
    base*: ptr uint8         ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1078:16
    len*: csize_t
  ngtcp2_vec_536871405 = struct_ngtcp2_vec_536871404 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1088:3
  struct_ngtcp2_pkt_hd_536871407 {.pure, inheritable, bycopy.} = object
    dcid*: ngtcp2_cid_536871402 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1113:16
    scid*: ngtcp2_cid_536871402
    pkt_num*: int64
    token*: ptr uint8
    tokenlen*: csize_t
    pkt_numlen*: csize_t
    len*: csize_t
    version*: uint32
    type_field*: uint8
    flags*: uint8
  ngtcp2_pkt_hd_536871409 = struct_ngtcp2_pkt_hd_536871408 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1162:3
  struct_ngtcp2_pkt_stateless_reset_536871411 {.pure, inheritable, bycopy.} = object
    stateless_reset_token*: array[16'i64, uint8] ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1169:16
    rand*: ptr uint8
    randlen*: csize_t
  ngtcp2_pkt_stateless_reset_536871413 = struct_ngtcp2_pkt_stateless_reset_536871412 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1183:3
  ngtcp2_sockaddr_536871415 = struct_sockaddr_536871418 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1285:25
  struct_sockaddr_536871417 {.pure, inheritable, bycopy.} = object
    sa_family*: sa_family_t_536871621 ## Generated based on /usr/include/x86_64-linux-gnu/bits/socket.h:183:8
    sa_data*: array[14'i64, cschar]
  ngtcp2_sockaddr_in_536871419 = struct_sockaddr_in_536871422 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1293:28
  struct_sockaddr_in_536871421 {.pure, inheritable, bycopy.} = object
    sin_family*: sa_family_t_536871621 ## Generated based on /usr/include/netinet/in.h:247:8
    sin_port*: in_port_t_536871623
    sin_addr*: struct_in_addr_536871625
    sin_zero*: array[8'i64, uint8]
  ngtcp2_sockaddr_in6_536871423 = struct_sockaddr_in6_536871426 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1301:29
  struct_sockaddr_in6_536871425 {.pure, inheritable, bycopy.} = object
    sin6_family*: sa_family_t_536871621 ## Generated based on /usr/include/netinet/in.h:262:8
    sin6_port*: in_port_t_536871623
    sin6_flowinfo*: uint32
    sin6_addr*: struct_in6_addr_536871627
    sin6_scope_id*: uint32
  ngtcp2_socklen_536871427 = socklen_t_536871430 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1309:19
  socklen_t_536871429 = compiler_socklen_t_536871632 ## Generated based on /usr/include/x86_64-linux-gnu/bits/socket.h:33:21
  union_ngtcp2_sockaddr_union_536871431 {.union, bycopy.} = object
    sa*: ngtcp2_sockaddr_536871416 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1318:15
    in_field*: ngtcp2_sockaddr_in_536871420
    in6*: ngtcp2_sockaddr_in6_536871424
  ngtcp2_sockaddr_union_536871433 = union_ngtcp2_sockaddr_union_536871432 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1322:3
  struct_ngtcp2_preferred_addr_536871435 {.pure, inheritable, bycopy.} = object
    cid*: ngtcp2_cid_536871402 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1330:16
    ipv4*: ngtcp2_sockaddr_in_536871420
    ipv6*: ngtcp2_sockaddr_in6_536871424
    ipv4_present*: uint8
    ipv6_present*: uint8
    stateless_reset_token*: array[16'i64, uint8]
  ngtcp2_preferred_addr_536871437 = struct_ngtcp2_preferred_addr_536871436 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1357:3
  struct_ngtcp2_version_info_536871439 {.pure, inheritable, bycopy.} = object
    chosen_version*: uint32  ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1365:16
    available_versions*: ptr uint8
    available_versionslen*: csize_t
  ngtcp2_version_info_536871441 = struct_ngtcp2_version_info_536871440 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1382:3
  struct_ngtcp2_transport_params_536871443 {.pure, inheritable, bycopy.} = object
    preferred_addr*: ngtcp2_preferred_addr_536871438 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1393:16
    original_dcid*: ngtcp2_cid_536871402
    initial_scid*: ngtcp2_cid_536871402
    retry_scid*: ngtcp2_cid_536871402
    initial_max_stream_data_bidi_local*: uint64
    initial_max_stream_data_bidi_remote*: uint64
    initial_max_stream_data_uni*: uint64
    initial_max_data*: uint64
    initial_max_streams_bidi*: uint64
    initial_max_streams_uni*: uint64
    max_idle_timeout*: ngtcp2_duration_536871398
    max_udp_payload_size*: uint64
    active_connection_id_limit*: uint64
    ack_delay_exponent*: uint64
    max_ack_delay*: ngtcp2_duration_536871398
    max_datagram_frame_size*: uint64
    stateless_reset_token_present*: uint8
    disable_active_migration*: uint8
    original_dcid_present*: uint8
    initial_scid_present*: uint8
    retry_scid_present*: uint8
    preferred_addr_present*: uint8
    stateless_reset_token*: array[16'i64, uint8]
    grease_quic_bit*: uint8
    version_info*: ngtcp2_version_info_536871442
    version_info_present*: uint8
  ngtcp2_transport_params_536871445 = struct_ngtcp2_transport_params_536871444 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1553:3
  struct_ngtcp2_conn_info_536871447 {.pure, inheritable, bycopy.} = object
    latest_rtt*: ngtcp2_duration_536871398 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1563:16
    min_rtt*: ngtcp2_duration_536871398
    smoothed_rtt*: ngtcp2_duration_536871398
    rttvar*: ngtcp2_duration_536871398
    cwnd*: uint64
    ssthresh*: uint64
    bytes_in_flight*: uint64
  ngtcp2_conn_info_536871449 = struct_ngtcp2_conn_info_536871448 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1595:3
  ngtcp2_cc_algo_536871460 = enum_ngtcp2_cc_algo_536871452 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1615:3
  ngtcp2_printf_536871462 = proc (a0: pointer; a1: cstring): void {.cdecl,
      varargs.}              ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1624:16
  struct_ngtcp2_rand_ctx_536871464 {.pure, inheritable, bycopy.} = object
    native_handle*: pointer  ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1654:16
  ngtcp2_rand_ctx_536871466 = struct_ngtcp2_rand_ctx_536871465 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1660:3
  ngtcp2_qlog_write_536871468 = proc (a0: pointer; a1: uint32; a2: pointer;
                                      a3: csize_t): void {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1671:16
  ngtcp2_token_type_536871472 = enum_ngtcp2_token_type_536871471 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1695:3
  struct_ngtcp2_settings_536871474 {.pure, inheritable, bycopy.} = object
    qlog_write*: ngtcp2_qlog_write_536871469 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1706:16
    cc_algo*: ngtcp2_cc_algo_536871461
    initial_ts*: ngtcp2_tstamp_536871396
    initial_rtt*: ngtcp2_duration_536871398
    log_printf*: ngtcp2_printf_536871463
    max_tx_udp_payload_size*: csize_t
    token*: ptr uint8
    tokenlen*: csize_t
    token_type*: ngtcp2_token_type_536871473
    rand_ctx*: ngtcp2_rand_ctx_536871467
    max_window*: uint64
    max_stream_window*: uint64
    ack_thresh*: csize_t
    no_tx_udp_payload_size_shaping*: uint8
    handshake_timeout*: ngtcp2_duration_536871398
    preferred_versions*: ptr uint32
    preferred_versionslen*: csize_t
    available_versions*: ptr uint32
    available_versionslen*: csize_t
    original_version*: uint32
    no_pmtud*: uint8
    initial_pkt_num*: uint32
    pmtud_probes*: ptr uint16
    pmtud_probeslen*: csize_t
  ngtcp2_settings_536871476 = struct_ngtcp2_settings_536871475 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1912:3
  struct_ngtcp2_addr_536871478 {.pure, inheritable, bycopy.} = object
    addr_field*: ptr ngtcp2_sockaddr_536871416 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1919:16
    addrlen*: ngtcp2_socklen_536871428
  ngtcp2_addr_536871480 = struct_ngtcp2_addr_536871479 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1930:3
  struct_ngtcp2_path_536871482 {.pure, inheritable, bycopy.} = object
    local*: ngtcp2_addr_536871481 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1938:16
    remote*: ngtcp2_addr_536871481
    user_data*: pointer
  ngtcp2_path_536871484 = struct_ngtcp2_path_536871483 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1962:3
  struct_ngtcp2_path_storage_536871486 {.pure, inheritable, bycopy.} = object
    path*: ngtcp2_path_536871485 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1970:16
    local_addrbuf*: ngtcp2_sockaddr_union_536871434
    remote_addrbuf*: ngtcp2_sockaddr_union_536871434
  ngtcp2_path_storage_536871488 = struct_ngtcp2_path_storage_536871487 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1983:3
  struct_ngtcp2_crypto_md_536871490 {.pure, inheritable, bycopy.} = object
    native_handle*: pointer  ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1991:16
  ngtcp2_crypto_md_536871492 = struct_ngtcp2_crypto_md_536871491 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1997:3
  struct_ngtcp2_crypto_aead_536871494 {.pure, inheritable, bycopy.} = object
    native_handle*: pointer  ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2004:16
    max_overhead*: csize_t
  ngtcp2_crypto_aead_536871496 = struct_ngtcp2_crypto_aead_536871495 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2015:3
  struct_ngtcp2_crypto_cipher_536871498 {.pure, inheritable, bycopy.} = object
    native_handle*: pointer  ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2023:16
  ngtcp2_crypto_cipher_536871500 = struct_ngtcp2_crypto_cipher_536871499 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2029:3
  struct_ngtcp2_crypto_aead_ctx_536871502 {.pure, inheritable, bycopy.} = object
    native_handle*: pointer  ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2039:16
  ngtcp2_crypto_aead_ctx_536871504 = struct_ngtcp2_crypto_aead_ctx_536871503 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2045:3
  struct_ngtcp2_crypto_cipher_ctx_536871506 {.pure, inheritable, bycopy.} = object
    native_handle*: pointer  ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2055:16
  ngtcp2_crypto_cipher_ctx_536871508 = struct_ngtcp2_crypto_cipher_ctx_536871507 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2061:3
  struct_ngtcp2_crypto_ctx_536871510 {.pure, inheritable, bycopy.} = object
    aead*: ngtcp2_crypto_aead_536871497 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2073:16
    md*: ngtcp2_crypto_md_536871493
    hp*: ngtcp2_crypto_cipher_536871501
    max_encryption*: uint64
    max_decryption_failure*: uint64
  ngtcp2_crypto_ctx_536871512 = struct_ngtcp2_crypto_ctx_536871511 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2096:3
  struct_ngtcp2_version_cid_536871514 {.pure, inheritable, bycopy.} = object
    version*: uint32         ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2198:16
    dcid*: ptr uint8
    dcidlen*: csize_t
    scid*: ptr uint8
    scidlen*: csize_t
  ngtcp2_version_cid_536871516 = struct_ngtcp2_version_cid_536871515 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2221:3
  ngtcp2_conn_536871518 = struct_ngtcp2_conn ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2391:28
  ngtcp2_client_initial_536871520 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2411:15
  ngtcp2_recv_client_initial_536871522 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: ptr ngtcp2_cid_536871402; a2: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2428:15
  ngtcp2_encryption_level_536871526 = enum_ngtcp2_encryption_level_536871525 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2456:3
  ngtcp2_recv_crypto_data_536871528 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: ngtcp2_encryption_level_536871527; a2: uint64; a3: ptr uint8;
      a4: csize_t; a5: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2493:15
  ngtcp2_handshake_completed_536871530 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2508:15
  ngtcp2_handshake_confirmed_536871532 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2521:15
  ngtcp2_recv_version_negotiation_536871534 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: ptr ngtcp2_pkt_hd_536871410; a2: ptr uint32; a3: csize_t; a4: pointer): cint {.
      cdecl.}                ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2536:15
  ngtcp2_recv_retry_536871536 = proc (a0: ptr ngtcp2_conn_536871519;
                                      a1: ptr ngtcp2_pkt_hd_536871410;
                                      a2: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2559:15
  ngtcp2_encrypt_536871538 = proc (a0: ptr uint8; a1: ptr ngtcp2_crypto_aead_536871497;
                                   a2: ptr ngtcp2_crypto_aead_ctx_536871505;
                                   a3: ptr uint8; a4: csize_t; a5: ptr uint8;
                                   a6: csize_t; a7: ptr uint8; a8: csize_t): cint {.
      cdecl.}                ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2584:15
  ngtcp2_decrypt_536871540 = proc (a0: ptr uint8; a1: ptr ngtcp2_crypto_aead_536871497;
                                   a2: ptr ngtcp2_crypto_aead_ctx_536871505;
                                   a3: ptr uint8; a4: csize_t; a5: ptr uint8;
                                   a6: csize_t; a7: ptr uint8; a8: csize_t): cint {.
      cdecl.}                ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2613:15
  ngtcp2_hp_mask_536871542 = proc (a0: ptr uint8; a1: ptr ngtcp2_crypto_cipher_536871501;
                                   a2: ptr ngtcp2_crypto_cipher_ctx_536871509;
                                   a3: ptr uint8): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2642:15
  ngtcp2_recv_stream_data_536871544 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: uint32; a2: int64; a3: uint64; a4: ptr uint8; a5: csize_t;
      a6: pointer; a7: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2698:15
  ngtcp2_stream_open_536871546 = proc (a0: ptr ngtcp2_conn_536871519; a1: int64;
                                       a2: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2715:15
  ngtcp2_stream_close_536871548 = proc (a0: ptr ngtcp2_conn_536871519;
                                        a1: uint32; a2: int64; a3: uint64;
                                        a4: pointer; a5: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2764:15
  ngtcp2_stream_reset_536871550 = proc (a0: ptr ngtcp2_conn_536871519;
                                        a1: int64; a2: uint64; a3: uint64;
                                        a4: pointer; a5: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2778:15
  ngtcp2_acked_stream_data_offset_536871552 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: int64; a2: uint64; a3: uint64; a4: pointer; a5: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2804:15
  ngtcp2_recv_stateless_reset_536871554 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: ptr ngtcp2_pkt_stateless_reset_536871414; a2: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2819:15
  ngtcp2_extend_max_streams_536871556 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: uint64; a2: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2835:15
  ngtcp2_extend_max_stream_data_536871558 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: int64; a2: uint64; a3: pointer; a4: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2850:15
  ngtcp2_rand_536871560 = proc (a0: ptr uint8; a1: csize_t;
                                a2: ptr ngtcp2_rand_ctx_536871467): void {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2863:16
  ngtcp2_get_new_connection_id_536871562 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: ptr ngtcp2_cid_536871402; a2: ptr uint8; a3: csize_t; a4: pointer): cint {.
      cdecl.}                ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2882:15
  ngtcp2_remove_connection_id_536871564 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: ptr ngtcp2_cid_536871402; a2: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2899:15
  ngtcp2_update_key_536871566 = proc (a0: ptr ngtcp2_conn_536871519;
                                      a1: ptr uint8; a2: ptr uint8;
                                      a3: ptr ngtcp2_crypto_aead_ctx_536871505;
                                      a4: ptr uint8;
                                      a5: ptr ngtcp2_crypto_aead_ctx_536871505;
                                      a6: ptr uint8; a7: ptr uint8;
                                      a8: ptr uint8; a9: csize_t; a10: pointer): cint {.
      cdecl.}                ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2927:15
  ngtcp2_path_validation_536871568 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: uint32; a2: ptr ngtcp2_path_536871485; a3: ptr ngtcp2_path_536871485;
      a4: ngtcp2_path_validation_result_536871394; a5: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2984:15
  ngtcp2_select_preferred_addr_536871570 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: ptr ngtcp2_path_536871485; a2: ptr ngtcp2_preferred_addr_536871438;
      a3: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3016:15
  ngtcp2_connection_id_status_type_536871574 = enum_ngtcp2_connection_id_status_type_536871573 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3039:3
  ngtcp2_connection_id_status_536871576 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: ngtcp2_connection_id_status_type_536871575; a2: uint64;
      a3: ptr ngtcp2_cid_536871402; a4: ptr uint8; a5: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3058:15
  ngtcp2_recv_new_token_536871578 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: ptr uint8; a2: csize_t; a3: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3075:15
  ngtcp2_delete_crypto_aead_ctx_536871580 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: ptr ngtcp2_crypto_aead_ctx_536871505; a2: pointer): void {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3086:16
  ngtcp2_delete_crypto_cipher_ctx_536871582 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: ptr ngtcp2_crypto_cipher_ctx_536871509; a2: pointer): void {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3098:16
  ngtcp2_recv_datagram_536871584 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: uint32; a2: ptr uint8; a3: csize_t; a4: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3138:15
  ngtcp2_ack_datagram_536871586 = proc (a0: ptr ngtcp2_conn_536871519;
                                        a1: uint64; a2: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3153:15
  ngtcp2_lost_datagram_536871588 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: uint64; a2: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3169:15
  ngtcp2_get_path_challenge_data_536871590 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: ptr uint8; a2: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3185:15
  ngtcp2_stream_stop_sending_536871592 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: int64; a2: uint64; a3: pointer; a4: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3201:15
  ngtcp2_version_negotiation_536871594 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: uint32; a2: ptr ngtcp2_cid_536871402; a3: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3224:15
  ngtcp2_recv_key_536871596 = proc (a0: ptr ngtcp2_conn_536871519;
                                    a1: ngtcp2_encryption_level_536871527;
                                    a2: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3238:15
  ngtcp2_tls_early_data_rejected_536871598 = proc (a0: ptr ngtcp2_conn_536871519;
      a1: pointer): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3252:15
  struct_ngtcp2_callbacks_536871600 {.pure, inheritable, bycopy.} = object
    client_initial*: ngtcp2_client_initial_536871521 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3263:16
    recv_client_initial*: ngtcp2_recv_client_initial_536871523
    recv_crypto_data*: ngtcp2_recv_crypto_data_536871529
    handshake_completed*: ngtcp2_handshake_completed_536871531
    recv_version_negotiation*: ngtcp2_recv_version_negotiation_536871535
    encrypt*: ngtcp2_encrypt_536871539
    decrypt*: ngtcp2_decrypt_536871541
    hp_mask*: ngtcp2_hp_mask_536871543
    recv_stream_data*: ngtcp2_recv_stream_data_536871545
    acked_stream_data_offset*: ngtcp2_acked_stream_data_offset_536871553
    stream_open*: ngtcp2_stream_open_536871547
    stream_close*: ngtcp2_stream_close_536871549
    recv_stateless_reset*: ngtcp2_recv_stateless_reset_536871555
    recv_retry*: ngtcp2_recv_retry_536871537
    extend_max_local_streams_bidi*: ngtcp2_extend_max_streams_536871557
    extend_max_local_streams_uni*: ngtcp2_extend_max_streams_536871557
    rand*: ngtcp2_rand_536871561
    get_new_connection_id*: ngtcp2_get_new_connection_id_536871563
    remove_connection_id*: ngtcp2_remove_connection_id_536871565
    update_key*: ngtcp2_update_key_536871567
    path_validation*: ngtcp2_path_validation_536871569
    select_preferred_addr*: ngtcp2_select_preferred_addr_536871571
    stream_reset*: ngtcp2_stream_reset_536871551
    extend_max_remote_streams_bidi*: ngtcp2_extend_max_streams_536871557
    extend_max_remote_streams_uni*: ngtcp2_extend_max_streams_536871557
    extend_max_stream_data*: ngtcp2_extend_max_stream_data_536871559
    dcid_status*: ngtcp2_connection_id_status_536871577
    handshake_confirmed*: ngtcp2_handshake_confirmed_536871533
    recv_new_token*: ngtcp2_recv_new_token_536871579
    delete_crypto_aead_ctx*: ngtcp2_delete_crypto_aead_ctx_536871581
    delete_crypto_cipher_ctx*: ngtcp2_delete_crypto_cipher_ctx_536871583
    recv_datagram*: ngtcp2_recv_datagram_536871585
    ack_datagram*: ngtcp2_ack_datagram_536871587
    lost_datagram*: ngtcp2_lost_datagram_536871589
    get_path_challenge_data*: ngtcp2_get_path_challenge_data_536871591
    stream_stop_sending*: ngtcp2_stream_stop_sending_536871593
    version_negotiation*: ngtcp2_version_negotiation_536871595
    recv_rx_key*: ngtcp2_recv_key_536871597
    recv_tx_key*: ngtcp2_recv_key_536871597
    tls_early_data_rejected*: ngtcp2_tls_early_data_rejected_536871599
  ngtcp2_callbacks_536871602 = struct_ngtcp2_callbacks_536871601 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3521:3
  struct_ngtcp2_cid_token_536871604 {.pure, inheritable, bycopy.} = object
    seq*: uint64             ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4820:16
    cid*: ngtcp2_cid_536871402
    ps*: ngtcp2_path_storage_536871489
    token*: array[16'i64, uint8]
    token_present*: uint8
  ngtcp2_cid_token_536871606 = struct_ngtcp2_cid_token_536871605 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4844:3
  ngtcp2_ccerr_type_536871610 = enum_ngtcp2_ccerr_type_536871609 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:5245:3
  struct_ngtcp2_ccerr_536871612 {.pure, inheritable, bycopy.} = object
    type_field*: ngtcp2_ccerr_type_536871611 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:5253:16
    error_code*: uint64
    frame_type*: uint64
    reason*: ptr uint8
    reasonlen*: csize_t
  ngtcp2_ccerr_536871614 = struct_ngtcp2_ccerr_536871613 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:5281:3
  struct_ngtcp2_info_536871616 {.pure, inheritable, bycopy.} = object
    age*: cint               ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:5675:16
    version_num*: cint
    version_str*: cstring
  ngtcp2_info_536871618 = struct_ngtcp2_info_536871617 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:5693:3
  sa_family_t_536871620 = cushort ## Generated based on /usr/include/x86_64-linux-gnu/bits/sockaddr.h:28:28
  in_port_t_536871622 = uint16 ## Generated based on /usr/include/netinet/in.h:125:18
  struct_in_addr_536871624 {.pure, inheritable, bycopy.} = object
    s_addr*: in_addr_t_536871634 ## Generated based on /usr/include/netinet/in.h:31:8
  struct_in6_addr_compiler_in6_u_t {.union, bycopy.} = object
    compiler_u6_addr8*: array[16'i64, uint8]
    compiler_u6_addr16*: array[8'i64, uint16]
    compiler_u6_addr32*: array[4'i64, uint32]
  struct_in6_addr_536871626 {.pure, inheritable, bycopy.} = object
    compiler_in6_u*: struct_in6_addr_compiler_in6_u_t ## Generated based on /usr/include/netinet/in.h:221:8
  compiler_socklen_t_536871631 = cuint ## Generated based on /usr/include/x86_64-linux-gnu/bits/types.h:210:23
  in_addr_t_536871633 = uint32 ## Generated based on /usr/include/netinet/in.h:30:18
  struct_ngtcp2_crypto_aead_ctx_536871503 = (when declared(
      struct_ngtcp2_crypto_aead_ctx):
    when ownSizeof(struct_ngtcp2_crypto_aead_ctx) !=
        ownSizeof(struct_ngtcp2_crypto_aead_ctx_536871502):
      static :
        warning("Declaration of " & "struct_ngtcp2_crypto_aead_ctx" &
            " exists but with different size")
    struct_ngtcp2_crypto_aead_ctx
   else:
    struct_ngtcp2_crypto_aead_ctx_536871502)
  ngtcp2_acked_stream_data_offset_536871553 = (when declared(
      ngtcp2_acked_stream_data_offset):
    when ownSizeof(ngtcp2_acked_stream_data_offset) !=
        ownSizeof(ngtcp2_acked_stream_data_offset_536871552):
      static :
        warning("Declaration of " & "ngtcp2_acked_stream_data_offset" &
            " exists but with different size")
    ngtcp2_acked_stream_data_offset
   else:
    ngtcp2_acked_stream_data_offset_536871552)
  ngtcp2_transport_params_536871446 = (when declared(ngtcp2_transport_params):
    when ownSizeof(ngtcp2_transport_params) !=
        ownSizeof(ngtcp2_transport_params_536871445):
      static :
        warning("Declaration of " & "ngtcp2_transport_params" &
            " exists but with different size")
    ngtcp2_transport_params
   else:
    ngtcp2_transport_params_536871445)
  struct_ngtcp2_pkt_info_536871384 = (when declared(struct_ngtcp2_pkt_info):
    when ownSizeof(struct_ngtcp2_pkt_info) != ownSizeof(struct_ngtcp2_pkt_info_536871383):
      static :
        warning("Declaration of " & "struct_ngtcp2_pkt_info" &
            " exists but with different size")
    struct_ngtcp2_pkt_info
   else:
    struct_ngtcp2_pkt_info_536871383)
  ngtcp2_preferred_addr_536871438 = (when declared(ngtcp2_preferred_addr):
    when ownSizeof(ngtcp2_preferred_addr) != ownSizeof(ngtcp2_preferred_addr_536871437):
      static :
        warning("Declaration of " & "ngtcp2_preferred_addr" &
            " exists but with different size")
    ngtcp2_preferred_addr
   else:
    ngtcp2_preferred_addr_536871437)
  ngtcp2_connection_id_status_type_536871575 = (when declared(
      ngtcp2_connection_id_status_type):
    when ownSizeof(ngtcp2_connection_id_status_type) !=
        ownSizeof(ngtcp2_connection_id_status_type_536871574):
      static :
        warning("Declaration of " & "ngtcp2_connection_id_status_type" &
            " exists but with different size")
    ngtcp2_connection_id_status_type
   else:
    ngtcp2_connection_id_status_type_536871574)
  struct_sockaddr_536871418 = (when declared(struct_sockaddr):
    when ownSizeof(struct_sockaddr) != ownSizeof(struct_sockaddr_536871417):
      static :
        warning("Declaration of " & "struct_sockaddr" &
            " exists but with different size")
    struct_sockaddr
   else:
    struct_sockaddr_536871417)
  struct_ngtcp2_transport_params_536871444 = (when declared(
      struct_ngtcp2_transport_params):
    when ownSizeof(struct_ngtcp2_transport_params) !=
        ownSizeof(struct_ngtcp2_transport_params_536871443):
      static :
        warning("Declaration of " & "struct_ngtcp2_transport_params" &
            " exists but with different size")
    struct_ngtcp2_transport_params
   else:
    struct_ngtcp2_transport_params_536871443)
  struct_in_addr_536871625 = (when declared(struct_in_addr):
    when ownSizeof(struct_in_addr) != ownSizeof(struct_in_addr_536871624):
      static :
        warning("Declaration of " & "struct_in_addr" &
            " exists but with different size")
    struct_in_addr
   else:
    struct_in_addr_536871624)
  ngtcp2_encrypt_536871539 = (when declared(ngtcp2_encrypt):
    when ownSizeof(ngtcp2_encrypt) != ownSizeof(ngtcp2_encrypt_536871538):
      static :
        warning("Declaration of " & "ngtcp2_encrypt" &
            " exists but with different size")
    ngtcp2_encrypt
   else:
    ngtcp2_encrypt_536871538)
  struct_ngtcp2_ccerr_536871613 = (when declared(struct_ngtcp2_ccerr):
    when ownSizeof(struct_ngtcp2_ccerr) != ownSizeof(struct_ngtcp2_ccerr_536871612):
      static :
        warning("Declaration of " & "struct_ngtcp2_ccerr" &
            " exists but with different size")
    struct_ngtcp2_ccerr
   else:
    struct_ngtcp2_ccerr_536871612)
  ngtcp2_cc_algo_536871461 = (when declared(ngtcp2_cc_algo):
    when ownSizeof(ngtcp2_cc_algo) != ownSizeof(ngtcp2_cc_algo_536871460):
      static :
        warning("Declaration of " & "ngtcp2_cc_algo" &
            " exists but with different size")
    ngtcp2_cc_algo
   else:
    ngtcp2_cc_algo_536871460)
  ngtcp2_pkt_hd_536871410 = (when declared(ngtcp2_pkt_hd):
    when ownSizeof(ngtcp2_pkt_hd) != ownSizeof(ngtcp2_pkt_hd_536871409):
      static :
        warning("Declaration of " & "ngtcp2_pkt_hd" &
            " exists but with different size")
    ngtcp2_pkt_hd
   else:
    ngtcp2_pkt_hd_536871409)
  ngtcp2_sockaddr_536871416 = (when declared(ngtcp2_sockaddr):
    when ownSizeof(ngtcp2_sockaddr) != ownSizeof(ngtcp2_sockaddr_536871415):
      static :
        warning("Declaration of " & "ngtcp2_sockaddr" &
            " exists but with different size")
    ngtcp2_sockaddr
   else:
    ngtcp2_sockaddr_536871415)
  struct_sockaddr_in_536871422 = (when declared(struct_sockaddr_in):
    when ownSizeof(struct_sockaddr_in) != ownSizeof(struct_sockaddr_in_536871421):
      static :
        warning("Declaration of " & "struct_sockaddr_in" &
            " exists but with different size")
    struct_sockaddr_in
   else:
    struct_sockaddr_in_536871421)
  enum_ngtcp2_token_type_536871471 = (when declared(enum_ngtcp2_token_type):
    when ownSizeof(enum_ngtcp2_token_type) != ownSizeof(enum_ngtcp2_token_type_536871470):
      static :
        warning("Declaration of " & "enum_ngtcp2_token_type" &
            " exists but with different size")
    enum_ngtcp2_token_type
   else:
    enum_ngtcp2_token_type_536871470)
  struct_ngtcp2_rand_ctx_536871465 = (when declared(struct_ngtcp2_rand_ctx):
    when ownSizeof(struct_ngtcp2_rand_ctx) != ownSizeof(struct_ngtcp2_rand_ctx_536871464):
      static :
        warning("Declaration of " & "struct_ngtcp2_rand_ctx" &
            " exists but with different size")
    struct_ngtcp2_rand_ctx
   else:
    struct_ngtcp2_rand_ctx_536871464)
  ngtcp2_pkt_type_536871390 = (when declared(ngtcp2_pkt_type):
    when ownSizeof(ngtcp2_pkt_type) != ownSizeof(ngtcp2_pkt_type_536871389):
      static :
        warning("Declaration of " & "ngtcp2_pkt_type" &
            " exists but with different size")
    ngtcp2_pkt_type
   else:
    ngtcp2_pkt_type_536871389)
  ngtcp2_decrypt_536871541 = (when declared(ngtcp2_decrypt):
    when ownSizeof(ngtcp2_decrypt) != ownSizeof(ngtcp2_decrypt_536871540):
      static :
        warning("Declaration of " & "ngtcp2_decrypt" &
            " exists but with different size")
    ngtcp2_decrypt
   else:
    ngtcp2_decrypt_536871540)
  struct_ngtcp2_mem_536871380 = (when declared(struct_ngtcp2_mem):
    when ownSizeof(struct_ngtcp2_mem) != ownSizeof(struct_ngtcp2_mem_536871379):
      static :
        warning("Declaration of " & "struct_ngtcp2_mem" &
            " exists but with different size")
    struct_ngtcp2_mem
   else:
    struct_ngtcp2_mem_536871379)
  ngtcp2_calloc_536871376 = (when declared(ngtcp2_calloc):
    when ownSizeof(ngtcp2_calloc) != ownSizeof(ngtcp2_calloc_536871375):
      static :
        warning("Declaration of " & "ngtcp2_calloc" &
            " exists but with different size")
    ngtcp2_calloc
   else:
    ngtcp2_calloc_536871375)
  struct_sockaddr_in6_536871426 = (when declared(struct_sockaddr_in6):
    when ownSizeof(struct_sockaddr_in6) != ownSizeof(struct_sockaddr_in6_536871425):
      static :
        warning("Declaration of " & "struct_sockaddr_in6" &
            " exists but with different size")
    struct_sockaddr_in6
   else:
    struct_sockaddr_in6_536871425)
  struct_ngtcp2_preferred_addr_536871436 = (when declared(
      struct_ngtcp2_preferred_addr):
    when ownSizeof(struct_ngtcp2_preferred_addr) !=
        ownSizeof(struct_ngtcp2_preferred_addr_536871435):
      static :
        warning("Declaration of " & "struct_ngtcp2_preferred_addr" &
            " exists but with different size")
    struct_ngtcp2_preferred_addr
   else:
    struct_ngtcp2_preferred_addr_536871435)
  ngtcp2_path_storage_536871489 = (when declared(ngtcp2_path_storage):
    when ownSizeof(ngtcp2_path_storage) != ownSizeof(ngtcp2_path_storage_536871488):
      static :
        warning("Declaration of " & "ngtcp2_path_storage" &
            " exists but with different size")
    ngtcp2_path_storage
   else:
    ngtcp2_path_storage_536871488)
  ngtcp2_stream_open_536871547 = (when declared(ngtcp2_stream_open):
    when ownSizeof(ngtcp2_stream_open) != ownSizeof(ngtcp2_stream_open_536871546):
      static :
        warning("Declaration of " & "ngtcp2_stream_open" &
            " exists but with different size")
    ngtcp2_stream_open
   else:
    ngtcp2_stream_open_536871546)
  enum_ngtcp2_ccerr_type_536871609 = (when declared(enum_ngtcp2_ccerr_type):
    when ownSizeof(enum_ngtcp2_ccerr_type) != ownSizeof(enum_ngtcp2_ccerr_type_536871608):
      static :
        warning("Declaration of " & "enum_ngtcp2_ccerr_type" &
            " exists but with different size")
    enum_ngtcp2_ccerr_type
   else:
    enum_ngtcp2_ccerr_type_536871608)
  ngtcp2_stream_stop_sending_536871593 = (when declared(
      ngtcp2_stream_stop_sending):
    when ownSizeof(ngtcp2_stream_stop_sending) !=
        ownSizeof(ngtcp2_stream_stop_sending_536871592):
      static :
        warning("Declaration of " & "ngtcp2_stream_stop_sending" &
            " exists but with different size")
    ngtcp2_stream_stop_sending
   else:
    ngtcp2_stream_stop_sending_536871592)
  ngtcp2_addr_536871481 = (when declared(ngtcp2_addr):
    when ownSizeof(ngtcp2_addr) != ownSizeof(ngtcp2_addr_536871480):
      static :
        warning("Declaration of " & "ngtcp2_addr" &
            " exists but with different size")
    ngtcp2_addr
   else:
    ngtcp2_addr_536871480)
  ngtcp2_sockaddr_in_536871420 = (when declared(ngtcp2_sockaddr_in):
    when ownSizeof(ngtcp2_sockaddr_in) != ownSizeof(ngtcp2_sockaddr_in_536871419):
      static :
        warning("Declaration of " & "ngtcp2_sockaddr_in" &
            " exists but with different size")
    ngtcp2_sockaddr_in
   else:
    ngtcp2_sockaddr_in_536871419)
  ngtcp2_tls_early_data_rejected_536871599 = (when declared(
      ngtcp2_tls_early_data_rejected):
    when ownSizeof(ngtcp2_tls_early_data_rejected) !=
        ownSizeof(ngtcp2_tls_early_data_rejected_536871598):
      static :
        warning("Declaration of " & "ngtcp2_tls_early_data_rejected" &
            " exists but with different size")
    ngtcp2_tls_early_data_rejected
   else:
    ngtcp2_tls_early_data_rejected_536871598)
  struct_ngtcp2_callbacks_536871601 = (when declared(struct_ngtcp2_callbacks):
    when ownSizeof(struct_ngtcp2_callbacks) !=
        ownSizeof(struct_ngtcp2_callbacks_536871600):
      static :
        warning("Declaration of " & "struct_ngtcp2_callbacks" &
            " exists but with different size")
    struct_ngtcp2_callbacks
   else:
    struct_ngtcp2_callbacks_536871600)
  ngtcp2_stream_reset_536871551 = (when declared(ngtcp2_stream_reset):
    when ownSizeof(ngtcp2_stream_reset) != ownSizeof(ngtcp2_stream_reset_536871550):
      static :
        warning("Declaration of " & "ngtcp2_stream_reset" &
            " exists but with different size")
    ngtcp2_stream_reset
   else:
    ngtcp2_stream_reset_536871550)
  ngtcp2_recv_datagram_536871585 = (when declared(ngtcp2_recv_datagram):
    when ownSizeof(ngtcp2_recv_datagram) != ownSizeof(ngtcp2_recv_datagram_536871584):
      static :
        warning("Declaration of " & "ngtcp2_recv_datagram" &
            " exists but with different size")
    ngtcp2_recv_datagram
   else:
    ngtcp2_recv_datagram_536871584)
  ngtcp2_path_536871485 = (when declared(ngtcp2_path):
    when ownSizeof(ngtcp2_path) != ownSizeof(ngtcp2_path_536871484):
      static :
        warning("Declaration of " & "ngtcp2_path" &
            " exists but with different size")
    ngtcp2_path
   else:
    ngtcp2_path_536871484)
  ngtcp2_pkt_info_536871386 = (when declared(ngtcp2_pkt_info):
    when ownSizeof(ngtcp2_pkt_info) != ownSizeof(ngtcp2_pkt_info_536871385):
      static :
        warning("Declaration of " & "ngtcp2_pkt_info" &
            " exists but with different size")
    ngtcp2_pkt_info
   else:
    ngtcp2_pkt_info_536871385)
  ngtcp2_encryption_level_536871527 = (when declared(ngtcp2_encryption_level):
    when ownSizeof(ngtcp2_encryption_level) !=
        ownSizeof(ngtcp2_encryption_level_536871526):
      static :
        warning("Declaration of " & "ngtcp2_encryption_level" &
            " exists but with different size")
    ngtcp2_encryption_level
   else:
    ngtcp2_encryption_level_536871526)
  ngtcp2_recv_stream_data_536871545 = (when declared(ngtcp2_recv_stream_data):
    when ownSizeof(ngtcp2_recv_stream_data) !=
        ownSizeof(ngtcp2_recv_stream_data_536871544):
      static :
        warning("Declaration of " & "ngtcp2_recv_stream_data" &
            " exists but with different size")
    ngtcp2_recv_stream_data
   else:
    ngtcp2_recv_stream_data_536871544)
  struct_ngtcp2_info_536871617 = (when declared(struct_ngtcp2_info):
    when ownSizeof(struct_ngtcp2_info) != ownSizeof(struct_ngtcp2_info_536871616):
      static :
        warning("Declaration of " & "struct_ngtcp2_info" &
            " exists but with different size")
    struct_ngtcp2_info
   else:
    struct_ngtcp2_info_536871616)
  struct_ngtcp2_crypto_aead_536871495 = (when declared(struct_ngtcp2_crypto_aead):
    when ownSizeof(struct_ngtcp2_crypto_aead) !=
        ownSizeof(struct_ngtcp2_crypto_aead_536871494):
      static :
        warning("Declaration of " & "struct_ngtcp2_crypto_aead" &
            " exists but with different size")
    struct_ngtcp2_crypto_aead
   else:
    struct_ngtcp2_crypto_aead_536871494)
  enum_ngtcp2_path_validation_result_536871392 = (when declared(
      enum_ngtcp2_path_validation_result):
    when ownSizeof(enum_ngtcp2_path_validation_result) !=
        ownSizeof(enum_ngtcp2_path_validation_result_536871391):
      static :
        warning("Declaration of " & "enum_ngtcp2_path_validation_result" &
            " exists but with different size")
    enum_ngtcp2_path_validation_result
   else:
    enum_ngtcp2_path_validation_result_536871391)
  ngtcp2_version_info_536871442 = (when declared(ngtcp2_version_info):
    when ownSizeof(ngtcp2_version_info) != ownSizeof(ngtcp2_version_info_536871441):
      static :
        warning("Declaration of " & "ngtcp2_version_info" &
            " exists but with different size")
    ngtcp2_version_info
   else:
    ngtcp2_version_info_536871441)
  struct_ngtcp2_crypto_ctx_536871511 = (when declared(struct_ngtcp2_crypto_ctx):
    when ownSizeof(struct_ngtcp2_crypto_ctx) !=
        ownSizeof(struct_ngtcp2_crypto_ctx_536871510):
      static :
        warning("Declaration of " & "struct_ngtcp2_crypto_ctx" &
            " exists but with different size")
    struct_ngtcp2_crypto_ctx
   else:
    struct_ngtcp2_crypto_ctx_536871510)
  ngtcp2_socklen_536871428 = (when declared(ngtcp2_socklen):
    when ownSizeof(ngtcp2_socklen) != ownSizeof(ngtcp2_socklen_536871427):
      static :
        warning("Declaration of " & "ngtcp2_socklen" &
            " exists but with different size")
    ngtcp2_socklen
   else:
    ngtcp2_socklen_536871427)
  struct_ngtcp2_path_storage_536871487 = (when declared(
      struct_ngtcp2_path_storage):
    when ownSizeof(struct_ngtcp2_path_storage) !=
        ownSizeof(struct_ngtcp2_path_storage_536871486):
      static :
        warning("Declaration of " & "struct_ngtcp2_path_storage" &
            " exists but with different size")
    struct_ngtcp2_path_storage
   else:
    struct_ngtcp2_path_storage_536871486)
  ngtcp2_crypto_aead_ctx_536871505 = (when declared(ngtcp2_crypto_aead_ctx):
    when ownSizeof(ngtcp2_crypto_aead_ctx) != ownSizeof(ngtcp2_crypto_aead_ctx_536871504):
      static :
        warning("Declaration of " & "ngtcp2_crypto_aead_ctx" &
            " exists but with different size")
    ngtcp2_crypto_aead_ctx
   else:
    ngtcp2_crypto_aead_ctx_536871504)
  ngtcp2_settings_536871477 = (when declared(ngtcp2_settings):
    when ownSizeof(ngtcp2_settings) != ownSizeof(ngtcp2_settings_536871476):
      static :
        warning("Declaration of " & "ngtcp2_settings" &
            " exists but with different size")
    ngtcp2_settings
   else:
    ngtcp2_settings_536871476)
  struct_ngtcp2_path_536871483 = (when declared(struct_ngtcp2_path):
    when ownSizeof(struct_ngtcp2_path) != ownSizeof(struct_ngtcp2_path_536871482):
      static :
        warning("Declaration of " & "struct_ngtcp2_path" &
            " exists but with different size")
    struct_ngtcp2_path
   else:
    struct_ngtcp2_path_536871482)
  ngtcp2_recv_client_initial_536871523 = (when declared(
      ngtcp2_recv_client_initial):
    when ownSizeof(ngtcp2_recv_client_initial) !=
        ownSizeof(ngtcp2_recv_client_initial_536871522):
      static :
        warning("Declaration of " & "ngtcp2_recv_client_initial" &
            " exists but with different size")
    ngtcp2_recv_client_initial
   else:
    ngtcp2_recv_client_initial_536871522)
  ngtcp2_get_new_connection_id_536871563 = (when declared(
      ngtcp2_get_new_connection_id):
    when ownSizeof(ngtcp2_get_new_connection_id) !=
        ownSizeof(ngtcp2_get_new_connection_id_536871562):
      static :
        warning("Declaration of " & "ngtcp2_get_new_connection_id" &
            " exists but with different size")
    ngtcp2_get_new_connection_id
   else:
    ngtcp2_get_new_connection_id_536871562)
  ngtcp2_get_path_challenge_data_536871591 = (when declared(
      ngtcp2_get_path_challenge_data):
    when ownSizeof(ngtcp2_get_path_challenge_data) !=
        ownSizeof(ngtcp2_get_path_challenge_data_536871590):
      static :
        warning("Declaration of " & "ngtcp2_get_path_challenge_data" &
            " exists but with different size")
    ngtcp2_get_path_challenge_data
   else:
    ngtcp2_get_path_challenge_data_536871590)
  ngtcp2_callbacks_536871603 = (when declared(ngtcp2_callbacks):
    when ownSizeof(ngtcp2_callbacks) != ownSizeof(ngtcp2_callbacks_536871602):
      static :
        warning("Declaration of " & "ngtcp2_callbacks" &
            " exists but with different size")
    ngtcp2_callbacks
   else:
    ngtcp2_callbacks_536871602)
  ngtcp2_crypto_cipher_536871501 = (when declared(ngtcp2_crypto_cipher):
    when ownSizeof(ngtcp2_crypto_cipher) != ownSizeof(ngtcp2_crypto_cipher_536871500):
      static :
        warning("Declaration of " & "ngtcp2_crypto_cipher" &
            " exists but with different size")
    ngtcp2_crypto_cipher
   else:
    ngtcp2_crypto_cipher_536871500)
  socklen_t_536871430 = (when declared(socklen_t):
    when ownSizeof(socklen_t) != ownSizeof(socklen_t_536871429):
      static :
        warning("Declaration of " & "socklen_t" &
            " exists but with different size")
    socklen_t
   else:
    socklen_t_536871429)
  ngtcp2_extend_max_streams_536871557 = (when declared(ngtcp2_extend_max_streams):
    when ownSizeof(ngtcp2_extend_max_streams) !=
        ownSizeof(ngtcp2_extend_max_streams_536871556):
      static :
        warning("Declaration of " & "ngtcp2_extend_max_streams" &
            " exists but with different size")
    ngtcp2_extend_max_streams
   else:
    ngtcp2_extend_max_streams_536871556)
  ngtcp2_lost_datagram_536871589 = (when declared(ngtcp2_lost_datagram):
    when ownSizeof(ngtcp2_lost_datagram) != ownSizeof(ngtcp2_lost_datagram_536871588):
      static :
        warning("Declaration of " & "ngtcp2_lost_datagram" &
            " exists but with different size")
    ngtcp2_lost_datagram
   else:
    ngtcp2_lost_datagram_536871588)
  ngtcp2_sockaddr_in6_536871424 = (when declared(ngtcp2_sockaddr_in6):
    when ownSizeof(ngtcp2_sockaddr_in6) != ownSizeof(ngtcp2_sockaddr_in6_536871423):
      static :
        warning("Declaration of " & "ngtcp2_sockaddr_in6" &
            " exists but with different size")
    ngtcp2_sockaddr_in6
   else:
    ngtcp2_sockaddr_in6_536871423)
  struct_ngtcp2_version_cid_536871515 = (when declared(struct_ngtcp2_version_cid):
    when ownSizeof(struct_ngtcp2_version_cid) !=
        ownSizeof(struct_ngtcp2_version_cid_536871514):
      static :
        warning("Declaration of " & "struct_ngtcp2_version_cid" &
            " exists but with different size")
    struct_ngtcp2_version_cid
   else:
    struct_ngtcp2_version_cid_536871514)
  struct_in6_addr_536871627 = (when declared(struct_in6_addr):
    when ownSizeof(struct_in6_addr) != ownSizeof(struct_in6_addr_536871626):
      static :
        warning("Declaration of " & "struct_in6_addr" &
            " exists but with different size")
    struct_in6_addr
   else:
    struct_in6_addr_536871626)
  enum_ngtcp2_pkt_type_536871388 = (when declared(enum_ngtcp2_pkt_type):
    when ownSizeof(enum_ngtcp2_pkt_type) != ownSizeof(enum_ngtcp2_pkt_type_536871387):
      static :
        warning("Declaration of " & "enum_ngtcp2_pkt_type" &
            " exists but with different size")
    enum_ngtcp2_pkt_type
   else:
    enum_ngtcp2_pkt_type_536871387)
  struct_ngtcp2_pkt_hd_536871408 = (when declared(struct_ngtcp2_pkt_hd):
    when ownSizeof(struct_ngtcp2_pkt_hd) != ownSizeof(struct_ngtcp2_pkt_hd_536871407):
      static :
        warning("Declaration of " & "struct_ngtcp2_pkt_hd" &
            " exists but with different size")
    struct_ngtcp2_pkt_hd
   else:
    struct_ngtcp2_pkt_hd_536871407)
  ngtcp2_version_cid_536871517 = (when declared(ngtcp2_version_cid):
    when ownSizeof(ngtcp2_version_cid) != ownSizeof(ngtcp2_version_cid_536871516):
      static :
        warning("Declaration of " & "ngtcp2_version_cid" &
            " exists but with different size")
    ngtcp2_version_cid
   else:
    ngtcp2_version_cid_536871516)
  ngtcp2_ccerr_536871615 = (when declared(ngtcp2_ccerr):
    when ownSizeof(ngtcp2_ccerr) != ownSizeof(ngtcp2_ccerr_536871614):
      static :
        warning("Declaration of " & "ngtcp2_ccerr" &
            " exists but with different size")
    ngtcp2_ccerr
   else:
    ngtcp2_ccerr_536871614)
  ngtcp2_stream_close_536871549 = (when declared(ngtcp2_stream_close):
    when ownSizeof(ngtcp2_stream_close) != ownSizeof(ngtcp2_stream_close_536871548):
      static :
        warning("Declaration of " & "ngtcp2_stream_close" &
            " exists but with different size")
    ngtcp2_stream_close
   else:
    ngtcp2_stream_close_536871548)
  ngtcp2_free_536871374 = (when declared(ngtcp2_free):
    when ownSizeof(ngtcp2_free) != ownSizeof(ngtcp2_free_536871373):
      static :
        warning("Declaration of " & "ngtcp2_free" &
            " exists but with different size")
    ngtcp2_free
   else:
    ngtcp2_free_536871373)
  ngtcp2_conn_info_536871450 = (when declared(ngtcp2_conn_info):
    when ownSizeof(ngtcp2_conn_info) != ownSizeof(ngtcp2_conn_info_536871449):
      static :
        warning("Declaration of " & "ngtcp2_conn_info" &
            " exists but with different size")
    ngtcp2_conn_info
   else:
    ngtcp2_conn_info_536871449)
  ngtcp2_token_type_536871473 = (when declared(ngtcp2_token_type):
    when ownSizeof(ngtcp2_token_type) != ownSizeof(ngtcp2_token_type_536871472):
      static :
        warning("Declaration of " & "ngtcp2_token_type" &
            " exists but with different size")
    ngtcp2_token_type
   else:
    ngtcp2_token_type_536871472)
  ngtcp2_handshake_confirmed_536871533 = (when declared(
      ngtcp2_handshake_confirmed):
    when ownSizeof(ngtcp2_handshake_confirmed) !=
        ownSizeof(ngtcp2_handshake_confirmed_536871532):
      static :
        warning("Declaration of " & "ngtcp2_handshake_confirmed" &
            " exists but with different size")
    ngtcp2_handshake_confirmed
   else:
    ngtcp2_handshake_confirmed_536871532)
  ngtcp2_pkt_stateless_reset_536871414 = (when declared(
      ngtcp2_pkt_stateless_reset):
    when ownSizeof(ngtcp2_pkt_stateless_reset) !=
        ownSizeof(ngtcp2_pkt_stateless_reset_536871413):
      static :
        warning("Declaration of " & "ngtcp2_pkt_stateless_reset" &
            " exists but with different size")
    ngtcp2_pkt_stateless_reset
   else:
    ngtcp2_pkt_stateless_reset_536871413)
  struct_ngtcp2_settings_536871475 = (when declared(struct_ngtcp2_settings):
    when ownSizeof(struct_ngtcp2_settings) != ownSizeof(struct_ngtcp2_settings_536871474):
      static :
        warning("Declaration of " & "struct_ngtcp2_settings" &
            " exists but with different size")
    struct_ngtcp2_settings
   else:
    struct_ngtcp2_settings_536871474)
  ngtcp2_qlog_write_536871469 = (when declared(ngtcp2_qlog_write):
    when ownSizeof(ngtcp2_qlog_write) != ownSizeof(ngtcp2_qlog_write_536871468):
      static :
        warning("Declaration of " & "ngtcp2_qlog_write" &
            " exists but with different size")
    ngtcp2_qlog_write
   else:
    ngtcp2_qlog_write_536871468)
  struct_ngtcp2_addr_536871479 = (when declared(struct_ngtcp2_addr):
    when ownSizeof(struct_ngtcp2_addr) != ownSizeof(struct_ngtcp2_addr_536871478):
      static :
        warning("Declaration of " & "struct_ngtcp2_addr" &
            " exists but with different size")
    struct_ngtcp2_addr
   else:
    struct_ngtcp2_addr_536871478)
  ngtcp2_update_key_536871567 = (when declared(ngtcp2_update_key):
    when ownSizeof(ngtcp2_update_key) != ownSizeof(ngtcp2_update_key_536871566):
      static :
        warning("Declaration of " & "ngtcp2_update_key" &
            " exists but with different size")
    ngtcp2_update_key
   else:
    ngtcp2_update_key_536871566)
  struct_ngtcp2_vec_536871404 = (when declared(struct_ngtcp2_vec):
    when ownSizeof(struct_ngtcp2_vec) != ownSizeof(struct_ngtcp2_vec_536871403):
      static :
        warning("Declaration of " & "struct_ngtcp2_vec" &
            " exists but with different size")
    struct_ngtcp2_vec
   else:
    struct_ngtcp2_vec_536871403)
  ngtcp2_path_validation_536871569 = (when declared(ngtcp2_path_validation):
    when ownSizeof(ngtcp2_path_validation) != ownSizeof(ngtcp2_path_validation_536871568):
      static :
        warning("Declaration of " & "ngtcp2_path_validation" &
            " exists but with different size")
    ngtcp2_path_validation
   else:
    ngtcp2_path_validation_536871568)
  compiler_socklen_t_536871632 = (when declared(compiler_socklen_t):
    when ownSizeof(compiler_socklen_t) != ownSizeof(compiler_socklen_t_536871631):
      static :
        warning("Declaration of " & "compiler_socklen_t" &
            " exists but with different size")
    compiler_socklen_t
   else:
    compiler_socklen_t_536871631)
  ngtcp2_ack_datagram_536871587 = (when declared(ngtcp2_ack_datagram):
    when ownSizeof(ngtcp2_ack_datagram) != ownSizeof(ngtcp2_ack_datagram_536871586):
      static :
        warning("Declaration of " & "ngtcp2_ack_datagram" &
            " exists but with different size")
    ngtcp2_ack_datagram
   else:
    ngtcp2_ack_datagram_536871586)
  ngtcp2_crypto_ctx_536871513 = (when declared(ngtcp2_crypto_ctx):
    when ownSizeof(ngtcp2_crypto_ctx) != ownSizeof(ngtcp2_crypto_ctx_536871512):
      static :
        warning("Declaration of " & "ngtcp2_crypto_ctx" &
            " exists but with different size")
    ngtcp2_crypto_ctx
   else:
    ngtcp2_crypto_ctx_536871512)
  ngtcp2_ccerr_type_536871611 = (when declared(ngtcp2_ccerr_type):
    when ownSizeof(ngtcp2_ccerr_type) != ownSizeof(ngtcp2_ccerr_type_536871610):
      static :
        warning("Declaration of " & "ngtcp2_ccerr_type" &
            " exists but with different size")
    ngtcp2_ccerr_type
   else:
    ngtcp2_ccerr_type_536871610)
  union_ngtcp2_sockaddr_union_536871432 = (when declared(
      union_ngtcp2_sockaddr_union):
    when ownSizeof(union_ngtcp2_sockaddr_union) !=
        ownSizeof(union_ngtcp2_sockaddr_union_536871431):
      static :
        warning("Declaration of " & "union_ngtcp2_sockaddr_union" &
            " exists but with different size")
    union_ngtcp2_sockaddr_union
   else:
    union_ngtcp2_sockaddr_union_536871431)
  ngtcp2_crypto_cipher_ctx_536871509 = (when declared(ngtcp2_crypto_cipher_ctx):
    when ownSizeof(ngtcp2_crypto_cipher_ctx) !=
        ownSizeof(ngtcp2_crypto_cipher_ctx_536871508):
      static :
        warning("Declaration of " & "ngtcp2_crypto_cipher_ctx" &
            " exists but with different size")
    ngtcp2_crypto_cipher_ctx
   else:
    ngtcp2_crypto_cipher_ctx_536871508)
  ngtcp2_path_validation_result_536871394 = (when declared(
      ngtcp2_path_validation_result):
    when ownSizeof(ngtcp2_path_validation_result) !=
        ownSizeof(ngtcp2_path_validation_result_536871393):
      static :
        warning("Declaration of " & "ngtcp2_path_validation_result" &
            " exists but with different size")
    ngtcp2_path_validation_result
   else:
    ngtcp2_path_validation_result_536871393)
  ngtcp2_cid_536871402 = (when declared(ngtcp2_cid):
    when ownSizeof(ngtcp2_cid) != ownSizeof(ngtcp2_cid_536871401):
      static :
        warning("Declaration of " & "ngtcp2_cid" &
            " exists but with different size")
    ngtcp2_cid
   else:
    ngtcp2_cid_536871401)
  ngtcp2_printf_536871463 = (when declared(ngtcp2_printf):
    when ownSizeof(ngtcp2_printf) != ownSizeof(ngtcp2_printf_536871462):
      static :
        warning("Declaration of " & "ngtcp2_printf" &
            " exists but with different size")
    ngtcp2_printf
   else:
    ngtcp2_printf_536871462)
  ngtcp2_recv_new_token_536871579 = (when declared(ngtcp2_recv_new_token):
    when ownSizeof(ngtcp2_recv_new_token) != ownSizeof(ngtcp2_recv_new_token_536871578):
      static :
        warning("Declaration of " & "ngtcp2_recv_new_token" &
            " exists but with different size")
    ngtcp2_recv_new_token
   else:
    ngtcp2_recv_new_token_536871578)
  in_addr_t_536871634 = (when declared(in_addr_t):
    when ownSizeof(in_addr_t) != ownSizeof(in_addr_t_536871633):
      static :
        warning("Declaration of " & "in_addr_t" &
            " exists but with different size")
    in_addr_t
   else:
    in_addr_t_536871633)
  ngtcp2_mem_536871382 = (when declared(ngtcp2_mem):
    when ownSizeof(ngtcp2_mem) != ownSizeof(ngtcp2_mem_536871381):
      static :
        warning("Declaration of " & "ngtcp2_mem" &
            " exists but with different size")
    ngtcp2_mem
   else:
    ngtcp2_mem_536871381)
  ngtcp2_handshake_completed_536871531 = (when declared(
      ngtcp2_handshake_completed):
    when ownSizeof(ngtcp2_handshake_completed) !=
        ownSizeof(ngtcp2_handshake_completed_536871530):
      static :
        warning("Declaration of " & "ngtcp2_handshake_completed" &
            " exists but with different size")
    ngtcp2_handshake_completed
   else:
    ngtcp2_handshake_completed_536871530)
  ngtcp2_info_536871619 = (when declared(ngtcp2_info):
    when ownSizeof(ngtcp2_info) != ownSizeof(ngtcp2_info_536871618):
      static :
        warning("Declaration of " & "ngtcp2_info" &
            " exists but with different size")
    ngtcp2_info
   else:
    ngtcp2_info_536871618)
  enum_ngtcp2_cc_algo_536871452 = (when declared(enum_ngtcp2_cc_algo):
    when ownSizeof(enum_ngtcp2_cc_algo) != ownSizeof(enum_ngtcp2_cc_algo_536871451):
      static :
        warning("Declaration of " & "enum_ngtcp2_cc_algo" &
            " exists but with different size")
    enum_ngtcp2_cc_algo
   else:
    enum_ngtcp2_cc_algo_536871451)
  struct_ngtcp2_crypto_md_536871491 = (when declared(struct_ngtcp2_crypto_md):
    when ownSizeof(struct_ngtcp2_crypto_md) !=
        ownSizeof(struct_ngtcp2_crypto_md_536871490):
      static :
        warning("Declaration of " & "struct_ngtcp2_crypto_md" &
            " exists but with different size")
    struct_ngtcp2_crypto_md
   else:
    struct_ngtcp2_crypto_md_536871490)
  ngtcp2_rand_536871561 = (when declared(ngtcp2_rand):
    when ownSizeof(ngtcp2_rand) != ownSizeof(ngtcp2_rand_536871560):
      static :
        warning("Declaration of " & "ngtcp2_rand" &
            " exists but with different size")
    ngtcp2_rand
   else:
    ngtcp2_rand_536871560)
  ngtcp2_duration_536871398 = (when declared(ngtcp2_duration):
    when ownSizeof(ngtcp2_duration) != ownSizeof(ngtcp2_duration_536871397):
      static :
        warning("Declaration of " & "ngtcp2_duration" &
            " exists but with different size")
    ngtcp2_duration
   else:
    ngtcp2_duration_536871397)
  struct_ngtcp2_cid_536871400 = (when declared(struct_ngtcp2_cid):
    when ownSizeof(struct_ngtcp2_cid) != ownSizeof(struct_ngtcp2_cid_536871399):
      static :
        warning("Declaration of " & "struct_ngtcp2_cid" &
            " exists but with different size")
    struct_ngtcp2_cid
   else:
    struct_ngtcp2_cid_536871399)
  in_port_t_536871623 = (when declared(in_port_t):
    when ownSizeof(in_port_t) != ownSizeof(in_port_t_536871622):
      static :
        warning("Declaration of " & "in_port_t" &
            " exists but with different size")
    in_port_t
   else:
    in_port_t_536871622)
  struct_ngtcp2_pkt_stateless_reset_536871412 = (when declared(
      struct_ngtcp2_pkt_stateless_reset):
    when ownSizeof(struct_ngtcp2_pkt_stateless_reset) !=
        ownSizeof(struct_ngtcp2_pkt_stateless_reset_536871411):
      static :
        warning("Declaration of " & "struct_ngtcp2_pkt_stateless_reset" &
            " exists but with different size")
    struct_ngtcp2_pkt_stateless_reset
   else:
    struct_ngtcp2_pkt_stateless_reset_536871411)
  ngtcp2_rand_ctx_536871467 = (when declared(ngtcp2_rand_ctx):
    when ownSizeof(ngtcp2_rand_ctx) != ownSizeof(ngtcp2_rand_ctx_536871466):
      static :
        warning("Declaration of " & "ngtcp2_rand_ctx" &
            " exists but with different size")
    ngtcp2_rand_ctx
   else:
    ngtcp2_rand_ctx_536871466)
  ngtcp2_vec_536871406 = (when declared(ngtcp2_vec):
    when ownSizeof(ngtcp2_vec) != ownSizeof(ngtcp2_vec_536871405):
      static :
        warning("Declaration of " & "ngtcp2_vec" &
            " exists but with different size")
    ngtcp2_vec
   else:
    ngtcp2_vec_536871405)
  ngtcp2_recv_version_negotiation_536871535 = (when declared(
      ngtcp2_recv_version_negotiation):
    when ownSizeof(ngtcp2_recv_version_negotiation) !=
        ownSizeof(ngtcp2_recv_version_negotiation_536871534):
      static :
        warning("Declaration of " & "ngtcp2_recv_version_negotiation" &
            " exists but with different size")
    ngtcp2_recv_version_negotiation
   else:
    ngtcp2_recv_version_negotiation_536871534)
  ngtcp2_crypto_md_536871493 = (when declared(ngtcp2_crypto_md):
    when ownSizeof(ngtcp2_crypto_md) != ownSizeof(ngtcp2_crypto_md_536871492):
      static :
        warning("Declaration of " & "ngtcp2_crypto_md" &
            " exists but with different size")
    ngtcp2_crypto_md
   else:
    ngtcp2_crypto_md_536871492)
  struct_ngtcp2_conn_info_536871448 = (when declared(struct_ngtcp2_conn_info):
    when ownSizeof(struct_ngtcp2_conn_info) !=
        ownSizeof(struct_ngtcp2_conn_info_536871447):
      static :
        warning("Declaration of " & "struct_ngtcp2_conn_info" &
            " exists but with different size")
    struct_ngtcp2_conn_info
   else:
    struct_ngtcp2_conn_info_536871447)
  ngtcp2_recv_stateless_reset_536871555 = (when declared(
      ngtcp2_recv_stateless_reset):
    when ownSizeof(ngtcp2_recv_stateless_reset) !=
        ownSizeof(ngtcp2_recv_stateless_reset_536871554):
      static :
        warning("Declaration of " & "ngtcp2_recv_stateless_reset" &
            " exists but with different size")
    ngtcp2_recv_stateless_reset
   else:
    ngtcp2_recv_stateless_reset_536871554)
  enum_ngtcp2_connection_id_status_type_536871573 = (when declared(
      enum_ngtcp2_connection_id_status_type):
    when ownSizeof(enum_ngtcp2_connection_id_status_type) !=
        ownSizeof(enum_ngtcp2_connection_id_status_type_536871572):
      static :
        warning("Declaration of " & "enum_ngtcp2_connection_id_status_type" &
            " exists but with different size")
    enum_ngtcp2_connection_id_status_type
   else:
    enum_ngtcp2_connection_id_status_type_536871572)
  ngtcp2_recv_key_536871597 = (when declared(ngtcp2_recv_key):
    when ownSizeof(ngtcp2_recv_key) != ownSizeof(ngtcp2_recv_key_536871596):
      static :
        warning("Declaration of " & "ngtcp2_recv_key" &
            " exists but with different size")
    ngtcp2_recv_key
   else:
    ngtcp2_recv_key_536871596)
  ngtcp2_remove_connection_id_536871565 = (when declared(
      ngtcp2_remove_connection_id):
    when ownSizeof(ngtcp2_remove_connection_id) !=
        ownSizeof(ngtcp2_remove_connection_id_536871564):
      static :
        warning("Declaration of " & "ngtcp2_remove_connection_id" &
            " exists but with different size")
    ngtcp2_remove_connection_id
   else:
    ngtcp2_remove_connection_id_536871564)
  ngtcp2_recv_retry_536871537 = (when declared(ngtcp2_recv_retry):
    when ownSizeof(ngtcp2_recv_retry) != ownSizeof(ngtcp2_recv_retry_536871536):
      static :
        warning("Declaration of " & "ngtcp2_recv_retry" &
            " exists but with different size")
    ngtcp2_recv_retry
   else:
    ngtcp2_recv_retry_536871536)
  ngtcp2_recv_crypto_data_536871529 = (when declared(ngtcp2_recv_crypto_data):
    when ownSizeof(ngtcp2_recv_crypto_data) !=
        ownSizeof(ngtcp2_recv_crypto_data_536871528):
      static :
        warning("Declaration of " & "ngtcp2_recv_crypto_data" &
            " exists but with different size")
    ngtcp2_recv_crypto_data
   else:
    ngtcp2_recv_crypto_data_536871528)
  ngtcp2_cid_token_536871607 = (when declared(ngtcp2_cid_token):
    when ownSizeof(ngtcp2_cid_token) != ownSizeof(ngtcp2_cid_token_536871606):
      static :
        warning("Declaration of " & "ngtcp2_cid_token" &
            " exists but with different size")
    ngtcp2_cid_token
   else:
    ngtcp2_cid_token_536871606)
  ngtcp2_realloc_536871378 = (when declared(ngtcp2_realloc):
    when ownSizeof(ngtcp2_realloc) != ownSizeof(ngtcp2_realloc_536871377):
      static :
        warning("Declaration of " & "ngtcp2_realloc" &
            " exists but with different size")
    ngtcp2_realloc
   else:
    ngtcp2_realloc_536871377)
  ngtcp2_hp_mask_536871543 = (when declared(ngtcp2_hp_mask):
    when ownSizeof(ngtcp2_hp_mask) != ownSizeof(ngtcp2_hp_mask_536871542):
      static :
        warning("Declaration of " & "ngtcp2_hp_mask" &
            " exists but with different size")
    ngtcp2_hp_mask
   else:
    ngtcp2_hp_mask_536871542)
  enum_ngtcp2_encryption_level_536871525 = (when declared(
      enum_ngtcp2_encryption_level):
    when ownSizeof(enum_ngtcp2_encryption_level) !=
        ownSizeof(enum_ngtcp2_encryption_level_536871524):
      static :
        warning("Declaration of " & "enum_ngtcp2_encryption_level" &
            " exists but with different size")
    enum_ngtcp2_encryption_level
   else:
    enum_ngtcp2_encryption_level_536871524)
  ngtcp2_connection_id_status_536871577 = (when declared(
      ngtcp2_connection_id_status):
    when ownSizeof(ngtcp2_connection_id_status) !=
        ownSizeof(ngtcp2_connection_id_status_536871576):
      static :
        warning("Declaration of " & "ngtcp2_connection_id_status" &
            " exists but with different size")
    ngtcp2_connection_id_status
   else:
    ngtcp2_connection_id_status_536871576)
  ngtcp2_crypto_aead_536871497 = (when declared(ngtcp2_crypto_aead):
    when ownSizeof(ngtcp2_crypto_aead) != ownSizeof(ngtcp2_crypto_aead_536871496):
      static :
        warning("Declaration of " & "ngtcp2_crypto_aead" &
            " exists but with different size")
    ngtcp2_crypto_aead
   else:
    ngtcp2_crypto_aead_536871496)
  ngtcp2_ssize_536871368 = (when declared(ngtcp2_ssize):
    when ownSizeof(ngtcp2_ssize) != ownSizeof(ngtcp2_ssize_536871367):
      static :
        warning("Declaration of " & "ngtcp2_ssize" &
            " exists but with different size")
    ngtcp2_ssize
   else:
    ngtcp2_ssize_536871367)
  ngtcp2_extend_max_stream_data_536871559 = (when declared(
      ngtcp2_extend_max_stream_data):
    when ownSizeof(ngtcp2_extend_max_stream_data) !=
        ownSizeof(ngtcp2_extend_max_stream_data_536871558):
      static :
        warning("Declaration of " & "ngtcp2_extend_max_stream_data" &
            " exists but with different size")
    ngtcp2_extend_max_stream_data
   else:
    ngtcp2_extend_max_stream_data_536871558)
  ptrdiff_t_536871370 = (when declared(ptrdiff_t):
    when ownSizeof(ptrdiff_t) != ownSizeof(ptrdiff_t_536871369):
      static :
        warning("Declaration of " & "ptrdiff_t" &
            " exists but with different size")
    ptrdiff_t
   else:
    ptrdiff_t_536871369)
  ngtcp2_conn_536871519 = (when declared(ngtcp2_conn):
    when ownSizeof(ngtcp2_conn) != ownSizeof(ngtcp2_conn_536871518):
      static :
        warning("Declaration of " & "ngtcp2_conn" &
            " exists but with different size")
    ngtcp2_conn
   else:
    ngtcp2_conn_536871518)
  ngtcp2_sockaddr_union_536871434 = (when declared(ngtcp2_sockaddr_union):
    when ownSizeof(ngtcp2_sockaddr_union) != ownSizeof(ngtcp2_sockaddr_union_536871433):
      static :
        warning("Declaration of " & "ngtcp2_sockaddr_union" &
            " exists but with different size")
    ngtcp2_sockaddr_union
   else:
    ngtcp2_sockaddr_union_536871433)
  struct_ngtcp2_crypto_cipher_536871499 = (when declared(
      struct_ngtcp2_crypto_cipher):
    when ownSizeof(struct_ngtcp2_crypto_cipher) !=
        ownSizeof(struct_ngtcp2_crypto_cipher_536871498):
      static :
        warning("Declaration of " & "struct_ngtcp2_crypto_cipher" &
            " exists but with different size")
    struct_ngtcp2_crypto_cipher
   else:
    struct_ngtcp2_crypto_cipher_536871498)
  ngtcp2_delete_crypto_cipher_ctx_536871583 = (when declared(
      ngtcp2_delete_crypto_cipher_ctx):
    when ownSizeof(ngtcp2_delete_crypto_cipher_ctx) !=
        ownSizeof(ngtcp2_delete_crypto_cipher_ctx_536871582):
      static :
        warning("Declaration of " & "ngtcp2_delete_crypto_cipher_ctx" &
            " exists but with different size")
    ngtcp2_delete_crypto_cipher_ctx
   else:
    ngtcp2_delete_crypto_cipher_ctx_536871582)
  ngtcp2_version_negotiation_536871595 = (when declared(
      ngtcp2_version_negotiation):
    when ownSizeof(ngtcp2_version_negotiation) !=
        ownSizeof(ngtcp2_version_negotiation_536871594):
      static :
        warning("Declaration of " & "ngtcp2_version_negotiation" &
            " exists but with different size")
    ngtcp2_version_negotiation
   else:
    ngtcp2_version_negotiation_536871594)
  sa_family_t_536871621 = (when declared(sa_family_t):
    when ownSizeof(sa_family_t) != ownSizeof(sa_family_t_536871620):
      static :
        warning("Declaration of " & "sa_family_t" &
            " exists but with different size")
    sa_family_t
   else:
    sa_family_t_536871620)
  struct_ngtcp2_crypto_cipher_ctx_536871507 = (when declared(
      struct_ngtcp2_crypto_cipher_ctx):
    when ownSizeof(struct_ngtcp2_crypto_cipher_ctx) !=
        ownSizeof(struct_ngtcp2_crypto_cipher_ctx_536871506):
      static :
        warning("Declaration of " & "struct_ngtcp2_crypto_cipher_ctx" &
            " exists but with different size")
    struct_ngtcp2_crypto_cipher_ctx
   else:
    struct_ngtcp2_crypto_cipher_ctx_536871506)
  ngtcp2_client_initial_536871521 = (when declared(ngtcp2_client_initial):
    when ownSizeof(ngtcp2_client_initial) != ownSizeof(ngtcp2_client_initial_536871520):
      static :
        warning("Declaration of " & "ngtcp2_client_initial" &
            " exists but with different size")
    ngtcp2_client_initial
   else:
    ngtcp2_client_initial_536871520)
  struct_ngtcp2_cid_token_536871605 = (when declared(struct_ngtcp2_cid_token):
    when ownSizeof(struct_ngtcp2_cid_token) !=
        ownSizeof(struct_ngtcp2_cid_token_536871604):
      static :
        warning("Declaration of " & "struct_ngtcp2_cid_token" &
            " exists but with different size")
    struct_ngtcp2_cid_token
   else:
    struct_ngtcp2_cid_token_536871604)
  ngtcp2_delete_crypto_aead_ctx_536871581 = (when declared(
      ngtcp2_delete_crypto_aead_ctx):
    when ownSizeof(ngtcp2_delete_crypto_aead_ctx) !=
        ownSizeof(ngtcp2_delete_crypto_aead_ctx_536871580):
      static :
        warning("Declaration of " & "ngtcp2_delete_crypto_aead_ctx" &
            " exists but with different size")
    ngtcp2_delete_crypto_aead_ctx
   else:
    ngtcp2_delete_crypto_aead_ctx_536871580)
  ngtcp2_malloc_536871372 = (when declared(ngtcp2_malloc):
    when ownSizeof(ngtcp2_malloc) != ownSizeof(ngtcp2_malloc_536871371):
      static :
        warning("Declaration of " & "ngtcp2_malloc" &
            " exists but with different size")
    ngtcp2_malloc
   else:
    ngtcp2_malloc_536871371)
  ngtcp2_tstamp_536871396 = (when declared(ngtcp2_tstamp):
    when ownSizeof(ngtcp2_tstamp) != ownSizeof(ngtcp2_tstamp_536871395):
      static :
        warning("Declaration of " & "ngtcp2_tstamp" &
            " exists but with different size")
    ngtcp2_tstamp
   else:
    ngtcp2_tstamp_536871395)
  ngtcp2_select_preferred_addr_536871571 = (when declared(
      ngtcp2_select_preferred_addr):
    when ownSizeof(ngtcp2_select_preferred_addr) !=
        ownSizeof(ngtcp2_select_preferred_addr_536871570):
      static :
        warning("Declaration of " & "ngtcp2_select_preferred_addr" &
            " exists but with different size")
    ngtcp2_select_preferred_addr
   else:
    ngtcp2_select_preferred_addr_536871570)
  struct_ngtcp2_version_info_536871440 = (when declared(
      struct_ngtcp2_version_info):
    when ownSizeof(struct_ngtcp2_version_info) !=
        ownSizeof(struct_ngtcp2_version_info_536871439):
      static :
        warning("Declaration of " & "struct_ngtcp2_version_info" &
            " exists but with different size")
    struct_ngtcp2_version_info
   else:
    struct_ngtcp2_version_info_536871439)
when not declared(struct_ngtcp2_crypto_aead_ctx):
  type
    struct_ngtcp2_crypto_aead_ctx* = struct_ngtcp2_crypto_aead_ctx_536871502
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_crypto_aead_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_acked_stream_data_offset):
  type
    ngtcp2_acked_stream_data_offset* = ngtcp2_acked_stream_data_offset_536871552
else:
  static :
    hint("Declaration of " & "ngtcp2_acked_stream_data_offset" &
        " already exists, not redeclaring")
when not declared(ngtcp2_transport_params):
  type
    ngtcp2_transport_params* = ngtcp2_transport_params_536871445
else:
  static :
    hint("Declaration of " & "ngtcp2_transport_params" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_pkt_info):
  type
    struct_ngtcp2_pkt_info* = struct_ngtcp2_pkt_info_536871383
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_pkt_info" &
        " already exists, not redeclaring")
when not declared(ngtcp2_preferred_addr):
  type
    ngtcp2_preferred_addr* = ngtcp2_preferred_addr_536871437
else:
  static :
    hint("Declaration of " & "ngtcp2_preferred_addr" &
        " already exists, not redeclaring")
when not declared(ngtcp2_connection_id_status_type):
  type
    ngtcp2_connection_id_status_type* = ngtcp2_connection_id_status_type_536871574
else:
  static :
    hint("Declaration of " & "ngtcp2_connection_id_status_type" &
        " already exists, not redeclaring")
when not declared(struct_sockaddr):
  type
    struct_sockaddr* = struct_sockaddr_536871417
else:
  static :
    hint("Declaration of " & "struct_sockaddr" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_transport_params):
  type
    struct_ngtcp2_transport_params* = struct_ngtcp2_transport_params_536871443
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_transport_params" &
        " already exists, not redeclaring")
when not declared(struct_in_addr):
  type
    struct_in_addr* = struct_in_addr_536871624
else:
  static :
    hint("Declaration of " & "struct_in_addr" &
        " already exists, not redeclaring")
when not declared(ngtcp2_encrypt):
  type
    ngtcp2_encrypt* = ngtcp2_encrypt_536871538
else:
  static :
    hint("Declaration of " & "ngtcp2_encrypt" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_ccerr):
  type
    struct_ngtcp2_ccerr* = struct_ngtcp2_ccerr_536871612
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_ccerr" &
        " already exists, not redeclaring")
when not declared(ngtcp2_cc_algo):
  type
    ngtcp2_cc_algo* = ngtcp2_cc_algo_536871460
else:
  static :
    hint("Declaration of " & "ngtcp2_cc_algo" &
        " already exists, not redeclaring")
when not declared(ngtcp2_pkt_hd):
  type
    ngtcp2_pkt_hd* = ngtcp2_pkt_hd_536871409
else:
  static :
    hint("Declaration of " & "ngtcp2_pkt_hd" &
        " already exists, not redeclaring")
when not declared(ngtcp2_sockaddr):
  type
    ngtcp2_sockaddr* = ngtcp2_sockaddr_536871415
else:
  static :
    hint("Declaration of " & "ngtcp2_sockaddr" &
        " already exists, not redeclaring")
when not declared(struct_sockaddr_in):
  type
    struct_sockaddr_in* = struct_sockaddr_in_536871421
else:
  static :
    hint("Declaration of " & "struct_sockaddr_in" &
        " already exists, not redeclaring")
when not declared(enum_ngtcp2_token_type):
  type
    enum_ngtcp2_token_type* = enum_ngtcp2_token_type_536871470
else:
  static :
    hint("Declaration of " & "enum_ngtcp2_token_type" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_rand_ctx):
  type
    struct_ngtcp2_rand_ctx* = struct_ngtcp2_rand_ctx_536871464
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_rand_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_pkt_type):
  type
    ngtcp2_pkt_type* = ngtcp2_pkt_type_536871389
else:
  static :
    hint("Declaration of " & "ngtcp2_pkt_type" &
        " already exists, not redeclaring")
when not declared(ngtcp2_decrypt):
  type
    ngtcp2_decrypt* = ngtcp2_decrypt_536871540
else:
  static :
    hint("Declaration of " & "ngtcp2_decrypt" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_mem):
  type
    struct_ngtcp2_mem* = struct_ngtcp2_mem_536871379
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_mem" &
        " already exists, not redeclaring")
when not declared(ngtcp2_calloc):
  type
    ngtcp2_calloc* = ngtcp2_calloc_536871375
else:
  static :
    hint("Declaration of " & "ngtcp2_calloc" &
        " already exists, not redeclaring")
when not declared(struct_sockaddr_in6):
  type
    struct_sockaddr_in6* = struct_sockaddr_in6_536871425
else:
  static :
    hint("Declaration of " & "struct_sockaddr_in6" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_preferred_addr):
  type
    struct_ngtcp2_preferred_addr* = struct_ngtcp2_preferred_addr_536871435
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_preferred_addr" &
        " already exists, not redeclaring")
when not declared(ngtcp2_path_storage):
  type
    ngtcp2_path_storage* = ngtcp2_path_storage_536871488
else:
  static :
    hint("Declaration of " & "ngtcp2_path_storage" &
        " already exists, not redeclaring")
when not declared(ngtcp2_stream_open):
  type
    ngtcp2_stream_open* = ngtcp2_stream_open_536871546
else:
  static :
    hint("Declaration of " & "ngtcp2_stream_open" &
        " already exists, not redeclaring")
when not declared(enum_ngtcp2_ccerr_type):
  type
    enum_ngtcp2_ccerr_type* = enum_ngtcp2_ccerr_type_536871608
else:
  static :
    hint("Declaration of " & "enum_ngtcp2_ccerr_type" &
        " already exists, not redeclaring")
when not declared(ngtcp2_stream_stop_sending):
  type
    ngtcp2_stream_stop_sending* = ngtcp2_stream_stop_sending_536871592
else:
  static :
    hint("Declaration of " & "ngtcp2_stream_stop_sending" &
        " already exists, not redeclaring")
when not declared(ngtcp2_addr):
  type
    ngtcp2_addr* = ngtcp2_addr_536871480
else:
  static :
    hint("Declaration of " & "ngtcp2_addr" & " already exists, not redeclaring")
when not declared(ngtcp2_sockaddr_in):
  type
    ngtcp2_sockaddr_in* = ngtcp2_sockaddr_in_536871419
else:
  static :
    hint("Declaration of " & "ngtcp2_sockaddr_in" &
        " already exists, not redeclaring")
when not declared(ngtcp2_tls_early_data_rejected):
  type
    ngtcp2_tls_early_data_rejected* = ngtcp2_tls_early_data_rejected_536871598
else:
  static :
    hint("Declaration of " & "ngtcp2_tls_early_data_rejected" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_callbacks):
  type
    struct_ngtcp2_callbacks* = struct_ngtcp2_callbacks_536871600
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_callbacks" &
        " already exists, not redeclaring")
when not declared(ngtcp2_stream_reset):
  type
    ngtcp2_stream_reset* = ngtcp2_stream_reset_536871550
else:
  static :
    hint("Declaration of " & "ngtcp2_stream_reset" &
        " already exists, not redeclaring")
when not declared(ngtcp2_recv_datagram):
  type
    ngtcp2_recv_datagram* = ngtcp2_recv_datagram_536871584
else:
  static :
    hint("Declaration of " & "ngtcp2_recv_datagram" &
        " already exists, not redeclaring")
when not declared(ngtcp2_path):
  type
    ngtcp2_path* = ngtcp2_path_536871484
else:
  static :
    hint("Declaration of " & "ngtcp2_path" & " already exists, not redeclaring")
when not declared(ngtcp2_pkt_info):
  type
    ngtcp2_pkt_info* = ngtcp2_pkt_info_536871385
else:
  static :
    hint("Declaration of " & "ngtcp2_pkt_info" &
        " already exists, not redeclaring")
when not declared(ngtcp2_encryption_level):
  type
    ngtcp2_encryption_level* = ngtcp2_encryption_level_536871526
else:
  static :
    hint("Declaration of " & "ngtcp2_encryption_level" &
        " already exists, not redeclaring")
when not declared(ngtcp2_recv_stream_data):
  type
    ngtcp2_recv_stream_data* = ngtcp2_recv_stream_data_536871544
else:
  static :
    hint("Declaration of " & "ngtcp2_recv_stream_data" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_info):
  type
    struct_ngtcp2_info* = struct_ngtcp2_info_536871616
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_info" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_crypto_aead):
  type
    struct_ngtcp2_crypto_aead* = struct_ngtcp2_crypto_aead_536871494
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_crypto_aead" &
        " already exists, not redeclaring")
when not declared(enum_ngtcp2_path_validation_result):
  type
    enum_ngtcp2_path_validation_result* = enum_ngtcp2_path_validation_result_536871391
else:
  static :
    hint("Declaration of " & "enum_ngtcp2_path_validation_result" &
        " already exists, not redeclaring")
when not declared(ngtcp2_version_info):
  type
    ngtcp2_version_info* = ngtcp2_version_info_536871441
else:
  static :
    hint("Declaration of " & "ngtcp2_version_info" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_crypto_ctx):
  type
    struct_ngtcp2_crypto_ctx* = struct_ngtcp2_crypto_ctx_536871510
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_crypto_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_socklen):
  type
    ngtcp2_socklen* = ngtcp2_socklen_536871427
else:
  static :
    hint("Declaration of " & "ngtcp2_socklen" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_path_storage):
  type
    struct_ngtcp2_path_storage* = struct_ngtcp2_path_storage_536871486
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_path_storage" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_aead_ctx):
  type
    ngtcp2_crypto_aead_ctx* = ngtcp2_crypto_aead_ctx_536871504
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_aead_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_settings):
  type
    ngtcp2_settings* = ngtcp2_settings_536871476
else:
  static :
    hint("Declaration of " & "ngtcp2_settings" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_path):
  type
    struct_ngtcp2_path* = struct_ngtcp2_path_536871482
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_path" &
        " already exists, not redeclaring")
when not declared(ngtcp2_recv_client_initial):
  type
    ngtcp2_recv_client_initial* = ngtcp2_recv_client_initial_536871522
else:
  static :
    hint("Declaration of " & "ngtcp2_recv_client_initial" &
        " already exists, not redeclaring")
when not declared(ngtcp2_get_new_connection_id):
  type
    ngtcp2_get_new_connection_id* = ngtcp2_get_new_connection_id_536871562
else:
  static :
    hint("Declaration of " & "ngtcp2_get_new_connection_id" &
        " already exists, not redeclaring")
when not declared(ngtcp2_get_path_challenge_data):
  type
    ngtcp2_get_path_challenge_data* = ngtcp2_get_path_challenge_data_536871590
else:
  static :
    hint("Declaration of " & "ngtcp2_get_path_challenge_data" &
        " already exists, not redeclaring")
when not declared(ngtcp2_callbacks):
  type
    ngtcp2_callbacks* = ngtcp2_callbacks_536871602
else:
  static :
    hint("Declaration of " & "ngtcp2_callbacks" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_cipher):
  type
    ngtcp2_crypto_cipher* = ngtcp2_crypto_cipher_536871500
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_cipher" &
        " already exists, not redeclaring")
when not declared(socklen_t):
  type
    socklen_t* = socklen_t_536871429
else:
  static :
    hint("Declaration of " & "socklen_t" & " already exists, not redeclaring")
when not declared(ngtcp2_extend_max_streams):
  type
    ngtcp2_extend_max_streams* = ngtcp2_extend_max_streams_536871556
else:
  static :
    hint("Declaration of " & "ngtcp2_extend_max_streams" &
        " already exists, not redeclaring")
when not declared(ngtcp2_lost_datagram):
  type
    ngtcp2_lost_datagram* = ngtcp2_lost_datagram_536871588
else:
  static :
    hint("Declaration of " & "ngtcp2_lost_datagram" &
        " already exists, not redeclaring")
when not declared(ngtcp2_sockaddr_in6):
  type
    ngtcp2_sockaddr_in6* = ngtcp2_sockaddr_in6_536871423
else:
  static :
    hint("Declaration of " & "ngtcp2_sockaddr_in6" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_version_cid):
  type
    struct_ngtcp2_version_cid* = struct_ngtcp2_version_cid_536871514
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_version_cid" &
        " already exists, not redeclaring")
when not declared(struct_in6_addr):
  type
    struct_in6_addr* = struct_in6_addr_536871626
else:
  static :
    hint("Declaration of " & "struct_in6_addr" &
        " already exists, not redeclaring")
when not declared(enum_ngtcp2_pkt_type):
  type
    enum_ngtcp2_pkt_type* = enum_ngtcp2_pkt_type_536871387
else:
  static :
    hint("Declaration of " & "enum_ngtcp2_pkt_type" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_pkt_hd):
  type
    struct_ngtcp2_pkt_hd* = struct_ngtcp2_pkt_hd_536871407
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_pkt_hd" &
        " already exists, not redeclaring")
when not declared(ngtcp2_version_cid):
  type
    ngtcp2_version_cid* = ngtcp2_version_cid_536871516
else:
  static :
    hint("Declaration of " & "ngtcp2_version_cid" &
        " already exists, not redeclaring")
when not declared(ngtcp2_ccerr):
  type
    ngtcp2_ccerr* = ngtcp2_ccerr_536871614
else:
  static :
    hint("Declaration of " & "ngtcp2_ccerr" & " already exists, not redeclaring")
when not declared(ngtcp2_stream_close):
  type
    ngtcp2_stream_close* = ngtcp2_stream_close_536871548
else:
  static :
    hint("Declaration of " & "ngtcp2_stream_close" &
        " already exists, not redeclaring")
when not declared(ngtcp2_free):
  type
    ngtcp2_free* = ngtcp2_free_536871373
else:
  static :
    hint("Declaration of " & "ngtcp2_free" & " already exists, not redeclaring")
when not declared(ngtcp2_conn_info):
  type
    ngtcp2_conn_info* = ngtcp2_conn_info_536871449
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_info" &
        " already exists, not redeclaring")
when not declared(ngtcp2_token_type):
  type
    ngtcp2_token_type* = ngtcp2_token_type_536871472
else:
  static :
    hint("Declaration of " & "ngtcp2_token_type" &
        " already exists, not redeclaring")
when not declared(ngtcp2_handshake_confirmed):
  type
    ngtcp2_handshake_confirmed* = ngtcp2_handshake_confirmed_536871532
else:
  static :
    hint("Declaration of " & "ngtcp2_handshake_confirmed" &
        " already exists, not redeclaring")
when not declared(ngtcp2_pkt_stateless_reset):
  type
    ngtcp2_pkt_stateless_reset* = ngtcp2_pkt_stateless_reset_536871413
else:
  static :
    hint("Declaration of " & "ngtcp2_pkt_stateless_reset" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_settings):
  type
    struct_ngtcp2_settings* = struct_ngtcp2_settings_536871474
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_settings" &
        " already exists, not redeclaring")
when not declared(ngtcp2_qlog_write):
  type
    ngtcp2_qlog_write* = ngtcp2_qlog_write_536871468
else:
  static :
    hint("Declaration of " & "ngtcp2_qlog_write" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_addr):
  type
    struct_ngtcp2_addr* = struct_ngtcp2_addr_536871478
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_addr" &
        " already exists, not redeclaring")
when not declared(ngtcp2_update_key):
  type
    ngtcp2_update_key* = ngtcp2_update_key_536871566
else:
  static :
    hint("Declaration of " & "ngtcp2_update_key" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_vec):
  type
    struct_ngtcp2_vec* = struct_ngtcp2_vec_536871403
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_vec" &
        " already exists, not redeclaring")
when not declared(ngtcp2_path_validation):
  type
    ngtcp2_path_validation* = ngtcp2_path_validation_536871568
else:
  static :
    hint("Declaration of " & "ngtcp2_path_validation" &
        " already exists, not redeclaring")
when not declared(compiler_socklen_t):
  type
    compiler_socklen_t* = compiler_socklen_t_536871631
else:
  static :
    hint("Declaration of " & "compiler_socklen_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_ack_datagram):
  type
    ngtcp2_ack_datagram* = ngtcp2_ack_datagram_536871586
else:
  static :
    hint("Declaration of " & "ngtcp2_ack_datagram" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_ctx):
  type
    ngtcp2_crypto_ctx* = ngtcp2_crypto_ctx_536871512
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_ccerr_type):
  type
    ngtcp2_ccerr_type* = ngtcp2_ccerr_type_536871610
else:
  static :
    hint("Declaration of " & "ngtcp2_ccerr_type" &
        " already exists, not redeclaring")
when not declared(union_ngtcp2_sockaddr_union):
  type
    union_ngtcp2_sockaddr_union* = union_ngtcp2_sockaddr_union_536871431
else:
  static :
    hint("Declaration of " & "union_ngtcp2_sockaddr_union" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_cipher_ctx):
  type
    ngtcp2_crypto_cipher_ctx* = ngtcp2_crypto_cipher_ctx_536871508
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_cipher_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_path_validation_result):
  type
    ngtcp2_path_validation_result* = ngtcp2_path_validation_result_536871393
else:
  static :
    hint("Declaration of " & "ngtcp2_path_validation_result" &
        " already exists, not redeclaring")
when not declared(ngtcp2_cid):
  type
    ngtcp2_cid* = ngtcp2_cid_536871401
else:
  static :
    hint("Declaration of " & "ngtcp2_cid" & " already exists, not redeclaring")
when not declared(ngtcp2_printf):
  type
    ngtcp2_printf* = ngtcp2_printf_536871462
else:
  static :
    hint("Declaration of " & "ngtcp2_printf" &
        " already exists, not redeclaring")
when not declared(ngtcp2_recv_new_token):
  type
    ngtcp2_recv_new_token* = ngtcp2_recv_new_token_536871578
else:
  static :
    hint("Declaration of " & "ngtcp2_recv_new_token" &
        " already exists, not redeclaring")
when not declared(in_addr_t):
  type
    in_addr_t* = in_addr_t_536871633
else:
  static :
    hint("Declaration of " & "in_addr_t" & " already exists, not redeclaring")
when not declared(ngtcp2_mem):
  type
    ngtcp2_mem* = ngtcp2_mem_536871381
else:
  static :
    hint("Declaration of " & "ngtcp2_mem" & " already exists, not redeclaring")
when not declared(ngtcp2_handshake_completed):
  type
    ngtcp2_handshake_completed* = ngtcp2_handshake_completed_536871530
else:
  static :
    hint("Declaration of " & "ngtcp2_handshake_completed" &
        " already exists, not redeclaring")
when not declared(ngtcp2_info):
  type
    ngtcp2_info* = ngtcp2_info_536871618
else:
  static :
    hint("Declaration of " & "ngtcp2_info" & " already exists, not redeclaring")
when not declared(enum_ngtcp2_cc_algo):
  type
    enum_ngtcp2_cc_algo* = enum_ngtcp2_cc_algo_536871451
else:
  static :
    hint("Declaration of " & "enum_ngtcp2_cc_algo" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_crypto_md):
  type
    struct_ngtcp2_crypto_md* = struct_ngtcp2_crypto_md_536871490
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_crypto_md" &
        " already exists, not redeclaring")
when not declared(ngtcp2_rand):
  type
    ngtcp2_rand* = ngtcp2_rand_536871560
else:
  static :
    hint("Declaration of " & "ngtcp2_rand" & " already exists, not redeclaring")
when not declared(ngtcp2_duration):
  type
    ngtcp2_duration* = ngtcp2_duration_536871397
else:
  static :
    hint("Declaration of " & "ngtcp2_duration" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_cid):
  type
    struct_ngtcp2_cid* = struct_ngtcp2_cid_536871399
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_cid" &
        " already exists, not redeclaring")
when not declared(in_port_t):
  type
    in_port_t* = in_port_t_536871622
else:
  static :
    hint("Declaration of " & "in_port_t" & " already exists, not redeclaring")
when not declared(struct_ngtcp2_pkt_stateless_reset):
  type
    struct_ngtcp2_pkt_stateless_reset* = struct_ngtcp2_pkt_stateless_reset_536871411
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_pkt_stateless_reset" &
        " already exists, not redeclaring")
when not declared(ngtcp2_rand_ctx):
  type
    ngtcp2_rand_ctx* = ngtcp2_rand_ctx_536871466
else:
  static :
    hint("Declaration of " & "ngtcp2_rand_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_vec):
  type
    ngtcp2_vec* = ngtcp2_vec_536871405
else:
  static :
    hint("Declaration of " & "ngtcp2_vec" & " already exists, not redeclaring")
when not declared(ngtcp2_recv_version_negotiation):
  type
    ngtcp2_recv_version_negotiation* = ngtcp2_recv_version_negotiation_536871534
else:
  static :
    hint("Declaration of " & "ngtcp2_recv_version_negotiation" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_md):
  type
    ngtcp2_crypto_md* = ngtcp2_crypto_md_536871492
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_md" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_conn_info):
  type
    struct_ngtcp2_conn_info* = struct_ngtcp2_conn_info_536871447
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_conn_info" &
        " already exists, not redeclaring")
when not declared(ngtcp2_recv_stateless_reset):
  type
    ngtcp2_recv_stateless_reset* = ngtcp2_recv_stateless_reset_536871554
else:
  static :
    hint("Declaration of " & "ngtcp2_recv_stateless_reset" &
        " already exists, not redeclaring")
when not declared(enum_ngtcp2_connection_id_status_type):
  type
    enum_ngtcp2_connection_id_status_type* = enum_ngtcp2_connection_id_status_type_536871572
else:
  static :
    hint("Declaration of " & "enum_ngtcp2_connection_id_status_type" &
        " already exists, not redeclaring")
when not declared(ngtcp2_recv_key):
  type
    ngtcp2_recv_key* = ngtcp2_recv_key_536871596
else:
  static :
    hint("Declaration of " & "ngtcp2_recv_key" &
        " already exists, not redeclaring")
when not declared(ngtcp2_remove_connection_id):
  type
    ngtcp2_remove_connection_id* = ngtcp2_remove_connection_id_536871564
else:
  static :
    hint("Declaration of " & "ngtcp2_remove_connection_id" &
        " already exists, not redeclaring")
when not declared(ngtcp2_recv_retry):
  type
    ngtcp2_recv_retry* = ngtcp2_recv_retry_536871536
else:
  static :
    hint("Declaration of " & "ngtcp2_recv_retry" &
        " already exists, not redeclaring")
when not declared(ngtcp2_recv_crypto_data):
  type
    ngtcp2_recv_crypto_data* = ngtcp2_recv_crypto_data_536871528
else:
  static :
    hint("Declaration of " & "ngtcp2_recv_crypto_data" &
        " already exists, not redeclaring")
when not declared(ngtcp2_cid_token):
  type
    ngtcp2_cid_token* = ngtcp2_cid_token_536871606
else:
  static :
    hint("Declaration of " & "ngtcp2_cid_token" &
        " already exists, not redeclaring")
when not declared(ngtcp2_realloc):
  type
    ngtcp2_realloc* = ngtcp2_realloc_536871377
else:
  static :
    hint("Declaration of " & "ngtcp2_realloc" &
        " already exists, not redeclaring")
when not declared(ngtcp2_hp_mask):
  type
    ngtcp2_hp_mask* = ngtcp2_hp_mask_536871542
else:
  static :
    hint("Declaration of " & "ngtcp2_hp_mask" &
        " already exists, not redeclaring")
when not declared(enum_ngtcp2_encryption_level):
  type
    enum_ngtcp2_encryption_level* = enum_ngtcp2_encryption_level_536871524
else:
  static :
    hint("Declaration of " & "enum_ngtcp2_encryption_level" &
        " already exists, not redeclaring")
when not declared(ngtcp2_connection_id_status):
  type
    ngtcp2_connection_id_status* = ngtcp2_connection_id_status_536871576
else:
  static :
    hint("Declaration of " & "ngtcp2_connection_id_status" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_aead):
  type
    ngtcp2_crypto_aead* = ngtcp2_crypto_aead_536871496
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_aead" &
        " already exists, not redeclaring")
when not declared(ngtcp2_ssize):
  type
    ngtcp2_ssize* = ngtcp2_ssize_536871367
else:
  static :
    hint("Declaration of " & "ngtcp2_ssize" & " already exists, not redeclaring")
when not declared(ngtcp2_extend_max_stream_data):
  type
    ngtcp2_extend_max_stream_data* = ngtcp2_extend_max_stream_data_536871558
else:
  static :
    hint("Declaration of " & "ngtcp2_extend_max_stream_data" &
        " already exists, not redeclaring")
when not declared(ptrdiff_t):
  type
    ptrdiff_t* = ptrdiff_t_536871369
else:
  static :
    hint("Declaration of " & "ptrdiff_t" & " already exists, not redeclaring")
when not declared(ngtcp2_conn):
  type
    ngtcp2_conn* = ngtcp2_conn_536871518
else:
  static :
    hint("Declaration of " & "ngtcp2_conn" & " already exists, not redeclaring")
when not declared(ngtcp2_sockaddr_union):
  type
    ngtcp2_sockaddr_union* = ngtcp2_sockaddr_union_536871433
else:
  static :
    hint("Declaration of " & "ngtcp2_sockaddr_union" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_crypto_cipher):
  type
    struct_ngtcp2_crypto_cipher* = struct_ngtcp2_crypto_cipher_536871498
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_crypto_cipher" &
        " already exists, not redeclaring")
when not declared(ngtcp2_delete_crypto_cipher_ctx):
  type
    ngtcp2_delete_crypto_cipher_ctx* = ngtcp2_delete_crypto_cipher_ctx_536871582
else:
  static :
    hint("Declaration of " & "ngtcp2_delete_crypto_cipher_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_version_negotiation):
  type
    ngtcp2_version_negotiation* = ngtcp2_version_negotiation_536871594
else:
  static :
    hint("Declaration of " & "ngtcp2_version_negotiation" &
        " already exists, not redeclaring")
when not declared(sa_family_t):
  type
    sa_family_t* = sa_family_t_536871620
else:
  static :
    hint("Declaration of " & "sa_family_t" & " already exists, not redeclaring")
when not declared(struct_ngtcp2_crypto_cipher_ctx):
  type
    struct_ngtcp2_crypto_cipher_ctx* = struct_ngtcp2_crypto_cipher_ctx_536871506
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_crypto_cipher_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_client_initial):
  type
    ngtcp2_client_initial* = ngtcp2_client_initial_536871520
else:
  static :
    hint("Declaration of " & "ngtcp2_client_initial" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_cid_token):
  type
    struct_ngtcp2_cid_token* = struct_ngtcp2_cid_token_536871604
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_cid_token" &
        " already exists, not redeclaring")
when not declared(ngtcp2_delete_crypto_aead_ctx):
  type
    ngtcp2_delete_crypto_aead_ctx* = ngtcp2_delete_crypto_aead_ctx_536871580
else:
  static :
    hint("Declaration of " & "ngtcp2_delete_crypto_aead_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_malloc):
  type
    ngtcp2_malloc* = ngtcp2_malloc_536871371
else:
  static :
    hint("Declaration of " & "ngtcp2_malloc" &
        " already exists, not redeclaring")
when not declared(ngtcp2_tstamp):
  type
    ngtcp2_tstamp* = ngtcp2_tstamp_536871395
else:
  static :
    hint("Declaration of " & "ngtcp2_tstamp" &
        " already exists, not redeclaring")
when not declared(ngtcp2_select_preferred_addr):
  type
    ngtcp2_select_preferred_addr* = ngtcp2_select_preferred_addr_536871570
else:
  static :
    hint("Declaration of " & "ngtcp2_select_preferred_addr" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_version_info):
  type
    struct_ngtcp2_version_info* = struct_ngtcp2_version_info_536871439
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_version_info" &
        " already exists, not redeclaring")
when not declared(NGTCP2_VERSION):
  when "1.6.0" is static:
    const
      NGTCP2_VERSION* = "1.6.0" ## Generated based on /home/r/vacp2p/nim-ngtcp2/build/lib/includes/ngtcp2/version.h:39:9
  else:
    let NGTCP2_VERSION* = "1.6.0" ## Generated based on /home/r/vacp2p/nim-ngtcp2/build/lib/includes/ngtcp2/version.h:39:9
else:
  static :
    hint("Declaration of " & "NGTCP2_VERSION" &
        " already exists, not redeclaring")
when not declared(NGTCP2_VERSION_NUM):
  when 67072 is static:
    const
      NGTCP2_VERSION_NUM* = 67072 ## Generated based on /home/r/vacp2p/nim-ngtcp2/build/lib/includes/ngtcp2/version.h:49:9
  else:
    let NGTCP2_VERSION_NUM* = 67072 ## Generated based on /home/r/vacp2p/nim-ngtcp2/build/lib/includes/ngtcp2/version.h:49:9
else:
  static :
    hint("Declaration of " & "NGTCP2_VERSION_NUM" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PROTO_VER_MAX):
  when NGTCP2_PROTO_VER_V1 is typedesc:
    type
      NGTCP2_PROTO_VER_MAX* = NGTCP2_PROTO_VER_V1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:273:9
  else:
    when NGTCP2_PROTO_VER_V1 is static:
      const
        NGTCP2_PROTO_VER_MAX* = NGTCP2_PROTO_VER_V1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:273:9
    else:
      let NGTCP2_PROTO_VER_MAX* = NGTCP2_PROTO_VER_V1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:273:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PROTO_VER_MAX" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PROTO_VER_MIN):
  when NGTCP2_PROTO_VER_V1 is typedesc:
    type
      NGTCP2_PROTO_VER_MIN* = NGTCP2_PROTO_VER_V1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:281:9
  else:
    when NGTCP2_PROTO_VER_V1 is static:
      const
        NGTCP2_PROTO_VER_MIN* = NGTCP2_PROTO_VER_V1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:281:9
    else:
      let NGTCP2_PROTO_VER_MIN* = NGTCP2_PROTO_VER_V1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:281:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PROTO_VER_MIN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_RESERVED_VERSION_MASK):
  when cast[cuint](168430090'i64) is static:
    const
      NGTCP2_RESERVED_VERSION_MASK* = cast[cuint](168430090'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:289:9
  else:
    let NGTCP2_RESERVED_VERSION_MASK* = cast[cuint](168430090'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:289:9
else:
  static :
    hint("Declaration of " & "NGTCP2_RESERVED_VERSION_MASK" &
        " already exists, not redeclaring")
when not declared(NGTCP2_MAX_UDP_PAYLOAD_SIZE):
  when 1200 is static:
    const
      NGTCP2_MAX_UDP_PAYLOAD_SIZE* = 1200 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:303:9
  else:
    let NGTCP2_MAX_UDP_PAYLOAD_SIZE* = 1200 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:303:9
else:
  static :
    hint("Declaration of " & "NGTCP2_MAX_UDP_PAYLOAD_SIZE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_MAX_PMTUD_UDP_PAYLOAD_SIZE):
  when 1452 is static:
    const
      NGTCP2_MAX_PMTUD_UDP_PAYLOAD_SIZE* = 1452 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:311:9
  else:
    let NGTCP2_MAX_PMTUD_UDP_PAYLOAD_SIZE* = 1452 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:311:9
else:
  static :
    hint("Declaration of " & "NGTCP2_MAX_PMTUD_UDP_PAYLOAD_SIZE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_STATELESS_RESET_TOKENLEN):
  when 16 is static:
    const
      NGTCP2_STATELESS_RESET_TOKENLEN* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:333:9
  else:
    let NGTCP2_STATELESS_RESET_TOKENLEN* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:333:9
else:
  static :
    hint("Declaration of " & "NGTCP2_STATELESS_RESET_TOKENLEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_MIN_STATELESS_RESET_RANDLEN):
  when 5 is static:
    const
      NGTCP2_MIN_STATELESS_RESET_RANDLEN* = 5 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:341:9
  else:
    let NGTCP2_MIN_STATELESS_RESET_RANDLEN* = 5 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:341:9
else:
  static :
    hint("Declaration of " & "NGTCP2_MIN_STATELESS_RESET_RANDLEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PATH_CHALLENGE_DATALEN):
  when 8 is static:
    const
      NGTCP2_PATH_CHALLENGE_DATALEN* = 8 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:349:9
  else:
    let NGTCP2_PATH_CHALLENGE_DATALEN* = 8 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:349:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PATH_CHALLENGE_DATALEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_RETRY_NONCE_V1):
  when "\\x46\\x15\\x99\\xd3\\x5d\\x63\\x2b\\xf2\\x23\\x98\\x25\\xbb" is static:
    const
      NGTCP2_RETRY_NONCE_V1* = "\\x46\\x15\\x99\\xd3\\x5d\\x63\\x2b\\xf2\\x23\\x98\\x25\\xbb" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:366:9
  else:
    let NGTCP2_RETRY_NONCE_V1* = "\\x46\\x15\\x99\\xd3\\x5d\\x63\\x2b\\xf2\\x23\\x98\\x25\\xbb" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:366:9
else:
  static :
    hint("Declaration of " & "NGTCP2_RETRY_NONCE_V1" &
        " already exists, not redeclaring")
when not declared(NGTCP2_RETRY_NONCE_V2):
  when "\\xd8\\x69\\x69\\xbc\\x2d\\x7c\\x6d\\x99\\x90\\xef\\xb0\\x4a" is static:
    const
      NGTCP2_RETRY_NONCE_V2* = "\\xd8\\x69\\x69\\xbc\\x2d\\x7c\\x6d\\x99\\x90\\xef\\xb0\\x4a" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:385:9
  else:
    let NGTCP2_RETRY_NONCE_V2* = "\\xd8\\x69\\x69\\xbc\\x2d\\x7c\\x6d\\x99\\x90\\xef\\xb0\\x4a" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:385:9
else:
  static :
    hint("Declaration of " & "NGTCP2_RETRY_NONCE_V2" &
        " already exists, not redeclaring")
when not declared(NGTCP2_HP_MASKLEN):
  when 5 is static:
    const
      NGTCP2_HP_MASKLEN* = 5 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:392:9
  else:
    let NGTCP2_HP_MASKLEN* = 5 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:392:9
else:
  static :
    hint("Declaration of " & "NGTCP2_HP_MASKLEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_HP_SAMPLELEN):
  when 16 is static:
    const
      NGTCP2_HP_SAMPLELEN* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:400:9
  else:
    let NGTCP2_HP_SAMPLELEN* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:400:9
else:
  static :
    hint("Declaration of " & "NGTCP2_HP_SAMPLELEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_MAX_CIDLEN):
  when 20 is static:
    const
      NGTCP2_MAX_CIDLEN* = 20 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:414:9
  else:
    let NGTCP2_MAX_CIDLEN* = 20 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:414:9
else:
  static :
    hint("Declaration of " & "NGTCP2_MAX_CIDLEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_MIN_CIDLEN):
  when 1 is static:
    const
      NGTCP2_MIN_CIDLEN* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:421:9
  else:
    let NGTCP2_MIN_CIDLEN* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:421:9
else:
  static :
    hint("Declaration of " & "NGTCP2_MIN_CIDLEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_MIN_INITIAL_DCIDLEN):
  when 8 is static:
    const
      NGTCP2_MIN_INITIAL_DCIDLEN* = 8 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:430:9
  else:
    let NGTCP2_MIN_INITIAL_DCIDLEN* = 8 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:430:9
else:
  static :
    hint("Declaration of " & "NGTCP2_MIN_INITIAL_DCIDLEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ECN_NOT_ECT):
  when 0 is static:
    const
      NGTCP2_ECN_NOT_ECT* = 0 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:443:9
  else:
    let NGTCP2_ECN_NOT_ECT* = 0 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:443:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ECN_NOT_ECT" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ECN_ECT_1):
  when 1 is static:
    const
      NGTCP2_ECN_ECT_1* = 1  ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:450:9
  else:
    let NGTCP2_ECN_ECT_1* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:450:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ECN_ECT_1" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ECN_ECT_0):
  when 2 is static:
    const
      NGTCP2_ECN_ECT_0* = 2  ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:457:9
  else:
    let NGTCP2_ECN_ECT_0* = 2 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:457:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ECN_ECT_0" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ECN_CE):
  when 3 is static:
    const
      NGTCP2_ECN_CE* = 3     ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:464:9
  else:
    let NGTCP2_ECN_CE* = 3   ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:464:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ECN_CE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ECN_MASK):
  when 3 is static:
    const
      NGTCP2_ECN_MASK* = 3   ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:471:9
  else:
    let NGTCP2_ECN_MASK* = 3 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:471:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ECN_MASK" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PKT_INFO_V1):
  when 1 is static:
    const
      NGTCP2_PKT_INFO_V1* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:473:9
  else:
    let NGTCP2_PKT_INFO_V1* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:473:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PKT_INFO_V1" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PKT_INFO_VERSION):
  when NGTCP2_PKT_INFO_V1 is typedesc:
    type
      NGTCP2_PKT_INFO_VERSION* = NGTCP2_PKT_INFO_V1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:474:9
  else:
    when NGTCP2_PKT_INFO_V1 is static:
      const
        NGTCP2_PKT_INFO_VERSION* = NGTCP2_PKT_INFO_V1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:474:9
    else:
      let NGTCP2_PKT_INFO_VERSION* = NGTCP2_PKT_INFO_V1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:474:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PKT_INFO_VERSION" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_INVALID_ARGUMENT):
  when -201 is static:
    const
      NGTCP2_ERR_INVALID_ARGUMENT* = -201 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:503:9
  else:
    let NGTCP2_ERR_INVALID_ARGUMENT* = -201 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:503:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_INVALID_ARGUMENT" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_NOBUF):
  when -202 is static:
    const
      NGTCP2_ERR_NOBUF* = -202 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:510:9
  else:
    let NGTCP2_ERR_NOBUF* = -202 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:510:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_NOBUF" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_PROTO):
  when -203 is static:
    const
      NGTCP2_ERR_PROTO* = -203 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:516:9
  else:
    let NGTCP2_ERR_PROTO* = -203 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:516:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_PROTO" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_INVALID_STATE):
  when -204 is static:
    const
      NGTCP2_ERR_INVALID_STATE* = -204 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:523:9
  else:
    let NGTCP2_ERR_INVALID_STATE* = -204 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:523:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_INVALID_STATE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_ACK_FRAME):
  when -205 is static:
    const
      NGTCP2_ERR_ACK_FRAME* = -205 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:530:9
  else:
    let NGTCP2_ERR_ACK_FRAME* = -205 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:530:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_ACK_FRAME" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_STREAM_ID_BLOCKED):
  when -206 is static:
    const
      NGTCP2_ERR_STREAM_ID_BLOCKED* = -206 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:537:9
  else:
    let NGTCP2_ERR_STREAM_ID_BLOCKED* = -206 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:537:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_STREAM_ID_BLOCKED" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_STREAM_IN_USE):
  when -207 is static:
    const
      NGTCP2_ERR_STREAM_IN_USE* = -207 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:544:9
  else:
    let NGTCP2_ERR_STREAM_IN_USE* = -207 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:544:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_STREAM_IN_USE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_STREAM_DATA_BLOCKED):
  when -208 is static:
    const
      NGTCP2_ERR_STREAM_DATA_BLOCKED* = -208 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:551:9
  else:
    let NGTCP2_ERR_STREAM_DATA_BLOCKED* = -208 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:551:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_STREAM_DATA_BLOCKED" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_FLOW_CONTROL):
  when -209 is static:
    const
      NGTCP2_ERR_FLOW_CONTROL* = -209 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:557:9
  else:
    let NGTCP2_ERR_FLOW_CONTROL* = -209 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:557:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_FLOW_CONTROL" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_CONNECTION_ID_LIMIT):
  when -210 is static:
    const
      NGTCP2_ERR_CONNECTION_ID_LIMIT* = -210 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:564:9
  else:
    let NGTCP2_ERR_CONNECTION_ID_LIMIT* = -210 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:564:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_CONNECTION_ID_LIMIT" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_STREAM_LIMIT):
  when -211 is static:
    const
      NGTCP2_ERR_STREAM_LIMIT* = -211 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:571:9
  else:
    let NGTCP2_ERR_STREAM_LIMIT* = -211 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:571:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_STREAM_LIMIT" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_FINAL_SIZE):
  when -212 is static:
    const
      NGTCP2_ERR_FINAL_SIZE* = -212 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:578:9
  else:
    let NGTCP2_ERR_FINAL_SIZE* = -212 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:578:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_FINAL_SIZE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_CRYPTO):
  when -213 is static:
    const
      NGTCP2_ERR_CRYPTO* = -213 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:584:9
  else:
    let NGTCP2_ERR_CRYPTO* = -213 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:584:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_CRYPTO" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_PKT_NUM_EXHAUSTED):
  when -214 is static:
    const
      NGTCP2_ERR_PKT_NUM_EXHAUSTED* = -214 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:591:9
  else:
    let NGTCP2_ERR_PKT_NUM_EXHAUSTED* = -214 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:591:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_PKT_NUM_EXHAUSTED" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_REQUIRED_TRANSPORT_PARAM):
  when -215 is static:
    const
      NGTCP2_ERR_REQUIRED_TRANSPORT_PARAM* = -215 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:598:9
  else:
    let NGTCP2_ERR_REQUIRED_TRANSPORT_PARAM* = -215 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:598:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_REQUIRED_TRANSPORT_PARAM" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_MALFORMED_TRANSPORT_PARAM):
  when -216 is static:
    const
      NGTCP2_ERR_MALFORMED_TRANSPORT_PARAM* = -216 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:605:9
  else:
    let NGTCP2_ERR_MALFORMED_TRANSPORT_PARAM* = -216 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:605:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_MALFORMED_TRANSPORT_PARAM" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_FRAME_ENCODING):
  when -217 is static:
    const
      NGTCP2_ERR_FRAME_ENCODING* = -217 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:612:9
  else:
    let NGTCP2_ERR_FRAME_ENCODING* = -217 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:612:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_FRAME_ENCODING" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_DECRYPT):
  when -218 is static:
    const
      NGTCP2_ERR_DECRYPT* = -218 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:618:9
  else:
    let NGTCP2_ERR_DECRYPT* = -218 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:618:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_DECRYPT" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_STREAM_SHUT_WR):
  when -219 is static:
    const
      NGTCP2_ERR_STREAM_SHUT_WR* = -219 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:625:9
  else:
    let NGTCP2_ERR_STREAM_SHUT_WR* = -219 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:625:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_STREAM_SHUT_WR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_STREAM_NOT_FOUND):
  when -220 is static:
    const
      NGTCP2_ERR_STREAM_NOT_FOUND* = -220 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:632:9
  else:
    let NGTCP2_ERR_STREAM_NOT_FOUND* = -220 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:632:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_STREAM_NOT_FOUND" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_STREAM_STATE):
  when -221 is static:
    const
      NGTCP2_ERR_STREAM_STATE* = -221 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:639:9
  else:
    let NGTCP2_ERR_STREAM_STATE* = -221 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:639:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_STREAM_STATE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_RECV_VERSION_NEGOTIATION):
  when -222 is static:
    const
      NGTCP2_ERR_RECV_VERSION_NEGOTIATION* = -222 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:646:9
  else:
    let NGTCP2_ERR_RECV_VERSION_NEGOTIATION* = -222 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:646:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_RECV_VERSION_NEGOTIATION" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_CLOSING):
  when -223 is static:
    const
      NGTCP2_ERR_CLOSING* = -223 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:653:9
  else:
    let NGTCP2_ERR_CLOSING* = -223 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:653:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_CLOSING" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_DRAINING):
  when -224 is static:
    const
      NGTCP2_ERR_DRAINING* = -224 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:660:9
  else:
    let NGTCP2_ERR_DRAINING* = -224 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:660:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_DRAINING" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_TRANSPORT_PARAM):
  when -225 is static:
    const
      NGTCP2_ERR_TRANSPORT_PARAM* = -225 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:667:9
  else:
    let NGTCP2_ERR_TRANSPORT_PARAM* = -225 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:667:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_TRANSPORT_PARAM" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_DISCARD_PKT):
  when -226 is static:
    const
      NGTCP2_ERR_DISCARD_PKT* = -226 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:673:9
  else:
    let NGTCP2_ERR_DISCARD_PKT* = -226 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:673:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_DISCARD_PKT" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_CONN_ID_BLOCKED):
  when -227 is static:
    const
      NGTCP2_ERR_CONN_ID_BLOCKED* = -227 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:680:9
  else:
    let NGTCP2_ERR_CONN_ID_BLOCKED* = -227 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:680:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_CONN_ID_BLOCKED" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_INTERNAL):
  when -228 is static:
    const
      NGTCP2_ERR_INTERNAL* = -228 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:686:9
  else:
    let NGTCP2_ERR_INTERNAL* = -228 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:686:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_INTERNAL" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_CRYPTO_BUFFER_EXCEEDED):
  when -229 is static:
    const
      NGTCP2_ERR_CRYPTO_BUFFER_EXCEEDED* = -229 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:693:9
  else:
    let NGTCP2_ERR_CRYPTO_BUFFER_EXCEEDED* = -229 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:693:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_CRYPTO_BUFFER_EXCEEDED" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_WRITE_MORE):
  when -230 is static:
    const
      NGTCP2_ERR_WRITE_MORE* = -230 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:701:9
  else:
    let NGTCP2_ERR_WRITE_MORE* = -230 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:701:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_WRITE_MORE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_RETRY):
  when -231 is static:
    const
      NGTCP2_ERR_RETRY* = -231 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:708:9
  else:
    let NGTCP2_ERR_RETRY* = -231 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:708:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_RETRY" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_DROP_CONN):
  when -232 is static:
    const
      NGTCP2_ERR_DROP_CONN* = -232 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:715:9
  else:
    let NGTCP2_ERR_DROP_CONN* = -232 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:715:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_DROP_CONN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_AEAD_LIMIT_REACHED):
  when -233 is static:
    const
      NGTCP2_ERR_AEAD_LIMIT_REACHED* = -233 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:723:9
  else:
    let NGTCP2_ERR_AEAD_LIMIT_REACHED* = -233 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:723:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_AEAD_LIMIT_REACHED" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_NO_VIABLE_PATH):
  when -234 is static:
    const
      NGTCP2_ERR_NO_VIABLE_PATH* = -234 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:731:9
  else:
    let NGTCP2_ERR_NO_VIABLE_PATH* = -234 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:731:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_NO_VIABLE_PATH" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_VERSION_NEGOTIATION):
  when -235 is static:
    const
      NGTCP2_ERR_VERSION_NEGOTIATION* = -235 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:738:9
  else:
    let NGTCP2_ERR_VERSION_NEGOTIATION* = -235 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:738:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_VERSION_NEGOTIATION" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_HANDSHAKE_TIMEOUT):
  when -236 is static:
    const
      NGTCP2_ERR_HANDSHAKE_TIMEOUT* = -236 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:745:9
  else:
    let NGTCP2_ERR_HANDSHAKE_TIMEOUT* = -236 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:745:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_HANDSHAKE_TIMEOUT" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_VERSION_NEGOTIATION_FAILURE):
  when -237 is static:
    const
      NGTCP2_ERR_VERSION_NEGOTIATION_FAILURE* = -237 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:752:9
  else:
    let NGTCP2_ERR_VERSION_NEGOTIATION_FAILURE* = -237 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:752:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_VERSION_NEGOTIATION_FAILURE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_IDLE_CLOSE):
  when -238 is static:
    const
      NGTCP2_ERR_IDLE_CLOSE* = -238 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:759:9
  else:
    let NGTCP2_ERR_IDLE_CLOSE* = -238 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:759:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_IDLE_CLOSE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_FATAL):
  when -500 is static:
    const
      NGTCP2_ERR_FATAL* = -500 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:767:9
  else:
    let NGTCP2_ERR_FATAL* = -500 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:767:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_FATAL" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_NOMEM):
  when -501 is static:
    const
      NGTCP2_ERR_NOMEM* = -501 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:773:9
  else:
    let NGTCP2_ERR_NOMEM* = -501 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:773:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_NOMEM" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_CALLBACK_FAILURE):
  when -502 is static:
    const
      NGTCP2_ERR_CALLBACK_FAILURE* = -502 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:780:9
  else:
    let NGTCP2_ERR_CALLBACK_FAILURE* = -502 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:780:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_CALLBACK_FAILURE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PKT_FLAG_NONE):
  when cast[cuint](0'i64) is static:
    const
      NGTCP2_PKT_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:793:9
  else:
    let NGTCP2_PKT_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:793:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PKT_FLAG_NONE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PKT_FLAG_LONG_FORM):
  when cast[cuint](1'i64) is static:
    const
      NGTCP2_PKT_FLAG_LONG_FORM* = cast[cuint](1'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:801:9
  else:
    let NGTCP2_PKT_FLAG_LONG_FORM* = cast[cuint](1'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:801:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PKT_FLAG_LONG_FORM" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PKT_FLAG_FIXED_BIT_CLEAR):
  when cast[cuint](2'i64) is static:
    const
      NGTCP2_PKT_FLAG_FIXED_BIT_CLEAR* = cast[cuint](2'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:809:9
  else:
    let NGTCP2_PKT_FLAG_FIXED_BIT_CLEAR* = cast[cuint](2'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:809:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PKT_FLAG_FIXED_BIT_CLEAR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PKT_FLAG_KEY_PHASE):
  when cast[cuint](4'i64) is static:
    const
      NGTCP2_PKT_FLAG_KEY_PHASE* = cast[cuint](4'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:816:9
  else:
    let NGTCP2_PKT_FLAG_KEY_PHASE* = cast[cuint](4'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:816:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PKT_FLAG_KEY_PHASE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_NO_ERROR):
  when cast[cuint](0'i64) is static:
    const
      NGTCP2_NO_ERROR* = cast[cuint](0'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:868:9
  else:
    let NGTCP2_NO_ERROR* = cast[cuint](0'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:868:9
else:
  static :
    hint("Declaration of " & "NGTCP2_NO_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_INTERNAL_ERROR):
  when cast[cuint](1'i64) is static:
    const
      NGTCP2_INTERNAL_ERROR* = cast[cuint](1'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:876:9
  else:
    let NGTCP2_INTERNAL_ERROR* = cast[cuint](1'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:876:9
else:
  static :
    hint("Declaration of " & "NGTCP2_INTERNAL_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CONNECTION_REFUSED):
  when cast[cuint](2'i64) is static:
    const
      NGTCP2_CONNECTION_REFUSED* = cast[cuint](2'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:884:9
  else:
    let NGTCP2_CONNECTION_REFUSED* = cast[cuint](2'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:884:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CONNECTION_REFUSED" &
        " already exists, not redeclaring")
when not declared(NGTCP2_FLOW_CONTROL_ERROR):
  when cast[cuint](3'i64) is static:
    const
      NGTCP2_FLOW_CONTROL_ERROR* = cast[cuint](3'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:892:9
  else:
    let NGTCP2_FLOW_CONTROL_ERROR* = cast[cuint](3'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:892:9
else:
  static :
    hint("Declaration of " & "NGTCP2_FLOW_CONTROL_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_STREAM_LIMIT_ERROR):
  when cast[cuint](4'i64) is static:
    const
      NGTCP2_STREAM_LIMIT_ERROR* = cast[cuint](4'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:900:9
  else:
    let NGTCP2_STREAM_LIMIT_ERROR* = cast[cuint](4'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:900:9
else:
  static :
    hint("Declaration of " & "NGTCP2_STREAM_LIMIT_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_STREAM_STATE_ERROR):
  when cast[cuint](5'i64) is static:
    const
      NGTCP2_STREAM_STATE_ERROR* = cast[cuint](5'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:908:9
  else:
    let NGTCP2_STREAM_STATE_ERROR* = cast[cuint](5'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:908:9
else:
  static :
    hint("Declaration of " & "NGTCP2_STREAM_STATE_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_FINAL_SIZE_ERROR):
  when cast[cuint](6'i64) is static:
    const
      NGTCP2_FINAL_SIZE_ERROR* = cast[cuint](6'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:916:9
  else:
    let NGTCP2_FINAL_SIZE_ERROR* = cast[cuint](6'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:916:9
else:
  static :
    hint("Declaration of " & "NGTCP2_FINAL_SIZE_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_FRAME_ENCODING_ERROR):
  when cast[cuint](7'i64) is static:
    const
      NGTCP2_FRAME_ENCODING_ERROR* = cast[cuint](7'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:924:9
  else:
    let NGTCP2_FRAME_ENCODING_ERROR* = cast[cuint](7'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:924:9
else:
  static :
    hint("Declaration of " & "NGTCP2_FRAME_ENCODING_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_TRANSPORT_PARAMETER_ERROR):
  when cast[cuint](8'i64) is static:
    const
      NGTCP2_TRANSPORT_PARAMETER_ERROR* = cast[cuint](8'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:932:9
  else:
    let NGTCP2_TRANSPORT_PARAMETER_ERROR* = cast[cuint](8'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:932:9
else:
  static :
    hint("Declaration of " & "NGTCP2_TRANSPORT_PARAMETER_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CONNECTION_ID_LIMIT_ERROR):
  when cast[cuint](9'i64) is static:
    const
      NGTCP2_CONNECTION_ID_LIMIT_ERROR* = cast[cuint](9'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:940:9
  else:
    let NGTCP2_CONNECTION_ID_LIMIT_ERROR* = cast[cuint](9'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:940:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CONNECTION_ID_LIMIT_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PROTOCOL_VIOLATION):
  when cast[cuint](10'i64) is static:
    const
      NGTCP2_PROTOCOL_VIOLATION* = cast[cuint](10'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:948:9
  else:
    let NGTCP2_PROTOCOL_VIOLATION* = cast[cuint](10'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:948:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PROTOCOL_VIOLATION" &
        " already exists, not redeclaring")
when not declared(NGTCP2_INVALID_TOKEN):
  when cast[cuint](11'i64) is static:
    const
      NGTCP2_INVALID_TOKEN* = cast[cuint](11'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:956:9
  else:
    let NGTCP2_INVALID_TOKEN* = cast[cuint](11'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:956:9
else:
  static :
    hint("Declaration of " & "NGTCP2_INVALID_TOKEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_APPLICATION_ERROR):
  when cast[cuint](12'i64) is static:
    const
      NGTCP2_APPLICATION_ERROR* = cast[cuint](12'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:964:9
  else:
    let NGTCP2_APPLICATION_ERROR* = cast[cuint](12'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:964:9
else:
  static :
    hint("Declaration of " & "NGTCP2_APPLICATION_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CRYPTO_BUFFER_EXCEEDED):
  when cast[cuint](13'i64) is static:
    const
      NGTCP2_CRYPTO_BUFFER_EXCEEDED* = cast[cuint](13'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:972:9
  else:
    let NGTCP2_CRYPTO_BUFFER_EXCEEDED* = cast[cuint](13'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:972:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CRYPTO_BUFFER_EXCEEDED" &
        " already exists, not redeclaring")
when not declared(NGTCP2_KEY_UPDATE_ERROR):
  when cast[cuint](14'i64) is static:
    const
      NGTCP2_KEY_UPDATE_ERROR* = cast[cuint](14'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:980:9
  else:
    let NGTCP2_KEY_UPDATE_ERROR* = cast[cuint](14'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:980:9
else:
  static :
    hint("Declaration of " & "NGTCP2_KEY_UPDATE_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_AEAD_LIMIT_REACHED):
  when cast[cuint](15'i64) is static:
    const
      NGTCP2_AEAD_LIMIT_REACHED* = cast[cuint](15'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:988:9
  else:
    let NGTCP2_AEAD_LIMIT_REACHED* = cast[cuint](15'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:988:9
else:
  static :
    hint("Declaration of " & "NGTCP2_AEAD_LIMIT_REACHED" &
        " already exists, not redeclaring")
when not declared(NGTCP2_NO_VIABLE_PATH):
  when cast[cuint](16'i64) is static:
    const
      NGTCP2_NO_VIABLE_PATH* = cast[cuint](16'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:996:9
  else:
    let NGTCP2_NO_VIABLE_PATH* = cast[cuint](16'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:996:9
else:
  static :
    hint("Declaration of " & "NGTCP2_NO_VIABLE_PATH" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CRYPTO_ERROR):
  when cast[cuint](256'i64) is static:
    const
      NGTCP2_CRYPTO_ERROR* = cast[cuint](256'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1004:9
  else:
    let NGTCP2_CRYPTO_ERROR* = cast[cuint](256'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1004:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CRYPTO_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_VERSION_NEGOTIATION_ERROR):
  when 17 is static:
    const
      NGTCP2_VERSION_NEGOTIATION_ERROR* = 17 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1012:9
  else:
    let NGTCP2_VERSION_NEGOTIATION_ERROR* = 17 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1012:9
else:
  static :
    hint("Declaration of " & "NGTCP2_VERSION_NEGOTIATION_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_DEFAULT_MAX_RECV_UDP_PAYLOAD_SIZE):
  when 65527 is static:
    const
      NGTCP2_DEFAULT_MAX_RECV_UDP_PAYLOAD_SIZE* = 65527 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1197:9
  else:
    let NGTCP2_DEFAULT_MAX_RECV_UDP_PAYLOAD_SIZE* = 65527 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1197:9
else:
  static :
    hint("Declaration of " & "NGTCP2_DEFAULT_MAX_RECV_UDP_PAYLOAD_SIZE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_DEFAULT_ACK_DELAY_EXPONENT):
  when 3 is static:
    const
      NGTCP2_DEFAULT_ACK_DELAY_EXPONENT* = 3 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1205:9
  else:
    let NGTCP2_DEFAULT_ACK_DELAY_EXPONENT* = 3 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1205:9
else:
  static :
    hint("Declaration of " & "NGTCP2_DEFAULT_ACK_DELAY_EXPONENT" &
        " already exists, not redeclaring")
when not declared(NGTCP2_DEFAULT_ACTIVE_CONNECTION_ID_LIMIT):
  when 2 is static:
    const
      NGTCP2_DEFAULT_ACTIVE_CONNECTION_ID_LIMIT* = 2 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1223:9
  else:
    let NGTCP2_DEFAULT_ACTIVE_CONNECTION_ID_LIMIT* = 2 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1223:9
else:
  static :
    hint("Declaration of " & "NGTCP2_DEFAULT_ACTIVE_CONNECTION_ID_LIMIT" &
        " already exists, not redeclaring")
when not declared(NGTCP2_TLSEXT_QUIC_TRANSPORT_PARAMETERS_V1):
  when cast[cuint](57'i64) is static:
    const
      NGTCP2_TLSEXT_QUIC_TRANSPORT_PARAMETERS_V1* = cast[cuint](57'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1231:9
  else:
    let NGTCP2_TLSEXT_QUIC_TRANSPORT_PARAMETERS_V1* = cast[cuint](57'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1231:9
else:
  static :
    hint("Declaration of " & "NGTCP2_TLSEXT_QUIC_TRANSPORT_PARAMETERS_V1" &
        " already exists, not redeclaring")
when not declared(NGTCP2_TRANSPORT_PARAMS_V1):
  when 1 is static:
    const
      NGTCP2_TRANSPORT_PARAMS_V1* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1384:9
  else:
    let NGTCP2_TRANSPORT_PARAMS_V1* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1384:9
else:
  static :
    hint("Declaration of " & "NGTCP2_TRANSPORT_PARAMS_V1" &
        " already exists, not redeclaring")
when not declared(NGTCP2_TRANSPORT_PARAMS_VERSION):
  when NGTCP2_TRANSPORT_PARAMS_V1 is typedesc:
    type
      NGTCP2_TRANSPORT_PARAMS_VERSION* = NGTCP2_TRANSPORT_PARAMS_V1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1385:9
  else:
    when NGTCP2_TRANSPORT_PARAMS_V1 is static:
      const
        NGTCP2_TRANSPORT_PARAMS_VERSION* = NGTCP2_TRANSPORT_PARAMS_V1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1385:9
    else:
      let NGTCP2_TRANSPORT_PARAMS_VERSION* = NGTCP2_TRANSPORT_PARAMS_V1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1385:9
else:
  static :
    hint("Declaration of " & "NGTCP2_TRANSPORT_PARAMS_VERSION" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CONN_INFO_V1):
  when 1 is static:
    const
      NGTCP2_CONN_INFO_V1* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1555:9
  else:
    let NGTCP2_CONN_INFO_V1* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1555:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CONN_INFO_V1" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CONN_INFO_VERSION):
  when NGTCP2_CONN_INFO_V1 is typedesc:
    type
      NGTCP2_CONN_INFO_VERSION* = NGTCP2_CONN_INFO_V1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1556:9
  else:
    when NGTCP2_CONN_INFO_V1 is static:
      const
        NGTCP2_CONN_INFO_VERSION* = NGTCP2_CONN_INFO_V1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1556:9
    else:
      let NGTCP2_CONN_INFO_VERSION* = NGTCP2_CONN_INFO_V1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1556:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CONN_INFO_VERSION" &
        " already exists, not redeclaring")
when not declared(NGTCP2_QLOG_WRITE_FLAG_NONE):
  when cast[cuint](0'i64) is static:
    const
      NGTCP2_QLOG_WRITE_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1637:9
  else:
    let NGTCP2_QLOG_WRITE_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1637:9
else:
  static :
    hint("Declaration of " & "NGTCP2_QLOG_WRITE_FLAG_NONE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_QLOG_WRITE_FLAG_FIN):
  when cast[cuint](1'i64) is static:
    const
      NGTCP2_QLOG_WRITE_FLAG_FIN* = cast[cuint](1'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1644:9
  else:
    let NGTCP2_QLOG_WRITE_FLAG_FIN* = cast[cuint](1'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1644:9
else:
  static :
    hint("Declaration of " & "NGTCP2_QLOG_WRITE_FLAG_FIN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_SETTINGS_V1):
  when 1 is static:
    const
      NGTCP2_SETTINGS_V1* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1697:9
  else:
    let NGTCP2_SETTINGS_V1* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1697:9
else:
  static :
    hint("Declaration of " & "NGTCP2_SETTINGS_V1" &
        " already exists, not redeclaring")
when not declared(NGTCP2_SETTINGS_V2):
  when 2 is static:
    const
      NGTCP2_SETTINGS_V2* = 2 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1698:9
  else:
    let NGTCP2_SETTINGS_V2* = 2 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1698:9
else:
  static :
    hint("Declaration of " & "NGTCP2_SETTINGS_V2" &
        " already exists, not redeclaring")
when not declared(NGTCP2_SETTINGS_VERSION):
  when NGTCP2_SETTINGS_V2 is typedesc:
    type
      NGTCP2_SETTINGS_VERSION* = NGTCP2_SETTINGS_V2 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1699:9
  else:
    when NGTCP2_SETTINGS_V2 is static:
      const
        NGTCP2_SETTINGS_VERSION* = NGTCP2_SETTINGS_V2 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1699:9
    else:
      let NGTCP2_SETTINGS_VERSION* = NGTCP2_SETTINGS_V2 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1699:9
else:
  static :
    hint("Declaration of " & "NGTCP2_SETTINGS_VERSION" &
        " already exists, not redeclaring")
when not declared(NGTCP2_STREAM_DATA_FLAG_NONE):
  when cast[cuint](0'i64) is static:
    const
      NGTCP2_STREAM_DATA_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2657:9
  else:
    let NGTCP2_STREAM_DATA_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2657:9
else:
  static :
    hint("Declaration of " & "NGTCP2_STREAM_DATA_FLAG_NONE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_STREAM_DATA_FLAG_FIN):
  when cast[cuint](1'i64) is static:
    const
      NGTCP2_STREAM_DATA_FLAG_FIN* = cast[cuint](1'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2665:9
  else:
    let NGTCP2_STREAM_DATA_FLAG_FIN* = cast[cuint](1'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2665:9
else:
  static :
    hint("Declaration of " & "NGTCP2_STREAM_DATA_FLAG_FIN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_STREAM_DATA_FLAG_0RTT):
  when cast[cuint](2'i64) is static:
    const
      NGTCP2_STREAM_DATA_FLAG_0RTT* = cast[cuint](2'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2674:9
  else:
    let NGTCP2_STREAM_DATA_FLAG_0RTT* = cast[cuint](2'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2674:9
else:
  static :
    hint("Declaration of " & "NGTCP2_STREAM_DATA_FLAG_0RTT" &
        " already exists, not redeclaring")
when not declared(NGTCP2_STREAM_CLOSE_FLAG_NONE):
  when cast[cuint](0'i64) is static:
    const
      NGTCP2_STREAM_CLOSE_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2729:9
  else:
    let NGTCP2_STREAM_CLOSE_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2729:9
else:
  static :
    hint("Declaration of " & "NGTCP2_STREAM_CLOSE_FLAG_NONE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_STREAM_CLOSE_FLAG_APP_ERROR_CODE_SET):
  when cast[cuint](1'i64) is static:
    const
      NGTCP2_STREAM_CLOSE_FLAG_APP_ERROR_CODE_SET* = cast[cuint](1'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2737:9
  else:
    let NGTCP2_STREAM_CLOSE_FLAG_APP_ERROR_CODE_SET* = cast[cuint](1'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2737:9
else:
  static :
    hint("Declaration of " & "NGTCP2_STREAM_CLOSE_FLAG_APP_ERROR_CODE_SET" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PATH_VALIDATION_FLAG_NONE):
  when cast[cuint](0'i64) is static:
    const
      NGTCP2_PATH_VALIDATION_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2945:9
  else:
    let NGTCP2_PATH_VALIDATION_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2945:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PATH_VALIDATION_FLAG_NONE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PATH_VALIDATION_FLAG_PREFERRED_ADDR):
  when cast[cuint](1'i64) is static:
    const
      NGTCP2_PATH_VALIDATION_FLAG_PREFERRED_ADDR* = cast[cuint](1'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2954:9
  else:
    let NGTCP2_PATH_VALIDATION_FLAG_PREFERRED_ADDR* = cast[cuint](1'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2954:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PATH_VALIDATION_FLAG_PREFERRED_ADDR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PATH_VALIDATION_FLAG_NEW_TOKEN):
  when cast[cuint](2'i64) is static:
    const
      NGTCP2_PATH_VALIDATION_FLAG_NEW_TOKEN* = cast[cuint](2'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2963:9
  else:
    let NGTCP2_PATH_VALIDATION_FLAG_NEW_TOKEN* = cast[cuint](2'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2963:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PATH_VALIDATION_FLAG_NEW_TOKEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_DATAGRAM_FLAG_NONE):
  when cast[cuint](0'i64) is static:
    const
      NGTCP2_DATAGRAM_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3112:9
  else:
    let NGTCP2_DATAGRAM_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3112:9
else:
  static :
    hint("Declaration of " & "NGTCP2_DATAGRAM_FLAG_NONE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_DATAGRAM_FLAG_0RTT):
  when cast[cuint](1'i64) is static:
    const
      NGTCP2_DATAGRAM_FLAG_0RTT* = cast[cuint](1'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3121:9
  else:
    let NGTCP2_DATAGRAM_FLAG_0RTT* = cast[cuint](1'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3121:9
else:
  static :
    hint("Declaration of " & "NGTCP2_DATAGRAM_FLAG_0RTT" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CALLBACKS_V1):
  when 1 is static:
    const
      NGTCP2_CALLBACKS_V1* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3255:9
  else:
    let NGTCP2_CALLBACKS_V1* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3255:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CALLBACKS_V1" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CALLBACKS_VERSION):
  when NGTCP2_CALLBACKS_V1 is typedesc:
    type
      NGTCP2_CALLBACKS_VERSION* = NGTCP2_CALLBACKS_V1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3256:9
  else:
    when NGTCP2_CALLBACKS_V1 is static:
      const
        NGTCP2_CALLBACKS_VERSION* = NGTCP2_CALLBACKS_V1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3256:9
    else:
      let NGTCP2_CALLBACKS_VERSION* = NGTCP2_CALLBACKS_V1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3256:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CALLBACKS_VERSION" &
        " already exists, not redeclaring")
when not declared(NGTCP2_WRITE_STREAM_FLAG_NONE):
  when cast[cuint](0'i64) is static:
    const
      NGTCP2_WRITE_STREAM_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4383:9
  else:
    let NGTCP2_WRITE_STREAM_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4383:9
else:
  static :
    hint("Declaration of " & "NGTCP2_WRITE_STREAM_FLAG_NONE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_WRITE_STREAM_FLAG_MORE):
  when cast[cuint](1'i64) is static:
    const
      NGTCP2_WRITE_STREAM_FLAG_MORE* = cast[cuint](1'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4391:9
  else:
    let NGTCP2_WRITE_STREAM_FLAG_MORE* = cast[cuint](1'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4391:9
else:
  static :
    hint("Declaration of " & "NGTCP2_WRITE_STREAM_FLAG_MORE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_WRITE_STREAM_FLAG_FIN):
  when cast[cuint](2'i64) is static:
    const
      NGTCP2_WRITE_STREAM_FLAG_FIN* = cast[cuint](2'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4399:9
  else:
    let NGTCP2_WRITE_STREAM_FLAG_FIN* = cast[cuint](2'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4399:9
else:
  static :
    hint("Declaration of " & "NGTCP2_WRITE_STREAM_FLAG_FIN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_WRITE_DATAGRAM_FLAG_NONE):
  when cast[cuint](0'i64) is static:
    const
      NGTCP2_WRITE_DATAGRAM_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4579:9
  else:
    let NGTCP2_WRITE_DATAGRAM_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4579:9
else:
  static :
    hint("Declaration of " & "NGTCP2_WRITE_DATAGRAM_FLAG_NONE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_WRITE_DATAGRAM_FLAG_MORE):
  when cast[cuint](1'i64) is static:
    const
      NGTCP2_WRITE_DATAGRAM_FLAG_MORE* = cast[cuint](1'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4587:9
  else:
    let NGTCP2_WRITE_DATAGRAM_FLAG_MORE* = cast[cuint](1'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4587:9
else:
  static :
    hint("Declaration of " & "NGTCP2_WRITE_DATAGRAM_FLAG_MORE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_VERSION_AGE):
  when 1 is static:
    const
      NGTCP2_VERSION_AGE* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:5667:9
  else:
    let NGTCP2_VERSION_AGE* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:5667:9
else:
  static :
    hint("Declaration of " & "NGTCP2_VERSION_AGE" &
        " already exists, not redeclaring")
when not declared(ngtcp2_cid_init):
  proc ngtcp2_cid_init*(cid: ptr ngtcp2_cid_536871402; data: ptr uint8;
                        datalen: csize_t): void {.cdecl,
      importc: "ngtcp2_cid_init".}
else:
  static :
    hint("Declaration of " & "ngtcp2_cid_init" &
        " already exists, not redeclaring")
when not declared(ngtcp2_cid_eq):
  proc ngtcp2_cid_eq*(a: ptr ngtcp2_cid_536871402; b: ptr ngtcp2_cid_536871402): cint {.
      cdecl, importc: "ngtcp2_cid_eq".}
else:
  static :
    hint("Declaration of " & "ngtcp2_cid_eq" &
        " already exists, not redeclaring")
when not declared(ngtcp2_transport_params_encode_versioned):
  proc ngtcp2_transport_params_encode_versioned*(dest: ptr uint8;
      destlen: csize_t; transport_params_version: cint;
      params: ptr ngtcp2_transport_params_536871446): ngtcp2_ssize_536871368 {.
      cdecl, importc: "ngtcp2_transport_params_encode_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_transport_params_encode_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_transport_params_decode_versioned):
  proc ngtcp2_transport_params_decode_versioned*(transport_params_version: cint;
      params: ptr ngtcp2_transport_params_536871446; data: ptr uint8;
      datalen: csize_t): cint {.cdecl, importc: "ngtcp2_transport_params_decode_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_transport_params_decode_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_transport_params_decode_new):
  proc ngtcp2_transport_params_decode_new*(
      pparams: ptr ptr ngtcp2_transport_params_536871446; data: ptr uint8;
      datalen: csize_t; mem: ptr ngtcp2_mem_536871382): cint {.cdecl,
      importc: "ngtcp2_transport_params_decode_new".}
else:
  static :
    hint("Declaration of " & "ngtcp2_transport_params_decode_new" &
        " already exists, not redeclaring")
when not declared(ngtcp2_transport_params_del):
  proc ngtcp2_transport_params_del*(params: ptr ngtcp2_transport_params_536871446;
                                    mem: ptr ngtcp2_mem_536871382): void {.
      cdecl, importc: "ngtcp2_transport_params_del".}
else:
  static :
    hint("Declaration of " & "ngtcp2_transport_params_del" &
        " already exists, not redeclaring")
when not declared(ngtcp2_pkt_decode_version_cid):
  proc ngtcp2_pkt_decode_version_cid*(dest: ptr ngtcp2_version_cid_536871517;
                                      data: ptr uint8; datalen: csize_t;
                                      short_dcidlen: csize_t): cint {.cdecl,
      importc: "ngtcp2_pkt_decode_version_cid".}
else:
  static :
    hint("Declaration of " & "ngtcp2_pkt_decode_version_cid" &
        " already exists, not redeclaring")
when not declared(ngtcp2_pkt_decode_hd_long):
  proc ngtcp2_pkt_decode_hd_long*(dest: ptr ngtcp2_pkt_hd_536871410;
                                  pkt: ptr uint8; pktlen: csize_t): ngtcp2_ssize_536871368 {.
      cdecl, importc: "ngtcp2_pkt_decode_hd_long".}
else:
  static :
    hint("Declaration of " & "ngtcp2_pkt_decode_hd_long" &
        " already exists, not redeclaring")
when not declared(ngtcp2_pkt_decode_hd_short):
  proc ngtcp2_pkt_decode_hd_short*(dest: ptr ngtcp2_pkt_hd_536871410;
                                   pkt: ptr uint8; pktlen: csize_t;
                                   dcidlen: csize_t): ngtcp2_ssize_536871368 {.
      cdecl, importc: "ngtcp2_pkt_decode_hd_short".}
else:
  static :
    hint("Declaration of " & "ngtcp2_pkt_decode_hd_short" &
        " already exists, not redeclaring")
when not declared(ngtcp2_pkt_write_stateless_reset):
  proc ngtcp2_pkt_write_stateless_reset*(dest: ptr uint8; destlen: csize_t;
      stateless_reset_token: ptr uint8; rand: ptr uint8; randlen: csize_t): ngtcp2_ssize_536871368 {.
      cdecl, importc: "ngtcp2_pkt_write_stateless_reset".}
else:
  static :
    hint("Declaration of " & "ngtcp2_pkt_write_stateless_reset" &
        " already exists, not redeclaring")
when not declared(ngtcp2_pkt_write_version_negotiation):
  proc ngtcp2_pkt_write_version_negotiation*(dest: ptr uint8; destlen: csize_t;
      unused_random: uint8; dcid: ptr uint8; dcidlen: csize_t; scid: ptr uint8;
      scidlen: csize_t; sv: ptr uint32; nsv: csize_t): ngtcp2_ssize_536871368 {.
      cdecl, importc: "ngtcp2_pkt_write_version_negotiation".}
else:
  static :
    hint("Declaration of " & "ngtcp2_pkt_write_version_negotiation" &
        " already exists, not redeclaring")
when not declared(ngtcp2_pkt_write_connection_close):
  proc ngtcp2_pkt_write_connection_close*(dest: ptr uint8; destlen: csize_t;
      version: uint32; dcid: ptr ngtcp2_cid_536871402; scid: ptr ngtcp2_cid_536871402;
      error_code: uint64; reason: ptr uint8; reasonlen: csize_t;
      encrypt: ngtcp2_encrypt_536871539; aead: ptr ngtcp2_crypto_aead_536871497;
      aead_ctx: ptr ngtcp2_crypto_aead_ctx_536871505; iv: ptr uint8;
      hp_mask: ngtcp2_hp_mask_536871543; hp: ptr ngtcp2_crypto_cipher_536871501;
      hp_ctx: ptr ngtcp2_crypto_cipher_ctx_536871509): ngtcp2_ssize_536871368 {.
      cdecl, importc: "ngtcp2_pkt_write_connection_close".}
else:
  static :
    hint("Declaration of " & "ngtcp2_pkt_write_connection_close" &
        " already exists, not redeclaring")
when not declared(ngtcp2_pkt_write_retry):
  proc ngtcp2_pkt_write_retry*(dest: ptr uint8; destlen: csize_t;
                               version: uint32; dcid: ptr ngtcp2_cid_536871402;
                               scid: ptr ngtcp2_cid_536871402;
                               odcid: ptr ngtcp2_cid_536871402;
                               token: ptr uint8; tokenlen: csize_t;
                               encrypt: ngtcp2_encrypt_536871539;
                               aead: ptr ngtcp2_crypto_aead_536871497;
                               aead_ctx: ptr ngtcp2_crypto_aead_ctx_536871505): ngtcp2_ssize_536871368 {.
      cdecl, importc: "ngtcp2_pkt_write_retry".}
else:
  static :
    hint("Declaration of " & "ngtcp2_pkt_write_retry" &
        " already exists, not redeclaring")
when not declared(ngtcp2_accept):
  proc ngtcp2_accept*(dest: ptr ngtcp2_pkt_hd_536871410; pkt: ptr uint8;
                      pktlen: csize_t): cint {.cdecl, importc: "ngtcp2_accept".}
else:
  static :
    hint("Declaration of " & "ngtcp2_accept" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_client_new_versioned):
  proc ngtcp2_conn_client_new_versioned*(pconn: ptr ptr ngtcp2_conn_536871519;
      dcid: ptr ngtcp2_cid_536871402; scid: ptr ngtcp2_cid_536871402;
      path: ptr ngtcp2_path_536871485; client_chosen_version: uint32;
      callbacks_version: cint; callbacks: ptr ngtcp2_callbacks_536871603;
      settings_version: cint; settings: ptr ngtcp2_settings_536871477;
      transport_params_version: cint; params: ptr ngtcp2_transport_params_536871446;
      mem: ptr ngtcp2_mem_536871382; user_data: pointer): cint {.cdecl,
      importc: "ngtcp2_conn_client_new_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_client_new_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_server_new_versioned):
  proc ngtcp2_conn_server_new_versioned*(pconn: ptr ptr ngtcp2_conn_536871519;
      dcid: ptr ngtcp2_cid_536871402; scid: ptr ngtcp2_cid_536871402;
      path: ptr ngtcp2_path_536871485; client_chosen_version: uint32;
      callbacks_version: cint; callbacks: ptr ngtcp2_callbacks_536871603;
      settings_version: cint; settings: ptr ngtcp2_settings_536871477;
      transport_params_version: cint; params: ptr ngtcp2_transport_params_536871446;
      mem: ptr ngtcp2_mem_536871382; user_data: pointer): cint {.cdecl,
      importc: "ngtcp2_conn_server_new_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_server_new_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_del):
  proc ngtcp2_conn_del*(conn: ptr ngtcp2_conn_536871519): void {.cdecl,
      importc: "ngtcp2_conn_del".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_del" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_read_pkt_versioned):
  proc ngtcp2_conn_read_pkt_versioned*(conn: ptr ngtcp2_conn_536871519;
                                       path: ptr ngtcp2_path_536871485;
                                       pkt_info_version: cint;
                                       pi: ptr ngtcp2_pkt_info_536871386;
                                       pkt: ptr uint8; pktlen: csize_t;
                                       ts: ngtcp2_tstamp_536871396): cint {.
      cdecl, importc: "ngtcp2_conn_read_pkt_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_read_pkt_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_write_pkt_versioned):
  proc ngtcp2_conn_write_pkt_versioned*(conn: ptr ngtcp2_conn_536871519;
                                        path: ptr ngtcp2_path_536871485;
                                        pkt_info_version: cint;
                                        pi: ptr ngtcp2_pkt_info_536871386;
                                        dest: ptr uint8; destlen: csize_t;
                                        ts: ngtcp2_tstamp_536871396): ngtcp2_ssize_536871368 {.
      cdecl, importc: "ngtcp2_conn_write_pkt_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_write_pkt_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_tls_handshake_completed):
  proc ngtcp2_conn_tls_handshake_completed*(conn: ptr ngtcp2_conn_536871519): void {.
      cdecl, importc: "ngtcp2_conn_tls_handshake_completed".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_tls_handshake_completed" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_handshake_completed):
  proc ngtcp2_conn_get_handshake_completed*(conn: ptr ngtcp2_conn_536871519): cint {.
      cdecl, importc: "ngtcp2_conn_get_handshake_completed".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_handshake_completed" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_install_initial_key):
  proc ngtcp2_conn_install_initial_key*(conn: ptr ngtcp2_conn_536871519;
      rx_aead_ctx: ptr ngtcp2_crypto_aead_ctx_536871505; rx_iv: ptr uint8;
      rx_hp_ctx: ptr ngtcp2_crypto_cipher_ctx_536871509; tx_aead_ctx: ptr ngtcp2_crypto_aead_ctx_536871505;
                                        tx_iv: ptr uint8; tx_hp_ctx: ptr ngtcp2_crypto_cipher_ctx_536871509;
                                        ivlen: csize_t): cint {.cdecl,
      importc: "ngtcp2_conn_install_initial_key".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_install_initial_key" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_install_vneg_initial_key):
  proc ngtcp2_conn_install_vneg_initial_key*(conn: ptr ngtcp2_conn_536871519;
      version: uint32; rx_aead_ctx: ptr ngtcp2_crypto_aead_ctx_536871505;
      rx_iv: ptr uint8; rx_hp_ctx: ptr ngtcp2_crypto_cipher_ctx_536871509;
      tx_aead_ctx: ptr ngtcp2_crypto_aead_ctx_536871505; tx_iv: ptr uint8;
      tx_hp_ctx: ptr ngtcp2_crypto_cipher_ctx_536871509; ivlen: csize_t): cint {.
      cdecl, importc: "ngtcp2_conn_install_vneg_initial_key".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_install_vneg_initial_key" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_install_rx_handshake_key):
  proc ngtcp2_conn_install_rx_handshake_key*(conn: ptr ngtcp2_conn_536871519;
      aead_ctx: ptr ngtcp2_crypto_aead_ctx_536871505; iv: ptr uint8;
      ivlen: csize_t; hp_ctx: ptr ngtcp2_crypto_cipher_ctx_536871509): cint {.
      cdecl, importc: "ngtcp2_conn_install_rx_handshake_key".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_install_rx_handshake_key" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_install_tx_handshake_key):
  proc ngtcp2_conn_install_tx_handshake_key*(conn: ptr ngtcp2_conn_536871519;
      aead_ctx: ptr ngtcp2_crypto_aead_ctx_536871505; iv: ptr uint8;
      ivlen: csize_t; hp_ctx: ptr ngtcp2_crypto_cipher_ctx_536871509): cint {.
      cdecl, importc: "ngtcp2_conn_install_tx_handshake_key".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_install_tx_handshake_key" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_install_0rtt_key):
  proc ngtcp2_conn_install_0rtt_key*(conn: ptr ngtcp2_conn_536871519;
                                     aead_ctx: ptr ngtcp2_crypto_aead_ctx_536871505;
                                     iv: ptr uint8; ivlen: csize_t;
                                     hp_ctx: ptr ngtcp2_crypto_cipher_ctx_536871509): cint {.
      cdecl, importc: "ngtcp2_conn_install_0rtt_key".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_install_0rtt_key" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_install_rx_key):
  proc ngtcp2_conn_install_rx_key*(conn: ptr ngtcp2_conn_536871519;
                                   secret: ptr uint8; secretlen: csize_t;
                                   aead_ctx: ptr ngtcp2_crypto_aead_ctx_536871505;
                                   iv: ptr uint8; ivlen: csize_t;
                                   hp_ctx: ptr ngtcp2_crypto_cipher_ctx_536871509): cint {.
      cdecl, importc: "ngtcp2_conn_install_rx_key".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_install_rx_key" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_install_tx_key):
  proc ngtcp2_conn_install_tx_key*(conn: ptr ngtcp2_conn_536871519;
                                   secret: ptr uint8; secretlen: csize_t;
                                   aead_ctx: ptr ngtcp2_crypto_aead_ctx_536871505;
                                   iv: ptr uint8; ivlen: csize_t;
                                   hp_ctx: ptr ngtcp2_crypto_cipher_ctx_536871509): cint {.
      cdecl, importc: "ngtcp2_conn_install_tx_key".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_install_tx_key" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_initiate_key_update):
  proc ngtcp2_conn_initiate_key_update*(conn: ptr ngtcp2_conn_536871519;
                                        ts: ngtcp2_tstamp_536871396): cint {.
      cdecl, importc: "ngtcp2_conn_initiate_key_update".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_initiate_key_update" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_tls_error):
  proc ngtcp2_conn_set_tls_error*(conn: ptr ngtcp2_conn_536871519; liberr: cint): void {.
      cdecl, importc: "ngtcp2_conn_set_tls_error".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_tls_error" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_tls_error):
  proc ngtcp2_conn_get_tls_error*(conn: ptr ngtcp2_conn_536871519): cint {.
      cdecl, importc: "ngtcp2_conn_get_tls_error".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_tls_error" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_tls_alert):
  proc ngtcp2_conn_set_tls_alert*(conn: ptr ngtcp2_conn_536871519; alert: uint8): void {.
      cdecl, importc: "ngtcp2_conn_set_tls_alert".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_tls_alert" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_tls_alert):
  proc ngtcp2_conn_get_tls_alert*(conn: ptr ngtcp2_conn_536871519): uint8 {.
      cdecl, importc: "ngtcp2_conn_get_tls_alert".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_tls_alert" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_keep_alive_timeout):
  proc ngtcp2_conn_set_keep_alive_timeout*(conn: ptr ngtcp2_conn_536871519;
      timeout: ngtcp2_duration_536871398): void {.cdecl,
      importc: "ngtcp2_conn_set_keep_alive_timeout".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_keep_alive_timeout" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_expiry):
  proc ngtcp2_conn_get_expiry*(conn: ptr ngtcp2_conn_536871519): ngtcp2_tstamp_536871396 {.
      cdecl, importc: "ngtcp2_conn_get_expiry".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_expiry" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_handle_expiry):
  proc ngtcp2_conn_handle_expiry*(conn: ptr ngtcp2_conn_536871519;
                                  ts: ngtcp2_tstamp_536871396): cint {.cdecl,
      importc: "ngtcp2_conn_handle_expiry".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_handle_expiry" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_pto):
  proc ngtcp2_conn_get_pto*(conn: ptr ngtcp2_conn_536871519): ngtcp2_duration_536871398 {.
      cdecl, importc: "ngtcp2_conn_get_pto".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_pto" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_decode_and_set_remote_transport_params):
  proc ngtcp2_conn_decode_and_set_remote_transport_params*(
      conn: ptr ngtcp2_conn_536871519; data: ptr uint8; datalen: csize_t): cint {.
      cdecl, importc: "ngtcp2_conn_decode_and_set_remote_transport_params".}
else:
  static :
    hint("Declaration of " &
        "ngtcp2_conn_decode_and_set_remote_transport_params" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_remote_transport_params):
  proc ngtcp2_conn_get_remote_transport_params*(conn: ptr ngtcp2_conn_536871519): ptr ngtcp2_transport_params_536871446 {.
      cdecl, importc: "ngtcp2_conn_get_remote_transport_params".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_remote_transport_params" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_encode_0rtt_transport_params):
  proc ngtcp2_conn_encode_0rtt_transport_params*(conn: ptr ngtcp2_conn_536871519;
      dest: ptr uint8; destlen: csize_t): ngtcp2_ssize_536871368 {.cdecl,
      importc: "ngtcp2_conn_encode_0rtt_transport_params".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_encode_0rtt_transport_params" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_decode_and_set_0rtt_transport_params):
  proc ngtcp2_conn_decode_and_set_0rtt_transport_params*(conn: ptr ngtcp2_conn_536871519;
      data: ptr uint8; datalen: csize_t): cint {.cdecl,
      importc: "ngtcp2_conn_decode_and_set_0rtt_transport_params".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_decode_and_set_0rtt_transport_params" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_local_transport_params_versioned):
  proc ngtcp2_conn_set_local_transport_params_versioned*(conn: ptr ngtcp2_conn_536871519;
      transport_params_version: cint; params: ptr ngtcp2_transport_params_536871446): cint {.
      cdecl, importc: "ngtcp2_conn_set_local_transport_params_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_local_transport_params_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_local_transport_params):
  proc ngtcp2_conn_get_local_transport_params*(conn: ptr ngtcp2_conn_536871519): ptr ngtcp2_transport_params_536871446 {.
      cdecl, importc: "ngtcp2_conn_get_local_transport_params".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_local_transport_params" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_encode_local_transport_params):
  proc ngtcp2_conn_encode_local_transport_params*(conn: ptr ngtcp2_conn_536871519;
      dest: ptr uint8; destlen: csize_t): ngtcp2_ssize_536871368 {.cdecl,
      importc: "ngtcp2_conn_encode_local_transport_params".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_encode_local_transport_params" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_open_bidi_stream):
  proc ngtcp2_conn_open_bidi_stream*(conn: ptr ngtcp2_conn_536871519;
                                     pstream_id: ptr int64;
                                     stream_user_data: pointer): cint {.cdecl,
      importc: "ngtcp2_conn_open_bidi_stream".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_open_bidi_stream" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_open_uni_stream):
  proc ngtcp2_conn_open_uni_stream*(conn: ptr ngtcp2_conn_536871519;
                                    pstream_id: ptr int64;
                                    stream_user_data: pointer): cint {.cdecl,
      importc: "ngtcp2_conn_open_uni_stream".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_open_uni_stream" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_shutdown_stream):
  proc ngtcp2_conn_shutdown_stream*(conn: ptr ngtcp2_conn_536871519;
                                    flags: uint32; stream_id: int64;
                                    app_error_code: uint64): cint {.cdecl,
      importc: "ngtcp2_conn_shutdown_stream".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_shutdown_stream" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_shutdown_stream_write):
  proc ngtcp2_conn_shutdown_stream_write*(conn: ptr ngtcp2_conn_536871519;
      flags: uint32; stream_id: int64; app_error_code: uint64): cint {.cdecl,
      importc: "ngtcp2_conn_shutdown_stream_write".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_shutdown_stream_write" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_shutdown_stream_read):
  proc ngtcp2_conn_shutdown_stream_read*(conn: ptr ngtcp2_conn_536871519;
      flags: uint32; stream_id: int64; app_error_code: uint64): cint {.cdecl,
      importc: "ngtcp2_conn_shutdown_stream_read".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_shutdown_stream_read" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_write_stream_versioned):
  proc ngtcp2_conn_write_stream_versioned*(conn: ptr ngtcp2_conn_536871519;
      path: ptr ngtcp2_path_536871485; pkt_info_version: cint;
      pi: ptr ngtcp2_pkt_info_536871386; dest: ptr uint8; destlen: csize_t;
      pdatalen: ptr ngtcp2_ssize_536871368; flags: uint32; stream_id: int64;
      data: ptr uint8; datalen: csize_t; ts: ngtcp2_tstamp_536871396): ngtcp2_ssize_536871368 {.
      cdecl, importc: "ngtcp2_conn_write_stream_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_write_stream_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_writev_stream_versioned):
  proc ngtcp2_conn_writev_stream_versioned*(conn: ptr ngtcp2_conn_536871519;
      path: ptr ngtcp2_path_536871485; pkt_info_version: cint;
      pi: ptr ngtcp2_pkt_info_536871386; dest: ptr uint8; destlen: csize_t;
      pdatalen: ptr ngtcp2_ssize_536871368; flags: uint32; stream_id: int64;
      datav: ptr ngtcp2_vec_536871406; datavcnt: csize_t; ts: ngtcp2_tstamp_536871396): ngtcp2_ssize_536871368 {.
      cdecl, importc: "ngtcp2_conn_writev_stream_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_writev_stream_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_write_datagram_versioned):
  proc ngtcp2_conn_write_datagram_versioned*(conn: ptr ngtcp2_conn_536871519;
      path: ptr ngtcp2_path_536871485; pkt_info_version: cint;
      pi: ptr ngtcp2_pkt_info_536871386; dest: ptr uint8; destlen: csize_t;
      paccepted: ptr cint; flags: uint32; dgram_id: uint64; data: ptr uint8;
      datalen: csize_t; ts: ngtcp2_tstamp_536871396): ngtcp2_ssize_536871368 {.
      cdecl, importc: "ngtcp2_conn_write_datagram_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_write_datagram_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_writev_datagram_versioned):
  proc ngtcp2_conn_writev_datagram_versioned*(conn: ptr ngtcp2_conn_536871519;
      path: ptr ngtcp2_path_536871485; pkt_info_version: cint;
      pi: ptr ngtcp2_pkt_info_536871386; dest: ptr uint8; destlen: csize_t;
      paccepted: ptr cint; flags: uint32; dgram_id: uint64;
      datav: ptr ngtcp2_vec_536871406; datavcnt: csize_t; ts: ngtcp2_tstamp_536871396): ngtcp2_ssize_536871368 {.
      cdecl, importc: "ngtcp2_conn_writev_datagram_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_writev_datagram_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_in_closing_period):
  proc ngtcp2_conn_in_closing_period*(conn: ptr ngtcp2_conn_536871519): cint {.
      cdecl, importc: "ngtcp2_conn_in_closing_period".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_in_closing_period" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_in_draining_period):
  proc ngtcp2_conn_in_draining_period*(conn: ptr ngtcp2_conn_536871519): cint {.
      cdecl, importc: "ngtcp2_conn_in_draining_period".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_in_draining_period" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_extend_max_stream_offset):
  proc ngtcp2_conn_extend_max_stream_offset*(conn: ptr ngtcp2_conn_536871519;
      stream_id: int64; datalen: uint64): cint {.cdecl,
      importc: "ngtcp2_conn_extend_max_stream_offset".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_extend_max_stream_offset" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_extend_max_offset):
  proc ngtcp2_conn_extend_max_offset*(conn: ptr ngtcp2_conn_536871519;
                                      datalen: uint64): void {.cdecl,
      importc: "ngtcp2_conn_extend_max_offset".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_extend_max_offset" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_extend_max_streams_bidi):
  proc ngtcp2_conn_extend_max_streams_bidi*(conn: ptr ngtcp2_conn_536871519;
      n: csize_t): void {.cdecl, importc: "ngtcp2_conn_extend_max_streams_bidi".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_extend_max_streams_bidi" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_extend_max_streams_uni):
  proc ngtcp2_conn_extend_max_streams_uni*(conn: ptr ngtcp2_conn_536871519;
      n: csize_t): void {.cdecl, importc: "ngtcp2_conn_extend_max_streams_uni".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_extend_max_streams_uni" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_dcid):
  proc ngtcp2_conn_get_dcid*(conn: ptr ngtcp2_conn_536871519): ptr ngtcp2_cid_536871402 {.
      cdecl, importc: "ngtcp2_conn_get_dcid".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_dcid" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_client_initial_dcid):
  proc ngtcp2_conn_get_client_initial_dcid*(conn: ptr ngtcp2_conn_536871519): ptr ngtcp2_cid_536871402 {.
      cdecl, importc: "ngtcp2_conn_get_client_initial_dcid".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_client_initial_dcid" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_scid):
  proc ngtcp2_conn_get_scid*(conn: ptr ngtcp2_conn_536871519;
                             dest: ptr ngtcp2_cid_536871402): csize_t {.cdecl,
      importc: "ngtcp2_conn_get_scid".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_scid" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_active_dcid):
  proc ngtcp2_conn_get_active_dcid*(conn: ptr ngtcp2_conn_536871519;
                                    dest: ptr ngtcp2_cid_token_536871607): csize_t {.
      cdecl, importc: "ngtcp2_conn_get_active_dcid".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_active_dcid" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_client_chosen_version):
  proc ngtcp2_conn_get_client_chosen_version*(conn: ptr ngtcp2_conn_536871519): uint32 {.
      cdecl, importc: "ngtcp2_conn_get_client_chosen_version".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_client_chosen_version" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_negotiated_version):
  proc ngtcp2_conn_get_negotiated_version*(conn: ptr ngtcp2_conn_536871519): uint32 {.
      cdecl, importc: "ngtcp2_conn_get_negotiated_version".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_negotiated_version" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_tls_early_data_rejected):
  proc ngtcp2_conn_tls_early_data_rejected*(conn: ptr ngtcp2_conn_536871519): cint {.
      cdecl, importc: "ngtcp2_conn_tls_early_data_rejected".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_tls_early_data_rejected" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_tls_early_data_rejected):
  proc ngtcp2_conn_get_tls_early_data_rejected*(conn: ptr ngtcp2_conn_536871519): cint {.
      cdecl, importc: "ngtcp2_conn_get_tls_early_data_rejected".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_tls_early_data_rejected" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_conn_info_versioned):
  proc ngtcp2_conn_get_conn_info_versioned*(conn: ptr ngtcp2_conn_536871519;
      conn_info_version: cint; cinfo: ptr ngtcp2_conn_info_536871450): void {.
      cdecl, importc: "ngtcp2_conn_get_conn_info_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_conn_info_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_submit_crypto_data):
  proc ngtcp2_conn_submit_crypto_data*(conn: ptr ngtcp2_conn_536871519;
      encryption_level: ngtcp2_encryption_level_536871527; data: ptr uint8;
                                       datalen: csize_t): cint {.cdecl,
      importc: "ngtcp2_conn_submit_crypto_data".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_submit_crypto_data" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_submit_new_token):
  proc ngtcp2_conn_submit_new_token*(conn: ptr ngtcp2_conn_536871519;
                                     token: ptr uint8; tokenlen: csize_t): cint {.
      cdecl, importc: "ngtcp2_conn_submit_new_token".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_submit_new_token" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_local_addr):
  proc ngtcp2_conn_set_local_addr*(conn: ptr ngtcp2_conn_536871519;
                                   addr_arg: ptr ngtcp2_addr_536871481): void {.
      cdecl, importc: "ngtcp2_conn_set_local_addr".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_local_addr" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_path_user_data):
  proc ngtcp2_conn_set_path_user_data*(conn: ptr ngtcp2_conn_536871519;
                                       path_user_data: pointer): void {.cdecl,
      importc: "ngtcp2_conn_set_path_user_data".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_path_user_data" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_path):
  proc ngtcp2_conn_get_path*(conn: ptr ngtcp2_conn_536871519): ptr ngtcp2_path_536871485 {.
      cdecl, importc: "ngtcp2_conn_get_path".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_path" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_max_tx_udp_payload_size):
  proc ngtcp2_conn_get_max_tx_udp_payload_size*(conn: ptr ngtcp2_conn_536871519): csize_t {.
      cdecl, importc: "ngtcp2_conn_get_max_tx_udp_payload_size".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_max_tx_udp_payload_size" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_path_max_tx_udp_payload_size):
  proc ngtcp2_conn_get_path_max_tx_udp_payload_size*(conn: ptr ngtcp2_conn_536871519): csize_t {.
      cdecl, importc: "ngtcp2_conn_get_path_max_tx_udp_payload_size".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_path_max_tx_udp_payload_size" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_initiate_immediate_migration):
  proc ngtcp2_conn_initiate_immediate_migration*(conn: ptr ngtcp2_conn_536871519;
      path: ptr ngtcp2_path_536871485; ts: ngtcp2_tstamp_536871396): cint {.
      cdecl, importc: "ngtcp2_conn_initiate_immediate_migration".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_initiate_immediate_migration" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_initiate_migration):
  proc ngtcp2_conn_initiate_migration*(conn: ptr ngtcp2_conn_536871519;
                                       path: ptr ngtcp2_path_536871485;
                                       ts: ngtcp2_tstamp_536871396): cint {.
      cdecl, importc: "ngtcp2_conn_initiate_migration".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_initiate_migration" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_max_data_left):
  proc ngtcp2_conn_get_max_data_left*(conn: ptr ngtcp2_conn_536871519): uint64 {.
      cdecl, importc: "ngtcp2_conn_get_max_data_left".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_max_data_left" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_max_stream_data_left):
  proc ngtcp2_conn_get_max_stream_data_left*(conn: ptr ngtcp2_conn_536871519;
      stream_id: int64): uint64 {.cdecl, importc: "ngtcp2_conn_get_max_stream_data_left".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_max_stream_data_left" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_streams_bidi_left):
  proc ngtcp2_conn_get_streams_bidi_left*(conn: ptr ngtcp2_conn_536871519): uint64 {.
      cdecl, importc: "ngtcp2_conn_get_streams_bidi_left".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_streams_bidi_left" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_streams_uni_left):
  proc ngtcp2_conn_get_streams_uni_left*(conn: ptr ngtcp2_conn_536871519): uint64 {.
      cdecl, importc: "ngtcp2_conn_get_streams_uni_left".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_streams_uni_left" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_cwnd_left):
  proc ngtcp2_conn_get_cwnd_left*(conn: ptr ngtcp2_conn_536871519): uint64 {.
      cdecl, importc: "ngtcp2_conn_get_cwnd_left".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_cwnd_left" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_initial_crypto_ctx):
  proc ngtcp2_conn_set_initial_crypto_ctx*(conn: ptr ngtcp2_conn_536871519;
      ctx: ptr ngtcp2_crypto_ctx_536871513): void {.cdecl,
      importc: "ngtcp2_conn_set_initial_crypto_ctx".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_initial_crypto_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_initial_crypto_ctx):
  proc ngtcp2_conn_get_initial_crypto_ctx*(conn: ptr ngtcp2_conn_536871519): ptr ngtcp2_crypto_ctx_536871513 {.
      cdecl, importc: "ngtcp2_conn_get_initial_crypto_ctx".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_initial_crypto_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_crypto_ctx):
  proc ngtcp2_conn_set_crypto_ctx*(conn: ptr ngtcp2_conn_536871519;
                                   ctx: ptr ngtcp2_crypto_ctx_536871513): void {.
      cdecl, importc: "ngtcp2_conn_set_crypto_ctx".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_crypto_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_crypto_ctx):
  proc ngtcp2_conn_get_crypto_ctx*(conn: ptr ngtcp2_conn_536871519): ptr ngtcp2_crypto_ctx_536871513 {.
      cdecl, importc: "ngtcp2_conn_get_crypto_ctx".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_crypto_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_0rtt_crypto_ctx):
  proc ngtcp2_conn_set_0rtt_crypto_ctx*(conn: ptr ngtcp2_conn_536871519;
                                        ctx: ptr ngtcp2_crypto_ctx_536871513): void {.
      cdecl, importc: "ngtcp2_conn_set_0rtt_crypto_ctx".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_0rtt_crypto_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_0rtt_crypto_ctx):
  proc ngtcp2_conn_get_0rtt_crypto_ctx*(conn: ptr ngtcp2_conn_536871519): ptr ngtcp2_crypto_ctx_536871513 {.
      cdecl, importc: "ngtcp2_conn_get_0rtt_crypto_ctx".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_0rtt_crypto_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_tls_native_handle):
  proc ngtcp2_conn_get_tls_native_handle*(conn: ptr ngtcp2_conn_536871519): pointer {.
      cdecl, importc: "ngtcp2_conn_get_tls_native_handle".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_tls_native_handle" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_tls_native_handle):
  proc ngtcp2_conn_set_tls_native_handle*(conn: ptr ngtcp2_conn_536871519;
      tls_native_handle: pointer): void {.cdecl,
      importc: "ngtcp2_conn_set_tls_native_handle".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_tls_native_handle" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_retry_aead):
  proc ngtcp2_conn_set_retry_aead*(conn: ptr ngtcp2_conn_536871519;
                                   aead: ptr ngtcp2_crypto_aead_536871497;
                                   aead_ctx: ptr ngtcp2_crypto_aead_ctx_536871505): void {.
      cdecl, importc: "ngtcp2_conn_set_retry_aead".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_retry_aead" &
        " already exists, not redeclaring")
when not declared(ngtcp2_ccerr_default):
  proc ngtcp2_ccerr_default*(ccerr: ptr ngtcp2_ccerr_536871615): void {.cdecl,
      importc: "ngtcp2_ccerr_default".}
else:
  static :
    hint("Declaration of " & "ngtcp2_ccerr_default" &
        " already exists, not redeclaring")
when not declared(ngtcp2_ccerr_set_transport_error):
  proc ngtcp2_ccerr_set_transport_error*(ccerr: ptr ngtcp2_ccerr_536871615;
      error_code: uint64; reason: ptr uint8; reasonlen: csize_t): void {.cdecl,
      importc: "ngtcp2_ccerr_set_transport_error".}
else:
  static :
    hint("Declaration of " & "ngtcp2_ccerr_set_transport_error" &
        " already exists, not redeclaring")
when not declared(ngtcp2_ccerr_set_liberr):
  proc ngtcp2_ccerr_set_liberr*(ccerr: ptr ngtcp2_ccerr_536871615; liberr: cint;
                                reason: ptr uint8; reasonlen: csize_t): void {.
      cdecl, importc: "ngtcp2_ccerr_set_liberr".}
else:
  static :
    hint("Declaration of " & "ngtcp2_ccerr_set_liberr" &
        " already exists, not redeclaring")
when not declared(ngtcp2_ccerr_set_tls_alert):
  proc ngtcp2_ccerr_set_tls_alert*(ccerr: ptr ngtcp2_ccerr_536871615;
                                   tls_alert: uint8; reason: ptr uint8;
                                   reasonlen: csize_t): void {.cdecl,
      importc: "ngtcp2_ccerr_set_tls_alert".}
else:
  static :
    hint("Declaration of " & "ngtcp2_ccerr_set_tls_alert" &
        " already exists, not redeclaring")
when not declared(ngtcp2_ccerr_set_application_error):
  proc ngtcp2_ccerr_set_application_error*(ccerr: ptr ngtcp2_ccerr_536871615;
      error_code: uint64; reason: ptr uint8; reasonlen: csize_t): void {.cdecl,
      importc: "ngtcp2_ccerr_set_application_error".}
else:
  static :
    hint("Declaration of " & "ngtcp2_ccerr_set_application_error" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_write_connection_close_versioned):
  proc ngtcp2_conn_write_connection_close_versioned*(conn: ptr ngtcp2_conn_536871519;
      path: ptr ngtcp2_path_536871485; pkt_info_version: cint;
      pi: ptr ngtcp2_pkt_info_536871386; dest: ptr uint8; destlen: csize_t;
      ccerr: ptr ngtcp2_ccerr_536871615; ts: ngtcp2_tstamp_536871396): ngtcp2_ssize_536871368 {.
      cdecl, importc: "ngtcp2_conn_write_connection_close_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_write_connection_close_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_ccerr):
  proc ngtcp2_conn_get_ccerr*(conn: ptr ngtcp2_conn_536871519): ptr ngtcp2_ccerr_536871615 {.
      cdecl, importc: "ngtcp2_conn_get_ccerr".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_ccerr" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_is_local_stream):
  proc ngtcp2_conn_is_local_stream*(conn: ptr ngtcp2_conn_536871519;
                                    stream_id: int64): cint {.cdecl,
      importc: "ngtcp2_conn_is_local_stream".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_is_local_stream" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_is_server):
  proc ngtcp2_conn_is_server*(conn: ptr ngtcp2_conn_536871519): cint {.cdecl,
      importc: "ngtcp2_conn_is_server".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_is_server" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_after_retry):
  proc ngtcp2_conn_after_retry*(conn: ptr ngtcp2_conn_536871519): cint {.cdecl,
      importc: "ngtcp2_conn_after_retry".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_after_retry" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_stream_user_data):
  proc ngtcp2_conn_set_stream_user_data*(conn: ptr ngtcp2_conn_536871519;
      stream_id: int64; stream_user_data: pointer): cint {.cdecl,
      importc: "ngtcp2_conn_set_stream_user_data".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_stream_user_data" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_update_pkt_tx_time):
  proc ngtcp2_conn_update_pkt_tx_time*(conn: ptr ngtcp2_conn_536871519;
                                       ts: ngtcp2_tstamp_536871396): void {.
      cdecl, importc: "ngtcp2_conn_update_pkt_tx_time".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_update_pkt_tx_time" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_send_quantum):
  proc ngtcp2_conn_get_send_quantum*(conn: ptr ngtcp2_conn_536871519): csize_t {.
      cdecl, importc: "ngtcp2_conn_get_send_quantum".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_send_quantum" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_stream_loss_count):
  proc ngtcp2_conn_get_stream_loss_count*(conn: ptr ngtcp2_conn_536871519;
      stream_id: int64): csize_t {.cdecl,
                                   importc: "ngtcp2_conn_get_stream_loss_count".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_stream_loss_count" &
        " already exists, not redeclaring")
when not declared(ngtcp2_strerror):
  proc ngtcp2_strerror*(liberr: cint): cstring {.cdecl,
      importc: "ngtcp2_strerror".}
else:
  static :
    hint("Declaration of " & "ngtcp2_strerror" &
        " already exists, not redeclaring")
when not declared(ngtcp2_err_is_fatal):
  proc ngtcp2_err_is_fatal*(liberr: cint): cint {.cdecl,
      importc: "ngtcp2_err_is_fatal".}
else:
  static :
    hint("Declaration of " & "ngtcp2_err_is_fatal" &
        " already exists, not redeclaring")
when not declared(ngtcp2_err_infer_quic_transport_error_code):
  proc ngtcp2_err_infer_quic_transport_error_code*(liberr: cint): uint64 {.
      cdecl, importc: "ngtcp2_err_infer_quic_transport_error_code".}
else:
  static :
    hint("Declaration of " & "ngtcp2_err_infer_quic_transport_error_code" &
        " already exists, not redeclaring")
when not declared(ngtcp2_addr_init):
  proc ngtcp2_addr_init*(dest: ptr ngtcp2_addr_536871481;
                         addr_arg: ptr ngtcp2_sockaddr_536871416;
                         addrlen: ngtcp2_socklen_536871428): ptr ngtcp2_addr_536871481 {.
      cdecl, importc: "ngtcp2_addr_init".}
else:
  static :
    hint("Declaration of " & "ngtcp2_addr_init" &
        " already exists, not redeclaring")
when not declared(ngtcp2_addr_copy_byte):
  proc ngtcp2_addr_copy_byte*(dest: ptr ngtcp2_addr_536871481;
                              addr_arg: ptr ngtcp2_sockaddr_536871416;
                              addrlen: ngtcp2_socklen_536871428): void {.cdecl,
      importc: "ngtcp2_addr_copy_byte".}
else:
  static :
    hint("Declaration of " & "ngtcp2_addr_copy_byte" &
        " already exists, not redeclaring")
when not declared(ngtcp2_path_storage_init):
  proc ngtcp2_path_storage_init*(ps: ptr ngtcp2_path_storage_536871489;
                                 local_addr: ptr ngtcp2_sockaddr_536871416;
                                 local_addrlen: ngtcp2_socklen_536871428;
                                 remote_addr: ptr ngtcp2_sockaddr_536871416;
                                 remote_addrlen: ngtcp2_socklen_536871428;
                                 user_data: pointer): void {.cdecl,
      importc: "ngtcp2_path_storage_init".}
else:
  static :
    hint("Declaration of " & "ngtcp2_path_storage_init" &
        " already exists, not redeclaring")
when not declared(ngtcp2_path_storage_zero):
  proc ngtcp2_path_storage_zero*(ps: ptr ngtcp2_path_storage_536871489): void {.
      cdecl, importc: "ngtcp2_path_storage_zero".}
else:
  static :
    hint("Declaration of " & "ngtcp2_path_storage_zero" &
        " already exists, not redeclaring")
when not declared(ngtcp2_settings_default_versioned):
  proc ngtcp2_settings_default_versioned*(settings_version: cint;
      settings: ptr ngtcp2_settings_536871477): void {.cdecl,
      importc: "ngtcp2_settings_default_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_settings_default_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_transport_params_default_versioned):
  proc ngtcp2_transport_params_default_versioned*(
      transport_params_version: cint; params: ptr ngtcp2_transport_params_536871446): void {.
      cdecl, importc: "ngtcp2_transport_params_default_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_transport_params_default_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_mem_default):
  proc ngtcp2_mem_default*(): ptr ngtcp2_mem_536871382 {.cdecl,
      importc: "ngtcp2_mem_default".}
else:
  static :
    hint("Declaration of " & "ngtcp2_mem_default" &
        " already exists, not redeclaring")
when not declared(ngtcp2_version):
  proc ngtcp2_version*(least_version: cint): ptr ngtcp2_info_536871619 {.cdecl,
      importc: "ngtcp2_version".}
else:
  static :
    hint("Declaration of " & "ngtcp2_version" &
        " already exists, not redeclaring")
when not declared(ngtcp2_is_bidi_stream):
  proc ngtcp2_is_bidi_stream*(stream_id: int64): cint {.cdecl,
      importc: "ngtcp2_is_bidi_stream".}
else:
  static :
    hint("Declaration of " & "ngtcp2_is_bidi_stream" &
        " already exists, not redeclaring")
when not declared(ngtcp2_path_copy):
  proc ngtcp2_path_copy*(dest: ptr ngtcp2_path_536871485; src: ptr ngtcp2_path_536871485): void {.
      cdecl, importc: "ngtcp2_path_copy".}
else:
  static :
    hint("Declaration of " & "ngtcp2_path_copy" &
        " already exists, not redeclaring")
when not declared(ngtcp2_path_eq):
  proc ngtcp2_path_eq*(a: ptr ngtcp2_path_536871485; b: ptr ngtcp2_path_536871485): cint {.
      cdecl, importc: "ngtcp2_path_eq".}
else:
  static :
    hint("Declaration of " & "ngtcp2_path_eq" &
        " already exists, not redeclaring")
when not declared(ngtcp2_is_supported_version):
  proc ngtcp2_is_supported_version*(version: uint32): cint {.cdecl,
      importc: "ngtcp2_is_supported_version".}
else:
  static :
    hint("Declaration of " & "ngtcp2_is_supported_version" &
        " already exists, not redeclaring")
when not declared(ngtcp2_is_reserved_version):
  proc ngtcp2_is_reserved_version*(version: uint32): cint {.cdecl,
      importc: "ngtcp2_is_reserved_version".}
else:
  static :
    hint("Declaration of " & "ngtcp2_is_reserved_version" &
        " already exists, not redeclaring")
when not declared(ngtcp2_select_version):
  proc ngtcp2_select_version*(preferred_versions: ptr uint32;
                              preferred_versionslen: csize_t;
                              offered_versions: ptr uint32;
                              offered_versionslen: csize_t): uint32 {.cdecl,
      importc: "ngtcp2_select_version".}
else:
  static :
    hint("Declaration of " & "ngtcp2_select_version" &
        " already exists, not redeclaring")
when not declared(PF_INET):
  when 2 is static:
    const
      PF_INET* = 2           ## Generated based on /usr/include/x86_64-linux-gnu/bits/socket.h:45:9
  else:
    let PF_INET* = 2         ## Generated based on /usr/include/x86_64-linux-gnu/bits/socket.h:45:9
else:
  static :
    hint("Declaration of " & "PF_INET" & " already exists, not redeclaring")
when not declared(PF_INET6):
  when 10 is static:
    const
      PF_INET6* = 10         ## Generated based on /usr/include/x86_64-linux-gnu/bits/socket.h:53:9
  else:
    let PF_INET6* = 10       ## Generated based on /usr/include/x86_64-linux-gnu/bits/socket.h:53:9
else:
  static :
    hint("Declaration of " & "PF_INET6" & " already exists, not redeclaring")