import os
import strformat

# Socket definitions
import nativesockets

{.passc: "-DNGTCP2_STATICLIB".}

when defined(windows):
  {.passl: "-lws2_32".}
  {.passc: "-D_WINDOWS".}
  {.passc: "-D__CRT__NO_INLINE".}
else:
  {.passc: "-DHAVE_UNISTD_H".}

when defined(macosx):
  {.passl: "-L/opt/homebrew/opt/openssl@3/lib -lcrypto".}
  {.passc: "-I/opt/homebrew/opt/openssl@3/include".}
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

# QuicTLS/OpenSSL crypto support
{.passc: "-DNGTCP2_CRYPTO_QUICTLS".}
{.passc: "-I/usr/include/openssl".}

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
{.compile: "./build/lib/cred_buffer.c".}
{.compile: "./build/lib/pem_utils.c".}

{.warning[UnusedImport]: off.}
{.hint[XDeclaredButNotUsed]: off.}
from macros import hint, warning, newLit, getSize

from os import parentDir

when not declared(ownSizeOf):
  macro ownSizeof(x: typed): untyped =
    newLit(x.getSize)

type
  enum_ngtcp2_pkt_type_553648605* {.size: sizeof(cuint).} = enum
    NGTCP2_PKT_INITIAL = 16, NGTCP2_PKT_0RTT = 17, NGTCP2_PKT_HANDSHAKE = 18,
    NGTCP2_PKT_RETRY = 19, NGTCP2_PKT_1RTT = 64,
    NGTCP2_PKT_VERSION_NEGOTIATION = 128, NGTCP2_PKT_STATELESS_RESET = 129
type
  enum_ngtcp2_path_validation_result_553648609* {.size: sizeof(cuint).} = enum
    NGTCP2_PATH_VALIDATION_RESULT_SUCCESS = 0,
    NGTCP2_PATH_VALIDATION_RESULT_FAILURE = 1,
    NGTCP2_PATH_VALIDATION_RESULT_ABORTED = 2
type
  enum_ngtcp2_cc_algo_553648676* {.size: sizeof(cuint).} = enum
    NGTCP2_CC_ALGO_RENO = 0, NGTCP2_CC_ALGO_CUBIC = 1, NGTCP2_CC_ALGO_BBR = 2
type
  enum_ngtcp2_token_type_553648688* {.size: sizeof(cuint).} = enum
    NGTCP2_TOKEN_TYPE_UNKNOWN = 0, NGTCP2_TOKEN_TYPE_RETRY = 1,
    NGTCP2_TOKEN_TYPE_NEW_TOKEN = 2
type
  enum_ngtcp2_encryption_level_553648742* {.size: sizeof(cuint).} = enum
    NGTCP2_ENCRYPTION_LEVEL_INITIAL = 0, NGTCP2_ENCRYPTION_LEVEL_HANDSHAKE = 1,
    NGTCP2_ENCRYPTION_LEVEL_1RTT = 2, NGTCP2_ENCRYPTION_LEVEL_0RTT = 3
type
  enum_ngtcp2_connection_id_status_type_553648790* {.size: sizeof(cuint).} = enum
    NGTCP2_CONNECTION_ID_STATUS_TYPE_ACTIVATE = 0,
    NGTCP2_CONNECTION_ID_STATUS_TYPE_DEACTIVATE = 1
type
  enum_ngtcp2_ccerr_type_553648826* {.size: sizeof(cuint).} = enum
    NGTCP2_CCERR_TYPE_TRANSPORT = 0, NGTCP2_CCERR_TYPE_APPLICATION = 1,
    NGTCP2_CCERR_TYPE_VERSION_NEGOTIATION = 2, NGTCP2_CCERR_TYPE_IDLE_CLOSE = 3,
    NGTCP2_CCERR_TYPE_DROP_CONN = 4, NGTCP2_CCERR_TYPE_RETRY = 5
type
  enum_en_ptls_hash_final_mode_t_553648890* {.size: sizeof(cuint).} = enum
    PTLS_HASH_FINAL_MODE_FREE = 0, PTLS_HASH_FINAL_MODE_RESET = 1,
    PTLS_HASH_FINAL_MODE_SNAPSHOT = 2
type
  enum_en_ptls_early_data_acceptance_t_553648992* {.size: sizeof(cuint).} = enum
    PTLS_EARLY_DATA_ACCEPTANCE_UNKNOWN = 0, PTLS_EARLY_DATA_REJECTED = 1,
    PTLS_EARLY_DATA_ACCEPTED = 2
when not declared(struct_st_ptls_t):
  type
    struct_st_ptls_t* = object
else:
  static :
    hint("Declaration of " & "struct_st_ptls_t" &
        " already exists, not redeclaring")
when not declared(compiler_thread):
  type
    compiler_thread* = object
else:
  static :
    hint("Declaration of " & "compiler_thread" &
        " already exists, not redeclaring")
when not declared(struct_evp_pkey_st):
  type
    struct_evp_pkey_st* = object
else:
  static :
    hint("Declaration of " & "struct_evp_pkey_st" &
        " already exists, not redeclaring")
when not declared(struct_hmac_ctx_st):
  type
    struct_hmac_ctx_st* = object
else:
  static :
    hint("Declaration of " & "struct_hmac_ctx_st" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_key_schedule_t):
  type
    struct_st_ptls_key_schedule_t* = object
else:
  static :
    hint("Declaration of " & "struct_st_ptls_key_schedule_t" &
        " already exists, not redeclaring")
when not declared(struct_evp_cipher_ctx_st):
  type
    struct_evp_cipher_ctx_st* = object
else:
  static :
    hint("Declaration of " & "struct_evp_cipher_ctx_st" &
        " already exists, not redeclaring")
when not declared(struct_x509_st):
  type
    struct_x509_st* = object
else:
  static :
    hint("Declaration of " & "struct_x509_st" &
        " already exists, not redeclaring")
when not declared(struct_x509_store_st):
  type
    struct_x509_store_st* = object
else:
  static :
    hint("Declaration of " & "struct_x509_store_st" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_traffic_protection_t):
  type
    struct_st_ptls_traffic_protection_t* = object
else:
  static :
    hint("Declaration of " & "struct_st_ptls_traffic_protection_t" &
        " already exists, not redeclaring")
when not declared(struct_evp_md_st):
  type
    struct_evp_md_st* = object
else:
  static :
    hint("Declaration of " & "struct_evp_md_st" &
        " already exists, not redeclaring")
when not declared(struct_stack_st_X509):
  type
    struct_stack_st_X509* = object
else:
  static :
    hint("Declaration of " & "struct_stack_st_X509" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PROTO_VER_V1):
  type
    NGTCP2_PROTO_VER_V1* = object
else:
  static :
    hint("Declaration of " & "NGTCP2_PROTO_VER_V1" &
        " already exists, not redeclaring")
when not declared(struct_evp_mac_ctx_st):
  type
    struct_evp_mac_ctx_st* = object
else:
  static :
    hint("Declaration of " & "struct_evp_mac_ctx_st" &
        " already exists, not redeclaring")
when not declared(UINT64_MAX):
  type
    UINT64_MAX* = object
else:
  static :
    hint("Declaration of " & "UINT64_MAX" & " already exists, not redeclaring")
when not declared(struct_ngtcp2_conn):
  type
    struct_ngtcp2_conn* = object
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_conn" &
        " already exists, not redeclaring")
type
  ngtcp2_ssize_553648585 = ptrdiff_t_553648588 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:98:19
  ptrdiff_t_553648587 = clong ## Generated based on /usr/include/clang/18.1.3/include/__stddef_ptrdiff_t.h:18:26
  ngtcp2_malloc_553648589 = proc (a0: csize_t; a1: pointer): pointer {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:107:17
  ngtcp2_free_553648591 = proc (a0: pointer; a1: pointer): void {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:116:16
  ngtcp2_calloc_553648593 = proc (a0: csize_t; a1: csize_t; a2: pointer): pointer {.
      cdecl.}                ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:125:17
  ngtcp2_realloc_553648595 = proc (a0: pointer; a1: csize_t; a2: pointer): pointer {.
      cdecl.}                ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:134:17
  struct_ngtcp2_mem_553648597 {.pure, inheritable, bycopy.} = object
    user_data*: pointer      ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:180:16
    malloc*: ngtcp2_malloc_553648590
    free*: ngtcp2_free_553648592
    calloc*: ngtcp2_calloc_553648594
    realloc*: ngtcp2_realloc_553648596
  ngtcp2_mem_553648599 = struct_ngtcp2_mem_553648598 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:206:3
  struct_ngtcp2_pkt_info_553648601 {.pure, inheritable, bycopy.} = object
    ecn* {.align(8'i64).}: uint8 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:481:32
  ngtcp2_pkt_info_553648603 = struct_ngtcp2_pkt_info_553648602 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:489:3
  ngtcp2_pkt_type_553648607 = enum_ngtcp2_pkt_type_553648606 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:855:3
  ngtcp2_path_validation_result_553648611 = enum_ngtcp2_path_validation_result_553648610 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1036:3
  ngtcp2_tstamp_553648613 = uint64 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1045:18
  ngtcp2_duration_553648615 = uint64 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1054:18
  struct_ngtcp2_cid_553648617 {.pure, inheritable, bycopy.} = object
    datalen*: csize_t        ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1061:16
    data*: array[20'i64, uint8]
  ngtcp2_cid_553648619 = struct_ngtcp2_cid_553648618 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1070:3
  struct_ngtcp2_vec_553648621 {.pure, inheritable, bycopy.} = object
    base*: ptr uint8         ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1078:16
    len*: csize_t
  ngtcp2_vec_553648623 = struct_ngtcp2_vec_553648622 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1088:3
  struct_ngtcp2_pkt_hd_553648625 {.pure, inheritable, bycopy.} = object
    dcid*: ngtcp2_cid_553648620 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1113:16
    scid*: ngtcp2_cid_553648620
    pkt_num*: int64
    token*: ptr uint8
    tokenlen*: csize_t
    pkt_numlen*: csize_t
    len*: csize_t
    version*: uint32
    type_field*: uint8
    flags*: uint8
  ngtcp2_pkt_hd_553648627 = struct_ngtcp2_pkt_hd_553648626 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1162:3
  struct_ngtcp2_pkt_stateless_reset_553648629 {.pure, inheritable, bycopy.} = object
    stateless_reset_token*: array[16'i64, uint8] ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1169:16
    rand*: ptr uint8
    randlen*: csize_t
  ngtcp2_pkt_stateless_reset_553648631 = struct_ngtcp2_pkt_stateless_reset_553648630 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1183:3
  ngtcp2_sockaddr_553648633 = struct_sockaddr_553648636 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1285:25
  struct_sockaddr_553648635 {.pure, inheritable, bycopy.} = object
    sa_family*: sa_family_t_553649057 ## Generated based on /usr/include/x86_64-linux-gnu/bits/socket.h:183:8
    sa_data*: array[14'i64, cschar]
  ngtcp2_sockaddr_in_553648637 = struct_sockaddr_in_553648640 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1293:28
  struct_sockaddr_in_553648639 {.pure, inheritable, bycopy.} = object
    sin_family*: sa_family_t_553649057 ## Generated based on /usr/include/netinet/in.h:247:8
    sin_port*: in_port_t_553649059
    sin_addr*: struct_in_addr_553649013
    sin_zero*: array[8'i64, uint8]
  ngtcp2_sockaddr_in6_553648641 = struct_sockaddr_in6_553648644 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1301:29
  struct_sockaddr_in6_553648643 {.pure, inheritable, bycopy.} = object
    sin6_family*: sa_family_t_553649057 ## Generated based on /usr/include/netinet/in.h:262:8
    sin6_port*: in_port_t_553649059
    sin6_flowinfo*: uint32
    sin6_addr*: struct_in6_addr_553649007
    sin6_scope_id*: uint32
  ngtcp2_socklen_553648645 = socklen_t_553648648 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1309:19
  socklen_t_553648647 = compiler_socklen_t_553649061 ## Generated based on /usr/include/x86_64-linux-gnu/bits/socket.h:33:21
  union_ngtcp2_sockaddr_union_553648649 {.union, bycopy.} = object
    sa*: ngtcp2_sockaddr_553648634 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1318:15
    in_field*: ngtcp2_sockaddr_in_553648638
    in6*: ngtcp2_sockaddr_in6_553648642
  ngtcp2_sockaddr_union_553648651 = union_ngtcp2_sockaddr_union_553648650 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1322:3
  struct_ngtcp2_preferred_addr_553648653 {.pure, inheritable, bycopy.} = object
    cid*: ngtcp2_cid_553648620 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1330:16
    ipv4*: ngtcp2_sockaddr_in_553648638
    ipv6*: ngtcp2_sockaddr_in6_553648642
    ipv4_present*: uint8
    ipv6_present*: uint8
    stateless_reset_token*: array[16'i64, uint8]
  ngtcp2_preferred_addr_553648655 = struct_ngtcp2_preferred_addr_553648654 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1357:3
  struct_ngtcp2_version_info_553648657 {.pure, inheritable, bycopy.} = object
    chosen_version*: uint32  ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1365:16
    available_versions*: ptr uint8
    available_versionslen*: csize_t
  ngtcp2_version_info_553648659 = struct_ngtcp2_version_info_553648658 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1382:3
  struct_ngtcp2_transport_params_553648661 {.pure, inheritable, bycopy.} = object
    preferred_addr*: ngtcp2_preferred_addr_553648656 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1393:16
    original_dcid*: ngtcp2_cid_553648620
    initial_scid*: ngtcp2_cid_553648620
    retry_scid*: ngtcp2_cid_553648620
    initial_max_stream_data_bidi_local*: uint64
    initial_max_stream_data_bidi_remote*: uint64
    initial_max_stream_data_uni*: uint64
    initial_max_data*: uint64
    initial_max_streams_bidi*: uint64
    initial_max_streams_uni*: uint64
    max_idle_timeout*: ngtcp2_duration_553648616
    max_udp_payload_size*: uint64
    active_connection_id_limit*: uint64
    ack_delay_exponent*: uint64
    max_ack_delay*: ngtcp2_duration_553648616
    max_datagram_frame_size*: uint64
    stateless_reset_token_present*: uint8
    disable_active_migration*: uint8
    original_dcid_present*: uint8
    initial_scid_present*: uint8
    retry_scid_present*: uint8
    preferred_addr_present*: uint8
    stateless_reset_token*: array[16'i64, uint8]
    grease_quic_bit*: uint8
    version_info*: ngtcp2_version_info_553648660
    version_info_present*: uint8
  ngtcp2_transport_params_553648663 = struct_ngtcp2_transport_params_553648662 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1553:3
  struct_ngtcp2_conn_info_553648665 {.pure, inheritable, bycopy.} = object
    latest_rtt*: ngtcp2_duration_553648616 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1563:16
    min_rtt*: ngtcp2_duration_553648616
    smoothed_rtt*: ngtcp2_duration_553648616
    rttvar*: ngtcp2_duration_553648616
    cwnd*: uint64
    ssthresh*: uint64
    bytes_in_flight*: uint64
  ngtcp2_conn_info_553648667 = struct_ngtcp2_conn_info_553648666 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1595:3
  ngtcp2_cc_algo_553648678 = enum_ngtcp2_cc_algo_553648677 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1615:3
  ngtcp2_printf_553648680 = proc (a0: pointer; a1: cstring): void {.cdecl,
      varargs.}              ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1624:16
  struct_ngtcp2_rand_ctx_553648682 {.pure, inheritable, bycopy.} = object
    native_handle*: pointer  ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1654:16
  ngtcp2_rand_ctx_553648684 = struct_ngtcp2_rand_ctx_553648683 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1660:3
  ngtcp2_qlog_write_553648686 = proc (a0: pointer; a1: uint32; a2: pointer;
                                      a3: csize_t): void {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1671:16
  ngtcp2_token_type_553648690 = enum_ngtcp2_token_type_553648689 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1695:3
  struct_ngtcp2_settings_553648692 {.pure, inheritable, bycopy.} = object
    qlog_write*: ngtcp2_qlog_write_553648687 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1706:16
    cc_algo*: ngtcp2_cc_algo_553648679
    initial_ts*: ngtcp2_tstamp_553648614
    initial_rtt*: ngtcp2_duration_553648616
    log_printf*: ngtcp2_printf_553648681
    max_tx_udp_payload_size*: csize_t
    token*: ptr uint8
    tokenlen*: csize_t
    token_type*: ngtcp2_token_type_553648691
    rand_ctx*: ngtcp2_rand_ctx_553648685
    max_window*: uint64
    max_stream_window*: uint64
    ack_thresh*: csize_t
    no_tx_udp_payload_size_shaping*: uint8
    handshake_timeout*: ngtcp2_duration_553648616
    preferred_versions*: ptr uint32
    preferred_versionslen*: csize_t
    available_versions*: ptr uint32
    available_versionslen*: csize_t
    original_version*: uint32
    no_pmtud*: uint8
    initial_pkt_num*: uint32
    pmtud_probes*: ptr uint16
    pmtud_probeslen*: csize_t
  ngtcp2_settings_553648694 = struct_ngtcp2_settings_553648693 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1912:3
  struct_ngtcp2_addr_553648696 {.pure, inheritable, bycopy.} = object
    addr_field*: ptr ngtcp2_sockaddr_553648634 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1919:16
    addrlen*: ngtcp2_socklen_553648646
  ngtcp2_addr_553648698 = struct_ngtcp2_addr_553648697 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1930:3
  struct_ngtcp2_path_553648700 {.pure, inheritable, bycopy.} = object
    local*: ngtcp2_addr_553648699 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1938:16
    remote*: ngtcp2_addr_553648699
    user_data*: pointer
  ngtcp2_path_553648702 = struct_ngtcp2_path_553648701 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1962:3
  struct_ngtcp2_path_storage_553648704 {.pure, inheritable, bycopy.} = object
    path*: ngtcp2_path_553648703 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1970:16
    local_addrbuf*: ngtcp2_sockaddr_union_553648652
    remote_addrbuf*: ngtcp2_sockaddr_union_553648652
  ngtcp2_path_storage_553648706 = struct_ngtcp2_path_storage_553648705 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1983:3
  struct_ngtcp2_crypto_md_553648708 {.pure, inheritable, bycopy.} = object
    native_handle*: pointer  ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1991:16
  ngtcp2_crypto_md_553648710 = struct_ngtcp2_crypto_md_553648709 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1997:3
  struct_ngtcp2_crypto_aead_553648712 {.pure, inheritable, bycopy.} = object
    native_handle*: pointer  ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2004:16
    max_overhead*: csize_t
  ngtcp2_crypto_aead_553648714 = struct_ngtcp2_crypto_aead_553648713 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2015:3
  struct_ngtcp2_crypto_cipher_553648716 {.pure, inheritable, bycopy.} = object
    native_handle*: pointer  ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2023:16
  ngtcp2_crypto_cipher_553648718 = struct_ngtcp2_crypto_cipher_553648717 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2029:3
  struct_ngtcp2_crypto_aead_ctx_553648720 {.pure, inheritable, bycopy.} = object
    native_handle*: pointer  ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2039:16
  ngtcp2_crypto_aead_ctx_553648722 = struct_ngtcp2_crypto_aead_ctx_553648721 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2045:3
  struct_ngtcp2_crypto_cipher_ctx_553648724 {.pure, inheritable, bycopy.} = object
    native_handle*: pointer  ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2055:16
  ngtcp2_crypto_cipher_ctx_553648726 = struct_ngtcp2_crypto_cipher_ctx_553648725 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2061:3
  struct_ngtcp2_crypto_ctx_553648728 {.pure, inheritable, bycopy.} = object
    aead*: ngtcp2_crypto_aead_553648715 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2073:16
    md*: ngtcp2_crypto_md_553648711
    hp*: ngtcp2_crypto_cipher_553648719
    max_encryption*: uint64
    max_decryption_failure*: uint64
  ngtcp2_crypto_ctx_553648730 = struct_ngtcp2_crypto_ctx_553648729 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2096:3
  struct_ngtcp2_version_cid_553648732 {.pure, inheritable, bycopy.} = object
    version*: uint32         ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2198:16
    dcid*: ptr uint8
    dcidlen*: csize_t
    scid*: ptr uint8
    scidlen*: csize_t
  ngtcp2_version_cid_553648734 = struct_ngtcp2_version_cid_553648733 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2221:3
  ngtcp2_conn_553648736 = struct_ngtcp2_conn ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2391:28
  ngtcp2_client_initial_553648738 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2411:15
  ngtcp2_recv_client_initial_553648740 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: ptr ngtcp2_cid_553648620; a2: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2428:15
  ngtcp2_encryption_level_553648744 = enum_ngtcp2_encryption_level_553648743 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2456:3
  ngtcp2_recv_crypto_data_553648746 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: ngtcp2_encryption_level_553648745; a2: uint64; a3: ptr uint8;
      a4: csize_t; a5: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2493:15
  ngtcp2_handshake_completed_553648748 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2508:15
  ngtcp2_handshake_confirmed_553648750 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2521:15
  ngtcp2_recv_version_negotiation_553648752 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: ptr ngtcp2_pkt_hd_553648628; a2: ptr uint32; a3: csize_t; a4: pointer): cint {.
      cdecl.}                ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2536:15
  ngtcp2_recv_retry_553648754 = proc (a0: ptr ngtcp2_conn_553648737;
                                      a1: ptr ngtcp2_pkt_hd_553648628;
                                      a2: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2559:15
  ngtcp2_encrypt_553648756 = proc (a0: ptr uint8; a1: ptr ngtcp2_crypto_aead_553648715;
                                   a2: ptr ngtcp2_crypto_aead_ctx_553648723;
                                   a3: ptr uint8; a4: csize_t; a5: ptr uint8;
                                   a6: csize_t; a7: ptr uint8; a8: csize_t): cint {.
      cdecl.}                ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2584:15
  ngtcp2_decrypt_553648758 = proc (a0: ptr uint8; a1: ptr ngtcp2_crypto_aead_553648715;
                                   a2: ptr ngtcp2_crypto_aead_ctx_553648723;
                                   a3: ptr uint8; a4: csize_t; a5: ptr uint8;
                                   a6: csize_t; a7: ptr uint8; a8: csize_t): cint {.
      cdecl.}                ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2613:15
  ngtcp2_hp_mask_553648760 = proc (a0: ptr uint8; a1: ptr ngtcp2_crypto_cipher_553648719;
                                   a2: ptr ngtcp2_crypto_cipher_ctx_553648727;
                                   a3: ptr uint8): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2642:15
  ngtcp2_recv_stream_data_553648762 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: uint32; a2: int64; a3: uint64; a4: ptr uint8; a5: csize_t;
      a6: pointer; a7: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2698:15
  ngtcp2_stream_open_553648764 = proc (a0: ptr ngtcp2_conn_553648737; a1: int64;
                                       a2: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2715:15
  ngtcp2_stream_close_553648766 = proc (a0: ptr ngtcp2_conn_553648737;
                                        a1: uint32; a2: int64; a3: uint64;
                                        a4: pointer; a5: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2764:15
  ngtcp2_stream_reset_553648768 = proc (a0: ptr ngtcp2_conn_553648737;
                                        a1: int64; a2: uint64; a3: uint64;
                                        a4: pointer; a5: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2778:15
  ngtcp2_acked_stream_data_offset_553648770 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: int64; a2: uint64; a3: uint64; a4: pointer; a5: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2804:15
  ngtcp2_recv_stateless_reset_553648772 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: ptr ngtcp2_pkt_stateless_reset_553648632; a2: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2819:15
  ngtcp2_extend_max_streams_553648774 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: uint64; a2: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2835:15
  ngtcp2_extend_max_stream_data_553648776 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: int64; a2: uint64; a3: pointer; a4: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2850:15
  ngtcp2_rand_553648778 = proc (a0: ptr uint8; a1: csize_t;
                                a2: ptr ngtcp2_rand_ctx_553648685): void {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2863:16
  ngtcp2_get_new_connection_id_553648780 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: ptr ngtcp2_cid_553648620; a2: ptr uint8; a3: csize_t; a4: pointer): cint {.
      cdecl.}                ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2882:15
  ngtcp2_remove_connection_id_553648782 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: ptr ngtcp2_cid_553648620; a2: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2899:15
  ngtcp2_update_key_553648784 = proc (a0: ptr ngtcp2_conn_553648737;
                                      a1: ptr uint8; a2: ptr uint8;
                                      a3: ptr ngtcp2_crypto_aead_ctx_553648723;
                                      a4: ptr uint8;
                                      a5: ptr ngtcp2_crypto_aead_ctx_553648723;
                                      a6: ptr uint8; a7: ptr uint8;
                                      a8: ptr uint8; a9: csize_t; a10: pointer): cint {.
      cdecl.}                ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2927:15
  ngtcp2_path_validation_553648786 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: uint32; a2: ptr ngtcp2_path_553648703; a3: ptr ngtcp2_path_553648703;
      a4: ngtcp2_path_validation_result_553648612; a5: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2984:15
  ngtcp2_select_preferred_addr_553648788 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: ptr ngtcp2_path_553648703; a2: ptr ngtcp2_preferred_addr_553648656;
      a3: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3016:15
  ngtcp2_connection_id_status_type_553648792 = enum_ngtcp2_connection_id_status_type_553648791 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3039:3
  ngtcp2_connection_id_status_553648794 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: ngtcp2_connection_id_status_type_553648793; a2: uint64;
      a3: ptr ngtcp2_cid_553648620; a4: ptr uint8; a5: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3058:15
  ngtcp2_recv_new_token_553648796 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: ptr uint8; a2: csize_t; a3: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3075:15
  ngtcp2_delete_crypto_aead_ctx_553648798 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: ptr ngtcp2_crypto_aead_ctx_553648723; a2: pointer): void {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3086:16
  ngtcp2_delete_crypto_cipher_ctx_553648800 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: ptr ngtcp2_crypto_cipher_ctx_553648727; a2: pointer): void {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3098:16
  ngtcp2_recv_datagram_553648802 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: uint32; a2: ptr uint8; a3: csize_t; a4: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3138:15
  ngtcp2_ack_datagram_553648804 = proc (a0: ptr ngtcp2_conn_553648737;
                                        a1: uint64; a2: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3153:15
  ngtcp2_lost_datagram_553648806 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: uint64; a2: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3169:15
  ngtcp2_get_path_challenge_data_553648808 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: ptr uint8; a2: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3185:15
  ngtcp2_stream_stop_sending_553648810 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: int64; a2: uint64; a3: pointer; a4: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3201:15
  ngtcp2_version_negotiation_553648812 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: uint32; a2: ptr ngtcp2_cid_553648620; a3: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3224:15
  ngtcp2_recv_key_553648814 = proc (a0: ptr ngtcp2_conn_553648737;
                                    a1: ngtcp2_encryption_level_553648745;
                                    a2: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3238:15
  ngtcp2_tls_early_data_rejected_553648816 = proc (a0: ptr ngtcp2_conn_553648737;
      a1: pointer): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3252:15
  struct_ngtcp2_callbacks_553648818 {.pure, inheritable, bycopy.} = object
    client_initial*: ngtcp2_client_initial_553648739 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3263:16
    recv_client_initial*: ngtcp2_recv_client_initial_553648741
    recv_crypto_data*: ngtcp2_recv_crypto_data_553648747
    handshake_completed*: ngtcp2_handshake_completed_553648749
    recv_version_negotiation*: ngtcp2_recv_version_negotiation_553648753
    encrypt*: ngtcp2_encrypt_553648757
    decrypt*: ngtcp2_decrypt_553648759
    hp_mask*: ngtcp2_hp_mask_553648761
    recv_stream_data*: ngtcp2_recv_stream_data_553648763
    acked_stream_data_offset*: ngtcp2_acked_stream_data_offset_553648771
    stream_open*: ngtcp2_stream_open_553648765
    stream_close*: ngtcp2_stream_close_553648767
    recv_stateless_reset*: ngtcp2_recv_stateless_reset_553648773
    recv_retry*: ngtcp2_recv_retry_553648755
    extend_max_local_streams_bidi*: ngtcp2_extend_max_streams_553648775
    extend_max_local_streams_uni*: ngtcp2_extend_max_streams_553648775
    rand*: ngtcp2_rand_553648779
    get_new_connection_id*: ngtcp2_get_new_connection_id_553648781
    remove_connection_id*: ngtcp2_remove_connection_id_553648783
    update_key*: ngtcp2_update_key_553648785
    path_validation*: ngtcp2_path_validation_553648787
    select_preferred_addr*: ngtcp2_select_preferred_addr_553648789
    stream_reset*: ngtcp2_stream_reset_553648769
    extend_max_remote_streams_bidi*: ngtcp2_extend_max_streams_553648775
    extend_max_remote_streams_uni*: ngtcp2_extend_max_streams_553648775
    extend_max_stream_data*: ngtcp2_extend_max_stream_data_553648777
    dcid_status*: ngtcp2_connection_id_status_553648795
    handshake_confirmed*: ngtcp2_handshake_confirmed_553648751
    recv_new_token*: ngtcp2_recv_new_token_553648797
    delete_crypto_aead_ctx*: ngtcp2_delete_crypto_aead_ctx_553648799
    delete_crypto_cipher_ctx*: ngtcp2_delete_crypto_cipher_ctx_553648801
    recv_datagram*: ngtcp2_recv_datagram_553648803
    ack_datagram*: ngtcp2_ack_datagram_553648805
    lost_datagram*: ngtcp2_lost_datagram_553648807
    get_path_challenge_data*: ngtcp2_get_path_challenge_data_553648809
    stream_stop_sending*: ngtcp2_stream_stop_sending_553648811
    version_negotiation*: ngtcp2_version_negotiation_553648813
    recv_rx_key*: ngtcp2_recv_key_553648815
    recv_tx_key*: ngtcp2_recv_key_553648815
    tls_early_data_rejected*: ngtcp2_tls_early_data_rejected_553648817
  ngtcp2_callbacks_553648820 = struct_ngtcp2_callbacks_553648819 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3521:3
  struct_ngtcp2_cid_token_553648822 {.pure, inheritable, bycopy.} = object
    seq*: uint64             ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4820:16
    cid*: ngtcp2_cid_553648620
    ps*: ngtcp2_path_storage_553648707
    token*: array[16'i64, uint8]
    token_present*: uint8
  ngtcp2_cid_token_553648824 = struct_ngtcp2_cid_token_553648823 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4844:3
  ngtcp2_ccerr_type_553648828 = enum_ngtcp2_ccerr_type_553648827 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:5245:3
  struct_ngtcp2_ccerr_553648830 {.pure, inheritable, bycopy.} = object
    type_field*: ngtcp2_ccerr_type_553648829 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:5253:16
    error_code*: uint64
    frame_type*: uint64
    reason*: ptr uint8
    reasonlen*: csize_t
  ngtcp2_ccerr_553648832 = struct_ngtcp2_ccerr_553648831 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:5281:3
  struct_ngtcp2_info_553648834 {.pure, inheritable, bycopy.} = object
    age*: cint               ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:5675:16
    version_num*: cint
    version_str*: cstring
  ngtcp2_info_553648836 = struct_ngtcp2_info_553648835 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:5693:3
  ngtcp2_crypto_conn_ref_553648838 = struct_ngtcp2_crypto_conn_ref_553648841 ## Generated based on /nim-ngtcp2/libs/ngtcp2/crypto/includes/ngtcp2/ngtcp2_crypto.h:950:3
  struct_ngtcp2_crypto_conn_ref_553648840 {.pure, inheritable, bycopy.} = object
    get_conn*: ngtcp2_crypto_get_conn_553648843 ## Generated based on /nim-ngtcp2/libs/ngtcp2/crypto/includes/ngtcp2/ngtcp2_crypto.h:940:16
    user_data*: pointer
  ngtcp2_crypto_get_conn_553648842 = proc (a0: ptr ngtcp2_crypto_conn_ref_553648839): ptr ngtcp2_conn_553648737 {.
      cdecl.}                ## Generated based on /nim-ngtcp2/libs/ngtcp2/crypto/includes/ngtcp2/ngtcp2_crypto.h:930:24
  ptls_t_553648844 = struct_st_ptls_t ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:323:26
  ptls_context_t_553648846 = struct_st_ptls_context_t_553648849 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:324:34
  struct_st_ptls_context_t_certificates_t {.pure, inheritable, bycopy.} = object
    list*: ptr ptls_iovec_t_553648855
    count*: csize_t
  struct_st_ptls_context_t_pre_shared_key_t {.pure, inheritable, bycopy.} = object
    identity*: ptls_iovec_t_553648855
    secret*: ptls_iovec_t_553648855
    hash*: ptr ptls_hash_algorithm_t_553648901
  struct_st_ptls_context_t_ech_t_client_t {.pure, inheritable, bycopy.} = object
    ciphers*: ptr ptr ptls_hpke_cipher_suite_t_553648921
    kems*: ptr ptr ptls_hpke_kem_t_553648913
  struct_st_ptls_context_t_ech_t_server_t {.pure, inheritable, bycopy.} = object
    create_opener*: ptr ptls_ech_create_opener_t_553648987
    retry_configs*: ptls_iovec_t_553648855
  struct_st_ptls_context_t_ech_t {.pure, inheritable, bycopy.} = object
    client*: struct_st_ptls_context_t_ech_t_client_t
    server*: struct_st_ptls_context_t_ech_t_server_t
  struct_st_ptls_context_t_ticket_context_t {.pure, inheritable, bycopy.} = object
    bytes*: array[32'i64, uint8]
    is_set* {.bitsize: 1'i64.}: cuint
  struct_st_ptls_context_t_client_ca_names_t {.pure, inheritable, bycopy.} = object
    list*: ptr ptls_iovec_t_553648855
    count*: csize_t
  struct_st_ptls_context_t_ticket_requests_t_client_t {.pure, inheritable,
      bycopy.} = object
    new_session_count*: uint8
    resumption_count*: uint8
  struct_st_ptls_context_t_ticket_requests_t_server_t {.pure, inheritable,
      bycopy.} = object
    max_count*: uint8
  struct_st_ptls_context_t_ticket_requests_t {.pure, inheritable, bycopy.} = object
    client*: struct_st_ptls_context_t_ticket_requests_t_client_t
    server*: struct_st_ptls_context_t_ticket_requests_t_server_t
  struct_st_ptls_context_t_553648848 {.pure, inheritable, bycopy.} = object
    random_bytes*: proc (a0: pointer; a1: csize_t): void {.cdecl.} ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:854:8
    get_time*: ptr ptls_get_time_t_553648933
    key_exchanges*: ptr ptr ptls_key_exchange_algorithm_t_553648869
    cipher_suites*: ptr ptr ptls_cipher_suite_t_553648905
    certificates*: struct_st_ptls_context_t_certificates_t
    pre_shared_key*: struct_st_ptls_context_t_pre_shared_key_t
    ech*: struct_st_ptls_context_t_ech_t
    on_client_hello*: ptr ptls_on_client_hello_t_553648937
    emit_certificate*: ptr ptls_emit_certificate_t_553648941
    sign_certificate*: ptr ptls_sign_certificate_t_553648949
    verify_certificate*: ptr ptls_verify_certificate_t_553648953
    ticket_lifetime*: uint32
    max_early_data_size*: uint32
    max_buffer_size*: csize_t
    hkdf_label_prefix_obsolete*: cstring
    require_dhe_on_psk* {.bitsize: 1'i64.}: cuint
    use_exporter* {.bitsize: 1'i64.}: cuint
    send_change_cipher_spec* {.bitsize: 1'i64.}: cuint
    require_client_authentication* {.bitsize: 1'i64.}: cuint
    omit_end_of_early_data* {.bitsize: 1'i64.}: cuint
    use_raw_public_keys* {.bitsize: 1'i64.}: cuint
    server_cipher_preference* {.bitsize: 1'i64.}: cuint
    server_cipher_chacha_priority* {.bitsize: 1'i64.}: cuint
    encrypt_ticket*: ptr ptls_encrypt_ticket_t_553648957
    save_ticket*: ptr ptls_save_ticket_t_553648961
    log_event*: ptr ptls_log_event_t_553648965
    update_open_count*: ptr ptls_update_open_count_t_553648971
    update_traffic_key*: ptr ptls_update_traffic_key_t_553648975
    decompress_certificate*: ptr ptls_decompress_certificate_t_553648983
    on_extension*: ptr ptls_on_extension_t_553648979
    tls12_cipher_suites*: ptr ptr ptls_cipher_suite_t_553648905
    ticket_context*: struct_st_ptls_context_t_ticket_context_t
    client_ca_names*: struct_st_ptls_context_t_client_ca_names_t
    ticket_requests*: struct_st_ptls_context_t_ticket_requests_t
  ptls_key_schedule_t_553648850 = struct_st_ptls_key_schedule_t ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:325:39
  struct_st_ptls_iovec_t_553648852 {.pure, inheritable, bycopy.} = object
    base*: ptr uint8         ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:330:16
    len*: csize_t
  ptls_iovec_t_553648854 = struct_st_ptls_iovec_t_553648853 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:333:3
  struct_st_ptls_buffer_t_553648856 {.pure, inheritable, bycopy.} = object
    base*: ptr uint8         ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:338:16
    capacity*: csize_t
    off*: csize_t
    is_allocated*: uint8
    align_bits*: uint8
  ptls_buffer_t_553648858 = struct_st_ptls_buffer_t_553648857 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:344:3
  struct_st_ptls_key_exchange_context_t_553648860 {.pure, inheritable, bycopy.} = object
    algo*: ptr struct_st_ptls_key_exchange_algorithm_t_553648863 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:349:16
    pubkey*: ptls_iovec_t_553648855
    on_exchange*: proc (a0: ptr ptr struct_st_ptls_key_exchange_context_t_553648861;
                        a1: cint; a2: ptr ptls_iovec_t_553648855;
                        a3: ptls_iovec_t_553648855): cint {.cdecl.}
  struct_st_ptls_key_exchange_algorithm_t_553648862 {.pure, inheritable, bycopy.} = object
    id*: uint16              ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:371:22
    create*: proc (a0: ptr struct_st_ptls_key_exchange_algorithm_t_553648863;
                   a1: ptr ptr ptls_key_exchange_context_t_553648865): cint {.
        cdecl.}
    exchange*: proc (a0: ptr struct_st_ptls_key_exchange_algorithm_t_553648863;
                     a1: ptr ptls_iovec_t_553648855; a2: ptr ptls_iovec_t_553648855;
                     a3: ptls_iovec_t_553648855): cint {.cdecl.}
    data*: intptr_t_553648867
    name*: cstring
  ptls_key_exchange_context_t_553648864 = struct_st_ptls_key_exchange_context_t_553648861 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:366:3
  intptr_t_553648866 = clong ## Generated based on /usr/include/stdint.h:76:19
  ptls_key_exchange_algorithm_t_553648868 = struct_st_ptls_key_exchange_algorithm_t_553648863 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:398:3
  struct_st_ptls_cipher_context_t_553648870 {.pure, inheritable, bycopy.} = object
    algo*: ptr struct_st_ptls_cipher_algorithm_t_553648873 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:403:16
    do_dispose*: proc (a0: ptr struct_st_ptls_cipher_context_t_553648871): void {.
        cdecl.}
    do_init*: proc (a0: ptr struct_st_ptls_cipher_context_t_553648871;
                    a1: pointer): void {.cdecl.}
    do_transform*: proc (a0: ptr struct_st_ptls_cipher_context_t_553648871;
                         a1: pointer; a2: pointer; a3: csize_t): void {.cdecl.}
  struct_st_ptls_cipher_algorithm_t_553648872 {.pure, inheritable, bycopy.} = object
    name*: cstring           ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:414:22
    key_size*: csize_t
    block_size*: csize_t
    iv_size*: csize_t
    context_size*: csize_t
    setup_crypto*: proc (a0: ptr ptls_cipher_context_t_553648875; a1: cint;
                         a2: pointer): cint {.cdecl.}
  ptls_cipher_context_t_553648874 = struct_st_ptls_cipher_context_t_553648871 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:409:3
  ptls_cipher_algorithm_t_553648876 = struct_st_ptls_cipher_algorithm_t_553648873 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:421:3
  struct_st_ptls_aead_supplementary_encryption_t_553648878 {.pure, inheritable,
      bycopy.} = object
    ctx*: ptr ptls_cipher_context_t_553648875 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:427:16
    input*: pointer
    output*: array[16'i64, uint8]
  ptls_aead_supplementary_encryption_t_553648880 = struct_st_ptls_aead_supplementary_encryption_t_553648879 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:442:3
  struct_st_ptls_aead_context_t_553648882 {.pure, inheritable, bycopy.} = object
    algo*: ptr struct_st_ptls_aead_algorithm_t_553648885 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:450:16
    dispose_crypto*: proc (a0: ptr struct_st_ptls_aead_context_t_553648883): void {.
        cdecl.}
    do_get_iv*: proc (a0: ptr struct_st_ptls_aead_context_t_553648883;
                      a1: pointer): void {.cdecl.}
    do_set_iv*: proc (a0: ptr struct_st_ptls_aead_context_t_553648883;
                      a1: pointer): void {.cdecl.}
    do_encrypt_init*: proc (a0: ptr struct_st_ptls_aead_context_t_553648883;
                            a1: uint64; a2: pointer; a3: csize_t): void {.cdecl.}
    do_encrypt_update*: proc (a0: ptr struct_st_ptls_aead_context_t_553648883;
                              a1: pointer; a2: pointer; a3: csize_t): csize_t {.
        cdecl.}
    do_encrypt_final*: proc (a0: ptr struct_st_ptls_aead_context_t_553648883;
                             a1: pointer): csize_t {.cdecl.}
    do_encrypt*: proc (a0: ptr struct_st_ptls_aead_context_t_553648883;
                       a1: pointer; a2: pointer; a3: csize_t; a4: uint64;
                       a5: pointer; a6: csize_t;
                       a7: ptr ptls_aead_supplementary_encryption_t_553648881): void {.
        cdecl.}
    do_encrypt_v*: proc (a0: ptr struct_st_ptls_aead_context_t_553648883;
                         a1: pointer; a2: ptr ptls_iovec_t_553648855;
                         a3: csize_t; a4: uint64; a5: pointer; a6: csize_t): void {.
        cdecl.}
    do_decrypt*: proc (a0: ptr struct_st_ptls_aead_context_t_553648883;
                       a1: pointer; a2: pointer; a3: csize_t; a4: uint64;
                       a5: pointer; a6: csize_t): csize_t {.cdecl.}
  struct_st_ptls_aead_algorithm_t_tls12_t {.pure, inheritable, bycopy.} = object
    fixed_iv_size*: csize_t
    record_iv_size*: csize_t
  struct_st_ptls_aead_algorithm_t_553648884 {.pure, inheritable, bycopy.} = object
    name*: cstring           ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:505:22
    confidentiality_limit*: uint64
    integrity_limit*: uint64
    ctr_cipher*: ptr ptls_cipher_algorithm_t_553648877
    ecb_cipher*: ptr ptls_cipher_algorithm_t_553648877
    key_size*: csize_t
    iv_size*: csize_t
    tag_size*: csize_t
    tls12*: struct_st_ptls_aead_algorithm_t_tls12_t
    non_temporal* {.bitsize: 1'i64.}: cuint
    align_bits*: uint8
    context_size*: csize_t
    setup_crypto*: proc (a0: ptr ptls_aead_context_t_553648887; a1: cint;
                         a2: pointer; a3: pointer): cint {.cdecl.}
  ptls_aead_context_t_553648886 = struct_st_ptls_aead_context_t_553648883 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:500:3
  ptls_aead_algorithm_t_553648888 = struct_st_ptls_aead_algorithm_t_553648885 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:566:3
  ptls_hash_final_mode_t_553648892 = enum_en_ptls_hash_final_mode_t_553648891 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:584:3
  struct_st_ptls_hash_context_t_553648894 {.pure, inheritable, bycopy.} = object
    update*: proc (a0: ptr struct_st_ptls_hash_context_t_553648895; a1: pointer;
                   a2: csize_t): void {.cdecl.} ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:589:16
    final*: proc (a0: ptr struct_st_ptls_hash_context_t_553648895; a1: pointer;
                  a2: ptls_hash_final_mode_t_553648893): void {.cdecl.}
    clone_private*: proc (a0: ptr struct_st_ptls_hash_context_t_553648895): ptr struct_st_ptls_hash_context_t_553648895 {.
        cdecl.}
  ptls_hash_context_t_553648896 = struct_st_ptls_hash_context_t_553648895 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:602:3
  struct_st_ptls_hash_algorithm_t_553648898 {.pure, inheritable, bycopy.} = object
    name*: cstring           ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:607:22
    block_size*: csize_t
    digest_size*: csize_t
    create*: proc (): ptr ptls_hash_context_t_553648897 {.cdecl.}
    empty_digest*: array[64'i64, uint8]
  ptls_hash_algorithm_t_553648900 = struct_st_ptls_hash_algorithm_t_553648899 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:628:3
  struct_st_ptls_cipher_suite_t_553648902 {.pure, inheritable, bycopy.} = object
    id*: uint16              ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:630:22
    aead*: ptr ptls_aead_algorithm_t_553648889
    hash*: ptr ptls_hash_algorithm_t_553648901
    name*: cstring
  ptls_cipher_suite_t_553648904 = struct_st_ptls_cipher_suite_t_553648903 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:647:3
  struct_st_ptls_message_emitter_t_553648906 {.pure, inheritable, bycopy.} = object
    buf*: ptr ptls_buffer_t_553648859 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:651:16
    enc*: ptr struct_st_ptls_traffic_protection_t
    record_header_length*: csize_t
    begin_message*: proc (a0: ptr struct_st_ptls_message_emitter_t_553648907): cint {.
        cdecl.}
    commit_message*: proc (a0: ptr struct_st_ptls_message_emitter_t_553648907): cint {.
        cdecl.}
  ptls_message_emitter_t_553648908 = struct_st_ptls_message_emitter_t_553648907 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:657:3
  struct_st_ptls_hpke_kem_t_553648910 {.pure, inheritable, bycopy.} = object
    id*: uint16              ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:662:22
    keyex*: ptr ptls_key_exchange_algorithm_t_553648869
    hash*: ptr ptls_hash_algorithm_t_553648901
  ptls_hpke_kem_t_553648912 = struct_st_ptls_hpke_kem_t_553648911 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:666:3
  struct_st_ptls_hpke_cipher_suite_id_t_553648914 {.pure, inheritable, bycopy.} = object
    kdf*: uint16             ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:668:16
    aead*: uint16
  ptls_hpke_cipher_suite_id_t_553648916 = struct_st_ptls_hpke_cipher_suite_id_t_553648915 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:671:3
  struct_st_ptls_hpke_cipher_suite_t_553648918 {.pure, inheritable, bycopy.} = object
    id*: ptls_hpke_cipher_suite_id_t_553648917 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:673:22
    name*: cstring
    hash*: ptr ptls_hash_algorithm_t_553648901
    aead*: ptr ptls_aead_algorithm_t_553648889
  ptls_hpke_cipher_suite_t_553648920 = struct_st_ptls_hpke_cipher_suite_t_553648919 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:678:3
  struct_st_ptls_client_hello_psk_identity_t_553648922 {.pure, inheritable,
      bycopy.} = object
    identity*: ptls_iovec_t_553648855 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:690:16
    obfuscated_ticket_age*: uint32
    binder*: ptls_iovec_t_553648855
  ptls_client_hello_psk_identity_t_553648924 = struct_st_ptls_client_hello_psk_identity_t_553648923 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:694:3
  struct_st_ptls_on_client_hello_parameters_t_negotiated_protocols_t {.pure,
      inheritable, bycopy.} = object
    list*: ptr ptls_iovec_t_553648855
    count*: csize_t
  struct_st_ptls_on_client_hello_parameters_t_signature_algorithms_t {.pure,
      inheritable, bycopy.} = object
    list*: ptr uint16
    count*: csize_t
  struct_st_ptls_on_client_hello_parameters_t_certificate_compression_algorithms_t {.
      pure, inheritable, bycopy.} = object
    list*: ptr uint16
    count*: csize_t
  struct_st_ptls_on_client_hello_parameters_t_server_certificate_types_t {.pure,
      inheritable, bycopy.} = object
    list*: ptr uint8
    count*: csize_t
  struct_st_ptls_on_client_hello_parameters_t_psk_identities_t {.pure,
      inheritable, bycopy.} = object
    list*: ptr ptls_client_hello_psk_identity_t_553648925
    count*: csize_t
  struct_st_ptls_on_client_hello_parameters_t_553648926 {.pure, inheritable,
      bycopy.} = object
    server_name*: ptls_iovec_t_553648855 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:699:16
    raw_message*: ptls_iovec_t_553648855
    cipher_suites*: ptls_iovec_t_553648855
    negotiated_protocols*: struct_st_ptls_on_client_hello_parameters_t_negotiated_protocols_t
    signature_algorithms*: struct_st_ptls_on_client_hello_parameters_t_signature_algorithms_t
    certificate_compression_algorithms*: struct_st_ptls_on_client_hello_parameters_t_certificate_compression_algorithms_t
    server_certificate_types*: struct_st_ptls_on_client_hello_parameters_t_server_certificate_types_t
    psk_identities*: struct_st_ptls_on_client_hello_parameters_t_psk_identities_t
    incompatible_version* {.bitsize: 1'i64.}: cuint
  ptls_on_client_hello_parameters_t_553648928 = struct_st_ptls_on_client_hello_parameters_t_553648927 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:739:3
  struct_st_ptls_get_time_t_553648930 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_get_time_t_553648931): uint64 {.cdecl.} ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:744:1
  ptls_get_time_t_553648932 = struct_st_ptls_get_time_t_553648931 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:744:1
  struct_st_ptls_on_client_hello_t_553648934 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_on_client_hello_t_553648935;
               a1: ptr ptls_t_553648845;
               a2: ptr ptls_on_client_hello_parameters_t_553648929): cint {.
        cdecl.}              ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:749:1
  ptls_on_client_hello_t_553648936 = struct_st_ptls_on_client_hello_t_553648935 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:749:1
  struct_st_ptls_emit_certificate_t_553648938 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_emit_certificate_t_553648939;
               a1: ptr ptls_t_553648845; a2: ptr ptls_message_emitter_t_553648909;
               a3: ptr ptls_key_schedule_t_553648851; a4: ptls_iovec_t_553648855;
               a5: cint; a6: ptr uint16; a7: csize_t): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:753:1
  ptls_emit_certificate_t_553648940 = struct_st_ptls_emit_certificate_t_553648939 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:753:1
  struct_st_ptls_async_job_t_553648942 {.pure, inheritable, bycopy.} = object
    destroy_private*: proc (a0: ptr struct_st_ptls_async_job_t_553648943): void {.
        cdecl.}              ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:763:16
    get_fd*: proc (a0: ptr struct_st_ptls_async_job_t_553648943): cint {.cdecl.}
    set_completion_callback*: proc (a0: ptr struct_st_ptls_async_job_t_553648943;
                                    a1: proc (a0: pointer): void {.cdecl.};
                                    a2: pointer): void {.cdecl.}
  ptls_async_job_t_553648944 = struct_st_ptls_async_job_t_553648943 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:773:3
  struct_st_ptls_sign_certificate_t_553648946 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_sign_certificate_t_553648947;
               a1: ptr ptls_t_553648845; a2: ptr ptr ptls_async_job_t_553648945;
               a3: ptr uint16; a4: ptr ptls_buffer_t_553648859;
               a5: ptls_iovec_t_553648855; a6: ptr uint16; a7: csize_t): cint {.
        cdecl.}              ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:778:1
  ptls_sign_certificate_t_553648948 = struct_st_ptls_sign_certificate_t_553648947 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:778:1
  struct_st_ptls_verify_certificate_t_553648950 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_verify_certificate_t_553648951;
               a1: ptr ptls_t_553648845; a2: cstring; a3: proc (a0: pointer;
        a1: uint16; a2: ptls_iovec_t_553648855; a3: ptls_iovec_t_553648855): cint {.
        cdecl.}; a4: ptr pointer; a5: ptr ptls_iovec_t_553648855; a6: csize_t): cint {.
        cdecl.}              ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:789:16
    algos*: ptr uint16
  ptls_verify_certificate_t_553648952 = struct_st_ptls_verify_certificate_t_553648951 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:797:3
  struct_st_ptls_encrypt_ticket_t_553648954 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_encrypt_ticket_t_553648955;
               a1: ptr ptls_t_553648845; a2: cint; a3: ptr ptls_buffer_t_553648859;
               a4: ptls_iovec_t_553648855): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:804:1
  ptls_encrypt_ticket_t_553648956 = struct_st_ptls_encrypt_ticket_t_553648955 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:804:1
  struct_st_ptls_save_ticket_t_553648958 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_save_ticket_t_553648959; a1: ptr ptls_t_553648845;
               a2: ptls_iovec_t_553648855): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:808:1
  ptls_save_ticket_t_553648960 = struct_st_ptls_save_ticket_t_553648959 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:808:1
  struct_st_ptls_log_event_t_553648962 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_log_event_t_553648963; a1: ptr ptls_t_553648845;
               a2: cstring; a3: cstring): void {.cdecl, varargs.} ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:812:16
  ptls_log_event_t_553648964 = struct_st_ptls_log_event_t_553648963 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:815:3
  struct_st_ptls_update_open_count_t_553648966 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_update_open_count_t_553648967; a1: ssize_t_553648969): void {.
        cdecl.}              ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:819:1
  ssize_t_553648968 = compiler_ssize_t_553649063 ## Generated based on /usr/include/x86_64-linux-gnu/sys/types.h:108:19
  ptls_update_open_count_t_553648970 = struct_st_ptls_update_open_count_t_553648967 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:819:1
  struct_st_ptls_update_traffic_key_t_553648972 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_update_traffic_key_t_553648973;
               a1: ptr ptls_t_553648845; a2: cint; a3: csize_t; a4: pointer): cint {.
        cdecl.}              ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:824:1
  ptls_update_traffic_key_t_553648974 = struct_st_ptls_update_traffic_key_t_553648973 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:824:1
  struct_st_ptls_on_extension_t_553648976 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_on_extension_t_553648977; a1: ptr ptls_t_553648845;
               a2: uint8; a3: uint16; a4: ptls_iovec_t_553648855): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:828:1
  ptls_on_extension_t_553648978 = struct_st_ptls_on_extension_t_553648977 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:828:1
  struct_st_ptls_decompress_certificate_t_553648980 {.pure, inheritable, bycopy.} = object
    supported_algorithms*: ptr uint16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:832:16
    cb*: proc (a0: ptr struct_st_ptls_decompress_certificate_t_553648981;
               a1: ptr ptls_t_553648845; a2: uint16; a3: ptls_iovec_t_553648855;
               a4: ptls_iovec_t_553648855): cint {.cdecl.}
  ptls_decompress_certificate_t_553648982 = struct_st_ptls_decompress_certificate_t_553648981 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:842:3
  struct_st_ptls_ech_create_opener_t_553648984 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_ech_create_opener_t_553648985;
               a1: ptr ptr ptls_hpke_kem_t_553648913;
               a2: ptr ptr ptls_hpke_cipher_suite_t_553648921; a3: ptr ptls_t_553648845;
               a4: uint8; a5: ptls_hpke_cipher_suite_id_t_553648917;
               a6: ptls_iovec_t_553648855; a7: ptls_iovec_t_553648855): ptr ptls_aead_context_t_553648887 {.
        cdecl.}              ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:848:1
  ptls_ech_create_opener_t_553648986 = struct_st_ptls_ech_create_opener_t_553648985 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:848:1
  struct_st_ptls_raw_extension_t_553648988 {.pure, inheritable, bycopy.} = object
    type_field*: uint16      ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:1059:16
    data*: ptls_iovec_t_553648855
  ptls_raw_extension_t_553648990 = struct_st_ptls_raw_extension_t_553648989 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:1062:3
  ptls_early_data_acceptance_t_553648994 = enum_en_ptls_early_data_acceptance_t_553648993 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:1068:3
  struct_st_ptls_handshake_properties_t_anon0_t_client_t_negotiated_protocols_t {.
      pure, inheritable, bycopy.} = object
    list*: ptr ptls_iovec_t_553648855
    count*: csize_t
  struct_st_ptls_handshake_properties_t_anon0_t_client_t_ech_t {.pure,
      inheritable, bycopy.} = object
    configs*: ptls_iovec_t_553648855
    retry_configs*: ptr ptls_iovec_t_553648855
  struct_st_ptls_handshake_properties_t_anon0_t_client_t {.pure, inheritable,
      bycopy.} = object
    negotiated_protocols*: struct_st_ptls_handshake_properties_t_anon0_t_client_t_negotiated_protocols_t
    session_ticket*: ptls_iovec_t_553648855
    max_early_data_size*: ptr csize_t
    early_data_acceptance*: ptls_early_data_acceptance_t_553648995
    negotiate_before_key_exchange* {.bitsize: 1'i64.}: cuint
    ech*: struct_st_ptls_handshake_properties_t_anon0_t_client_t_ech_t
  struct_st_ptls_handshake_properties_t_anon0_t_server_t_selected_psk_binder_t {.
      pure, inheritable, bycopy.} = object
    base*: array[64'i64, uint8]
    len*: csize_t
  struct_st_ptls_handshake_properties_t_anon0_t_server_t_cookie_t {.pure,
      inheritable, bycopy.} = object
    key*: pointer
    additional_data*: ptls_iovec_t_553648855
  struct_st_ptls_handshake_properties_t_anon0_t_server_t {.pure, inheritable,
      bycopy.} = object
    selected_psk_binder*: struct_st_ptls_handshake_properties_t_anon0_t_server_t_selected_psk_binder_t
    cookie*: struct_st_ptls_handshake_properties_t_anon0_t_server_t_cookie_t
    enforce_retry* {.bitsize: 1'i64.}: cuint
    retry_uses_cookie* {.bitsize: 1'i64.}: cuint
  struct_st_ptls_handshake_properties_t_anon0_t {.union, bycopy.} = object
    client*: struct_st_ptls_handshake_properties_t_anon0_t_client_t
    server*: struct_st_ptls_handshake_properties_t_anon0_t_server_t
  struct_st_ptls_handshake_properties_t_553648996 {.pure, inheritable, bycopy.} = object
    anon0*: struct_st_ptls_handshake_properties_t_anon0_t ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:1078:16
    additional_extensions*: ptr ptls_raw_extension_t_553648991
    collect_extension*: proc (a0: ptr ptls_t_553648845;
                              a1: ptr struct_st_ptls_handshake_properties_t_553648997;
                              a2: uint16): cint {.cdecl.}
    collected_extensions*: proc (a0: ptr ptls_t_553648845;
                                 a1: ptr struct_st_ptls_handshake_properties_t_553648997;
                                 a2: ptr ptls_raw_extension_t_553648991): cint {.
        cdecl.}
  ptls_handshake_properties_t_553648998 = struct_st_ptls_handshake_properties_t_553648997 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:1167:3
  struct_st_ptls_log_state_t_553649000 {.pure, inheritable, bycopy.} = object
    active_conns*: uint32    ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:1492:8
    generation*: uint64
  struct_st_ptls_log_point_t_553649002 {.pure, inheritable, bycopy.} = object
    name*: cstring           ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:1506:8
    state*: struct_st_ptls_log_state_t_553649001
  struct_st_ptls_log_conn_state_t_553649004 {.pure, inheritable, bycopy.} = object
    random_private*: cfloat  ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:1514:16
    address*: struct_in6_addr_553649007
    state*: struct_st_ptls_log_state_t_553649001
  struct_in6_addr_compiler_in6_u_t {.union, bycopy.} = object
    compiler_u6_addr8*: array[16'i64, uint8]
    compiler_u6_addr16*: array[8'i64, uint16]
    compiler_u6_addr32*: array[4'i64, uint32]
  struct_in6_addr_553649006 {.pure, inheritable, bycopy.} = object
    compiler_in6_u*: struct_in6_addr_compiler_in6_u_t ## Generated based on /usr/include/netinet/in.h:221:8
  ptls_log_conn_state_t_553649008 = struct_st_ptls_log_conn_state_t_553649005 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:1525:3
  struct_st_ptls_log_t_553649010 {.pure, inheritable, bycopy.} = object
    may_include_appdata* {.bitsize: 1'i64.}: cuint ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:1535:15
    dummy_conn_state*: ptls_log_conn_state_t_553649009
    internal_generation*: uint64
  struct_in_addr_553649012 {.pure, inheritable, bycopy.} = object
    s_addr*: in_addr_t_553649065 ## Generated based on /usr/include/netinet/in.h:31:8
  EVP_PKEY_553649014 = struct_evp_pkey_st ## Generated based on /usr/include/openssl/types.h:107:28
  struct_st_ptls_openssl_signature_scheme_t_553649016 {.pure, inheritable,
      bycopy.} = object
    scheme_id*: uint16       ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:150:16
    scheme_md*: proc (): ptr EVP_MD_553649019 {.cdecl.}
  EVP_MD_553649018 = struct_evp_md_st ## Generated based on /usr/include/openssl/types.h:103:26
  ptls_openssl_signature_scheme_t_553649020 = struct_st_ptls_openssl_signature_scheme_t_553649017 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:153:3
  struct_st_ptls_openssl_sign_certificate_t_553649022 {.pure, inheritable,
      bycopy.} = object
    super*: ptls_sign_certificate_t_553648949 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:165:16
    key*: ptr EVP_PKEY_553649015
    schemes*: ptr ptls_openssl_signature_scheme_t_553649021
    async* {.bitsize: 1'i64.}: cuint
  ptls_openssl_sign_certificate_t_553649024 = struct_st_ptls_openssl_sign_certificate_t_553649023 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:177:3
  X509_553649026 = struct_x509_st ## Generated based on /usr/include/openssl/types.h:157:24
  struct_st_ptls_openssl_raw_pubkey_verify_certificate_t_553649028 {.pure,
      inheritable, bycopy.} = object
    super*: ptls_verify_certificate_t_553648953 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:183:16
    expected_pubkey*: ptr EVP_PKEY_553649015
  ptls_openssl_raw_pubkey_verify_certificate_t_553649030 = struct_st_ptls_openssl_raw_pubkey_verify_certificate_t_553649029 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:186:3
  struct_st_ptls_openssl_override_verify_certificate_t_553649032 {.pure,
      inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_openssl_override_verify_certificate_t_553649033;
               a1: ptr ptls_t_553648845; a2: cint; a3: cint; a4: ptr X509_553649027;
               a5: ptr struct_stack_st_X509): cint {.cdecl.} ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:195:1
  ptls_openssl_override_verify_certificate_t_553649034 = struct_st_ptls_openssl_override_verify_certificate_t_553649033 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:195:1
  struct_st_ptls_openssl_verify_certificate_t_553649036 {.pure, inheritable,
      bycopy.} = object
    super*: ptls_verify_certificate_t_553648953 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:198:16
    cert_store*: ptr X509_STORE_553649039
    override_callback*: ptr ptls_openssl_override_verify_certificate_t_553649035
  X509_STORE_553649038 = struct_x509_store_st ## Generated based on /usr/include/openssl/types.h:164:30
  ptls_openssl_verify_certificate_t_553649040 = struct_st_ptls_openssl_verify_certificate_t_553649037 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:202:3
  EVP_CIPHER_CTX_553649042 = struct_evp_cipher_ctx_st ## Generated based on /usr/include/openssl/types.h:102:34
  HMAC_CTX_553649044 = struct_hmac_ctx_st ## Generated based on /usr/include/openssl/types.h:132:28
  EVP_MAC_CTX_553649046 = struct_evp_mac_ctx_st ## Generated based on /usr/include/openssl/types.h:106:31
  struct_ngtcp2_crypto_picotls_ctx_553649048 {.pure, inheritable, bycopy.} = object
    ptls*: ptr ptls_t_553648845 ## Generated based on /nim-ngtcp2/libs/ngtcp2/crypto/includes/ngtcp2/ngtcp2_crypto_picotls.h:43:16
    handshake_properties*: ptls_handshake_properties_t_553648999
  ngtcp2_crypto_picotls_ctx_553649050 = struct_ngtcp2_crypto_picotls_ctx_553649049 ## Generated based on /nim-ngtcp2/libs/ngtcp2/crypto/includes/ngtcp2/ngtcp2_crypto_picotls.h:53:3
  struct_ptls_cred_buffer_s_553649052 {.pure, inheritable, bycopy.} = object
    base*: cstring           ## Generated based on /home/andrew/opensource/Vac/nim-ngtcp2/build/lib/includes/utils/cred_buffer.h:8:16
    len*: csize_t
    off*: csize_t
    owns_base*: cint
  ptls_cred_buffer_t_553649054 = struct_ptls_cred_buffer_s_553649053 ## Generated based on /home/andrew/opensource/Vac/nim-ngtcp2/build/lib/includes/utils/cred_buffer.h:16:3
  sa_family_t_553649056 = cushort ## Generated based on /usr/include/x86_64-linux-gnu/bits/sockaddr.h:28:28
  in_port_t_553649058 = uint16 ## Generated based on /usr/include/netinet/in.h:125:18
  compiler_socklen_t_553649060 = cuint ## Generated based on /usr/include/x86_64-linux-gnu/bits/types.h:210:23
  compiler_ssize_t_553649062 = clong ## Generated based on /usr/include/x86_64-linux-gnu/bits/types.h:194:27
  in_addr_t_553649064 = uint32 ## Generated based on /usr/include/netinet/in.h:30:18
  ptls_hpke_kem_t_553648913 = (when declared(ptls_hpke_kem_t):
    when ownSizeof(ptls_hpke_kem_t) != ownSizeof(ptls_hpke_kem_t_553648912):
      static :
        warning("Declaration of " & "ptls_hpke_kem_t" &
            " exists but with different size")
    ptls_hpke_kem_t
  else:
    ptls_hpke_kem_t_553648912)
  ngtcp2_recv_retry_553648755 = (when declared(ngtcp2_recv_retry):
    when ownSizeof(ngtcp2_recv_retry) != ownSizeof(ngtcp2_recv_retry_553648754):
      static :
        warning("Declaration of " & "ngtcp2_recv_retry" &
            " exists but with different size")
    ngtcp2_recv_retry
  else:
    ngtcp2_recv_retry_553648754)
  X509_553649027 = (when declared(X509):
    when ownSizeof(X509) != ownSizeof(X509_553649026):
      static :
        warning("Declaration of " & "X509" & " exists but with different size")
    X509
  else:
    X509_553649026)
  ngtcp2_sockaddr_in_553648638 = (when declared(ngtcp2_sockaddr_in):
    when ownSizeof(ngtcp2_sockaddr_in) != ownSizeof(ngtcp2_sockaddr_in_553648637):
      static :
        warning("Declaration of " & "ngtcp2_sockaddr_in" &
            " exists but with different size")
    ngtcp2_sockaddr_in
  else:
    ngtcp2_sockaddr_in_553648637)
  ptls_message_emitter_t_553648909 = (when declared(ptls_message_emitter_t):
    when ownSizeof(ptls_message_emitter_t) != ownSizeof(ptls_message_emitter_t_553648908):
      static :
        warning("Declaration of " & "ptls_message_emitter_t" &
            " exists but with different size")
    ptls_message_emitter_t
  else:
    ptls_message_emitter_t_553648908)
  struct_st_ptls_verify_certificate_t_553648951 = (when declared(
      struct_st_ptls_verify_certificate_t):
    when ownSizeof(struct_st_ptls_verify_certificate_t) !=
        ownSizeof(struct_st_ptls_verify_certificate_t_553648950):
      static :
        warning("Declaration of " & "struct_st_ptls_verify_certificate_t" &
            " exists but with different size")
    struct_st_ptls_verify_certificate_t
  else:
    struct_st_ptls_verify_certificate_t_553648950)
  struct_ngtcp2_transport_params_553648662 = (when declared(
      struct_ngtcp2_transport_params):
    when ownSizeof(struct_ngtcp2_transport_params) !=
        ownSizeof(struct_ngtcp2_transport_params_553648661):
      static :
        warning("Declaration of " & "struct_ngtcp2_transport_params" &
            " exists but with different size")
    struct_ngtcp2_transport_params
  else:
    struct_ngtcp2_transport_params_553648661)
  EVP_MAC_CTX_553649047 = (when declared(EVP_MAC_CTX):
    when ownSizeof(EVP_MAC_CTX) != ownSizeof(EVP_MAC_CTX_553649046):
      static :
        warning("Declaration of " & "EVP_MAC_CTX" &
            " exists but with different size")
    EVP_MAC_CTX
  else:
    EVP_MAC_CTX_553649046)
  struct_st_ptls_log_state_t_553649001 = (when declared(
      struct_st_ptls_log_state_t):
    when ownSizeof(struct_st_ptls_log_state_t) !=
        ownSizeof(struct_st_ptls_log_state_t_553649000):
      static :
        warning("Declaration of " & "struct_st_ptls_log_state_t" &
            " exists but with different size")
    struct_st_ptls_log_state_t
  else:
    struct_st_ptls_log_state_t_553649000)
  struct_st_ptls_client_hello_psk_identity_t_553648923 = (when declared(
      struct_st_ptls_client_hello_psk_identity_t):
    when ownSizeof(struct_st_ptls_client_hello_psk_identity_t) !=
        ownSizeof(struct_st_ptls_client_hello_psk_identity_t_553648922):
      static :
        warning("Declaration of " & "struct_st_ptls_client_hello_psk_identity_t" &
            " exists but with different size")
    struct_st_ptls_client_hello_psk_identity_t
  else:
    struct_st_ptls_client_hello_psk_identity_t_553648922)
  ptls_emit_certificate_t_553648941 = (when declared(ptls_emit_certificate_t):
    when ownSizeof(ptls_emit_certificate_t) !=
        ownSizeof(ptls_emit_certificate_t_553648940):
      static :
        warning("Declaration of " & "ptls_emit_certificate_t" &
            " exists but with different size")
    ptls_emit_certificate_t
  else:
    ptls_emit_certificate_t_553648940)
  ngtcp2_path_validation_result_553648612 = (when declared(
      ngtcp2_path_validation_result):
    when ownSizeof(ngtcp2_path_validation_result) !=
        ownSizeof(ngtcp2_path_validation_result_553648611):
      static :
        warning("Declaration of " & "ngtcp2_path_validation_result" &
            " exists but with different size")
    ngtcp2_path_validation_result
  else:
    ngtcp2_path_validation_result_553648611)
  ngtcp2_ack_datagram_553648805 = (when declared(ngtcp2_ack_datagram):
    when ownSizeof(ngtcp2_ack_datagram) != ownSizeof(ngtcp2_ack_datagram_553648804):
      static :
        warning("Declaration of " & "ngtcp2_ack_datagram" &
            " exists but with different size")
    ngtcp2_ack_datagram
  else:
    ngtcp2_ack_datagram_553648804)
  ngtcp2_info_553648837 = (when declared(ngtcp2_info):
    when ownSizeof(ngtcp2_info) != ownSizeof(ngtcp2_info_553648836):
      static :
        warning("Declaration of " & "ngtcp2_info" &
            " exists but with different size")
    ngtcp2_info
  else:
    ngtcp2_info_553648836)
  struct_st_ptls_cipher_suite_t_553648903 = (when declared(
      struct_st_ptls_cipher_suite_t):
    when ownSizeof(struct_st_ptls_cipher_suite_t) !=
        ownSizeof(struct_st_ptls_cipher_suite_t_553648902):
      static :
        warning("Declaration of " & "struct_st_ptls_cipher_suite_t" &
            " exists but with different size")
    struct_st_ptls_cipher_suite_t
  else:
    struct_st_ptls_cipher_suite_t_553648902)
  struct_ngtcp2_crypto_picotls_ctx_553649049 = (when declared(
      struct_ngtcp2_crypto_picotls_ctx):
    when ownSizeof(struct_ngtcp2_crypto_picotls_ctx) !=
        ownSizeof(struct_ngtcp2_crypto_picotls_ctx_553649048):
      static :
        warning("Declaration of " & "struct_ngtcp2_crypto_picotls_ctx" &
            " exists but with different size")
    struct_ngtcp2_crypto_picotls_ctx
  else:
    struct_ngtcp2_crypto_picotls_ctx_553649048)
  struct_st_ptls_on_client_hello_t_553648935 = (when declared(
      struct_st_ptls_on_client_hello_t):
    when ownSizeof(struct_st_ptls_on_client_hello_t) !=
        ownSizeof(struct_st_ptls_on_client_hello_t_553648934):
      static :
        warning("Declaration of " & "struct_st_ptls_on_client_hello_t" &
            " exists but with different size")
    struct_st_ptls_on_client_hello_t
  else:
    struct_st_ptls_on_client_hello_t_553648934)
  ngtcp2_stream_close_553648767 = (when declared(ngtcp2_stream_close):
    when ownSizeof(ngtcp2_stream_close) != ownSizeof(ngtcp2_stream_close_553648766):
      static :
        warning("Declaration of " & "ngtcp2_stream_close" &
            " exists but with different size")
    ngtcp2_stream_close
  else:
    ngtcp2_stream_close_553648766)
  X509_STORE_553649039 = (when declared(X509_STORE):
    when ownSizeof(X509_STORE) != ownSizeof(X509_STORE_553649038):
      static :
        warning("Declaration of " & "X509_STORE" &
            " exists but with different size")
    X509_STORE
  else:
    X509_STORE_553649038)
  struct_ngtcp2_callbacks_553648819 = (when declared(struct_ngtcp2_callbacks):
    when ownSizeof(struct_ngtcp2_callbacks) !=
        ownSizeof(struct_ngtcp2_callbacks_553648818):
      static :
        warning("Declaration of " & "struct_ngtcp2_callbacks" &
            " exists but with different size")
    struct_ngtcp2_callbacks
  else:
    struct_ngtcp2_callbacks_553648818)
  struct_ngtcp2_info_553648835 = (when declared(struct_ngtcp2_info):
    when ownSizeof(struct_ngtcp2_info) != ownSizeof(struct_ngtcp2_info_553648834):
      static :
        warning("Declaration of " & "struct_ngtcp2_info" &
            " exists but with different size")
    struct_ngtcp2_info
  else:
    struct_ngtcp2_info_553648834)
  ngtcp2_delete_crypto_aead_ctx_553648799 = (when declared(
      ngtcp2_delete_crypto_aead_ctx):
    when ownSizeof(ngtcp2_delete_crypto_aead_ctx) !=
        ownSizeof(ngtcp2_delete_crypto_aead_ctx_553648798):
      static :
        warning("Declaration of " & "ngtcp2_delete_crypto_aead_ctx" &
            " exists but with different size")
    ngtcp2_delete_crypto_aead_ctx
  else:
    ngtcp2_delete_crypto_aead_ctx_553648798)
  ptls_get_time_t_553648933 = (when declared(ptls_get_time_t):
    when ownSizeof(ptls_get_time_t) != ownSizeof(ptls_get_time_t_553648932):
      static :
        warning("Declaration of " & "ptls_get_time_t" &
            " exists but with different size")
    ptls_get_time_t
  else:
    ptls_get_time_t_553648932)
  ngtcp2_select_preferred_addr_553648789 = (when declared(
      ngtcp2_select_preferred_addr):
    when ownSizeof(ngtcp2_select_preferred_addr) !=
        ownSizeof(ngtcp2_select_preferred_addr_553648788):
      static :
        warning("Declaration of " & "ngtcp2_select_preferred_addr" &
            " exists but with different size")
    ngtcp2_select_preferred_addr
  else:
    ngtcp2_select_preferred_addr_553648788)
  ptls_update_traffic_key_t_553648975 = (when declared(ptls_update_traffic_key_t):
    when ownSizeof(ptls_update_traffic_key_t) !=
        ownSizeof(ptls_update_traffic_key_t_553648974):
      static :
        warning("Declaration of " & "ptls_update_traffic_key_t" &
            " exists but with different size")
    ptls_update_traffic_key_t
  else:
    ptls_update_traffic_key_t_553648974)
  struct_st_ptls_log_t_553649011 = (when declared(struct_st_ptls_log_t):
    when ownSizeof(struct_st_ptls_log_t) != ownSizeof(struct_st_ptls_log_t_553649010):
      static :
        warning("Declaration of " & "struct_st_ptls_log_t" &
            " exists but with different size")
    struct_st_ptls_log_t
  else:
    struct_st_ptls_log_t_553649010)
  struct_ngtcp2_version_info_553648658 = (when declared(
      struct_ngtcp2_version_info):
    when ownSizeof(struct_ngtcp2_version_info) !=
        ownSizeof(struct_ngtcp2_version_info_553648657):
      static :
        warning("Declaration of " & "struct_ngtcp2_version_info" &
            " exists but with different size")
    struct_ngtcp2_version_info
  else:
    struct_ngtcp2_version_info_553648657)
  enum_en_ptls_hash_final_mode_t_553648891 = (when declared(
      enum_en_ptls_hash_final_mode_t):
    when ownSizeof(enum_en_ptls_hash_final_mode_t) !=
        ownSizeof(enum_en_ptls_hash_final_mode_t_553648890):
      static :
        warning("Declaration of " & "enum_en_ptls_hash_final_mode_t" &
            " exists but with different size")
    enum_en_ptls_hash_final_mode_t
  else:
    enum_en_ptls_hash_final_mode_t_553648890)
  ngtcp2_encryption_level_553648745 = (when declared(ngtcp2_encryption_level):
    when ownSizeof(ngtcp2_encryption_level) !=
        ownSizeof(ngtcp2_encryption_level_553648744):
      static :
        warning("Declaration of " & "ngtcp2_encryption_level" &
            " exists but with different size")
    ngtcp2_encryption_level
  else:
    ngtcp2_encryption_level_553648744)
  struct_st_ptls_update_open_count_t_553648967 = (when declared(
      struct_st_ptls_update_open_count_t):
    when ownSizeof(struct_st_ptls_update_open_count_t) !=
        ownSizeof(struct_st_ptls_update_open_count_t_553648966):
      static :
        warning("Declaration of " & "struct_st_ptls_update_open_count_t" &
            " exists but with different size")
    struct_st_ptls_update_open_count_t
  else:
    struct_st_ptls_update_open_count_t_553648966)
  ngtcp2_malloc_553648590 = (when declared(ngtcp2_malloc):
    when ownSizeof(ngtcp2_malloc) != ownSizeof(ngtcp2_malloc_553648589):
      static :
        warning("Declaration of " & "ngtcp2_malloc" &
            " exists but with different size")
    ngtcp2_malloc
  else:
    ngtcp2_malloc_553648589)
  struct_ngtcp2_pkt_hd_553648626 = (when declared(struct_ngtcp2_pkt_hd):
    when ownSizeof(struct_ngtcp2_pkt_hd) != ownSizeof(struct_ngtcp2_pkt_hd_553648625):
      static :
        warning("Declaration of " & "struct_ngtcp2_pkt_hd" &
            " exists but with different size")
    struct_ngtcp2_pkt_hd
  else:
    struct_ngtcp2_pkt_hd_553648625)
  ngtcp2_conn_553648737 = (when declared(ngtcp2_conn):
    when ownSizeof(ngtcp2_conn) != ownSizeof(ngtcp2_conn_553648736):
      static :
        warning("Declaration of " & "ngtcp2_conn" &
            " exists but with different size")
    ngtcp2_conn
  else:
    ngtcp2_conn_553648736)
  ngtcp2_connection_id_status_553648795 = (when declared(
      ngtcp2_connection_id_status):
    when ownSizeof(ngtcp2_connection_id_status) !=
        ownSizeof(ngtcp2_connection_id_status_553648794):
      static :
        warning("Declaration of " & "ngtcp2_connection_id_status" &
            " exists but with different size")
    ngtcp2_connection_id_status
  else:
    ngtcp2_connection_id_status_553648794)
  ngtcp2_recv_key_553648815 = (when declared(ngtcp2_recv_key):
    when ownSizeof(ngtcp2_recv_key) != ownSizeof(ngtcp2_recv_key_553648814):
      static :
        warning("Declaration of " & "ngtcp2_recv_key" &
            " exists but with different size")
    ngtcp2_recv_key
  else:
    ngtcp2_recv_key_553648814)
  ptls_key_exchange_context_t_553648865 = (when declared(
      ptls_key_exchange_context_t):
    when ownSizeof(ptls_key_exchange_context_t) !=
        ownSizeof(ptls_key_exchange_context_t_553648864):
      static :
        warning("Declaration of " & "ptls_key_exchange_context_t" &
            " exists but with different size")
    ptls_key_exchange_context_t
  else:
    ptls_key_exchange_context_t_553648864)
  struct_ngtcp2_crypto_aead_ctx_553648721 = (when declared(
      struct_ngtcp2_crypto_aead_ctx):
    when ownSizeof(struct_ngtcp2_crypto_aead_ctx) !=
        ownSizeof(struct_ngtcp2_crypto_aead_ctx_553648720):
      static :
        warning("Declaration of " & "struct_ngtcp2_crypto_aead_ctx" &
            " exists but with different size")
    struct_ngtcp2_crypto_aead_ctx
  else:
    struct_ngtcp2_crypto_aead_ctx_553648720)
  ptls_ech_create_opener_t_553648987 = (when declared(ptls_ech_create_opener_t):
    when ownSizeof(ptls_ech_create_opener_t) !=
        ownSizeof(ptls_ech_create_opener_t_553648986):
      static :
        warning("Declaration of " & "ptls_ech_create_opener_t" &
            " exists but with different size")
    ptls_ech_create_opener_t
  else:
    ptls_ech_create_opener_t_553648986)
  struct_st_ptls_sign_certificate_t_553648947 = (when declared(
      struct_st_ptls_sign_certificate_t):
    when ownSizeof(struct_st_ptls_sign_certificate_t) !=
        ownSizeof(struct_st_ptls_sign_certificate_t_553648946):
      static :
        warning("Declaration of " & "struct_st_ptls_sign_certificate_t" &
            " exists but with different size")
    struct_st_ptls_sign_certificate_t
  else:
    struct_st_ptls_sign_certificate_t_553648946)
  ngtcp2_duration_553648616 = (when declared(ngtcp2_duration):
    when ownSizeof(ngtcp2_duration) != ownSizeof(ngtcp2_duration_553648615):
      static :
        warning("Declaration of " & "ngtcp2_duration" &
            " exists but with different size")
    ngtcp2_duration
  else:
    ngtcp2_duration_553648615)
  struct_sockaddr_in_553648640 = (when declared(struct_sockaddr_in):
    when ownSizeof(struct_sockaddr_in) != ownSizeof(struct_sockaddr_in_553648639):
      static :
        warning("Declaration of " & "struct_sockaddr_in" &
            " exists but with different size")
    struct_sockaddr_in
  else:
    struct_sockaddr_in_553648639)
  compiler_socklen_t_553649061 = (when declared(compiler_socklen_t):
    when ownSizeof(compiler_socklen_t) != ownSizeof(compiler_socklen_t_553649060):
      static :
        warning("Declaration of " & "compiler_socklen_t" &
            " exists but with different size")
    compiler_socklen_t
  else:
    compiler_socklen_t_553649060)
  ngtcp2_cc_algo_553648679 = (when declared(ngtcp2_cc_algo):
    when ownSizeof(ngtcp2_cc_algo) != ownSizeof(ngtcp2_cc_algo_553648678):
      static :
        warning("Declaration of " & "ngtcp2_cc_algo" &
            " exists but with different size")
    ngtcp2_cc_algo
  else:
    ngtcp2_cc_algo_553648678)
  ngtcp2_crypto_md_553648711 = (when declared(ngtcp2_crypto_md):
    when ownSizeof(ngtcp2_crypto_md) != ownSizeof(ngtcp2_crypto_md_553648710):
      static :
        warning("Declaration of " & "ngtcp2_crypto_md" &
            " exists but with different size")
    ngtcp2_crypto_md
  else:
    ngtcp2_crypto_md_553648710)
  struct_st_ptls_raw_extension_t_553648989 = (when declared(
      struct_st_ptls_raw_extension_t):
    when ownSizeof(struct_st_ptls_raw_extension_t) !=
        ownSizeof(struct_st_ptls_raw_extension_t_553648988):
      static :
        warning("Declaration of " & "struct_st_ptls_raw_extension_t" &
            " exists but with different size")
    struct_st_ptls_raw_extension_t
  else:
    struct_st_ptls_raw_extension_t_553648988)
  struct_ngtcp2_path_553648701 = (when declared(struct_ngtcp2_path):
    when ownSizeof(struct_ngtcp2_path) != ownSizeof(struct_ngtcp2_path_553648700):
      static :
        warning("Declaration of " & "struct_ngtcp2_path" &
            " exists but with different size")
    struct_ngtcp2_path
  else:
    struct_ngtcp2_path_553648700)
  ngtcp2_decrypt_553648759 = (when declared(ngtcp2_decrypt):
    when ownSizeof(ngtcp2_decrypt) != ownSizeof(ngtcp2_decrypt_553648758):
      static :
        warning("Declaration of " & "ngtcp2_decrypt" &
            " exists but with different size")
    ngtcp2_decrypt
  else:
    ngtcp2_decrypt_553648758)
  ngtcp2_tstamp_553648614 = (when declared(ngtcp2_tstamp):
    when ownSizeof(ngtcp2_tstamp) != ownSizeof(ngtcp2_tstamp_553648613):
      static :
        warning("Declaration of " & "ngtcp2_tstamp" &
            " exists but with different size")
    ngtcp2_tstamp
  else:
    ngtcp2_tstamp_553648613)
  struct_st_ptls_key_exchange_context_t_553648861 = (when declared(
      struct_st_ptls_key_exchange_context_t):
    when ownSizeof(struct_st_ptls_key_exchange_context_t) !=
        ownSizeof(struct_st_ptls_key_exchange_context_t_553648860):
      static :
        warning("Declaration of " & "struct_st_ptls_key_exchange_context_t" &
            " exists but with different size")
    struct_st_ptls_key_exchange_context_t
  else:
    struct_st_ptls_key_exchange_context_t_553648860)
  ngtcp2_crypto_conn_ref_553648839 = (when declared(ngtcp2_crypto_conn_ref):
    when ownSizeof(ngtcp2_crypto_conn_ref) != ownSizeof(ngtcp2_crypto_conn_ref_553648838):
      static :
        warning("Declaration of " & "ngtcp2_crypto_conn_ref" &
            " exists but with different size")
    ngtcp2_crypto_conn_ref
  else:
    ngtcp2_crypto_conn_ref_553648838)
  ptls_raw_extension_t_553648991 = (when declared(ptls_raw_extension_t):
    when ownSizeof(ptls_raw_extension_t) != ownSizeof(ptls_raw_extension_t_553648990):
      static :
        warning("Declaration of " & "ptls_raw_extension_t" &
            " exists but with different size")
    ptls_raw_extension_t
  else:
    ptls_raw_extension_t_553648990)
  ngtcp2_recv_version_negotiation_553648753 = (when declared(
      ngtcp2_recv_version_negotiation):
    when ownSizeof(ngtcp2_recv_version_negotiation) !=
        ownSizeof(ngtcp2_recv_version_negotiation_553648752):
      static :
        warning("Declaration of " & "ngtcp2_recv_version_negotiation" &
            " exists but with different size")
    ngtcp2_recv_version_negotiation
  else:
    ngtcp2_recv_version_negotiation_553648752)
  ptls_on_extension_t_553648979 = (when declared(ptls_on_extension_t):
    when ownSizeof(ptls_on_extension_t) != ownSizeof(ptls_on_extension_t_553648978):
      static :
        warning("Declaration of " & "ptls_on_extension_t" &
            " exists but with different size")
    ptls_on_extension_t
  else:
    ptls_on_extension_t_553648978)
  ptls_openssl_sign_certificate_t_553649025 = (when declared(
      ptls_openssl_sign_certificate_t):
    when ownSizeof(ptls_openssl_sign_certificate_t) !=
        ownSizeof(ptls_openssl_sign_certificate_t_553649024):
      static :
        warning("Declaration of " & "ptls_openssl_sign_certificate_t" &
            " exists but with different size")
    ptls_openssl_sign_certificate_t
  else:
    ptls_openssl_sign_certificate_t_553649024)
  struct_st_ptls_hpke_cipher_suite_id_t_553648915 = (when declared(
      struct_st_ptls_hpke_cipher_suite_id_t):
    when ownSizeof(struct_st_ptls_hpke_cipher_suite_id_t) !=
        ownSizeof(struct_st_ptls_hpke_cipher_suite_id_t_553648914):
      static :
        warning("Declaration of " & "struct_st_ptls_hpke_cipher_suite_id_t" &
            " exists but with different size")
    struct_st_ptls_hpke_cipher_suite_id_t
  else:
    struct_st_ptls_hpke_cipher_suite_id_t_553648914)
  struct_st_ptls_aead_supplementary_encryption_t_553648879 = (when declared(
      struct_st_ptls_aead_supplementary_encryption_t):
    when ownSizeof(struct_st_ptls_aead_supplementary_encryption_t) !=
        ownSizeof(struct_st_ptls_aead_supplementary_encryption_t_553648878):
      static :
        warning("Declaration of " &
            "struct_st_ptls_aead_supplementary_encryption_t" &
            " exists but with different size")
    struct_st_ptls_aead_supplementary_encryption_t
  else:
    struct_st_ptls_aead_supplementary_encryption_t_553648878)
  ngtcp2_crypto_aead_553648715 = (when declared(ngtcp2_crypto_aead):
    when ownSizeof(ngtcp2_crypto_aead) != ownSizeof(ngtcp2_crypto_aead_553648714):
      static :
        warning("Declaration of " & "ngtcp2_crypto_aead" &
            " exists but with different size")
    ngtcp2_crypto_aead
  else:
    ngtcp2_crypto_aead_553648714)
  struct_ptls_cred_buffer_s_553649053 = (when declared(struct_ptls_cred_buffer_s):
    when ownSizeof(struct_ptls_cred_buffer_s) !=
        ownSizeof(struct_ptls_cred_buffer_s_553649052):
      static :
        warning("Declaration of " & "struct_ptls_cred_buffer_s" &
            " exists but with different size")
    struct_ptls_cred_buffer_s
  else:
    struct_ptls_cred_buffer_s_553649052)
  ptls_key_schedule_t_553648851 = (when declared(ptls_key_schedule_t):
    when ownSizeof(ptls_key_schedule_t) != ownSizeof(ptls_key_schedule_t_553648850):
      static :
        warning("Declaration of " & "ptls_key_schedule_t" &
            " exists but with different size")
    ptls_key_schedule_t
  else:
    ptls_key_schedule_t_553648850)
  ptls_verify_certificate_t_553648953 = (when declared(ptls_verify_certificate_t):
    when ownSizeof(ptls_verify_certificate_t) !=
        ownSizeof(ptls_verify_certificate_t_553648952):
      static :
        warning("Declaration of " & "ptls_verify_certificate_t" &
            " exists but with different size")
    ptls_verify_certificate_t
  else:
    ptls_verify_certificate_t_553648952)
  ptls_encrypt_ticket_t_553648957 = (when declared(ptls_encrypt_ticket_t):
    when ownSizeof(ptls_encrypt_ticket_t) != ownSizeof(ptls_encrypt_ticket_t_553648956):
      static :
        warning("Declaration of " & "ptls_encrypt_ticket_t" &
            " exists but with different size")
    ptls_encrypt_ticket_t
  else:
    ptls_encrypt_ticket_t_553648956)
  ngtcp2_settings_553648695 = (when declared(ngtcp2_settings):
    when ownSizeof(ngtcp2_settings) != ownSizeof(ngtcp2_settings_553648694):
      static :
        warning("Declaration of " & "ngtcp2_settings" &
            " exists but with different size")
    ngtcp2_settings
  else:
    ngtcp2_settings_553648694)
  struct_st_ptls_get_time_t_553648931 = (when declared(struct_st_ptls_get_time_t):
    when ownSizeof(struct_st_ptls_get_time_t) !=
        ownSizeof(struct_st_ptls_get_time_t_553648930):
      static :
        warning("Declaration of " & "struct_st_ptls_get_time_t" &
            " exists but with different size")
    struct_st_ptls_get_time_t
  else:
    struct_st_ptls_get_time_t_553648930)
  ptls_async_job_t_553648945 = (when declared(ptls_async_job_t):
    when ownSizeof(ptls_async_job_t) != ownSizeof(ptls_async_job_t_553648944):
      static :
        warning("Declaration of " & "ptls_async_job_t" &
            " exists but with different size")
    ptls_async_job_t
  else:
    ptls_async_job_t_553648944)
  struct_st_ptls_log_conn_state_t_553649005 = (when declared(
      struct_st_ptls_log_conn_state_t):
    when ownSizeof(struct_st_ptls_log_conn_state_t) !=
        ownSizeof(struct_st_ptls_log_conn_state_t_553649004):
      static :
        warning("Declaration of " & "struct_st_ptls_log_conn_state_t" &
            " exists but with different size")
    struct_st_ptls_log_conn_state_t
  else:
    struct_st_ptls_log_conn_state_t_553649004)
  struct_st_ptls_key_exchange_algorithm_t_553648863 = (when declared(
      struct_st_ptls_key_exchange_algorithm_t):
    when ownSizeof(struct_st_ptls_key_exchange_algorithm_t) !=
        ownSizeof(struct_st_ptls_key_exchange_algorithm_t_553648862):
      static :
        warning("Declaration of " & "struct_st_ptls_key_exchange_algorithm_t" &
            " exists but with different size")
    struct_st_ptls_key_exchange_algorithm_t
  else:
    struct_st_ptls_key_exchange_algorithm_t_553648862)
  ngtcp2_hp_mask_553648761 = (when declared(ngtcp2_hp_mask):
    when ownSizeof(ngtcp2_hp_mask) != ownSizeof(ngtcp2_hp_mask_553648760):
      static :
        warning("Declaration of " & "ngtcp2_hp_mask" &
            " exists but with different size")
    ngtcp2_hp_mask
  else:
    ngtcp2_hp_mask_553648760)
  EVP_MD_553649019 = (when declared(EVP_MD):
    when ownSizeof(EVP_MD) != ownSizeof(EVP_MD_553649018):
      static :
        warning("Declaration of " & "EVP_MD" & " exists but with different size")
    EVP_MD
  else:
    EVP_MD_553649018)
  ptls_client_hello_psk_identity_t_553648925 = (when declared(
      ptls_client_hello_psk_identity_t):
    when ownSizeof(ptls_client_hello_psk_identity_t) !=
        ownSizeof(ptls_client_hello_psk_identity_t_553648924):
      static :
        warning("Declaration of " & "ptls_client_hello_psk_identity_t" &
            " exists but with different size")
    ptls_client_hello_psk_identity_t
  else:
    ptls_client_hello_psk_identity_t_553648924)
  struct_st_ptls_log_event_t_553648963 = (when declared(
      struct_st_ptls_log_event_t):
    when ownSizeof(struct_st_ptls_log_event_t) !=
        ownSizeof(struct_st_ptls_log_event_t_553648962):
      static :
        warning("Declaration of " & "struct_st_ptls_log_event_t" &
            " exists but with different size")
    struct_st_ptls_log_event_t
  else:
    struct_st_ptls_log_event_t_553648962)
  ngtcp2_recv_new_token_553648797 = (when declared(ngtcp2_recv_new_token):
    when ownSizeof(ngtcp2_recv_new_token) != ownSizeof(ngtcp2_recv_new_token_553648796):
      static :
        warning("Declaration of " & "ngtcp2_recv_new_token" &
            " exists but with different size")
    ngtcp2_recv_new_token
  else:
    ngtcp2_recv_new_token_553648796)
  enum_en_ptls_early_data_acceptance_t_553648993 = (when declared(
      enum_en_ptls_early_data_acceptance_t):
    when ownSizeof(enum_en_ptls_early_data_acceptance_t) !=
        ownSizeof(enum_en_ptls_early_data_acceptance_t_553648992):
      static :
        warning("Declaration of " & "enum_en_ptls_early_data_acceptance_t" &
            " exists but with different size")
    enum_en_ptls_early_data_acceptance_t
  else:
    enum_en_ptls_early_data_acceptance_t_553648992)
  enum_ngtcp2_path_validation_result_553648610 = (when declared(
      enum_ngtcp2_path_validation_result):
    when ownSizeof(enum_ngtcp2_path_validation_result) !=
        ownSizeof(enum_ngtcp2_path_validation_result_553648609):
      static :
        warning("Declaration of " & "enum_ngtcp2_path_validation_result" &
            " exists but with different size")
    enum_ngtcp2_path_validation_result
  else:
    enum_ngtcp2_path_validation_result_553648609)
  struct_st_ptls_hash_context_t_553648895 = (when declared(
      struct_st_ptls_hash_context_t):
    when ownSizeof(struct_st_ptls_hash_context_t) !=
        ownSizeof(struct_st_ptls_hash_context_t_553648894):
      static :
        warning("Declaration of " & "struct_st_ptls_hash_context_t" &
            " exists but with different size")
    struct_st_ptls_hash_context_t
  else:
    struct_st_ptls_hash_context_t_553648894)
  socklen_t_553648648 = (when declared(socklen_t):
    when ownSizeof(socklen_t) != ownSizeof(socklen_t_553648647):
      static :
        warning("Declaration of " & "socklen_t" &
            " exists but with different size")
    socklen_t
  else:
    socklen_t_553648647)
  struct_st_ptls_openssl_sign_certificate_t_553649023 = (when declared(
      struct_st_ptls_openssl_sign_certificate_t):
    when ownSizeof(struct_st_ptls_openssl_sign_certificate_t) !=
        ownSizeof(struct_st_ptls_openssl_sign_certificate_t_553649022):
      static :
        warning("Declaration of " & "struct_st_ptls_openssl_sign_certificate_t" &
            " exists but with different size")
    struct_st_ptls_openssl_sign_certificate_t
  else:
    struct_st_ptls_openssl_sign_certificate_t_553649022)
  in_port_t_553649059 = (when declared(in_port_t):
    when ownSizeof(in_port_t) != ownSizeof(in_port_t_553649058):
      static :
        warning("Declaration of " & "in_port_t" &
            " exists but with different size")
    in_port_t
  else:
    in_port_t_553649058)
  struct_ngtcp2_vec_553648622 = (when declared(struct_ngtcp2_vec):
    when ownSizeof(struct_ngtcp2_vec) != ownSizeof(struct_ngtcp2_vec_553648621):
      static :
        warning("Declaration of " & "struct_ngtcp2_vec" &
            " exists but with different size")
    struct_ngtcp2_vec
  else:
    struct_ngtcp2_vec_553648621)
  ngtcp2_ccerr_type_553648829 = (when declared(ngtcp2_ccerr_type):
    when ownSizeof(ngtcp2_ccerr_type) != ownSizeof(ngtcp2_ccerr_type_553648828):
      static :
        warning("Declaration of " & "ngtcp2_ccerr_type" &
            " exists but with different size")
    ngtcp2_ccerr_type
  else:
    ngtcp2_ccerr_type_553648828)
  ptls_early_data_acceptance_t_553648995 = (when declared(
      ptls_early_data_acceptance_t):
    when ownSizeof(ptls_early_data_acceptance_t) !=
        ownSizeof(ptls_early_data_acceptance_t_553648994):
      static :
        warning("Declaration of " & "ptls_early_data_acceptance_t" &
            " exists but with different size")
    ptls_early_data_acceptance_t
  else:
    ptls_early_data_acceptance_t_553648994)
  ngtcp2_transport_params_553648664 = (when declared(ngtcp2_transport_params):
    when ownSizeof(ngtcp2_transport_params) !=
        ownSizeof(ngtcp2_transport_params_553648663):
      static :
        warning("Declaration of " & "ngtcp2_transport_params" &
            " exists but with different size")
    ngtcp2_transport_params
  else:
    ngtcp2_transport_params_553648663)
  ngtcp2_acked_stream_data_offset_553648771 = (when declared(
      ngtcp2_acked_stream_data_offset):
    when ownSizeof(ngtcp2_acked_stream_data_offset) !=
        ownSizeof(ngtcp2_acked_stream_data_offset_553648770):
      static :
        warning("Declaration of " & "ngtcp2_acked_stream_data_offset" &
            " exists but with different size")
    ngtcp2_acked_stream_data_offset
  else:
    ngtcp2_acked_stream_data_offset_553648770)
  struct_st_ptls_iovec_t_553648853 = (when declared(struct_st_ptls_iovec_t):
    when ownSizeof(struct_st_ptls_iovec_t) != ownSizeof(struct_st_ptls_iovec_t_553648852):
      static :
        warning("Declaration of " & "struct_st_ptls_iovec_t" &
            " exists but with different size")
    struct_st_ptls_iovec_t
  else:
    struct_st_ptls_iovec_t_553648852)
  ptls_t_553648845 = (when declared(ptls_t):
    when ownSizeof(ptls_t) != ownSizeof(ptls_t_553648844):
      static :
        warning("Declaration of " & "ptls_t" & " exists but with different size")
    ptls_t
  else:
    ptls_t_553648844)
  ngtcp2_free_553648592 = (when declared(ngtcp2_free):
    when ownSizeof(ngtcp2_free) != ownSizeof(ngtcp2_free_553648591):
      static :
        warning("Declaration of " & "ngtcp2_free" &
            " exists but with different size")
    ngtcp2_free
  else:
    ngtcp2_free_553648591)
  struct_st_ptls_cipher_context_t_553648871 = (when declared(
      struct_st_ptls_cipher_context_t):
    when ownSizeof(struct_st_ptls_cipher_context_t) !=
        ownSizeof(struct_st_ptls_cipher_context_t_553648870):
      static :
        warning("Declaration of " & "struct_st_ptls_cipher_context_t" &
            " exists but with different size")
    struct_st_ptls_cipher_context_t
  else:
    struct_st_ptls_cipher_context_t_553648870)
  ngtcp2_crypto_aead_ctx_553648723 = (when declared(ngtcp2_crypto_aead_ctx):
    when ownSizeof(ngtcp2_crypto_aead_ctx) != ownSizeof(ngtcp2_crypto_aead_ctx_553648722):
      static :
        warning("Declaration of " & "ngtcp2_crypto_aead_ctx" &
            " exists but with different size")
    ngtcp2_crypto_aead_ctx
  else:
    ngtcp2_crypto_aead_ctx_553648722)
  enum_ngtcp2_encryption_level_553648743 = (when declared(
      enum_ngtcp2_encryption_level):
    when ownSizeof(enum_ngtcp2_encryption_level) !=
        ownSizeof(enum_ngtcp2_encryption_level_553648742):
      static :
        warning("Declaration of " & "enum_ngtcp2_encryption_level" &
            " exists but with different size")
    enum_ngtcp2_encryption_level
  else:
    enum_ngtcp2_encryption_level_553648742)
  ngtcp2_crypto_get_conn_553648843 = (when declared(ngtcp2_crypto_get_conn):
    when ownSizeof(ngtcp2_crypto_get_conn) != ownSizeof(ngtcp2_crypto_get_conn_553648842):
      static :
        warning("Declaration of " & "ngtcp2_crypto_get_conn" &
            " exists but with different size")
    ngtcp2_crypto_get_conn
  else:
    ngtcp2_crypto_get_conn_553648842)
  ptls_aead_supplementary_encryption_t_553648881 = (when declared(
      ptls_aead_supplementary_encryption_t):
    when ownSizeof(ptls_aead_supplementary_encryption_t) !=
        ownSizeof(ptls_aead_supplementary_encryption_t_553648880):
      static :
        warning("Declaration of " & "ptls_aead_supplementary_encryption_t" &
            " exists but with different size")
    ptls_aead_supplementary_encryption_t
  else:
    ptls_aead_supplementary_encryption_t_553648880)
  ngtcp2_sockaddr_553648634 = (when declared(ngtcp2_sockaddr):
    when ownSizeof(ngtcp2_sockaddr) != ownSizeof(ngtcp2_sockaddr_553648633):
      static :
        warning("Declaration of " & "ngtcp2_sockaddr" &
            " exists but with different size")
    ngtcp2_sockaddr
  else:
    ngtcp2_sockaddr_553648633)
  ngtcp2_crypto_ctx_553648731 = (when declared(ngtcp2_crypto_ctx):
    when ownSizeof(ngtcp2_crypto_ctx) != ownSizeof(ngtcp2_crypto_ctx_553648730):
      static :
        warning("Declaration of " & "ngtcp2_crypto_ctx" &
            " exists but with different size")
    ngtcp2_crypto_ctx
  else:
    ngtcp2_crypto_ctx_553648730)
  enum_ngtcp2_connection_id_status_type_553648791 = (when declared(
      enum_ngtcp2_connection_id_status_type):
    when ownSizeof(enum_ngtcp2_connection_id_status_type) !=
        ownSizeof(enum_ngtcp2_connection_id_status_type_553648790):
      static :
        warning("Declaration of " & "enum_ngtcp2_connection_id_status_type" &
            " exists but with different size")
    enum_ngtcp2_connection_id_status_type
  else:
    enum_ngtcp2_connection_id_status_type_553648790)
  ptls_hash_algorithm_t_553648901 = (when declared(ptls_hash_algorithm_t):
    when ownSizeof(ptls_hash_algorithm_t) != ownSizeof(ptls_hash_algorithm_t_553648900):
      static :
        warning("Declaration of " & "ptls_hash_algorithm_t" &
            " exists but with different size")
    ptls_hash_algorithm_t
  else:
    ptls_hash_algorithm_t_553648900)
  struct_st_ptls_emit_certificate_t_553648939 = (when declared(
      struct_st_ptls_emit_certificate_t):
    when ownSizeof(struct_st_ptls_emit_certificate_t) !=
        ownSizeof(struct_st_ptls_emit_certificate_t_553648938):
      static :
        warning("Declaration of " & "struct_st_ptls_emit_certificate_t" &
            " exists but with different size")
    struct_st_ptls_emit_certificate_t
  else:
    struct_st_ptls_emit_certificate_t_553648938)
  struct_st_ptls_on_client_hello_parameters_t_553648927 = (when declared(
      struct_st_ptls_on_client_hello_parameters_t):
    when ownSizeof(struct_st_ptls_on_client_hello_parameters_t) !=
        ownSizeof(struct_st_ptls_on_client_hello_parameters_t_553648926):
      static :
        warning("Declaration of " &
            "struct_st_ptls_on_client_hello_parameters_t" &
            " exists but with different size")
    struct_st_ptls_on_client_hello_parameters_t
  else:
    struct_st_ptls_on_client_hello_parameters_t_553648926)
  struct_st_ptls_async_job_t_553648943 = (when declared(
      struct_st_ptls_async_job_t):
    when ownSizeof(struct_st_ptls_async_job_t) !=
        ownSizeof(struct_st_ptls_async_job_t_553648942):
      static :
        warning("Declaration of " & "struct_st_ptls_async_job_t" &
            " exists but with different size")
    struct_st_ptls_async_job_t
  else:
    struct_st_ptls_async_job_t_553648942)
  EVP_CIPHER_CTX_553649043 = (when declared(EVP_CIPHER_CTX):
    when ownSizeof(EVP_CIPHER_CTX) != ownSizeof(EVP_CIPHER_CTX_553649042):
      static :
        warning("Declaration of " & "EVP_CIPHER_CTX" &
            " exists but with different size")
    EVP_CIPHER_CTX
  else:
    EVP_CIPHER_CTX_553649042)
  ptls_decompress_certificate_t_553648983 = (when declared(
      ptls_decompress_certificate_t):
    when ownSizeof(ptls_decompress_certificate_t) !=
        ownSizeof(ptls_decompress_certificate_t_553648982):
      static :
        warning("Declaration of " & "ptls_decompress_certificate_t" &
            " exists but with different size")
    ptls_decompress_certificate_t
  else:
    ptls_decompress_certificate_t_553648982)
  ngtcp2_update_key_553648785 = (when declared(ngtcp2_update_key):
    when ownSizeof(ngtcp2_update_key) != ownSizeof(ngtcp2_update_key_553648784):
      static :
        warning("Declaration of " & "ngtcp2_update_key" &
            " exists but with different size")
    ngtcp2_update_key
  else:
    ngtcp2_update_key_553648784)
  ngtcp2_get_new_connection_id_553648781 = (when declared(
      ngtcp2_get_new_connection_id):
    when ownSizeof(ngtcp2_get_new_connection_id) !=
        ownSizeof(ngtcp2_get_new_connection_id_553648780):
      static :
        warning("Declaration of " & "ngtcp2_get_new_connection_id" &
            " exists but with different size")
    ngtcp2_get_new_connection_id
  else:
    ngtcp2_get_new_connection_id_553648780)
  ngtcp2_encrypt_553648757 = (when declared(ngtcp2_encrypt):
    when ownSizeof(ngtcp2_encrypt) != ownSizeof(ngtcp2_encrypt_553648756):
      static :
        warning("Declaration of " & "ngtcp2_encrypt" &
            " exists but with different size")
    ngtcp2_encrypt
  else:
    ngtcp2_encrypt_553648756)
  compiler_ssize_t_553649063 = (when declared(compiler_ssize_t):
    when ownSizeof(compiler_ssize_t) != ownSizeof(compiler_ssize_t_553649062):
      static :
        warning("Declaration of " & "compiler_ssize_t" &
            " exists but with different size")
    compiler_ssize_t
  else:
    compiler_ssize_t_553649062)
  ngtcp2_stream_open_553648765 = (when declared(ngtcp2_stream_open):
    when ownSizeof(ngtcp2_stream_open) != ownSizeof(ngtcp2_stream_open_553648764):
      static :
        warning("Declaration of " & "ngtcp2_stream_open" &
            " exists but with different size")
    ngtcp2_stream_open
  else:
    ngtcp2_stream_open_553648764)
  ptls_handshake_properties_t_553648999 = (when declared(
      ptls_handshake_properties_t):
    when ownSizeof(ptls_handshake_properties_t) !=
        ownSizeof(ptls_handshake_properties_t_553648998):
      static :
        warning("Declaration of " & "ptls_handshake_properties_t" &
            " exists but with different size")
    ptls_handshake_properties_t
  else:
    ptls_handshake_properties_t_553648998)
  struct_sockaddr_553648636 = (when declared(struct_sockaddr):
    when ownSizeof(struct_sockaddr) != ownSizeof(struct_sockaddr_553648635):
      static :
        warning("Declaration of " & "struct_sockaddr" &
            " exists but with different size")
    struct_sockaddr
  else:
    struct_sockaddr_553648635)
  ngtcp2_recv_datagram_553648803 = (when declared(ngtcp2_recv_datagram):
    when ownSizeof(ngtcp2_recv_datagram) != ownSizeof(ngtcp2_recv_datagram_553648802):
      static :
        warning("Declaration of " & "ngtcp2_recv_datagram" &
            " exists but with different size")
    ngtcp2_recv_datagram
  else:
    ngtcp2_recv_datagram_553648802)
  ptls_log_event_t_553648965 = (when declared(ptls_log_event_t):
    when ownSizeof(ptls_log_event_t) != ownSizeof(ptls_log_event_t_553648964):
      static :
        warning("Declaration of " & "ptls_log_event_t" &
            " exists but with different size")
    ptls_log_event_t
  else:
    ptls_log_event_t_553648964)
  ngtcp2_extend_max_streams_553648775 = (when declared(ngtcp2_extend_max_streams):
    when ownSizeof(ngtcp2_extend_max_streams) !=
        ownSizeof(ngtcp2_extend_max_streams_553648774):
      static :
        warning("Declaration of " & "ngtcp2_extend_max_streams" &
            " exists but with different size")
    ngtcp2_extend_max_streams
  else:
    ngtcp2_extend_max_streams_553648774)
  ngtcp2_recv_stateless_reset_553648773 = (when declared(
      ngtcp2_recv_stateless_reset):
    when ownSizeof(ngtcp2_recv_stateless_reset) !=
        ownSizeof(ngtcp2_recv_stateless_reset_553648772):
      static :
        warning("Declaration of " & "ngtcp2_recv_stateless_reset" &
            " exists but with different size")
    ngtcp2_recv_stateless_reset
  else:
    ngtcp2_recv_stateless_reset_553648772)
  ngtcp2_path_validation_553648787 = (when declared(ngtcp2_path_validation):
    when ownSizeof(ngtcp2_path_validation) != ownSizeof(ngtcp2_path_validation_553648786):
      static :
        warning("Declaration of " & "ngtcp2_path_validation" &
            " exists but with different size")
    ngtcp2_path_validation
  else:
    ngtcp2_path_validation_553648786)
  ptls_iovec_t_553648855 = (when declared(ptls_iovec_t):
    when ownSizeof(ptls_iovec_t) != ownSizeof(ptls_iovec_t_553648854):
      static :
        warning("Declaration of " & "ptls_iovec_t" &
            " exists but with different size")
    ptls_iovec_t
  else:
    ptls_iovec_t_553648854)
  struct_st_ptls_openssl_verify_certificate_t_553649037 = (when declared(
      struct_st_ptls_openssl_verify_certificate_t):
    when ownSizeof(struct_st_ptls_openssl_verify_certificate_t) !=
        ownSizeof(struct_st_ptls_openssl_verify_certificate_t_553649036):
      static :
        warning("Declaration of " &
            "struct_st_ptls_openssl_verify_certificate_t" &
            " exists but with different size")
    struct_st_ptls_openssl_verify_certificate_t
  else:
    struct_st_ptls_openssl_verify_certificate_t_553649036)
  struct_sockaddr_in6_553648644 = (when declared(struct_sockaddr_in6):
    when ownSizeof(struct_sockaddr_in6) != ownSizeof(struct_sockaddr_in6_553648643):
      static :
        warning("Declaration of " & "struct_sockaddr_in6" &
            " exists but with different size")
    struct_sockaddr_in6
  else:
    struct_sockaddr_in6_553648643)
  struct_st_ptls_aead_algorithm_t_553648885 = (when declared(
      struct_st_ptls_aead_algorithm_t):
    when ownSizeof(struct_st_ptls_aead_algorithm_t) !=
        ownSizeof(struct_st_ptls_aead_algorithm_t_553648884):
      static :
        warning("Declaration of " & "struct_st_ptls_aead_algorithm_t" &
            " exists but with different size")
    struct_st_ptls_aead_algorithm_t
  else:
    struct_st_ptls_aead_algorithm_t_553648884)
  struct_ngtcp2_cid_553648618 = (when declared(struct_ngtcp2_cid):
    when ownSizeof(struct_ngtcp2_cid) != ownSizeof(struct_ngtcp2_cid_553648617):
      static :
        warning("Declaration of " & "struct_ngtcp2_cid" &
            " exists but with different size")
    struct_ngtcp2_cid
  else:
    struct_ngtcp2_cid_553648617)
  ssize_t_553648969 = (when declared(ssize_t):
    when ownSizeof(ssize_t) != ownSizeof(ssize_t_553648968):
      static :
        warning("Declaration of " & "ssize_t" &
            " exists but with different size")
    ssize_t
  else:
    ssize_t_553648968)
  ngtcp2_pkt_hd_553648628 = (when declared(ngtcp2_pkt_hd):
    when ownSizeof(ngtcp2_pkt_hd) != ownSizeof(ngtcp2_pkt_hd_553648627):
      static :
        warning("Declaration of " & "ngtcp2_pkt_hd" &
            " exists but with different size")
    ngtcp2_pkt_hd
  else:
    ngtcp2_pkt_hd_553648627)
  enum_ngtcp2_token_type_553648689 = (when declared(enum_ngtcp2_token_type):
    when ownSizeof(enum_ngtcp2_token_type) != ownSizeof(enum_ngtcp2_token_type_553648688):
      static :
        warning("Declaration of " & "enum_ngtcp2_token_type" &
            " exists but with different size")
    enum_ngtcp2_token_type
  else:
    enum_ngtcp2_token_type_553648688)
  ngtcp2_recv_stream_data_553648763 = (when declared(ngtcp2_recv_stream_data):
    when ownSizeof(ngtcp2_recv_stream_data) !=
        ownSizeof(ngtcp2_recv_stream_data_553648762):
      static :
        warning("Declaration of " & "ngtcp2_recv_stream_data" &
            " exists but with different size")
    ngtcp2_recv_stream_data
  else:
    ngtcp2_recv_stream_data_553648762)
  struct_st_ptls_ech_create_opener_t_553648985 = (when declared(
      struct_st_ptls_ech_create_opener_t):
    when ownSizeof(struct_st_ptls_ech_create_opener_t) !=
        ownSizeof(struct_st_ptls_ech_create_opener_t_553648984):
      static :
        warning("Declaration of " & "struct_st_ptls_ech_create_opener_t" &
            " exists but with different size")
    struct_st_ptls_ech_create_opener_t
  else:
    struct_st_ptls_ech_create_opener_t_553648984)
  ptls_openssl_raw_pubkey_verify_certificate_t_553649031 = (when declared(
      ptls_openssl_raw_pubkey_verify_certificate_t):
    when ownSizeof(ptls_openssl_raw_pubkey_verify_certificate_t) !=
        ownSizeof(ptls_openssl_raw_pubkey_verify_certificate_t_553649030):
      static :
        warning("Declaration of " &
            "ptls_openssl_raw_pubkey_verify_certificate_t" &
            " exists but with different size")
    ptls_openssl_raw_pubkey_verify_certificate_t
  else:
    ptls_openssl_raw_pubkey_verify_certificate_t_553649030)
  struct_st_ptls_message_emitter_t_553648907 = (when declared(
      struct_st_ptls_message_emitter_t):
    when ownSizeof(struct_st_ptls_message_emitter_t) !=
        ownSizeof(struct_st_ptls_message_emitter_t_553648906):
      static :
        warning("Declaration of " & "struct_st_ptls_message_emitter_t" &
            " exists but with different size")
    struct_st_ptls_message_emitter_t
  else:
    struct_st_ptls_message_emitter_t_553648906)
  sa_family_t_553649057 = (when declared(sa_family_t):
    when ownSizeof(sa_family_t) != ownSizeof(sa_family_t_553649056):
      static :
        warning("Declaration of " & "sa_family_t" &
            " exists but with different size")
    sa_family_t
  else:
    sa_family_t_553649056)
  ngtcp2_callbacks_553648821 = (when declared(ngtcp2_callbacks):
    when ownSizeof(ngtcp2_callbacks) != ownSizeof(ngtcp2_callbacks_553648820):
      static :
        warning("Declaration of " & "ngtcp2_callbacks" &
            " exists but with different size")
    ngtcp2_callbacks
  else:
    ngtcp2_callbacks_553648820)
  struct_st_ptls_log_point_t_553649003 = (when declared(
      struct_st_ptls_log_point_t):
    when ownSizeof(struct_st_ptls_log_point_t) !=
        ownSizeof(struct_st_ptls_log_point_t_553649002):
      static :
        warning("Declaration of " & "struct_st_ptls_log_point_t" &
            " exists but with different size")
    struct_st_ptls_log_point_t
  else:
    struct_st_ptls_log_point_t_553649002)
  ngtcp2_stream_reset_553648769 = (when declared(ngtcp2_stream_reset):
    when ownSizeof(ngtcp2_stream_reset) != ownSizeof(ngtcp2_stream_reset_553648768):
      static :
        warning("Declaration of " & "ngtcp2_stream_reset" &
            " exists but with different size")
    ngtcp2_stream_reset
  else:
    ngtcp2_stream_reset_553648768)
  ptls_aead_context_t_553648887 = (when declared(ptls_aead_context_t):
    when ownSizeof(ptls_aead_context_t) != ownSizeof(ptls_aead_context_t_553648886):
      static :
        warning("Declaration of " & "ptls_aead_context_t" &
            " exists but with different size")
    ptls_aead_context_t
  else:
    ptls_aead_context_t_553648886)
  struct_ngtcp2_conn_info_553648666 = (when declared(struct_ngtcp2_conn_info):
    when ownSizeof(struct_ngtcp2_conn_info) !=
        ownSizeof(struct_ngtcp2_conn_info_553648665):
      static :
        warning("Declaration of " & "struct_ngtcp2_conn_info" &
            " exists but with different size")
    struct_ngtcp2_conn_info
  else:
    struct_ngtcp2_conn_info_553648665)
  struct_ngtcp2_pkt_info_553648602 = (when declared(struct_ngtcp2_pkt_info):
    when ownSizeof(struct_ngtcp2_pkt_info) != ownSizeof(struct_ngtcp2_pkt_info_553648601):
      static :
        warning("Declaration of " & "struct_ngtcp2_pkt_info" &
            " exists but with different size")
    struct_ngtcp2_pkt_info
  else:
    struct_ngtcp2_pkt_info_553648601)
  ngtcp2_tls_early_data_rejected_553648817 = (when declared(
      ngtcp2_tls_early_data_rejected):
    when ownSizeof(ngtcp2_tls_early_data_rejected) !=
        ownSizeof(ngtcp2_tls_early_data_rejected_553648816):
      static :
        warning("Declaration of " & "ngtcp2_tls_early_data_rejected" &
            " exists but with different size")
    ngtcp2_tls_early_data_rejected
  else:
    ngtcp2_tls_early_data_rejected_553648816)
  struct_ngtcp2_path_storage_553648705 = (when declared(
      struct_ngtcp2_path_storage):
    when ownSizeof(struct_ngtcp2_path_storage) !=
        ownSizeof(struct_ngtcp2_path_storage_553648704):
      static :
        warning("Declaration of " & "struct_ngtcp2_path_storage" &
            " exists but with different size")
    struct_ngtcp2_path_storage
  else:
    struct_ngtcp2_path_storage_553648704)
  struct_st_ptls_handshake_properties_t_553648997 = (when declared(
      struct_st_ptls_handshake_properties_t):
    when ownSizeof(struct_st_ptls_handshake_properties_t) !=
        ownSizeof(struct_st_ptls_handshake_properties_t_553648996):
      static :
        warning("Declaration of " & "struct_st_ptls_handshake_properties_t" &
            " exists but with different size")
    struct_st_ptls_handshake_properties_t
  else:
    struct_st_ptls_handshake_properties_t_553648996)
  ptls_key_exchange_algorithm_t_553648869 = (when declared(
      ptls_key_exchange_algorithm_t):
    when ownSizeof(ptls_key_exchange_algorithm_t) !=
        ownSizeof(ptls_key_exchange_algorithm_t_553648868):
      static :
        warning("Declaration of " & "ptls_key_exchange_algorithm_t" &
            " exists but with different size")
    ptls_key_exchange_algorithm_t
  else:
    ptls_key_exchange_algorithm_t_553648868)
  ngtcp2_client_initial_553648739 = (when declared(ngtcp2_client_initial):
    when ownSizeof(ngtcp2_client_initial) != ownSizeof(ngtcp2_client_initial_553648738):
      static :
        warning("Declaration of " & "ngtcp2_client_initial" &
            " exists but with different size")
    ngtcp2_client_initial
  else:
    ngtcp2_client_initial_553648738)
  ptls_openssl_verify_certificate_t_553649041 = (when declared(
      ptls_openssl_verify_certificate_t):
    when ownSizeof(ptls_openssl_verify_certificate_t) !=
        ownSizeof(ptls_openssl_verify_certificate_t_553649040):
      static :
        warning("Declaration of " & "ptls_openssl_verify_certificate_t" &
            " exists but with different size")
    ptls_openssl_verify_certificate_t
  else:
    ptls_openssl_verify_certificate_t_553649040)
  ptls_hpke_cipher_suite_id_t_553648917 = (when declared(
      ptls_hpke_cipher_suite_id_t):
    when ownSizeof(ptls_hpke_cipher_suite_id_t) !=
        ownSizeof(ptls_hpke_cipher_suite_id_t_553648916):
      static :
        warning("Declaration of " & "ptls_hpke_cipher_suite_id_t" &
            " exists but with different size")
    ptls_hpke_cipher_suite_id_t
  else:
    ptls_hpke_cipher_suite_id_t_553648916)
  struct_ngtcp2_crypto_aead_553648713 = (when declared(struct_ngtcp2_crypto_aead):
    when ownSizeof(struct_ngtcp2_crypto_aead) !=
        ownSizeof(struct_ngtcp2_crypto_aead_553648712):
      static :
        warning("Declaration of " & "struct_ngtcp2_crypto_aead" &
            " exists but with different size")
    struct_ngtcp2_crypto_aead
  else:
    struct_ngtcp2_crypto_aead_553648712)
  struct_st_ptls_decompress_certificate_t_553648981 = (when declared(
      struct_st_ptls_decompress_certificate_t):
    when ownSizeof(struct_st_ptls_decompress_certificate_t) !=
        ownSizeof(struct_st_ptls_decompress_certificate_t_553648980):
      static :
        warning("Declaration of " & "struct_st_ptls_decompress_certificate_t" &
            " exists but with different size")
    struct_st_ptls_decompress_certificate_t
  else:
    struct_st_ptls_decompress_certificate_t_553648980)
  ngtcp2_path_storage_553648707 = (when declared(ngtcp2_path_storage):
    when ownSizeof(ngtcp2_path_storage) != ownSizeof(ngtcp2_path_storage_553648706):
      static :
        warning("Declaration of " & "ngtcp2_path_storage" &
            " exists but with different size")
    ngtcp2_path_storage
  else:
    ngtcp2_path_storage_553648706)
  ngtcp2_calloc_553648594 = (when declared(ngtcp2_calloc):
    when ownSizeof(ngtcp2_calloc) != ownSizeof(ngtcp2_calloc_553648593):
      static :
        warning("Declaration of " & "ngtcp2_calloc" &
            " exists but with different size")
    ngtcp2_calloc
  else:
    ngtcp2_calloc_553648593)
  ptls_cipher_suite_t_553648905 = (when declared(ptls_cipher_suite_t):
    when ownSizeof(ptls_cipher_suite_t) != ownSizeof(ptls_cipher_suite_t_553648904):
      static :
        warning("Declaration of " & "ptls_cipher_suite_t" &
            " exists but with different size")
    ptls_cipher_suite_t
  else:
    ptls_cipher_suite_t_553648904)
  ngtcp2_conn_info_553648668 = (when declared(ngtcp2_conn_info):
    when ownSizeof(ngtcp2_conn_info) != ownSizeof(ngtcp2_conn_info_553648667):
      static :
        warning("Declaration of " & "ngtcp2_conn_info" &
            " exists but with different size")
    ngtcp2_conn_info
  else:
    ngtcp2_conn_info_553648667)
  ngtcp2_socklen_553648646 = (when declared(ngtcp2_socklen):
    when ownSizeof(ngtcp2_socklen) != ownSizeof(ngtcp2_socklen_553648645):
      static :
        warning("Declaration of " & "ngtcp2_socklen" &
            " exists but with different size")
    ngtcp2_socklen
  else:
    ngtcp2_socklen_553648645)
  ptls_context_t_553648847 = (when declared(ptls_context_t):
    when ownSizeof(ptls_context_t) != ownSizeof(ptls_context_t_553648846):
      static :
        warning("Declaration of " & "ptls_context_t" &
            " exists but with different size")
    ptls_context_t
  else:
    ptls_context_t_553648846)
  struct_ngtcp2_rand_ctx_553648683 = (when declared(struct_ngtcp2_rand_ctx):
    when ownSizeof(struct_ngtcp2_rand_ctx) != ownSizeof(struct_ngtcp2_rand_ctx_553648682):
      static :
        warning("Declaration of " & "struct_ngtcp2_rand_ctx" &
            " exists but with different size")
    struct_ngtcp2_rand_ctx
  else:
    struct_ngtcp2_rand_ctx_553648682)
  ngtcp2_ccerr_553648833 = (when declared(ngtcp2_ccerr):
    when ownSizeof(ngtcp2_ccerr) != ownSizeof(ngtcp2_ccerr_553648832):
      static :
        warning("Declaration of " & "ngtcp2_ccerr" &
            " exists but with different size")
    ngtcp2_ccerr
  else:
    ngtcp2_ccerr_553648832)
  struct_st_ptls_context_t_553648849 = (when declared(struct_st_ptls_context_t):
    when ownSizeof(struct_st_ptls_context_t) !=
        ownSizeof(struct_st_ptls_context_t_553648848):
      static :
        warning("Declaration of " & "struct_st_ptls_context_t" &
            " exists but with different size")
    struct_st_ptls_context_t
  else:
    struct_st_ptls_context_t_553648848)
  ngtcp2_handshake_completed_553648749 = (when declared(
      ngtcp2_handshake_completed):
    when ownSizeof(ngtcp2_handshake_completed) !=
        ownSizeof(ngtcp2_handshake_completed_553648748):
      static :
        warning("Declaration of " & "ngtcp2_handshake_completed" &
            " exists but with different size")
    ngtcp2_handshake_completed
  else:
    ngtcp2_handshake_completed_553648748)
  struct_ngtcp2_pkt_stateless_reset_553648630 = (when declared(
      struct_ngtcp2_pkt_stateless_reset):
    when ownSizeof(struct_ngtcp2_pkt_stateless_reset) !=
        ownSizeof(struct_ngtcp2_pkt_stateless_reset_553648629):
      static :
        warning("Declaration of " & "struct_ngtcp2_pkt_stateless_reset" &
            " exists but with different size")
    struct_ngtcp2_pkt_stateless_reset
  else:
    struct_ngtcp2_pkt_stateless_reset_553648629)
  HMAC_CTX_553649045 = (when declared(HMAC_CTX):
    when ownSizeof(HMAC_CTX) != ownSizeof(HMAC_CTX_553649044):
      static :
        warning("Declaration of " & "HMAC_CTX" &
            " exists but with different size")
    HMAC_CTX
  else:
    HMAC_CTX_553649044)
  ptls_cred_buffer_t_553649055 = (when declared(ptls_cred_buffer_t):
    when ownSizeof(ptls_cred_buffer_t) != ownSizeof(ptls_cred_buffer_t_553649054):
      static :
        warning("Declaration of " & "ptls_cred_buffer_t" &
            " exists but with different size")
    ptls_cred_buffer_t
  else:
    ptls_cred_buffer_t_553649054)
  intptr_t_553648867 = (when declared(intptr_t):
    when ownSizeof(intptr_t) != ownSizeof(intptr_t_553648866):
      static :
        warning("Declaration of " & "intptr_t" &
            " exists but with different size")
    intptr_t
  else:
    intptr_t_553648866)
  struct_ngtcp2_crypto_cipher_553648717 = (when declared(
      struct_ngtcp2_crypto_cipher):
    when ownSizeof(struct_ngtcp2_crypto_cipher) !=
        ownSizeof(struct_ngtcp2_crypto_cipher_553648716):
      static :
        warning("Declaration of " & "struct_ngtcp2_crypto_cipher" &
            " exists but with different size")
    struct_ngtcp2_crypto_cipher
  else:
    struct_ngtcp2_crypto_cipher_553648716)
  struct_st_ptls_on_extension_t_553648977 = (when declared(
      struct_st_ptls_on_extension_t):
    when ownSizeof(struct_st_ptls_on_extension_t) !=
        ownSizeof(struct_st_ptls_on_extension_t_553648976):
      static :
        warning("Declaration of " & "struct_st_ptls_on_extension_t" &
            " exists but with different size")
    struct_st_ptls_on_extension_t
  else:
    struct_st_ptls_on_extension_t_553648976)
  struct_st_ptls_openssl_signature_scheme_t_553649017 = (when declared(
      struct_st_ptls_openssl_signature_scheme_t):
    when ownSizeof(struct_st_ptls_openssl_signature_scheme_t) !=
        ownSizeof(struct_st_ptls_openssl_signature_scheme_t_553649016):
      static :
        warning("Declaration of " & "struct_st_ptls_openssl_signature_scheme_t" &
            " exists but with different size")
    struct_st_ptls_openssl_signature_scheme_t
  else:
    struct_st_ptls_openssl_signature_scheme_t_553649016)
  ngtcp2_pkt_type_553648608 = (when declared(ngtcp2_pkt_type):
    when ownSizeof(ngtcp2_pkt_type) != ownSizeof(ngtcp2_pkt_type_553648607):
      static :
        warning("Declaration of " & "ngtcp2_pkt_type" &
            " exists but with different size")
    ngtcp2_pkt_type
  else:
    ngtcp2_pkt_type_553648607)
  struct_ngtcp2_preferred_addr_553648654 = (when declared(
      struct_ngtcp2_preferred_addr):
    when ownSizeof(struct_ngtcp2_preferred_addr) !=
        ownSizeof(struct_ngtcp2_preferred_addr_553648653):
      static :
        warning("Declaration of " & "struct_ngtcp2_preferred_addr" &
            " exists but with different size")
    struct_ngtcp2_preferred_addr
  else:
    struct_ngtcp2_preferred_addr_553648653)
  enum_ngtcp2_ccerr_type_553648827 = (when declared(enum_ngtcp2_ccerr_type):
    when ownSizeof(enum_ngtcp2_ccerr_type) != ownSizeof(enum_ngtcp2_ccerr_type_553648826):
      static :
        warning("Declaration of " & "enum_ngtcp2_ccerr_type" &
            " exists but with different size")
    enum_ngtcp2_ccerr_type
  else:
    enum_ngtcp2_ccerr_type_553648826)
  ngtcp2_delete_crypto_cipher_ctx_553648801 = (when declared(
      ngtcp2_delete_crypto_cipher_ctx):
    when ownSizeof(ngtcp2_delete_crypto_cipher_ctx) !=
        ownSizeof(ngtcp2_delete_crypto_cipher_ctx_553648800):
      static :
        warning("Declaration of " & "ngtcp2_delete_crypto_cipher_ctx" &
            " exists but with different size")
    ngtcp2_delete_crypto_cipher_ctx
  else:
    ngtcp2_delete_crypto_cipher_ctx_553648800)
  ptls_hash_context_t_553648897 = (when declared(ptls_hash_context_t):
    when ownSizeof(ptls_hash_context_t) != ownSizeof(ptls_hash_context_t_553648896):
      static :
        warning("Declaration of " & "ptls_hash_context_t" &
            " exists but with different size")
    ptls_hash_context_t
  else:
    ptls_hash_context_t_553648896)
  ngtcp2_stream_stop_sending_553648811 = (when declared(
      ngtcp2_stream_stop_sending):
    when ownSizeof(ngtcp2_stream_stop_sending) !=
        ownSizeof(ngtcp2_stream_stop_sending_553648810):
      static :
        warning("Declaration of " & "ngtcp2_stream_stop_sending" &
            " exists but with different size")
    ngtcp2_stream_stop_sending
  else:
    ngtcp2_stream_stop_sending_553648810)
  ngtcp2_pkt_stateless_reset_553648632 = (when declared(
      ngtcp2_pkt_stateless_reset):
    when ownSizeof(ngtcp2_pkt_stateless_reset) !=
        ownSizeof(ngtcp2_pkt_stateless_reset_553648631):
      static :
        warning("Declaration of " & "ngtcp2_pkt_stateless_reset" &
            " exists but with different size")
    ngtcp2_pkt_stateless_reset
  else:
    ngtcp2_pkt_stateless_reset_553648631)
  ngtcp2_token_type_553648691 = (when declared(ngtcp2_token_type):
    when ownSizeof(ngtcp2_token_type) != ownSizeof(ngtcp2_token_type_553648690):
      static :
        warning("Declaration of " & "ngtcp2_token_type" &
            " exists but with different size")
    ngtcp2_token_type
  else:
    ngtcp2_token_type_553648690)
  ptls_hpke_cipher_suite_t_553648921 = (when declared(ptls_hpke_cipher_suite_t):
    when ownSizeof(ptls_hpke_cipher_suite_t) !=
        ownSizeof(ptls_hpke_cipher_suite_t_553648920):
      static :
        warning("Declaration of " & "ptls_hpke_cipher_suite_t" &
            " exists but with different size")
    ptls_hpke_cipher_suite_t
  else:
    ptls_hpke_cipher_suite_t_553648920)
  ngtcp2_crypto_cipher_553648719 = (when declared(ngtcp2_crypto_cipher):
    when ownSizeof(ngtcp2_crypto_cipher) != ownSizeof(ngtcp2_crypto_cipher_553648718):
      static :
        warning("Declaration of " & "ngtcp2_crypto_cipher" &
            " exists but with different size")
    ngtcp2_crypto_cipher
  else:
    ngtcp2_crypto_cipher_553648718)
  struct_ngtcp2_crypto_cipher_ctx_553648725 = (when declared(
      struct_ngtcp2_crypto_cipher_ctx):
    when ownSizeof(struct_ngtcp2_crypto_cipher_ctx) !=
        ownSizeof(struct_ngtcp2_crypto_cipher_ctx_553648724):
      static :
        warning("Declaration of " & "struct_ngtcp2_crypto_cipher_ctx" &
            " exists but with different size")
    struct_ngtcp2_crypto_cipher_ctx
  else:
    struct_ngtcp2_crypto_cipher_ctx_553648724)
  ptls_cipher_algorithm_t_553648877 = (when declared(ptls_cipher_algorithm_t):
    when ownSizeof(ptls_cipher_algorithm_t) !=
        ownSizeof(ptls_cipher_algorithm_t_553648876):
      static :
        warning("Declaration of " & "ptls_cipher_algorithm_t" &
            " exists but with different size")
    ptls_cipher_algorithm_t
  else:
    ptls_cipher_algorithm_t_553648876)
  ngtcp2_path_553648703 = (when declared(ngtcp2_path):
    when ownSizeof(ngtcp2_path) != ownSizeof(ngtcp2_path_553648702):
      static :
        warning("Declaration of " & "ngtcp2_path" &
            " exists but with different size")
    ngtcp2_path
  else:
    ngtcp2_path_553648702)
  ngtcp2_version_negotiation_553648813 = (when declared(
      ngtcp2_version_negotiation):
    when ownSizeof(ngtcp2_version_negotiation) !=
        ownSizeof(ngtcp2_version_negotiation_553648812):
      static :
        warning("Declaration of " & "ngtcp2_version_negotiation" &
            " exists but with different size")
    ngtcp2_version_negotiation
  else:
    ngtcp2_version_negotiation_553648812)
  struct_ngtcp2_mem_553648598 = (when declared(struct_ngtcp2_mem):
    when ownSizeof(struct_ngtcp2_mem) != ownSizeof(struct_ngtcp2_mem_553648597):
      static :
        warning("Declaration of " & "struct_ngtcp2_mem" &
            " exists but with different size")
    struct_ngtcp2_mem
  else:
    struct_ngtcp2_mem_553648597)
  ngtcp2_cid_553648620 = (when declared(ngtcp2_cid):
    when ownSizeof(ngtcp2_cid) != ownSizeof(ngtcp2_cid_553648619):
      static :
        warning("Declaration of " & "ngtcp2_cid" &
            " exists but with different size")
    ngtcp2_cid
  else:
    ngtcp2_cid_553648619)
  ngtcp2_version_info_553648660 = (when declared(ngtcp2_version_info):
    when ownSizeof(ngtcp2_version_info) != ownSizeof(ngtcp2_version_info_553648659):
      static :
        warning("Declaration of " & "ngtcp2_version_info" &
            " exists but with different size")
    ngtcp2_version_info
  else:
    ngtcp2_version_info_553648659)
  struct_ngtcp2_addr_553648697 = (when declared(struct_ngtcp2_addr):
    when ownSizeof(struct_ngtcp2_addr) != ownSizeof(struct_ngtcp2_addr_553648696):
      static :
        warning("Declaration of " & "struct_ngtcp2_addr" &
            " exists but with different size")
    struct_ngtcp2_addr
  else:
    struct_ngtcp2_addr_553648696)
  ngtcp2_addr_553648699 = (when declared(ngtcp2_addr):
    when ownSizeof(ngtcp2_addr) != ownSizeof(ngtcp2_addr_553648698):
      static :
        warning("Declaration of " & "ngtcp2_addr" &
            " exists but with different size")
    ngtcp2_addr
  else:
    ngtcp2_addr_553648698)
  ngtcp2_qlog_write_553648687 = (when declared(ngtcp2_qlog_write):
    when ownSizeof(ngtcp2_qlog_write) != ownSizeof(ngtcp2_qlog_write_553648686):
      static :
        warning("Declaration of " & "ngtcp2_qlog_write" &
            " exists but with different size")
    ngtcp2_qlog_write
  else:
    ngtcp2_qlog_write_553648686)
  ngtcp2_remove_connection_id_553648783 = (when declared(
      ngtcp2_remove_connection_id):
    when ownSizeof(ngtcp2_remove_connection_id) !=
        ownSizeof(ngtcp2_remove_connection_id_553648782):
      static :
        warning("Declaration of " & "ngtcp2_remove_connection_id" &
            " exists but with different size")
    ngtcp2_remove_connection_id
  else:
    ngtcp2_remove_connection_id_553648782)
  struct_ngtcp2_cid_token_553648823 = (when declared(struct_ngtcp2_cid_token):
    when ownSizeof(struct_ngtcp2_cid_token) !=
        ownSizeof(struct_ngtcp2_cid_token_553648822):
      static :
        warning("Declaration of " & "struct_ngtcp2_cid_token" &
            " exists but with different size")
    struct_ngtcp2_cid_token
  else:
    struct_ngtcp2_cid_token_553648822)
  ngtcp2_rand_ctx_553648685 = (when declared(ngtcp2_rand_ctx):
    when ownSizeof(ngtcp2_rand_ctx) != ownSizeof(ngtcp2_rand_ctx_553648684):
      static :
        warning("Declaration of " & "ngtcp2_rand_ctx" &
            " exists but with different size")
    ngtcp2_rand_ctx
  else:
    ngtcp2_rand_ctx_553648684)
  struct_ngtcp2_settings_553648693 = (when declared(struct_ngtcp2_settings):
    when ownSizeof(struct_ngtcp2_settings) != ownSizeof(struct_ngtcp2_settings_553648692):
      static :
        warning("Declaration of " & "struct_ngtcp2_settings" &
            " exists but with different size")
    struct_ngtcp2_settings
  else:
    struct_ngtcp2_settings_553648692)
  ngtcp2_get_path_challenge_data_553648809 = (when declared(
      ngtcp2_get_path_challenge_data):
    when ownSizeof(ngtcp2_get_path_challenge_data) !=
        ownSizeof(ngtcp2_get_path_challenge_data_553648808):
      static :
        warning("Declaration of " & "ngtcp2_get_path_challenge_data" &
            " exists but with different size")
    ngtcp2_get_path_challenge_data
  else:
    ngtcp2_get_path_challenge_data_553648808)
  EVP_PKEY_553649015 = (when declared(EVP_PKEY):
    when ownSizeof(EVP_PKEY) != ownSizeof(EVP_PKEY_553649014):
      static :
        warning("Declaration of " & "EVP_PKEY" &
            " exists but with different size")
    EVP_PKEY
  else:
    EVP_PKEY_553649014)
  ptls_save_ticket_t_553648961 = (when declared(ptls_save_ticket_t):
    when ownSizeof(ptls_save_ticket_t) != ownSizeof(ptls_save_ticket_t_553648960):
      static :
        warning("Declaration of " & "ptls_save_ticket_t" &
            " exists but with different size")
    ptls_save_ticket_t
  else:
    ptls_save_ticket_t_553648960)
  ptls_openssl_override_verify_certificate_t_553649035 = (when declared(
      ptls_openssl_override_verify_certificate_t):
    when ownSizeof(ptls_openssl_override_verify_certificate_t) !=
        ownSizeof(ptls_openssl_override_verify_certificate_t_553649034):
      static :
        warning("Declaration of " & "ptls_openssl_override_verify_certificate_t" &
            " exists but with different size")
    ptls_openssl_override_verify_certificate_t
  else:
    ptls_openssl_override_verify_certificate_t_553649034)
  ptls_sign_certificate_t_553648949 = (when declared(ptls_sign_certificate_t):
    when ownSizeof(ptls_sign_certificate_t) !=
        ownSizeof(ptls_sign_certificate_t_553648948):
      static :
        warning("Declaration of " & "ptls_sign_certificate_t" &
            " exists but with different size")
    ptls_sign_certificate_t
  else:
    ptls_sign_certificate_t_553648948)
  struct_ngtcp2_version_cid_553648733 = (when declared(struct_ngtcp2_version_cid):
    when ownSizeof(struct_ngtcp2_version_cid) !=
        ownSizeof(struct_ngtcp2_version_cid_553648732):
      static :
        warning("Declaration of " & "struct_ngtcp2_version_cid" &
            " exists but with different size")
    struct_ngtcp2_version_cid
  else:
    struct_ngtcp2_version_cid_553648732)
  ptls_log_conn_state_t_553649009 = (when declared(ptls_log_conn_state_t):
    when ownSizeof(ptls_log_conn_state_t) != ownSizeof(ptls_log_conn_state_t_553649008):
      static :
        warning("Declaration of " & "ptls_log_conn_state_t" &
            " exists but with different size")
    ptls_log_conn_state_t
  else:
    ptls_log_conn_state_t_553649008)
  struct_st_ptls_hpke_cipher_suite_t_553648919 = (when declared(
      struct_st_ptls_hpke_cipher_suite_t):
    when ownSizeof(struct_st_ptls_hpke_cipher_suite_t) !=
        ownSizeof(struct_st_ptls_hpke_cipher_suite_t_553648918):
      static :
        warning("Declaration of " & "struct_st_ptls_hpke_cipher_suite_t" &
            " exists but with different size")
    struct_st_ptls_hpke_cipher_suite_t
  else:
    struct_st_ptls_hpke_cipher_suite_t_553648918)
  in_addr_t_553649065 = (when declared(in_addr_t):
    when ownSizeof(in_addr_t) != ownSizeof(in_addr_t_553649064):
      static :
        warning("Declaration of " & "in_addr_t" &
            " exists but with different size")
    in_addr_t
  else:
    in_addr_t_553649064)
  struct_st_ptls_openssl_override_verify_certificate_t_553649033 = (when declared(
      struct_st_ptls_openssl_override_verify_certificate_t):
    when ownSizeof(struct_st_ptls_openssl_override_verify_certificate_t) !=
        ownSizeof(struct_st_ptls_openssl_override_verify_certificate_t_553649032):
      static :
        warning("Declaration of " &
            "struct_st_ptls_openssl_override_verify_certificate_t" &
            " exists but with different size")
    struct_st_ptls_openssl_override_verify_certificate_t
  else:
    struct_st_ptls_openssl_override_verify_certificate_t_553649032)
  ngtcp2_connection_id_status_type_553648793 = (when declared(
      ngtcp2_connection_id_status_type):
    when ownSizeof(ngtcp2_connection_id_status_type) !=
        ownSizeof(ngtcp2_connection_id_status_type_553648792):
      static :
        warning("Declaration of " & "ngtcp2_connection_id_status_type" &
            " exists but with different size")
    ngtcp2_connection_id_status_type
  else:
    ngtcp2_connection_id_status_type_553648792)
  ngtcp2_sockaddr_union_553648652 = (when declared(ngtcp2_sockaddr_union):
    when ownSizeof(ngtcp2_sockaddr_union) != ownSizeof(ngtcp2_sockaddr_union_553648651):
      static :
        warning("Declaration of " & "ngtcp2_sockaddr_union" &
            " exists but with different size")
    ngtcp2_sockaddr_union
  else:
    ngtcp2_sockaddr_union_553648651)
  ngtcp2_cid_token_553648825 = (when declared(ngtcp2_cid_token):
    when ownSizeof(ngtcp2_cid_token) != ownSizeof(ngtcp2_cid_token_553648824):
      static :
        warning("Declaration of " & "ngtcp2_cid_token" &
            " exists but with different size")
    ngtcp2_cid_token
  else:
    ngtcp2_cid_token_553648824)
  ptls_buffer_t_553648859 = (when declared(ptls_buffer_t):
    when ownSizeof(ptls_buffer_t) != ownSizeof(ptls_buffer_t_553648858):
      static :
        warning("Declaration of " & "ptls_buffer_t" &
            " exists but with different size")
    ptls_buffer_t
  else:
    ptls_buffer_t_553648858)
  struct_st_ptls_buffer_t_553648857 = (when declared(struct_st_ptls_buffer_t):
    when ownSizeof(struct_st_ptls_buffer_t) !=
        ownSizeof(struct_st_ptls_buffer_t_553648856):
      static :
        warning("Declaration of " & "struct_st_ptls_buffer_t" &
            " exists but with different size")
    struct_st_ptls_buffer_t
  else:
    struct_st_ptls_buffer_t_553648856)
  ptls_aead_algorithm_t_553648889 = (when declared(ptls_aead_algorithm_t):
    when ownSizeof(ptls_aead_algorithm_t) != ownSizeof(ptls_aead_algorithm_t_553648888):
      static :
        warning("Declaration of " & "ptls_aead_algorithm_t" &
            " exists but with different size")
    ptls_aead_algorithm_t
  else:
    ptls_aead_algorithm_t_553648888)
  ngtcp2_ssize_553648586 = (when declared(ngtcp2_ssize):
    when ownSizeof(ngtcp2_ssize) != ownSizeof(ngtcp2_ssize_553648585):
      static :
        warning("Declaration of " & "ngtcp2_ssize" &
            " exists but with different size")
    ngtcp2_ssize
  else:
    ngtcp2_ssize_553648585)
  ngtcp2_sockaddr_in6_553648642 = (when declared(ngtcp2_sockaddr_in6):
    when ownSizeof(ngtcp2_sockaddr_in6) != ownSizeof(ngtcp2_sockaddr_in6_553648641):
      static :
        warning("Declaration of " & "ngtcp2_sockaddr_in6" &
            " exists but with different size")
    ngtcp2_sockaddr_in6
  else:
    ngtcp2_sockaddr_in6_553648641)
  ngtcp2_mem_553648600 = (when declared(ngtcp2_mem):
    when ownSizeof(ngtcp2_mem) != ownSizeof(ngtcp2_mem_553648599):
      static :
        warning("Declaration of " & "ngtcp2_mem" &
            " exists but with different size")
    ngtcp2_mem
  else:
    ngtcp2_mem_553648599)
  ptls_hash_final_mode_t_553648893 = (when declared(ptls_hash_final_mode_t):
    when ownSizeof(ptls_hash_final_mode_t) != ownSizeof(ptls_hash_final_mode_t_553648892):
      static :
        warning("Declaration of " & "ptls_hash_final_mode_t" &
            " exists but with different size")
    ptls_hash_final_mode_t
  else:
    ptls_hash_final_mode_t_553648892)
  ngtcp2_pkt_info_553648604 = (when declared(ngtcp2_pkt_info):
    when ownSizeof(ngtcp2_pkt_info) != ownSizeof(ngtcp2_pkt_info_553648603):
      static :
        warning("Declaration of " & "ngtcp2_pkt_info" &
            " exists but with different size")
    ngtcp2_pkt_info
  else:
    ngtcp2_pkt_info_553648603)
  ptrdiff_t_553648588 = (when declared(ptrdiff_t):
    when ownSizeof(ptrdiff_t) != ownSizeof(ptrdiff_t_553648587):
      static :
        warning("Declaration of " & "ptrdiff_t" &
            " exists but with different size")
    ptrdiff_t
  else:
    ptrdiff_t_553648587)
  struct_st_ptls_aead_context_t_553648883 = (when declared(
      struct_st_ptls_aead_context_t):
    when ownSizeof(struct_st_ptls_aead_context_t) !=
        ownSizeof(struct_st_ptls_aead_context_t_553648882):
      static :
        warning("Declaration of " & "struct_st_ptls_aead_context_t" &
            " exists but with different size")
    struct_st_ptls_aead_context_t
  else:
    struct_st_ptls_aead_context_t_553648882)
  ngtcp2_preferred_addr_553648656 = (when declared(ngtcp2_preferred_addr):
    when ownSizeof(ngtcp2_preferred_addr) != ownSizeof(ngtcp2_preferred_addr_553648655):
      static :
        warning("Declaration of " & "ngtcp2_preferred_addr" &
            " exists but with different size")
    ngtcp2_preferred_addr
  else:
    ngtcp2_preferred_addr_553648655)
  struct_st_ptls_hpke_kem_t_553648911 = (when declared(struct_st_ptls_hpke_kem_t):
    when ownSizeof(struct_st_ptls_hpke_kem_t) !=
        ownSizeof(struct_st_ptls_hpke_kem_t_553648910):
      static :
        warning("Declaration of " & "struct_st_ptls_hpke_kem_t" &
            " exists but with different size")
    struct_st_ptls_hpke_kem_t
  else:
    struct_st_ptls_hpke_kem_t_553648910)
  ngtcp2_realloc_553648596 = (when declared(ngtcp2_realloc):
    when ownSizeof(ngtcp2_realloc) != ownSizeof(ngtcp2_realloc_553648595):
      static :
        warning("Declaration of " & "ngtcp2_realloc" &
            " exists but with different size")
    ngtcp2_realloc
  else:
    ngtcp2_realloc_553648595)
  ngtcp2_crypto_cipher_ctx_553648727 = (when declared(ngtcp2_crypto_cipher_ctx):
    when ownSizeof(ngtcp2_crypto_cipher_ctx) !=
        ownSizeof(ngtcp2_crypto_cipher_ctx_553648726):
      static :
        warning("Declaration of " & "ngtcp2_crypto_cipher_ctx" &
            " exists but with different size")
    ngtcp2_crypto_cipher_ctx
  else:
    ngtcp2_crypto_cipher_ctx_553648726)
  ngtcp2_version_cid_553648735 = (when declared(ngtcp2_version_cid):
    when ownSizeof(ngtcp2_version_cid) != ownSizeof(ngtcp2_version_cid_553648734):
      static :
        warning("Declaration of " & "ngtcp2_version_cid" &
            " exists but with different size")
    ngtcp2_version_cid
  else:
    ngtcp2_version_cid_553648734)
  ptls_on_client_hello_parameters_t_553648929 = (when declared(
      ptls_on_client_hello_parameters_t):
    when ownSizeof(ptls_on_client_hello_parameters_t) !=
        ownSizeof(ptls_on_client_hello_parameters_t_553648928):
      static :
        warning("Declaration of " & "ptls_on_client_hello_parameters_t" &
            " exists but with different size")
    ptls_on_client_hello_parameters_t
  else:
    ptls_on_client_hello_parameters_t_553648928)
  ngtcp2_recv_client_initial_553648741 = (when declared(
      ngtcp2_recv_client_initial):
    when ownSizeof(ngtcp2_recv_client_initial) !=
        ownSizeof(ngtcp2_recv_client_initial_553648740):
      static :
        warning("Declaration of " & "ngtcp2_recv_client_initial" &
            " exists but with different size")
    ngtcp2_recv_client_initial
  else:
    ngtcp2_recv_client_initial_553648740)
  ptls_on_client_hello_t_553648937 = (when declared(ptls_on_client_hello_t):
    when ownSizeof(ptls_on_client_hello_t) != ownSizeof(ptls_on_client_hello_t_553648936):
      static :
        warning("Declaration of " & "ptls_on_client_hello_t" &
            " exists but with different size")
    ptls_on_client_hello_t
  else:
    ptls_on_client_hello_t_553648936)
  ngtcp2_vec_553648624 = (when declared(ngtcp2_vec):
    when ownSizeof(ngtcp2_vec) != ownSizeof(ngtcp2_vec_553648623):
      static :
        warning("Declaration of " & "ngtcp2_vec" &
            " exists but with different size")
    ngtcp2_vec
  else:
    ngtcp2_vec_553648623)
  struct_st_ptls_encrypt_ticket_t_553648955 = (when declared(
      struct_st_ptls_encrypt_ticket_t):
    when ownSizeof(struct_st_ptls_encrypt_ticket_t) !=
        ownSizeof(struct_st_ptls_encrypt_ticket_t_553648954):
      static :
        warning("Declaration of " & "struct_st_ptls_encrypt_ticket_t" &
            " exists but with different size")
    struct_st_ptls_encrypt_ticket_t
  else:
    struct_st_ptls_encrypt_ticket_t_553648954)
  union_ngtcp2_sockaddr_union_553648650 = (when declared(
      union_ngtcp2_sockaddr_union):
    when ownSizeof(union_ngtcp2_sockaddr_union) !=
        ownSizeof(union_ngtcp2_sockaddr_union_553648649):
      static :
        warning("Declaration of " & "union_ngtcp2_sockaddr_union" &
            " exists but with different size")
    union_ngtcp2_sockaddr_union
  else:
    union_ngtcp2_sockaddr_union_553648649)
  struct_st_ptls_openssl_raw_pubkey_verify_certificate_t_553649029 = (when declared(
      struct_st_ptls_openssl_raw_pubkey_verify_certificate_t):
    when ownSizeof(struct_st_ptls_openssl_raw_pubkey_verify_certificate_t) !=
        ownSizeof(struct_st_ptls_openssl_raw_pubkey_verify_certificate_t_553649028):
      static :
        warning("Declaration of " &
            "struct_st_ptls_openssl_raw_pubkey_verify_certificate_t" &
            " exists but with different size")
    struct_st_ptls_openssl_raw_pubkey_verify_certificate_t
  else:
    struct_st_ptls_openssl_raw_pubkey_verify_certificate_t_553649028)
  ngtcp2_rand_553648779 = (when declared(ngtcp2_rand):
    when ownSizeof(ngtcp2_rand) != ownSizeof(ngtcp2_rand_553648778):
      static :
        warning("Declaration of " & "ngtcp2_rand" &
            " exists but with different size")
    ngtcp2_rand
  else:
    ngtcp2_rand_553648778)
  enum_ngtcp2_pkt_type_553648606 = (when declared(enum_ngtcp2_pkt_type):
    when ownSizeof(enum_ngtcp2_pkt_type) != ownSizeof(enum_ngtcp2_pkt_type_553648605):
      static :
        warning("Declaration of " & "enum_ngtcp2_pkt_type" &
            " exists but with different size")
    enum_ngtcp2_pkt_type
  else:
    enum_ngtcp2_pkt_type_553648605)
  struct_in_addr_553649013 = (when declared(struct_in_addr):
    when ownSizeof(struct_in_addr) != ownSizeof(struct_in_addr_553649012):
      static :
        warning("Declaration of " & "struct_in_addr" &
            " exists but with different size")
    struct_in_addr
  else:
    struct_in_addr_553649012)
  struct_st_ptls_cipher_algorithm_t_553648873 = (when declared(
      struct_st_ptls_cipher_algorithm_t):
    when ownSizeof(struct_st_ptls_cipher_algorithm_t) !=
        ownSizeof(struct_st_ptls_cipher_algorithm_t_553648872):
      static :
        warning("Declaration of " & "struct_st_ptls_cipher_algorithm_t" &
            " exists but with different size")
    struct_st_ptls_cipher_algorithm_t
  else:
    struct_st_ptls_cipher_algorithm_t_553648872)
  ptls_cipher_context_t_553648875 = (when declared(ptls_cipher_context_t):
    when ownSizeof(ptls_cipher_context_t) != ownSizeof(ptls_cipher_context_t_553648874):
      static :
        warning("Declaration of " & "ptls_cipher_context_t" &
            " exists but with different size")
    ptls_cipher_context_t
  else:
    ptls_cipher_context_t_553648874)
  enum_ngtcp2_cc_algo_553648677 = (when declared(enum_ngtcp2_cc_algo):
    when ownSizeof(enum_ngtcp2_cc_algo) != ownSizeof(enum_ngtcp2_cc_algo_553648676):
      static :
        warning("Declaration of " & "enum_ngtcp2_cc_algo" &
            " exists but with different size")
    enum_ngtcp2_cc_algo
  else:
    enum_ngtcp2_cc_algo_553648676)
  ptls_update_open_count_t_553648971 = (when declared(ptls_update_open_count_t):
    when ownSizeof(ptls_update_open_count_t) !=
        ownSizeof(ptls_update_open_count_t_553648970):
      static :
        warning("Declaration of " & "ptls_update_open_count_t" &
            " exists but with different size")
    ptls_update_open_count_t
  else:
    ptls_update_open_count_t_553648970)
  struct_ngtcp2_crypto_ctx_553648729 = (when declared(struct_ngtcp2_crypto_ctx):
    when ownSizeof(struct_ngtcp2_crypto_ctx) !=
        ownSizeof(struct_ngtcp2_crypto_ctx_553648728):
      static :
        warning("Declaration of " & "struct_ngtcp2_crypto_ctx" &
            " exists but with different size")
    struct_ngtcp2_crypto_ctx
  else:
    struct_ngtcp2_crypto_ctx_553648728)
  ngtcp2_extend_max_stream_data_553648777 = (when declared(
      ngtcp2_extend_max_stream_data):
    when ownSizeof(ngtcp2_extend_max_stream_data) !=
        ownSizeof(ngtcp2_extend_max_stream_data_553648776):
      static :
        warning("Declaration of " & "ngtcp2_extend_max_stream_data" &
            " exists but with different size")
    ngtcp2_extend_max_stream_data
  else:
    ngtcp2_extend_max_stream_data_553648776)
  ngtcp2_lost_datagram_553648807 = (when declared(ngtcp2_lost_datagram):
    when ownSizeof(ngtcp2_lost_datagram) != ownSizeof(ngtcp2_lost_datagram_553648806):
      static :
        warning("Declaration of " & "ngtcp2_lost_datagram" &
            " exists but with different size")
    ngtcp2_lost_datagram
  else:
    ngtcp2_lost_datagram_553648806)
  ptls_openssl_signature_scheme_t_553649021 = (when declared(
      ptls_openssl_signature_scheme_t):
    when ownSizeof(ptls_openssl_signature_scheme_t) !=
        ownSizeof(ptls_openssl_signature_scheme_t_553649020):
      static :
        warning("Declaration of " & "ptls_openssl_signature_scheme_t" &
            " exists but with different size")
    ptls_openssl_signature_scheme_t
  else:
    ptls_openssl_signature_scheme_t_553649020)
  ngtcp2_recv_crypto_data_553648747 = (when declared(ngtcp2_recv_crypto_data):
    when ownSizeof(ngtcp2_recv_crypto_data) !=
        ownSizeof(ngtcp2_recv_crypto_data_553648746):
      static :
        warning("Declaration of " & "ngtcp2_recv_crypto_data" &
            " exists but with different size")
    ngtcp2_recv_crypto_data
  else:
    ngtcp2_recv_crypto_data_553648746)
  ngtcp2_handshake_confirmed_553648751 = (when declared(
      ngtcp2_handshake_confirmed):
    when ownSizeof(ngtcp2_handshake_confirmed) !=
        ownSizeof(ngtcp2_handshake_confirmed_553648750):
      static :
        warning("Declaration of " & "ngtcp2_handshake_confirmed" &
            " exists but with different size")
    ngtcp2_handshake_confirmed
  else:
    ngtcp2_handshake_confirmed_553648750)
  struct_st_ptls_hash_algorithm_t_553648899 = (when declared(
      struct_st_ptls_hash_algorithm_t):
    when ownSizeof(struct_st_ptls_hash_algorithm_t) !=
        ownSizeof(struct_st_ptls_hash_algorithm_t_553648898):
      static :
        warning("Declaration of " & "struct_st_ptls_hash_algorithm_t" &
            " exists but with different size")
    struct_st_ptls_hash_algorithm_t
  else:
    struct_st_ptls_hash_algorithm_t_553648898)
  ngtcp2_printf_553648681 = (when declared(ngtcp2_printf):
    when ownSizeof(ngtcp2_printf) != ownSizeof(ngtcp2_printf_553648680):
      static :
        warning("Declaration of " & "ngtcp2_printf" &
            " exists but with different size")
    ngtcp2_printf
  else:
    ngtcp2_printf_553648680)
  struct_ngtcp2_crypto_md_553648709 = (when declared(struct_ngtcp2_crypto_md):
    when ownSizeof(struct_ngtcp2_crypto_md) !=
        ownSizeof(struct_ngtcp2_crypto_md_553648708):
      static :
        warning("Declaration of " & "struct_ngtcp2_crypto_md" &
            " exists but with different size")
    struct_ngtcp2_crypto_md
  else:
    struct_ngtcp2_crypto_md_553648708)
  struct_st_ptls_save_ticket_t_553648959 = (when declared(
      struct_st_ptls_save_ticket_t):
    when ownSizeof(struct_st_ptls_save_ticket_t) !=
        ownSizeof(struct_st_ptls_save_ticket_t_553648958):
      static :
        warning("Declaration of " & "struct_st_ptls_save_ticket_t" &
            " exists but with different size")
    struct_st_ptls_save_ticket_t
  else:
    struct_st_ptls_save_ticket_t_553648958)
  struct_in6_addr_553649007 = (when declared(struct_in6_addr):
    when ownSizeof(struct_in6_addr) != ownSizeof(struct_in6_addr_553649006):
      static :
        warning("Declaration of " & "struct_in6_addr" &
            " exists but with different size")
    struct_in6_addr
  else:
    struct_in6_addr_553649006)
  struct_ngtcp2_crypto_conn_ref_553648841 = (when declared(
      struct_ngtcp2_crypto_conn_ref):
    when ownSizeof(struct_ngtcp2_crypto_conn_ref) !=
        ownSizeof(struct_ngtcp2_crypto_conn_ref_553648840):
      static :
        warning("Declaration of " & "struct_ngtcp2_crypto_conn_ref" &
            " exists but with different size")
    struct_ngtcp2_crypto_conn_ref
  else:
    struct_ngtcp2_crypto_conn_ref_553648840)
  struct_st_ptls_update_traffic_key_t_553648973 = (when declared(
      struct_st_ptls_update_traffic_key_t):
    when ownSizeof(struct_st_ptls_update_traffic_key_t) !=
        ownSizeof(struct_st_ptls_update_traffic_key_t_553648972):
      static :
        warning("Declaration of " & "struct_st_ptls_update_traffic_key_t" &
            " exists but with different size")
    struct_st_ptls_update_traffic_key_t
  else:
    struct_st_ptls_update_traffic_key_t_553648972)
  ngtcp2_crypto_picotls_ctx_553649051 = (when declared(ngtcp2_crypto_picotls_ctx):
    when ownSizeof(ngtcp2_crypto_picotls_ctx) !=
        ownSizeof(ngtcp2_crypto_picotls_ctx_553649050):
      static :
        warning("Declaration of " & "ngtcp2_crypto_picotls_ctx" &
            " exists but with different size")
    ngtcp2_crypto_picotls_ctx
  else:
    ngtcp2_crypto_picotls_ctx_553649050)
  struct_ngtcp2_ccerr_553648831 = (when declared(struct_ngtcp2_ccerr):
    when ownSizeof(struct_ngtcp2_ccerr) != ownSizeof(struct_ngtcp2_ccerr_553648830):
      static :
        warning("Declaration of " & "struct_ngtcp2_ccerr" &
            " exists but with different size")
    struct_ngtcp2_ccerr
  else:
    struct_ngtcp2_ccerr_553648830)
when not declared(ptls_hpke_kem_t):
  type
    ptls_hpke_kem_t* = ptls_hpke_kem_t_553648912
else:
  static :
    hint("Declaration of " & "ptls_hpke_kem_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_recv_retry):
  type
    ngtcp2_recv_retry* = ngtcp2_recv_retry_553648754
else:
  static :
    hint("Declaration of " & "ngtcp2_recv_retry" &
        " already exists, not redeclaring")
when not declared(X509):
  type
    X509* = X509_553649026
else:
  static :
    hint("Declaration of " & "X509" & " already exists, not redeclaring")
when not declared(ngtcp2_sockaddr_in):
  type
    ngtcp2_sockaddr_in* = ngtcp2_sockaddr_in_553648637
else:
  static :
    hint("Declaration of " & "ngtcp2_sockaddr_in" &
        " already exists, not redeclaring")
when not declared(ptls_message_emitter_t):
  type
    ptls_message_emitter_t* = ptls_message_emitter_t_553648908
else:
  static :
    hint("Declaration of " & "ptls_message_emitter_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_verify_certificate_t):
  type
    struct_st_ptls_verify_certificate_t* = struct_st_ptls_verify_certificate_t_553648950
else:
  static :
    hint("Declaration of " & "struct_st_ptls_verify_certificate_t" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_transport_params):
  type
    struct_ngtcp2_transport_params* = struct_ngtcp2_transport_params_553648661
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_transport_params" &
        " already exists, not redeclaring")
when not declared(EVP_MAC_CTX):
  type
    EVP_MAC_CTX* = EVP_MAC_CTX_553649046
else:
  static :
    hint("Declaration of " & "EVP_MAC_CTX" & " already exists, not redeclaring")
when not declared(struct_st_ptls_log_state_t):
  type
    struct_st_ptls_log_state_t* = struct_st_ptls_log_state_t_553649000
else:
  static :
    hint("Declaration of " & "struct_st_ptls_log_state_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_client_hello_psk_identity_t):
  type
    struct_st_ptls_client_hello_psk_identity_t* = struct_st_ptls_client_hello_psk_identity_t_553648922
else:
  static :
    hint("Declaration of " & "struct_st_ptls_client_hello_psk_identity_t" &
        " already exists, not redeclaring")
when not declared(ptls_emit_certificate_t):
  type
    ptls_emit_certificate_t* = ptls_emit_certificate_t_553648940
else:
  static :
    hint("Declaration of " & "ptls_emit_certificate_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_path_validation_result):
  type
    ngtcp2_path_validation_result* = ngtcp2_path_validation_result_553648611
else:
  static :
    hint("Declaration of " & "ngtcp2_path_validation_result" &
        " already exists, not redeclaring")
when not declared(ngtcp2_ack_datagram):
  type
    ngtcp2_ack_datagram* = ngtcp2_ack_datagram_553648804
else:
  static :
    hint("Declaration of " & "ngtcp2_ack_datagram" &
        " already exists, not redeclaring")
when not declared(ngtcp2_info):
  type
    ngtcp2_info* = ngtcp2_info_553648836
else:
  static :
    hint("Declaration of " & "ngtcp2_info" & " already exists, not redeclaring")
when not declared(struct_st_ptls_cipher_suite_t):
  type
    struct_st_ptls_cipher_suite_t* = struct_st_ptls_cipher_suite_t_553648902
else:
  static :
    hint("Declaration of " & "struct_st_ptls_cipher_suite_t" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_crypto_picotls_ctx):
  type
    struct_ngtcp2_crypto_picotls_ctx* = struct_ngtcp2_crypto_picotls_ctx_553649048
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_crypto_picotls_ctx" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_on_client_hello_t):
  type
    struct_st_ptls_on_client_hello_t* = struct_st_ptls_on_client_hello_t_553648934
else:
  static :
    hint("Declaration of " & "struct_st_ptls_on_client_hello_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_stream_close):
  type
    ngtcp2_stream_close* = ngtcp2_stream_close_553648766
else:
  static :
    hint("Declaration of " & "ngtcp2_stream_close" &
        " already exists, not redeclaring")
when not declared(X509_STORE):
  type
    X509_STORE* = X509_STORE_553649038
else:
  static :
    hint("Declaration of " & "X509_STORE" & " already exists, not redeclaring")
when not declared(struct_ngtcp2_callbacks):
  type
    struct_ngtcp2_callbacks* = struct_ngtcp2_callbacks_553648818
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_callbacks" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_info):
  type
    struct_ngtcp2_info* = struct_ngtcp2_info_553648834
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_info" &
        " already exists, not redeclaring")
when not declared(ngtcp2_delete_crypto_aead_ctx):
  type
    ngtcp2_delete_crypto_aead_ctx* = ngtcp2_delete_crypto_aead_ctx_553648798
else:
  static :
    hint("Declaration of " & "ngtcp2_delete_crypto_aead_ctx" &
        " already exists, not redeclaring")
when not declared(ptls_get_time_t):
  type
    ptls_get_time_t* = ptls_get_time_t_553648932
else:
  static :
    hint("Declaration of " & "ptls_get_time_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_select_preferred_addr):
  type
    ngtcp2_select_preferred_addr* = ngtcp2_select_preferred_addr_553648788
else:
  static :
    hint("Declaration of " & "ngtcp2_select_preferred_addr" &
        " already exists, not redeclaring")
when not declared(ptls_update_traffic_key_t):
  type
    ptls_update_traffic_key_t* = ptls_update_traffic_key_t_553648974
else:
  static :
    hint("Declaration of " & "ptls_update_traffic_key_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_log_t):
  type
    struct_st_ptls_log_t* = struct_st_ptls_log_t_553649010
else:
  static :
    hint("Declaration of " & "struct_st_ptls_log_t" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_version_info):
  type
    struct_ngtcp2_version_info* = struct_ngtcp2_version_info_553648657
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_version_info" &
        " already exists, not redeclaring")
when not declared(enum_en_ptls_hash_final_mode_t):
  type
    enum_en_ptls_hash_final_mode_t* = enum_en_ptls_hash_final_mode_t_553648890
else:
  static :
    hint("Declaration of " & "enum_en_ptls_hash_final_mode_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_encryption_level):
  type
    ngtcp2_encryption_level* = ngtcp2_encryption_level_553648744
else:
  static :
    hint("Declaration of " & "ngtcp2_encryption_level" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_update_open_count_t):
  type
    struct_st_ptls_update_open_count_t* = struct_st_ptls_update_open_count_t_553648966
else:
  static :
    hint("Declaration of " & "struct_st_ptls_update_open_count_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_malloc):
  type
    ngtcp2_malloc* = ngtcp2_malloc_553648589
else:
  static :
    hint("Declaration of " & "ngtcp2_malloc" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_pkt_hd):
  type
    struct_ngtcp2_pkt_hd* = struct_ngtcp2_pkt_hd_553648625
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_pkt_hd" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn):
  type
    ngtcp2_conn* = ngtcp2_conn_553648736
else:
  static :
    hint("Declaration of " & "ngtcp2_conn" & " already exists, not redeclaring")
when not declared(ngtcp2_connection_id_status):
  type
    ngtcp2_connection_id_status* = ngtcp2_connection_id_status_553648794
else:
  static :
    hint("Declaration of " & "ngtcp2_connection_id_status" &
        " already exists, not redeclaring")
when not declared(ngtcp2_recv_key):
  type
    ngtcp2_recv_key* = ngtcp2_recv_key_553648814
else:
  static :
    hint("Declaration of " & "ngtcp2_recv_key" &
        " already exists, not redeclaring")
when not declared(ptls_key_exchange_context_t):
  type
    ptls_key_exchange_context_t* = ptls_key_exchange_context_t_553648864
else:
  static :
    hint("Declaration of " & "ptls_key_exchange_context_t" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_crypto_aead_ctx):
  type
    struct_ngtcp2_crypto_aead_ctx* = struct_ngtcp2_crypto_aead_ctx_553648720
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_crypto_aead_ctx" &
        " already exists, not redeclaring")
when not declared(ptls_ech_create_opener_t):
  type
    ptls_ech_create_opener_t* = ptls_ech_create_opener_t_553648986
else:
  static :
    hint("Declaration of " & "ptls_ech_create_opener_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_sign_certificate_t):
  type
    struct_st_ptls_sign_certificate_t* = struct_st_ptls_sign_certificate_t_553648946
else:
  static :
    hint("Declaration of " & "struct_st_ptls_sign_certificate_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_duration):
  type
    ngtcp2_duration* = ngtcp2_duration_553648615
else:
  static :
    hint("Declaration of " & "ngtcp2_duration" &
        " already exists, not redeclaring")
when not declared(struct_sockaddr_in):
  type
    struct_sockaddr_in* = struct_sockaddr_in_553648639
else:
  static :
    hint("Declaration of " & "struct_sockaddr_in" &
        " already exists, not redeclaring")
when not declared(compiler_socklen_t):
  type
    compiler_socklen_t* = compiler_socklen_t_553649060
else:
  static :
    hint("Declaration of " & "compiler_socklen_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_cc_algo):
  type
    ngtcp2_cc_algo* = ngtcp2_cc_algo_553648678
else:
  static :
    hint("Declaration of " & "ngtcp2_cc_algo" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_md):
  type
    ngtcp2_crypto_md* = ngtcp2_crypto_md_553648710
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_md" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_raw_extension_t):
  type
    struct_st_ptls_raw_extension_t* = struct_st_ptls_raw_extension_t_553648988
else:
  static :
    hint("Declaration of " & "struct_st_ptls_raw_extension_t" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_path):
  type
    struct_ngtcp2_path* = struct_ngtcp2_path_553648700
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_path" &
        " already exists, not redeclaring")
when not declared(ngtcp2_decrypt):
  type
    ngtcp2_decrypt* = ngtcp2_decrypt_553648758
else:
  static :
    hint("Declaration of " & "ngtcp2_decrypt" &
        " already exists, not redeclaring")
when not declared(ngtcp2_tstamp):
  type
    ngtcp2_tstamp* = ngtcp2_tstamp_553648613
else:
  static :
    hint("Declaration of " & "ngtcp2_tstamp" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_key_exchange_context_t):
  type
    struct_st_ptls_key_exchange_context_t* = struct_st_ptls_key_exchange_context_t_553648860
else:
  static :
    hint("Declaration of " & "struct_st_ptls_key_exchange_context_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_conn_ref):
  type
    ngtcp2_crypto_conn_ref* = ngtcp2_crypto_conn_ref_553648838
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_conn_ref" &
        " already exists, not redeclaring")
when not declared(ptls_raw_extension_t):
  type
    ptls_raw_extension_t* = ptls_raw_extension_t_553648990
else:
  static :
    hint("Declaration of " & "ptls_raw_extension_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_recv_version_negotiation):
  type
    ngtcp2_recv_version_negotiation* = ngtcp2_recv_version_negotiation_553648752
else:
  static :
    hint("Declaration of " & "ngtcp2_recv_version_negotiation" &
        " already exists, not redeclaring")
when not declared(ptls_on_extension_t):
  type
    ptls_on_extension_t* = ptls_on_extension_t_553648978
else:
  static :
    hint("Declaration of " & "ptls_on_extension_t" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_sign_certificate_t):
  type
    ptls_openssl_sign_certificate_t* = ptls_openssl_sign_certificate_t_553649024
else:
  static :
    hint("Declaration of " & "ptls_openssl_sign_certificate_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_hpke_cipher_suite_id_t):
  type
    struct_st_ptls_hpke_cipher_suite_id_t* = struct_st_ptls_hpke_cipher_suite_id_t_553648914
else:
  static :
    hint("Declaration of " & "struct_st_ptls_hpke_cipher_suite_id_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_aead_supplementary_encryption_t):
  type
    struct_st_ptls_aead_supplementary_encryption_t* = struct_st_ptls_aead_supplementary_encryption_t_553648878
else:
  static :
    hint("Declaration of " & "struct_st_ptls_aead_supplementary_encryption_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_aead):
  type
    ngtcp2_crypto_aead* = ngtcp2_crypto_aead_553648714
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_aead" &
        " already exists, not redeclaring")
when not declared(struct_ptls_cred_buffer_s):
  type
    struct_ptls_cred_buffer_s* = struct_ptls_cred_buffer_s_553649052
else:
  static :
    hint("Declaration of " & "struct_ptls_cred_buffer_s" &
        " already exists, not redeclaring")
when not declared(ptls_key_schedule_t):
  type
    ptls_key_schedule_t* = ptls_key_schedule_t_553648850
else:
  static :
    hint("Declaration of " & "ptls_key_schedule_t" &
        " already exists, not redeclaring")
when not declared(ptls_verify_certificate_t):
  type
    ptls_verify_certificate_t* = ptls_verify_certificate_t_553648952
else:
  static :
    hint("Declaration of " & "ptls_verify_certificate_t" &
        " already exists, not redeclaring")
when not declared(ptls_encrypt_ticket_t):
  type
    ptls_encrypt_ticket_t* = ptls_encrypt_ticket_t_553648956
else:
  static :
    hint("Declaration of " & "ptls_encrypt_ticket_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_settings):
  type
    ngtcp2_settings* = ngtcp2_settings_553648694
else:
  static :
    hint("Declaration of " & "ngtcp2_settings" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_get_time_t):
  type
    struct_st_ptls_get_time_t* = struct_st_ptls_get_time_t_553648930
else:
  static :
    hint("Declaration of " & "struct_st_ptls_get_time_t" &
        " already exists, not redeclaring")
when not declared(ptls_async_job_t):
  type
    ptls_async_job_t* = ptls_async_job_t_553648944
else:
  static :
    hint("Declaration of " & "ptls_async_job_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_log_conn_state_t):
  type
    struct_st_ptls_log_conn_state_t* = struct_st_ptls_log_conn_state_t_553649004
else:
  static :
    hint("Declaration of " & "struct_st_ptls_log_conn_state_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_key_exchange_algorithm_t):
  type
    struct_st_ptls_key_exchange_algorithm_t* = struct_st_ptls_key_exchange_algorithm_t_553648862
else:
  static :
    hint("Declaration of " & "struct_st_ptls_key_exchange_algorithm_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_hp_mask):
  type
    ngtcp2_hp_mask* = ngtcp2_hp_mask_553648760
else:
  static :
    hint("Declaration of " & "ngtcp2_hp_mask" &
        " already exists, not redeclaring")
when not declared(EVP_MD):
  type
    EVP_MD* = EVP_MD_553649018
else:
  static :
    hint("Declaration of " & "EVP_MD" & " already exists, not redeclaring")
when not declared(ptls_client_hello_psk_identity_t):
  type
    ptls_client_hello_psk_identity_t* = ptls_client_hello_psk_identity_t_553648924
else:
  static :
    hint("Declaration of " & "ptls_client_hello_psk_identity_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_log_event_t):
  type
    struct_st_ptls_log_event_t* = struct_st_ptls_log_event_t_553648962
else:
  static :
    hint("Declaration of " & "struct_st_ptls_log_event_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_recv_new_token):
  type
    ngtcp2_recv_new_token* = ngtcp2_recv_new_token_553648796
else:
  static :
    hint("Declaration of " & "ngtcp2_recv_new_token" &
        " already exists, not redeclaring")
when not declared(enum_en_ptls_early_data_acceptance_t):
  type
    enum_en_ptls_early_data_acceptance_t* = enum_en_ptls_early_data_acceptance_t_553648992
else:
  static :
    hint("Declaration of " & "enum_en_ptls_early_data_acceptance_t" &
        " already exists, not redeclaring")
when not declared(enum_ngtcp2_path_validation_result):
  type
    enum_ngtcp2_path_validation_result* = enum_ngtcp2_path_validation_result_553648609
else:
  static :
    hint("Declaration of " & "enum_ngtcp2_path_validation_result" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_hash_context_t):
  type
    struct_st_ptls_hash_context_t* = struct_st_ptls_hash_context_t_553648894
else:
  static :
    hint("Declaration of " & "struct_st_ptls_hash_context_t" &
        " already exists, not redeclaring")
when not declared(socklen_t):
  type
    socklen_t* = socklen_t_553648647
else:
  static :
    hint("Declaration of " & "socklen_t" & " already exists, not redeclaring")
when not declared(struct_st_ptls_openssl_sign_certificate_t):
  type
    struct_st_ptls_openssl_sign_certificate_t* = struct_st_ptls_openssl_sign_certificate_t_553649022
else:
  static :
    hint("Declaration of " & "struct_st_ptls_openssl_sign_certificate_t" &
        " already exists, not redeclaring")
when not declared(in_port_t):
  type
    in_port_t* = in_port_t_553649058
else:
  static :
    hint("Declaration of " & "in_port_t" & " already exists, not redeclaring")
when not declared(struct_ngtcp2_vec):
  type
    struct_ngtcp2_vec* = struct_ngtcp2_vec_553648621
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_vec" &
        " already exists, not redeclaring")
when not declared(ngtcp2_ccerr_type):
  type
    ngtcp2_ccerr_type* = ngtcp2_ccerr_type_553648828
else:
  static :
    hint("Declaration of " & "ngtcp2_ccerr_type" &
        " already exists, not redeclaring")
when not declared(ptls_early_data_acceptance_t):
  type
    ptls_early_data_acceptance_t* = ptls_early_data_acceptance_t_553648994
else:
  static :
    hint("Declaration of " & "ptls_early_data_acceptance_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_transport_params):
  type
    ngtcp2_transport_params* = ngtcp2_transport_params_553648663
else:
  static :
    hint("Declaration of " & "ngtcp2_transport_params" &
        " already exists, not redeclaring")
when not declared(ngtcp2_acked_stream_data_offset):
  type
    ngtcp2_acked_stream_data_offset* = ngtcp2_acked_stream_data_offset_553648770
else:
  static :
    hint("Declaration of " & "ngtcp2_acked_stream_data_offset" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_iovec_t):
  type
    struct_st_ptls_iovec_t* = struct_st_ptls_iovec_t_553648852
else:
  static :
    hint("Declaration of " & "struct_st_ptls_iovec_t" &
        " already exists, not redeclaring")
when not declared(ptls_t):
  type
    ptls_t* = ptls_t_553648844
else:
  static :
    hint("Declaration of " & "ptls_t" & " already exists, not redeclaring")
when not declared(ngtcp2_free):
  type
    ngtcp2_free* = ngtcp2_free_553648591
else:
  static :
    hint("Declaration of " & "ngtcp2_free" & " already exists, not redeclaring")
when not declared(struct_st_ptls_cipher_context_t):
  type
    struct_st_ptls_cipher_context_t* = struct_st_ptls_cipher_context_t_553648870
else:
  static :
    hint("Declaration of " & "struct_st_ptls_cipher_context_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_aead_ctx):
  type
    ngtcp2_crypto_aead_ctx* = ngtcp2_crypto_aead_ctx_553648722
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_aead_ctx" &
        " already exists, not redeclaring")
when not declared(enum_ngtcp2_encryption_level):
  type
    enum_ngtcp2_encryption_level* = enum_ngtcp2_encryption_level_553648742
else:
  static :
    hint("Declaration of " & "enum_ngtcp2_encryption_level" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_get_conn):
  type
    ngtcp2_crypto_get_conn* = ngtcp2_crypto_get_conn_553648842
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_get_conn" &
        " already exists, not redeclaring")
when not declared(ptls_aead_supplementary_encryption_t):
  type
    ptls_aead_supplementary_encryption_t* = ptls_aead_supplementary_encryption_t_553648880
else:
  static :
    hint("Declaration of " & "ptls_aead_supplementary_encryption_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_sockaddr):
  type
    ngtcp2_sockaddr* = ngtcp2_sockaddr_553648633
else:
  static :
    hint("Declaration of " & "ngtcp2_sockaddr" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_ctx):
  type
    ngtcp2_crypto_ctx* = ngtcp2_crypto_ctx_553648730
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_ctx" &
        " already exists, not redeclaring")
when not declared(enum_ngtcp2_connection_id_status_type):
  type
    enum_ngtcp2_connection_id_status_type* = enum_ngtcp2_connection_id_status_type_553648790
else:
  static :
    hint("Declaration of " & "enum_ngtcp2_connection_id_status_type" &
        " already exists, not redeclaring")
when not declared(ptls_hash_algorithm_t):
  type
    ptls_hash_algorithm_t* = ptls_hash_algorithm_t_553648900
else:
  static :
    hint("Declaration of " & "ptls_hash_algorithm_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_emit_certificate_t):
  type
    struct_st_ptls_emit_certificate_t* = struct_st_ptls_emit_certificate_t_553648938
else:
  static :
    hint("Declaration of " & "struct_st_ptls_emit_certificate_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_on_client_hello_parameters_t):
  type
    struct_st_ptls_on_client_hello_parameters_t* = struct_st_ptls_on_client_hello_parameters_t_553648926
else:
  static :
    hint("Declaration of " & "struct_st_ptls_on_client_hello_parameters_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_async_job_t):
  type
    struct_st_ptls_async_job_t* = struct_st_ptls_async_job_t_553648942
else:
  static :
    hint("Declaration of " & "struct_st_ptls_async_job_t" &
        " already exists, not redeclaring")
when not declared(EVP_CIPHER_CTX):
  type
    EVP_CIPHER_CTX* = EVP_CIPHER_CTX_553649042
else:
  static :
    hint("Declaration of " & "EVP_CIPHER_CTX" &
        " already exists, not redeclaring")
when not declared(ptls_decompress_certificate_t):
  type
    ptls_decompress_certificate_t* = ptls_decompress_certificate_t_553648982
else:
  static :
    hint("Declaration of " & "ptls_decompress_certificate_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_update_key):
  type
    ngtcp2_update_key* = ngtcp2_update_key_553648784
else:
  static :
    hint("Declaration of " & "ngtcp2_update_key" &
        " already exists, not redeclaring")
when not declared(ngtcp2_get_new_connection_id):
  type
    ngtcp2_get_new_connection_id* = ngtcp2_get_new_connection_id_553648780
else:
  static :
    hint("Declaration of " & "ngtcp2_get_new_connection_id" &
        " already exists, not redeclaring")
when not declared(ngtcp2_encrypt):
  type
    ngtcp2_encrypt* = ngtcp2_encrypt_553648756
else:
  static :
    hint("Declaration of " & "ngtcp2_encrypt" &
        " already exists, not redeclaring")
when not declared(compiler_ssize_t):
  type
    compiler_ssize_t* = compiler_ssize_t_553649062
else:
  static :
    hint("Declaration of " & "compiler_ssize_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_stream_open):
  type
    ngtcp2_stream_open* = ngtcp2_stream_open_553648764
else:
  static :
    hint("Declaration of " & "ngtcp2_stream_open" &
        " already exists, not redeclaring")
when not declared(ptls_handshake_properties_t):
  type
    ptls_handshake_properties_t* = ptls_handshake_properties_t_553648998
else:
  static :
    hint("Declaration of " & "ptls_handshake_properties_t" &
        " already exists, not redeclaring")
when not declared(struct_sockaddr):
  type
    struct_sockaddr* = struct_sockaddr_553648635
else:
  static :
    hint("Declaration of " & "struct_sockaddr" &
        " already exists, not redeclaring")
when not declared(ngtcp2_recv_datagram):
  type
    ngtcp2_recv_datagram* = ngtcp2_recv_datagram_553648802
else:
  static :
    hint("Declaration of " & "ngtcp2_recv_datagram" &
        " already exists, not redeclaring")
when not declared(ptls_log_event_t):
  type
    ptls_log_event_t* = ptls_log_event_t_553648964
else:
  static :
    hint("Declaration of " & "ptls_log_event_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_extend_max_streams):
  type
    ngtcp2_extend_max_streams* = ngtcp2_extend_max_streams_553648774
else:
  static :
    hint("Declaration of " & "ngtcp2_extend_max_streams" &
        " already exists, not redeclaring")
when not declared(ngtcp2_recv_stateless_reset):
  type
    ngtcp2_recv_stateless_reset* = ngtcp2_recv_stateless_reset_553648772
else:
  static :
    hint("Declaration of " & "ngtcp2_recv_stateless_reset" &
        " already exists, not redeclaring")
when not declared(ngtcp2_path_validation):
  type
    ngtcp2_path_validation* = ngtcp2_path_validation_553648786
else:
  static :
    hint("Declaration of " & "ngtcp2_path_validation" &
        " already exists, not redeclaring")
when not declared(ptls_iovec_t):
  type
    ptls_iovec_t* = ptls_iovec_t_553648854
else:
  static :
    hint("Declaration of " & "ptls_iovec_t" & " already exists, not redeclaring")
when not declared(struct_st_ptls_openssl_verify_certificate_t):
  type
    struct_st_ptls_openssl_verify_certificate_t* = struct_st_ptls_openssl_verify_certificate_t_553649036
else:
  static :
    hint("Declaration of " & "struct_st_ptls_openssl_verify_certificate_t" &
        " already exists, not redeclaring")
when not declared(struct_sockaddr_in6):
  type
    struct_sockaddr_in6* = struct_sockaddr_in6_553648643
else:
  static :
    hint("Declaration of " & "struct_sockaddr_in6" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_aead_algorithm_t):
  type
    struct_st_ptls_aead_algorithm_t* = struct_st_ptls_aead_algorithm_t_553648884
else:
  static :
    hint("Declaration of " & "struct_st_ptls_aead_algorithm_t" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_cid):
  type
    struct_ngtcp2_cid* = struct_ngtcp2_cid_553648617
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_cid" &
        " already exists, not redeclaring")
when not declared(ssize_t):
  type
    ssize_t* = ssize_t_553648968
else:
  static :
    hint("Declaration of " & "ssize_t" & " already exists, not redeclaring")
when not declared(ngtcp2_pkt_hd):
  type
    ngtcp2_pkt_hd* = ngtcp2_pkt_hd_553648627
else:
  static :
    hint("Declaration of " & "ngtcp2_pkt_hd" &
        " already exists, not redeclaring")
when not declared(enum_ngtcp2_token_type):
  type
    enum_ngtcp2_token_type* = enum_ngtcp2_token_type_553648688
else:
  static :
    hint("Declaration of " & "enum_ngtcp2_token_type" &
        " already exists, not redeclaring")
when not declared(ngtcp2_recv_stream_data):
  type
    ngtcp2_recv_stream_data* = ngtcp2_recv_stream_data_553648762
else:
  static :
    hint("Declaration of " & "ngtcp2_recv_stream_data" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_ech_create_opener_t):
  type
    struct_st_ptls_ech_create_opener_t* = struct_st_ptls_ech_create_opener_t_553648984
else:
  static :
    hint("Declaration of " & "struct_st_ptls_ech_create_opener_t" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_raw_pubkey_verify_certificate_t):
  type
    ptls_openssl_raw_pubkey_verify_certificate_t* = ptls_openssl_raw_pubkey_verify_certificate_t_553649030
else:
  static :
    hint("Declaration of " & "ptls_openssl_raw_pubkey_verify_certificate_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_message_emitter_t):
  type
    struct_st_ptls_message_emitter_t* = struct_st_ptls_message_emitter_t_553648906
else:
  static :
    hint("Declaration of " & "struct_st_ptls_message_emitter_t" &
        " already exists, not redeclaring")
when not declared(sa_family_t):
  type
    sa_family_t* = sa_family_t_553649056
else:
  static :
    hint("Declaration of " & "sa_family_t" & " already exists, not redeclaring")
when not declared(ngtcp2_callbacks):
  type
    ngtcp2_callbacks* = ngtcp2_callbacks_553648820
else:
  static :
    hint("Declaration of " & "ngtcp2_callbacks" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_log_point_t):
  type
    struct_st_ptls_log_point_t* = struct_st_ptls_log_point_t_553649002
else:
  static :
    hint("Declaration of " & "struct_st_ptls_log_point_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_stream_reset):
  type
    ngtcp2_stream_reset* = ngtcp2_stream_reset_553648768
else:
  static :
    hint("Declaration of " & "ngtcp2_stream_reset" &
        " already exists, not redeclaring")
when not declared(ptls_aead_context_t):
  type
    ptls_aead_context_t* = ptls_aead_context_t_553648886
else:
  static :
    hint("Declaration of " & "ptls_aead_context_t" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_conn_info):
  type
    struct_ngtcp2_conn_info* = struct_ngtcp2_conn_info_553648665
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_conn_info" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_pkt_info):
  type
    struct_ngtcp2_pkt_info* = struct_ngtcp2_pkt_info_553648601
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_pkt_info" &
        " already exists, not redeclaring")
when not declared(ngtcp2_tls_early_data_rejected):
  type
    ngtcp2_tls_early_data_rejected* = ngtcp2_tls_early_data_rejected_553648816
else:
  static :
    hint("Declaration of " & "ngtcp2_tls_early_data_rejected" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_path_storage):
  type
    struct_ngtcp2_path_storage* = struct_ngtcp2_path_storage_553648704
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_path_storage" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_handshake_properties_t):
  type
    struct_st_ptls_handshake_properties_t* = struct_st_ptls_handshake_properties_t_553648996
else:
  static :
    hint("Declaration of " & "struct_st_ptls_handshake_properties_t" &
        " already exists, not redeclaring")
when not declared(ptls_key_exchange_algorithm_t):
  type
    ptls_key_exchange_algorithm_t* = ptls_key_exchange_algorithm_t_553648868
else:
  static :
    hint("Declaration of " & "ptls_key_exchange_algorithm_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_client_initial):
  type
    ngtcp2_client_initial* = ngtcp2_client_initial_553648738
else:
  static :
    hint("Declaration of " & "ngtcp2_client_initial" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_verify_certificate_t):
  type
    ptls_openssl_verify_certificate_t* = ptls_openssl_verify_certificate_t_553649040
else:
  static :
    hint("Declaration of " & "ptls_openssl_verify_certificate_t" &
        " already exists, not redeclaring")
when not declared(ptls_hpke_cipher_suite_id_t):
  type
    ptls_hpke_cipher_suite_id_t* = ptls_hpke_cipher_suite_id_t_553648916
else:
  static :
    hint("Declaration of " & "ptls_hpke_cipher_suite_id_t" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_crypto_aead):
  type
    struct_ngtcp2_crypto_aead* = struct_ngtcp2_crypto_aead_553648712
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_crypto_aead" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_decompress_certificate_t):
  type
    struct_st_ptls_decompress_certificate_t* = struct_st_ptls_decompress_certificate_t_553648980
else:
  static :
    hint("Declaration of " & "struct_st_ptls_decompress_certificate_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_path_storage):
  type
    ngtcp2_path_storage* = ngtcp2_path_storage_553648706
else:
  static :
    hint("Declaration of " & "ngtcp2_path_storage" &
        " already exists, not redeclaring")
when not declared(ngtcp2_calloc):
  type
    ngtcp2_calloc* = ngtcp2_calloc_553648593
else:
  static :
    hint("Declaration of " & "ngtcp2_calloc" &
        " already exists, not redeclaring")
when not declared(ptls_cipher_suite_t):
  type
    ptls_cipher_suite_t* = ptls_cipher_suite_t_553648904
else:
  static :
    hint("Declaration of " & "ptls_cipher_suite_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_info):
  type
    ngtcp2_conn_info* = ngtcp2_conn_info_553648667
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_info" &
        " already exists, not redeclaring")
when not declared(ngtcp2_socklen):
  type
    ngtcp2_socklen* = ngtcp2_socklen_553648645
else:
  static :
    hint("Declaration of " & "ngtcp2_socklen" &
        " already exists, not redeclaring")
when not declared(ptls_context_t):
  type
    ptls_context_t* = ptls_context_t_553648846
else:
  static :
    hint("Declaration of " & "ptls_context_t" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_rand_ctx):
  type
    struct_ngtcp2_rand_ctx* = struct_ngtcp2_rand_ctx_553648682
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_rand_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_ccerr):
  type
    ngtcp2_ccerr* = ngtcp2_ccerr_553648832
else:
  static :
    hint("Declaration of " & "ngtcp2_ccerr" & " already exists, not redeclaring")
when not declared(struct_st_ptls_context_t):
  type
    struct_st_ptls_context_t* = struct_st_ptls_context_t_553648848
else:
  static :
    hint("Declaration of " & "struct_st_ptls_context_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_handshake_completed):
  type
    ngtcp2_handshake_completed* = ngtcp2_handshake_completed_553648748
else:
  static :
    hint("Declaration of " & "ngtcp2_handshake_completed" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_pkt_stateless_reset):
  type
    struct_ngtcp2_pkt_stateless_reset* = struct_ngtcp2_pkt_stateless_reset_553648629
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_pkt_stateless_reset" &
        " already exists, not redeclaring")
when not declared(HMAC_CTX):
  type
    HMAC_CTX* = HMAC_CTX_553649044
else:
  static :
    hint("Declaration of " & "HMAC_CTX" & " already exists, not redeclaring")
when not declared(ptls_cred_buffer_t):
  type
    ptls_cred_buffer_t* = ptls_cred_buffer_t_553649054
else:
  static :
    hint("Declaration of " & "ptls_cred_buffer_t" &
        " already exists, not redeclaring")
when not declared(intptr_t):
  type
    intptr_t* = intptr_t_553648866
else:
  static :
    hint("Declaration of " & "intptr_t" & " already exists, not redeclaring")
when not declared(struct_ngtcp2_crypto_cipher):
  type
    struct_ngtcp2_crypto_cipher* = struct_ngtcp2_crypto_cipher_553648716
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_crypto_cipher" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_on_extension_t):
  type
    struct_st_ptls_on_extension_t* = struct_st_ptls_on_extension_t_553648976
else:
  static :
    hint("Declaration of " & "struct_st_ptls_on_extension_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_openssl_signature_scheme_t):
  type
    struct_st_ptls_openssl_signature_scheme_t* = struct_st_ptls_openssl_signature_scheme_t_553649016
else:
  static :
    hint("Declaration of " & "struct_st_ptls_openssl_signature_scheme_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_pkt_type):
  type
    ngtcp2_pkt_type* = ngtcp2_pkt_type_553648607
else:
  static :
    hint("Declaration of " & "ngtcp2_pkt_type" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_preferred_addr):
  type
    struct_ngtcp2_preferred_addr* = struct_ngtcp2_preferred_addr_553648653
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_preferred_addr" &
        " already exists, not redeclaring")
when not declared(enum_ngtcp2_ccerr_type):
  type
    enum_ngtcp2_ccerr_type* = enum_ngtcp2_ccerr_type_553648826
else:
  static :
    hint("Declaration of " & "enum_ngtcp2_ccerr_type" &
        " already exists, not redeclaring")
when not declared(ngtcp2_delete_crypto_cipher_ctx):
  type
    ngtcp2_delete_crypto_cipher_ctx* = ngtcp2_delete_crypto_cipher_ctx_553648800
else:
  static :
    hint("Declaration of " & "ngtcp2_delete_crypto_cipher_ctx" &
        " already exists, not redeclaring")
when not declared(ptls_hash_context_t):
  type
    ptls_hash_context_t* = ptls_hash_context_t_553648896
else:
  static :
    hint("Declaration of " & "ptls_hash_context_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_stream_stop_sending):
  type
    ngtcp2_stream_stop_sending* = ngtcp2_stream_stop_sending_553648810
else:
  static :
    hint("Declaration of " & "ngtcp2_stream_stop_sending" &
        " already exists, not redeclaring")
when not declared(ngtcp2_pkt_stateless_reset):
  type
    ngtcp2_pkt_stateless_reset* = ngtcp2_pkt_stateless_reset_553648631
else:
  static :
    hint("Declaration of " & "ngtcp2_pkt_stateless_reset" &
        " already exists, not redeclaring")
when not declared(ngtcp2_token_type):
  type
    ngtcp2_token_type* = ngtcp2_token_type_553648690
else:
  static :
    hint("Declaration of " & "ngtcp2_token_type" &
        " already exists, not redeclaring")
when not declared(ptls_hpke_cipher_suite_t):
  type
    ptls_hpke_cipher_suite_t* = ptls_hpke_cipher_suite_t_553648920
else:
  static :
    hint("Declaration of " & "ptls_hpke_cipher_suite_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_cipher):
  type
    ngtcp2_crypto_cipher* = ngtcp2_crypto_cipher_553648718
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_cipher" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_crypto_cipher_ctx):
  type
    struct_ngtcp2_crypto_cipher_ctx* = struct_ngtcp2_crypto_cipher_ctx_553648724
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_crypto_cipher_ctx" &
        " already exists, not redeclaring")
when not declared(ptls_cipher_algorithm_t):
  type
    ptls_cipher_algorithm_t* = ptls_cipher_algorithm_t_553648876
else:
  static :
    hint("Declaration of " & "ptls_cipher_algorithm_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_path):
  type
    ngtcp2_path* = ngtcp2_path_553648702
else:
  static :
    hint("Declaration of " & "ngtcp2_path" & " already exists, not redeclaring")
when not declared(ngtcp2_version_negotiation):
  type
    ngtcp2_version_negotiation* = ngtcp2_version_negotiation_553648812
else:
  static :
    hint("Declaration of " & "ngtcp2_version_negotiation" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_mem):
  type
    struct_ngtcp2_mem* = struct_ngtcp2_mem_553648597
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_mem" &
        " already exists, not redeclaring")
when not declared(ngtcp2_cid):
  type
    ngtcp2_cid* = ngtcp2_cid_553648619
else:
  static :
    hint("Declaration of " & "ngtcp2_cid" & " already exists, not redeclaring")
when not declared(ngtcp2_version_info):
  type
    ngtcp2_version_info* = ngtcp2_version_info_553648659
else:
  static :
    hint("Declaration of " & "ngtcp2_version_info" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_addr):
  type
    struct_ngtcp2_addr* = struct_ngtcp2_addr_553648696
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_addr" &
        " already exists, not redeclaring")
when not declared(ngtcp2_addr):
  type
    ngtcp2_addr* = ngtcp2_addr_553648698
else:
  static :
    hint("Declaration of " & "ngtcp2_addr" & " already exists, not redeclaring")
when not declared(ngtcp2_qlog_write):
  type
    ngtcp2_qlog_write* = ngtcp2_qlog_write_553648686
else:
  static :
    hint("Declaration of " & "ngtcp2_qlog_write" &
        " already exists, not redeclaring")
when not declared(ngtcp2_remove_connection_id):
  type
    ngtcp2_remove_connection_id* = ngtcp2_remove_connection_id_553648782
else:
  static :
    hint("Declaration of " & "ngtcp2_remove_connection_id" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_cid_token):
  type
    struct_ngtcp2_cid_token* = struct_ngtcp2_cid_token_553648822
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_cid_token" &
        " already exists, not redeclaring")
when not declared(ngtcp2_rand_ctx):
  type
    ngtcp2_rand_ctx* = ngtcp2_rand_ctx_553648684
else:
  static :
    hint("Declaration of " & "ngtcp2_rand_ctx" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_settings):
  type
    struct_ngtcp2_settings* = struct_ngtcp2_settings_553648692
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_settings" &
        " already exists, not redeclaring")
when not declared(ngtcp2_get_path_challenge_data):
  type
    ngtcp2_get_path_challenge_data* = ngtcp2_get_path_challenge_data_553648808
else:
  static :
    hint("Declaration of " & "ngtcp2_get_path_challenge_data" &
        " already exists, not redeclaring")
when not declared(EVP_PKEY):
  type
    EVP_PKEY* = EVP_PKEY_553649014
else:
  static :
    hint("Declaration of " & "EVP_PKEY" & " already exists, not redeclaring")
when not declared(ptls_save_ticket_t):
  type
    ptls_save_ticket_t* = ptls_save_ticket_t_553648960
else:
  static :
    hint("Declaration of " & "ptls_save_ticket_t" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_override_verify_certificate_t):
  type
    ptls_openssl_override_verify_certificate_t* = ptls_openssl_override_verify_certificate_t_553649034
else:
  static :
    hint("Declaration of " & "ptls_openssl_override_verify_certificate_t" &
        " already exists, not redeclaring")
when not declared(ptls_sign_certificate_t):
  type
    ptls_sign_certificate_t* = ptls_sign_certificate_t_553648948
else:
  static :
    hint("Declaration of " & "ptls_sign_certificate_t" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_version_cid):
  type
    struct_ngtcp2_version_cid* = struct_ngtcp2_version_cid_553648732
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_version_cid" &
        " already exists, not redeclaring")
when not declared(ptls_log_conn_state_t):
  type
    ptls_log_conn_state_t* = ptls_log_conn_state_t_553649008
else:
  static :
    hint("Declaration of " & "ptls_log_conn_state_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_hpke_cipher_suite_t):
  type
    struct_st_ptls_hpke_cipher_suite_t* = struct_st_ptls_hpke_cipher_suite_t_553648918
else:
  static :
    hint("Declaration of " & "struct_st_ptls_hpke_cipher_suite_t" &
        " already exists, not redeclaring")
when not declared(in_addr_t):
  type
    in_addr_t* = in_addr_t_553649064
else:
  static :
    hint("Declaration of " & "in_addr_t" & " already exists, not redeclaring")
when not declared(struct_st_ptls_openssl_override_verify_certificate_t):
  type
    struct_st_ptls_openssl_override_verify_certificate_t* = struct_st_ptls_openssl_override_verify_certificate_t_553649032
else:
  static :
    hint("Declaration of " &
        "struct_st_ptls_openssl_override_verify_certificate_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_connection_id_status_type):
  type
    ngtcp2_connection_id_status_type* = ngtcp2_connection_id_status_type_553648792
else:
  static :
    hint("Declaration of " & "ngtcp2_connection_id_status_type" &
        " already exists, not redeclaring")
when not declared(ngtcp2_sockaddr_union):
  type
    ngtcp2_sockaddr_union* = ngtcp2_sockaddr_union_553648651
else:
  static :
    hint("Declaration of " & "ngtcp2_sockaddr_union" &
        " already exists, not redeclaring")
when not declared(ngtcp2_cid_token):
  type
    ngtcp2_cid_token* = ngtcp2_cid_token_553648824
else:
  static :
    hint("Declaration of " & "ngtcp2_cid_token" &
        " already exists, not redeclaring")
when not declared(ptls_buffer_t):
  type
    ptls_buffer_t* = ptls_buffer_t_553648858
else:
  static :
    hint("Declaration of " & "ptls_buffer_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_buffer_t):
  type
    struct_st_ptls_buffer_t* = struct_st_ptls_buffer_t_553648856
else:
  static :
    hint("Declaration of " & "struct_st_ptls_buffer_t" &
        " already exists, not redeclaring")
when not declared(ptls_aead_algorithm_t):
  type
    ptls_aead_algorithm_t* = ptls_aead_algorithm_t_553648888
else:
  static :
    hint("Declaration of " & "ptls_aead_algorithm_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_ssize):
  type
    ngtcp2_ssize* = ngtcp2_ssize_553648585
else:
  static :
    hint("Declaration of " & "ngtcp2_ssize" & " already exists, not redeclaring")
when not declared(ngtcp2_sockaddr_in6):
  type
    ngtcp2_sockaddr_in6* = ngtcp2_sockaddr_in6_553648641
else:
  static :
    hint("Declaration of " & "ngtcp2_sockaddr_in6" &
        " already exists, not redeclaring")
when not declared(ngtcp2_mem):
  type
    ngtcp2_mem* = ngtcp2_mem_553648599
else:
  static :
    hint("Declaration of " & "ngtcp2_mem" & " already exists, not redeclaring")
when not declared(ptls_hash_final_mode_t):
  type
    ptls_hash_final_mode_t* = ptls_hash_final_mode_t_553648892
else:
  static :
    hint("Declaration of " & "ptls_hash_final_mode_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_pkt_info):
  type
    ngtcp2_pkt_info* = ngtcp2_pkt_info_553648603
else:
  static :
    hint("Declaration of " & "ngtcp2_pkt_info" &
        " already exists, not redeclaring")
when not declared(ptrdiff_t):
  type
    ptrdiff_t* = ptrdiff_t_553648587
else:
  static :
    hint("Declaration of " & "ptrdiff_t" & " already exists, not redeclaring")
when not declared(struct_st_ptls_aead_context_t):
  type
    struct_st_ptls_aead_context_t* = struct_st_ptls_aead_context_t_553648882
else:
  static :
    hint("Declaration of " & "struct_st_ptls_aead_context_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_preferred_addr):
  type
    ngtcp2_preferred_addr* = ngtcp2_preferred_addr_553648655
else:
  static :
    hint("Declaration of " & "ngtcp2_preferred_addr" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_hpke_kem_t):
  type
    struct_st_ptls_hpke_kem_t* = struct_st_ptls_hpke_kem_t_553648910
else:
  static :
    hint("Declaration of " & "struct_st_ptls_hpke_kem_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_realloc):
  type
    ngtcp2_realloc* = ngtcp2_realloc_553648595
else:
  static :
    hint("Declaration of " & "ngtcp2_realloc" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_cipher_ctx):
  type
    ngtcp2_crypto_cipher_ctx* = ngtcp2_crypto_cipher_ctx_553648726
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_cipher_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_version_cid):
  type
    ngtcp2_version_cid* = ngtcp2_version_cid_553648734
else:
  static :
    hint("Declaration of " & "ngtcp2_version_cid" &
        " already exists, not redeclaring")
when not declared(ptls_on_client_hello_parameters_t):
  type
    ptls_on_client_hello_parameters_t* = ptls_on_client_hello_parameters_t_553648928
else:
  static :
    hint("Declaration of " & "ptls_on_client_hello_parameters_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_recv_client_initial):
  type
    ngtcp2_recv_client_initial* = ngtcp2_recv_client_initial_553648740
else:
  static :
    hint("Declaration of " & "ngtcp2_recv_client_initial" &
        " already exists, not redeclaring")
when not declared(ptls_on_client_hello_t):
  type
    ptls_on_client_hello_t* = ptls_on_client_hello_t_553648936
else:
  static :
    hint("Declaration of " & "ptls_on_client_hello_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_vec):
  type
    ngtcp2_vec* = ngtcp2_vec_553648623
else:
  static :
    hint("Declaration of " & "ngtcp2_vec" & " already exists, not redeclaring")
when not declared(struct_st_ptls_encrypt_ticket_t):
  type
    struct_st_ptls_encrypt_ticket_t* = struct_st_ptls_encrypt_ticket_t_553648954
else:
  static :
    hint("Declaration of " & "struct_st_ptls_encrypt_ticket_t" &
        " already exists, not redeclaring")
when not declared(union_ngtcp2_sockaddr_union):
  type
    union_ngtcp2_sockaddr_union* = union_ngtcp2_sockaddr_union_553648649
else:
  static :
    hint("Declaration of " & "union_ngtcp2_sockaddr_union" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_openssl_raw_pubkey_verify_certificate_t):
  type
    struct_st_ptls_openssl_raw_pubkey_verify_certificate_t* = struct_st_ptls_openssl_raw_pubkey_verify_certificate_t_553649028
else:
  static :
    hint("Declaration of " &
        "struct_st_ptls_openssl_raw_pubkey_verify_certificate_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_rand):
  type
    ngtcp2_rand* = ngtcp2_rand_553648778
else:
  static :
    hint("Declaration of " & "ngtcp2_rand" & " already exists, not redeclaring")
when not declared(enum_ngtcp2_pkt_type):
  type
    enum_ngtcp2_pkt_type* = enum_ngtcp2_pkt_type_553648605
else:
  static :
    hint("Declaration of " & "enum_ngtcp2_pkt_type" &
        " already exists, not redeclaring")
when not declared(struct_in_addr):
  type
    struct_in_addr* = struct_in_addr_553649012
else:
  static :
    hint("Declaration of " & "struct_in_addr" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_cipher_algorithm_t):
  type
    struct_st_ptls_cipher_algorithm_t* = struct_st_ptls_cipher_algorithm_t_553648872
else:
  static :
    hint("Declaration of " & "struct_st_ptls_cipher_algorithm_t" &
        " already exists, not redeclaring")
when not declared(ptls_cipher_context_t):
  type
    ptls_cipher_context_t* = ptls_cipher_context_t_553648874
else:
  static :
    hint("Declaration of " & "ptls_cipher_context_t" &
        " already exists, not redeclaring")
when not declared(enum_ngtcp2_cc_algo):
  type
    enum_ngtcp2_cc_algo* = enum_ngtcp2_cc_algo_553648676
else:
  static :
    hint("Declaration of " & "enum_ngtcp2_cc_algo" &
        " already exists, not redeclaring")
when not declared(ptls_update_open_count_t):
  type
    ptls_update_open_count_t* = ptls_update_open_count_t_553648970
else:
  static :
    hint("Declaration of " & "ptls_update_open_count_t" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_crypto_ctx):
  type
    struct_ngtcp2_crypto_ctx* = struct_ngtcp2_crypto_ctx_553648728
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_crypto_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_extend_max_stream_data):
  type
    ngtcp2_extend_max_stream_data* = ngtcp2_extend_max_stream_data_553648776
else:
  static :
    hint("Declaration of " & "ngtcp2_extend_max_stream_data" &
        " already exists, not redeclaring")
when not declared(ngtcp2_lost_datagram):
  type
    ngtcp2_lost_datagram* = ngtcp2_lost_datagram_553648806
else:
  static :
    hint("Declaration of " & "ngtcp2_lost_datagram" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_signature_scheme_t):
  type
    ptls_openssl_signature_scheme_t* = ptls_openssl_signature_scheme_t_553649020
else:
  static :
    hint("Declaration of " & "ptls_openssl_signature_scheme_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_recv_crypto_data):
  type
    ngtcp2_recv_crypto_data* = ngtcp2_recv_crypto_data_553648746
else:
  static :
    hint("Declaration of " & "ngtcp2_recv_crypto_data" &
        " already exists, not redeclaring")
when not declared(ngtcp2_handshake_confirmed):
  type
    ngtcp2_handshake_confirmed* = ngtcp2_handshake_confirmed_553648750
else:
  static :
    hint("Declaration of " & "ngtcp2_handshake_confirmed" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_hash_algorithm_t):
  type
    struct_st_ptls_hash_algorithm_t* = struct_st_ptls_hash_algorithm_t_553648898
else:
  static :
    hint("Declaration of " & "struct_st_ptls_hash_algorithm_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_printf):
  type
    ngtcp2_printf* = ngtcp2_printf_553648680
else:
  static :
    hint("Declaration of " & "ngtcp2_printf" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_crypto_md):
  type
    struct_ngtcp2_crypto_md* = struct_ngtcp2_crypto_md_553648708
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_crypto_md" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_save_ticket_t):
  type
    struct_st_ptls_save_ticket_t* = struct_st_ptls_save_ticket_t_553648958
else:
  static :
    hint("Declaration of " & "struct_st_ptls_save_ticket_t" &
        " already exists, not redeclaring")
when not declared(struct_in6_addr):
  type
    struct_in6_addr* = struct_in6_addr_553649006
else:
  static :
    hint("Declaration of " & "struct_in6_addr" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_crypto_conn_ref):
  type
    struct_ngtcp2_crypto_conn_ref* = struct_ngtcp2_crypto_conn_ref_553648840
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_crypto_conn_ref" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_update_traffic_key_t):
  type
    struct_st_ptls_update_traffic_key_t* = struct_st_ptls_update_traffic_key_t_553648972
else:
  static :
    hint("Declaration of " & "struct_st_ptls_update_traffic_key_t" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_picotls_ctx):
  type
    ngtcp2_crypto_picotls_ctx* = ngtcp2_crypto_picotls_ctx_553649050
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_picotls_ctx" &
        " already exists, not redeclaring")
when not declared(struct_ngtcp2_ccerr):
  type
    struct_ngtcp2_ccerr* = struct_ngtcp2_ccerr_553648830
else:
  static :
    hint("Declaration of " & "struct_ngtcp2_ccerr" &
        " already exists, not redeclaring")
when not declared(NGTCP2_VERSION):
  when "1.6.0" is static:
    const
      NGTCP2_VERSION* = "1.6.0" ## Generated based on /home/andrew/opensource/Vac/nim-ngtcp2/build/lib/includes/ngtcp2/version.h:39:9
  else:
    let NGTCP2_VERSION* = "1.6.0" ## Generated based on /home/andrew/opensource/Vac/nim-ngtcp2/build/lib/includes/ngtcp2/version.h:39:9
else:
  static :
    hint("Declaration of " & "NGTCP2_VERSION" &
        " already exists, not redeclaring")
when not declared(NGTCP2_VERSION_NUM):
  when 67072 is static:
    const
      NGTCP2_VERSION_NUM* = 67072 ## Generated based on /home/andrew/opensource/Vac/nim-ngtcp2/build/lib/includes/ngtcp2/version.h:49:9
  else:
    let NGTCP2_VERSION_NUM* = 67072 ## Generated based on /home/andrew/opensource/Vac/nim-ngtcp2/build/lib/includes/ngtcp2/version.h:49:9
else:
  static :
    hint("Declaration of " & "NGTCP2_VERSION_NUM" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PROTO_VER_MAX):
  when NGTCP2_PROTO_VER_V1 is typedesc:
    type
      NGTCP2_PROTO_VER_MAX* = NGTCP2_PROTO_VER_V1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:273:9
  else:
    when NGTCP2_PROTO_VER_V1 is static:
      const
        NGTCP2_PROTO_VER_MAX* = NGTCP2_PROTO_VER_V1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:273:9
    else:
      let NGTCP2_PROTO_VER_MAX* = NGTCP2_PROTO_VER_V1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:273:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PROTO_VER_MAX" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PROTO_VER_MIN):
  when NGTCP2_PROTO_VER_V1 is typedesc:
    type
      NGTCP2_PROTO_VER_MIN* = NGTCP2_PROTO_VER_V1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:281:9
  else:
    when NGTCP2_PROTO_VER_V1 is static:
      const
        NGTCP2_PROTO_VER_MIN* = NGTCP2_PROTO_VER_V1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:281:9
    else:
      let NGTCP2_PROTO_VER_MIN* = NGTCP2_PROTO_VER_V1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:281:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PROTO_VER_MIN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_RESERVED_VERSION_MASK):
  when cast[cuint](168430090'i64) is static:
    const
      NGTCP2_RESERVED_VERSION_MASK* = cast[cuint](168430090'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:289:9
  else:
    let NGTCP2_RESERVED_VERSION_MASK* = cast[cuint](168430090'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:289:9
else:
  static :
    hint("Declaration of " & "NGTCP2_RESERVED_VERSION_MASK" &
        " already exists, not redeclaring")
when not declared(NGTCP2_MAX_UDP_PAYLOAD_SIZE):
  when 1200 is static:
    const
      NGTCP2_MAX_UDP_PAYLOAD_SIZE* = 1200 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:303:9
  else:
    let NGTCP2_MAX_UDP_PAYLOAD_SIZE* = 1200 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:303:9
else:
  static :
    hint("Declaration of " & "NGTCP2_MAX_UDP_PAYLOAD_SIZE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_MAX_PMTUD_UDP_PAYLOAD_SIZE):
  when 1452 is static:
    const
      NGTCP2_MAX_PMTUD_UDP_PAYLOAD_SIZE* = 1452 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:311:9
  else:
    let NGTCP2_MAX_PMTUD_UDP_PAYLOAD_SIZE* = 1452 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:311:9
else:
  static :
    hint("Declaration of " & "NGTCP2_MAX_PMTUD_UDP_PAYLOAD_SIZE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_STATELESS_RESET_TOKENLEN):
  when 16 is static:
    const
      NGTCP2_STATELESS_RESET_TOKENLEN* = 16 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:333:9
  else:
    let NGTCP2_STATELESS_RESET_TOKENLEN* = 16 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:333:9
else:
  static :
    hint("Declaration of " & "NGTCP2_STATELESS_RESET_TOKENLEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_MIN_STATELESS_RESET_RANDLEN):
  when 5 is static:
    const
      NGTCP2_MIN_STATELESS_RESET_RANDLEN* = 5 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:341:9
  else:
    let NGTCP2_MIN_STATELESS_RESET_RANDLEN* = 5 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:341:9
else:
  static :
    hint("Declaration of " & "NGTCP2_MIN_STATELESS_RESET_RANDLEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PATH_CHALLENGE_DATALEN):
  when 8 is static:
    const
      NGTCP2_PATH_CHALLENGE_DATALEN* = 8 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:349:9
  else:
    let NGTCP2_PATH_CHALLENGE_DATALEN* = 8 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:349:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PATH_CHALLENGE_DATALEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_RETRY_NONCE_V1):
  when "\\x46\\x15\\x99\\xd3\\x5d\\x63\\x2b\\xf2\\x23\\x98\\x25\\xbb" is static:
    const
      NGTCP2_RETRY_NONCE_V1* = "\\x46\\x15\\x99\\xd3\\x5d\\x63\\x2b\\xf2\\x23\\x98\\x25\\xbb" ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:366:9
  else:
    let NGTCP2_RETRY_NONCE_V1* = "\\x46\\x15\\x99\\xd3\\x5d\\x63\\x2b\\xf2\\x23\\x98\\x25\\xbb" ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:366:9
else:
  static :
    hint("Declaration of " & "NGTCP2_RETRY_NONCE_V1" &
        " already exists, not redeclaring")
when not declared(NGTCP2_RETRY_NONCE_V2):
  when "\\xd8\\x69\\x69\\xbc\\x2d\\x7c\\x6d\\x99\\x90\\xef\\xb0\\x4a" is static:
    const
      NGTCP2_RETRY_NONCE_V2* = "\\xd8\\x69\\x69\\xbc\\x2d\\x7c\\x6d\\x99\\x90\\xef\\xb0\\x4a" ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:385:9
  else:
    let NGTCP2_RETRY_NONCE_V2* = "\\xd8\\x69\\x69\\xbc\\x2d\\x7c\\x6d\\x99\\x90\\xef\\xb0\\x4a" ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:385:9
else:
  static :
    hint("Declaration of " & "NGTCP2_RETRY_NONCE_V2" &
        " already exists, not redeclaring")
when not declared(NGTCP2_HP_MASKLEN):
  when 5 is static:
    const
      NGTCP2_HP_MASKLEN* = 5 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:392:9
  else:
    let NGTCP2_HP_MASKLEN* = 5 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:392:9
else:
  static :
    hint("Declaration of " & "NGTCP2_HP_MASKLEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_HP_SAMPLELEN):
  when 16 is static:
    const
      NGTCP2_HP_SAMPLELEN* = 16 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:400:9
  else:
    let NGTCP2_HP_SAMPLELEN* = 16 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:400:9
else:
  static :
    hint("Declaration of " & "NGTCP2_HP_SAMPLELEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_MAX_CIDLEN):
  when 20 is static:
    const
      NGTCP2_MAX_CIDLEN* = 20 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:414:9
  else:
    let NGTCP2_MAX_CIDLEN* = 20 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:414:9
else:
  static :
    hint("Declaration of " & "NGTCP2_MAX_CIDLEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_MIN_CIDLEN):
  when 1 is static:
    const
      NGTCP2_MIN_CIDLEN* = 1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:421:9
  else:
    let NGTCP2_MIN_CIDLEN* = 1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:421:9
else:
  static :
    hint("Declaration of " & "NGTCP2_MIN_CIDLEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_MIN_INITIAL_DCIDLEN):
  when 8 is static:
    const
      NGTCP2_MIN_INITIAL_DCIDLEN* = 8 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:430:9
  else:
    let NGTCP2_MIN_INITIAL_DCIDLEN* = 8 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:430:9
else:
  static :
    hint("Declaration of " & "NGTCP2_MIN_INITIAL_DCIDLEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ECN_NOT_ECT):
  when 0 is static:
    const
      NGTCP2_ECN_NOT_ECT* = 0 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:443:9
  else:
    let NGTCP2_ECN_NOT_ECT* = 0 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:443:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ECN_NOT_ECT" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ECN_ECT_1):
  when 1 is static:
    const
      NGTCP2_ECN_ECT_1* = 1  ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:450:9
  else:
    let NGTCP2_ECN_ECT_1* = 1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:450:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ECN_ECT_1" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ECN_ECT_0):
  when 2 is static:
    const
      NGTCP2_ECN_ECT_0* = 2  ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:457:9
  else:
    let NGTCP2_ECN_ECT_0* = 2 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:457:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ECN_ECT_0" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ECN_CE):
  when 3 is static:
    const
      NGTCP2_ECN_CE* = 3     ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:464:9
  else:
    let NGTCP2_ECN_CE* = 3   ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:464:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ECN_CE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ECN_MASK):
  when 3 is static:
    const
      NGTCP2_ECN_MASK* = 3   ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:471:9
  else:
    let NGTCP2_ECN_MASK* = 3 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:471:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ECN_MASK" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PKT_INFO_V1):
  when 1 is static:
    const
      NGTCP2_PKT_INFO_V1* = 1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:473:9
  else:
    let NGTCP2_PKT_INFO_V1* = 1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:473:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PKT_INFO_V1" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PKT_INFO_VERSION):
  when NGTCP2_PKT_INFO_V1 is typedesc:
    type
      NGTCP2_PKT_INFO_VERSION* = NGTCP2_PKT_INFO_V1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:474:9
  else:
    when NGTCP2_PKT_INFO_V1 is static:
      const
        NGTCP2_PKT_INFO_VERSION* = NGTCP2_PKT_INFO_V1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:474:9
    else:
      let NGTCP2_PKT_INFO_VERSION* = NGTCP2_PKT_INFO_V1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:474:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PKT_INFO_VERSION" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_INVALID_ARGUMENT):
  when -201 is static:
    const
      NGTCP2_ERR_INVALID_ARGUMENT* = -201 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:503:9
  else:
    let NGTCP2_ERR_INVALID_ARGUMENT* = -201 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:503:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_INVALID_ARGUMENT" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_NOBUF):
  when -202 is static:
    const
      NGTCP2_ERR_NOBUF* = -202 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:510:9
  else:
    let NGTCP2_ERR_NOBUF* = -202 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:510:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_NOBUF" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_PROTO):
  when -203 is static:
    const
      NGTCP2_ERR_PROTO* = -203 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:516:9
  else:
    let NGTCP2_ERR_PROTO* = -203 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:516:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_PROTO" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_INVALID_STATE):
  when -204 is static:
    const
      NGTCP2_ERR_INVALID_STATE* = -204 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:523:9
  else:
    let NGTCP2_ERR_INVALID_STATE* = -204 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:523:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_INVALID_STATE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_ACK_FRAME):
  when -205 is static:
    const
      NGTCP2_ERR_ACK_FRAME* = -205 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:530:9
  else:
    let NGTCP2_ERR_ACK_FRAME* = -205 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:530:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_ACK_FRAME" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_STREAM_ID_BLOCKED):
  when -206 is static:
    const
      NGTCP2_ERR_STREAM_ID_BLOCKED* = -206 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:537:9
  else:
    let NGTCP2_ERR_STREAM_ID_BLOCKED* = -206 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:537:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_STREAM_ID_BLOCKED" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_STREAM_IN_USE):
  when -207 is static:
    const
      NGTCP2_ERR_STREAM_IN_USE* = -207 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:544:9
  else:
    let NGTCP2_ERR_STREAM_IN_USE* = -207 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:544:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_STREAM_IN_USE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_STREAM_DATA_BLOCKED):
  when -208 is static:
    const
      NGTCP2_ERR_STREAM_DATA_BLOCKED* = -208 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:551:9
  else:
    let NGTCP2_ERR_STREAM_DATA_BLOCKED* = -208 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:551:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_STREAM_DATA_BLOCKED" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_FLOW_CONTROL):
  when -209 is static:
    const
      NGTCP2_ERR_FLOW_CONTROL* = -209 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:557:9
  else:
    let NGTCP2_ERR_FLOW_CONTROL* = -209 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:557:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_FLOW_CONTROL" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_CONNECTION_ID_LIMIT):
  when -210 is static:
    const
      NGTCP2_ERR_CONNECTION_ID_LIMIT* = -210 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:564:9
  else:
    let NGTCP2_ERR_CONNECTION_ID_LIMIT* = -210 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:564:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_CONNECTION_ID_LIMIT" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_STREAM_LIMIT):
  when -211 is static:
    const
      NGTCP2_ERR_STREAM_LIMIT* = -211 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:571:9
  else:
    let NGTCP2_ERR_STREAM_LIMIT* = -211 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:571:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_STREAM_LIMIT" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_FINAL_SIZE):
  when -212 is static:
    const
      NGTCP2_ERR_FINAL_SIZE* = -212 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:578:9
  else:
    let NGTCP2_ERR_FINAL_SIZE* = -212 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:578:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_FINAL_SIZE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_CRYPTO):
  when -213 is static:
    const
      NGTCP2_ERR_CRYPTO* = -213 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:584:9
  else:
    let NGTCP2_ERR_CRYPTO* = -213 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:584:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_CRYPTO" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_PKT_NUM_EXHAUSTED):
  when -214 is static:
    const
      NGTCP2_ERR_PKT_NUM_EXHAUSTED* = -214 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:591:9
  else:
    let NGTCP2_ERR_PKT_NUM_EXHAUSTED* = -214 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:591:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_PKT_NUM_EXHAUSTED" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_REQUIRED_TRANSPORT_PARAM):
  when -215 is static:
    const
      NGTCP2_ERR_REQUIRED_TRANSPORT_PARAM* = -215 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:598:9
  else:
    let NGTCP2_ERR_REQUIRED_TRANSPORT_PARAM* = -215 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:598:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_REQUIRED_TRANSPORT_PARAM" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_MALFORMED_TRANSPORT_PARAM):
  when -216 is static:
    const
      NGTCP2_ERR_MALFORMED_TRANSPORT_PARAM* = -216 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:605:9
  else:
    let NGTCP2_ERR_MALFORMED_TRANSPORT_PARAM* = -216 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:605:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_MALFORMED_TRANSPORT_PARAM" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_FRAME_ENCODING):
  when -217 is static:
    const
      NGTCP2_ERR_FRAME_ENCODING* = -217 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:612:9
  else:
    let NGTCP2_ERR_FRAME_ENCODING* = -217 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:612:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_FRAME_ENCODING" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_DECRYPT):
  when -218 is static:
    const
      NGTCP2_ERR_DECRYPT* = -218 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:618:9
  else:
    let NGTCP2_ERR_DECRYPT* = -218 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:618:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_DECRYPT" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_STREAM_SHUT_WR):
  when -219 is static:
    const
      NGTCP2_ERR_STREAM_SHUT_WR* = -219 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:625:9
  else:
    let NGTCP2_ERR_STREAM_SHUT_WR* = -219 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:625:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_STREAM_SHUT_WR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_STREAM_NOT_FOUND):
  when -220 is static:
    const
      NGTCP2_ERR_STREAM_NOT_FOUND* = -220 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:632:9
  else:
    let NGTCP2_ERR_STREAM_NOT_FOUND* = -220 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:632:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_STREAM_NOT_FOUND" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_STREAM_STATE):
  when -221 is static:
    const
      NGTCP2_ERR_STREAM_STATE* = -221 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:639:9
  else:
    let NGTCP2_ERR_STREAM_STATE* = -221 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:639:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_STREAM_STATE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_RECV_VERSION_NEGOTIATION):
  when -222 is static:
    const
      NGTCP2_ERR_RECV_VERSION_NEGOTIATION* = -222 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:646:9
  else:
    let NGTCP2_ERR_RECV_VERSION_NEGOTIATION* = -222 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:646:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_RECV_VERSION_NEGOTIATION" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_CLOSING):
  when -223 is static:
    const
      NGTCP2_ERR_CLOSING* = -223 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:653:9
  else:
    let NGTCP2_ERR_CLOSING* = -223 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:653:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_CLOSING" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_DRAINING):
  when -224 is static:
    const
      NGTCP2_ERR_DRAINING* = -224 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:660:9
  else:
    let NGTCP2_ERR_DRAINING* = -224 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:660:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_DRAINING" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_TRANSPORT_PARAM):
  when -225 is static:
    const
      NGTCP2_ERR_TRANSPORT_PARAM* = -225 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:667:9
  else:
    let NGTCP2_ERR_TRANSPORT_PARAM* = -225 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:667:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_TRANSPORT_PARAM" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_DISCARD_PKT):
  when -226 is static:
    const
      NGTCP2_ERR_DISCARD_PKT* = -226 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:673:9
  else:
    let NGTCP2_ERR_DISCARD_PKT* = -226 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:673:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_DISCARD_PKT" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_CONN_ID_BLOCKED):
  when -227 is static:
    const
      NGTCP2_ERR_CONN_ID_BLOCKED* = -227 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:680:9
  else:
    let NGTCP2_ERR_CONN_ID_BLOCKED* = -227 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:680:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_CONN_ID_BLOCKED" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_INTERNAL):
  when -228 is static:
    const
      NGTCP2_ERR_INTERNAL* = -228 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:686:9
  else:
    let NGTCP2_ERR_INTERNAL* = -228 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:686:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_INTERNAL" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_CRYPTO_BUFFER_EXCEEDED):
  when -229 is static:
    const
      NGTCP2_ERR_CRYPTO_BUFFER_EXCEEDED* = -229 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:693:9
  else:
    let NGTCP2_ERR_CRYPTO_BUFFER_EXCEEDED* = -229 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:693:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_CRYPTO_BUFFER_EXCEEDED" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_WRITE_MORE):
  when -230 is static:
    const
      NGTCP2_ERR_WRITE_MORE* = -230 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:701:9
  else:
    let NGTCP2_ERR_WRITE_MORE* = -230 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:701:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_WRITE_MORE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_RETRY):
  when -231 is static:
    const
      NGTCP2_ERR_RETRY* = -231 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:708:9
  else:
    let NGTCP2_ERR_RETRY* = -231 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:708:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_RETRY" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_DROP_CONN):
  when -232 is static:
    const
      NGTCP2_ERR_DROP_CONN* = -232 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:715:9
  else:
    let NGTCP2_ERR_DROP_CONN* = -232 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:715:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_DROP_CONN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_AEAD_LIMIT_REACHED):
  when -233 is static:
    const
      NGTCP2_ERR_AEAD_LIMIT_REACHED* = -233 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:723:9
  else:
    let NGTCP2_ERR_AEAD_LIMIT_REACHED* = -233 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:723:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_AEAD_LIMIT_REACHED" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_NO_VIABLE_PATH):
  when -234 is static:
    const
      NGTCP2_ERR_NO_VIABLE_PATH* = -234 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:731:9
  else:
    let NGTCP2_ERR_NO_VIABLE_PATH* = -234 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:731:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_NO_VIABLE_PATH" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_VERSION_NEGOTIATION):
  when -235 is static:
    const
      NGTCP2_ERR_VERSION_NEGOTIATION* = -235 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:738:9
  else:
    let NGTCP2_ERR_VERSION_NEGOTIATION* = -235 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:738:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_VERSION_NEGOTIATION" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_HANDSHAKE_TIMEOUT):
  when -236 is static:
    const
      NGTCP2_ERR_HANDSHAKE_TIMEOUT* = -236 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:745:9
  else:
    let NGTCP2_ERR_HANDSHAKE_TIMEOUT* = -236 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:745:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_HANDSHAKE_TIMEOUT" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_VERSION_NEGOTIATION_FAILURE):
  when -237 is static:
    const
      NGTCP2_ERR_VERSION_NEGOTIATION_FAILURE* = -237 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:752:9
  else:
    let NGTCP2_ERR_VERSION_NEGOTIATION_FAILURE* = -237 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:752:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_VERSION_NEGOTIATION_FAILURE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_IDLE_CLOSE):
  when -238 is static:
    const
      NGTCP2_ERR_IDLE_CLOSE* = -238 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:759:9
  else:
    let NGTCP2_ERR_IDLE_CLOSE* = -238 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:759:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_IDLE_CLOSE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_FATAL):
  when -500 is static:
    const
      NGTCP2_ERR_FATAL* = -500 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:767:9
  else:
    let NGTCP2_ERR_FATAL* = -500 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:767:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_FATAL" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_NOMEM):
  when -501 is static:
    const
      NGTCP2_ERR_NOMEM* = -501 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:773:9
  else:
    let NGTCP2_ERR_NOMEM* = -501 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:773:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_NOMEM" &
        " already exists, not redeclaring")
when not declared(NGTCP2_ERR_CALLBACK_FAILURE):
  when -502 is static:
    const
      NGTCP2_ERR_CALLBACK_FAILURE* = -502 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:780:9
  else:
    let NGTCP2_ERR_CALLBACK_FAILURE* = -502 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:780:9
else:
  static :
    hint("Declaration of " & "NGTCP2_ERR_CALLBACK_FAILURE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PKT_FLAG_NONE):
  when cast[cuint](0'i64) is static:
    const
      NGTCP2_PKT_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:793:9
  else:
    let NGTCP2_PKT_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:793:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PKT_FLAG_NONE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PKT_FLAG_LONG_FORM):
  when cast[cuint](1'i64) is static:
    const
      NGTCP2_PKT_FLAG_LONG_FORM* = cast[cuint](1'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:801:9
  else:
    let NGTCP2_PKT_FLAG_LONG_FORM* = cast[cuint](1'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:801:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PKT_FLAG_LONG_FORM" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PKT_FLAG_FIXED_BIT_CLEAR):
  when cast[cuint](2'i64) is static:
    const
      NGTCP2_PKT_FLAG_FIXED_BIT_CLEAR* = cast[cuint](2'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:809:9
  else:
    let NGTCP2_PKT_FLAG_FIXED_BIT_CLEAR* = cast[cuint](2'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:809:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PKT_FLAG_FIXED_BIT_CLEAR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PKT_FLAG_KEY_PHASE):
  when cast[cuint](4'i64) is static:
    const
      NGTCP2_PKT_FLAG_KEY_PHASE* = cast[cuint](4'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:816:9
  else:
    let NGTCP2_PKT_FLAG_KEY_PHASE* = cast[cuint](4'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:816:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PKT_FLAG_KEY_PHASE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_NO_ERROR):
  when cast[cuint](0'i64) is static:
    const
      NGTCP2_NO_ERROR* = cast[cuint](0'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:868:9
  else:
    let NGTCP2_NO_ERROR* = cast[cuint](0'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:868:9
else:
  static :
    hint("Declaration of " & "NGTCP2_NO_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_INTERNAL_ERROR):
  when cast[cuint](1'i64) is static:
    const
      NGTCP2_INTERNAL_ERROR* = cast[cuint](1'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:876:9
  else:
    let NGTCP2_INTERNAL_ERROR* = cast[cuint](1'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:876:9
else:
  static :
    hint("Declaration of " & "NGTCP2_INTERNAL_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CONNECTION_REFUSED):
  when cast[cuint](2'i64) is static:
    const
      NGTCP2_CONNECTION_REFUSED* = cast[cuint](2'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:884:9
  else:
    let NGTCP2_CONNECTION_REFUSED* = cast[cuint](2'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:884:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CONNECTION_REFUSED" &
        " already exists, not redeclaring")
when not declared(NGTCP2_FLOW_CONTROL_ERROR):
  when cast[cuint](3'i64) is static:
    const
      NGTCP2_FLOW_CONTROL_ERROR* = cast[cuint](3'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:892:9
  else:
    let NGTCP2_FLOW_CONTROL_ERROR* = cast[cuint](3'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:892:9
else:
  static :
    hint("Declaration of " & "NGTCP2_FLOW_CONTROL_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_STREAM_LIMIT_ERROR):
  when cast[cuint](4'i64) is static:
    const
      NGTCP2_STREAM_LIMIT_ERROR* = cast[cuint](4'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:900:9
  else:
    let NGTCP2_STREAM_LIMIT_ERROR* = cast[cuint](4'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:900:9
else:
  static :
    hint("Declaration of " & "NGTCP2_STREAM_LIMIT_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_STREAM_STATE_ERROR):
  when cast[cuint](5'i64) is static:
    const
      NGTCP2_STREAM_STATE_ERROR* = cast[cuint](5'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:908:9
  else:
    let NGTCP2_STREAM_STATE_ERROR* = cast[cuint](5'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:908:9
else:
  static :
    hint("Declaration of " & "NGTCP2_STREAM_STATE_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_FINAL_SIZE_ERROR):
  when cast[cuint](6'i64) is static:
    const
      NGTCP2_FINAL_SIZE_ERROR* = cast[cuint](6'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:916:9
  else:
    let NGTCP2_FINAL_SIZE_ERROR* = cast[cuint](6'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:916:9
else:
  static :
    hint("Declaration of " & "NGTCP2_FINAL_SIZE_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_FRAME_ENCODING_ERROR):
  when cast[cuint](7'i64) is static:
    const
      NGTCP2_FRAME_ENCODING_ERROR* = cast[cuint](7'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:924:9
  else:
    let NGTCP2_FRAME_ENCODING_ERROR* = cast[cuint](7'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:924:9
else:
  static :
    hint("Declaration of " & "NGTCP2_FRAME_ENCODING_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_TRANSPORT_PARAMETER_ERROR):
  when cast[cuint](8'i64) is static:
    const
      NGTCP2_TRANSPORT_PARAMETER_ERROR* = cast[cuint](8'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:932:9
  else:
    let NGTCP2_TRANSPORT_PARAMETER_ERROR* = cast[cuint](8'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:932:9
else:
  static :
    hint("Declaration of " & "NGTCP2_TRANSPORT_PARAMETER_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CONNECTION_ID_LIMIT_ERROR):
  when cast[cuint](9'i64) is static:
    const
      NGTCP2_CONNECTION_ID_LIMIT_ERROR* = cast[cuint](9'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:940:9
  else:
    let NGTCP2_CONNECTION_ID_LIMIT_ERROR* = cast[cuint](9'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:940:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CONNECTION_ID_LIMIT_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PROTOCOL_VIOLATION):
  when cast[cuint](10'i64) is static:
    const
      NGTCP2_PROTOCOL_VIOLATION* = cast[cuint](10'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:948:9
  else:
    let NGTCP2_PROTOCOL_VIOLATION* = cast[cuint](10'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:948:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PROTOCOL_VIOLATION" &
        " already exists, not redeclaring")
when not declared(NGTCP2_INVALID_TOKEN):
  when cast[cuint](11'i64) is static:
    const
      NGTCP2_INVALID_TOKEN* = cast[cuint](11'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:956:9
  else:
    let NGTCP2_INVALID_TOKEN* = cast[cuint](11'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:956:9
else:
  static :
    hint("Declaration of " & "NGTCP2_INVALID_TOKEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_APPLICATION_ERROR):
  when cast[cuint](12'i64) is static:
    const
      NGTCP2_APPLICATION_ERROR* = cast[cuint](12'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:964:9
  else:
    let NGTCP2_APPLICATION_ERROR* = cast[cuint](12'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:964:9
else:
  static :
    hint("Declaration of " & "NGTCP2_APPLICATION_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CRYPTO_BUFFER_EXCEEDED):
  when cast[cuint](13'i64) is static:
    const
      NGTCP2_CRYPTO_BUFFER_EXCEEDED* = cast[cuint](13'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:972:9
  else:
    let NGTCP2_CRYPTO_BUFFER_EXCEEDED* = cast[cuint](13'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:972:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CRYPTO_BUFFER_EXCEEDED" &
        " already exists, not redeclaring")
when not declared(NGTCP2_KEY_UPDATE_ERROR):
  when cast[cuint](14'i64) is static:
    const
      NGTCP2_KEY_UPDATE_ERROR* = cast[cuint](14'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:980:9
  else:
    let NGTCP2_KEY_UPDATE_ERROR* = cast[cuint](14'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:980:9
else:
  static :
    hint("Declaration of " & "NGTCP2_KEY_UPDATE_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_AEAD_LIMIT_REACHED):
  when cast[cuint](15'i64) is static:
    const
      NGTCP2_AEAD_LIMIT_REACHED* = cast[cuint](15'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:988:9
  else:
    let NGTCP2_AEAD_LIMIT_REACHED* = cast[cuint](15'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:988:9
else:
  static :
    hint("Declaration of " & "NGTCP2_AEAD_LIMIT_REACHED" &
        " already exists, not redeclaring")
when not declared(NGTCP2_NO_VIABLE_PATH):
  when cast[cuint](16'i64) is static:
    const
      NGTCP2_NO_VIABLE_PATH* = cast[cuint](16'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:996:9
  else:
    let NGTCP2_NO_VIABLE_PATH* = cast[cuint](16'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:996:9
else:
  static :
    hint("Declaration of " & "NGTCP2_NO_VIABLE_PATH" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CRYPTO_ERROR):
  when cast[cuint](256'i64) is static:
    const
      NGTCP2_CRYPTO_ERROR* = cast[cuint](256'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1004:9
  else:
    let NGTCP2_CRYPTO_ERROR* = cast[cuint](256'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1004:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CRYPTO_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_VERSION_NEGOTIATION_ERROR):
  when 17 is static:
    const
      NGTCP2_VERSION_NEGOTIATION_ERROR* = 17 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1012:9
  else:
    let NGTCP2_VERSION_NEGOTIATION_ERROR* = 17 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1012:9
else:
  static :
    hint("Declaration of " & "NGTCP2_VERSION_NEGOTIATION_ERROR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_DEFAULT_MAX_RECV_UDP_PAYLOAD_SIZE):
  when 65527 is static:
    const
      NGTCP2_DEFAULT_MAX_RECV_UDP_PAYLOAD_SIZE* = 65527 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1197:9
  else:
    let NGTCP2_DEFAULT_MAX_RECV_UDP_PAYLOAD_SIZE* = 65527 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1197:9
else:
  static :
    hint("Declaration of " & "NGTCP2_DEFAULT_MAX_RECV_UDP_PAYLOAD_SIZE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_DEFAULT_ACK_DELAY_EXPONENT):
  when 3 is static:
    const
      NGTCP2_DEFAULT_ACK_DELAY_EXPONENT* = 3 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1205:9
  else:
    let NGTCP2_DEFAULT_ACK_DELAY_EXPONENT* = 3 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1205:9
else:
  static :
    hint("Declaration of " & "NGTCP2_DEFAULT_ACK_DELAY_EXPONENT" &
        " already exists, not redeclaring")
when not declared(NGTCP2_DEFAULT_ACTIVE_CONNECTION_ID_LIMIT):
  when 2 is static:
    const
      NGTCP2_DEFAULT_ACTIVE_CONNECTION_ID_LIMIT* = 2 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1223:9
  else:
    let NGTCP2_DEFAULT_ACTIVE_CONNECTION_ID_LIMIT* = 2 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1223:9
else:
  static :
    hint("Declaration of " & "NGTCP2_DEFAULT_ACTIVE_CONNECTION_ID_LIMIT" &
        " already exists, not redeclaring")
when not declared(NGTCP2_TLSEXT_QUIC_TRANSPORT_PARAMETERS_V1):
  when cast[cuint](57'i64) is static:
    const
      NGTCP2_TLSEXT_QUIC_TRANSPORT_PARAMETERS_V1* = cast[cuint](57'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1231:9
  else:
    let NGTCP2_TLSEXT_QUIC_TRANSPORT_PARAMETERS_V1* = cast[cuint](57'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1231:9
else:
  static :
    hint("Declaration of " & "NGTCP2_TLSEXT_QUIC_TRANSPORT_PARAMETERS_V1" &
        " already exists, not redeclaring")
when not declared(NGTCP2_TRANSPORT_PARAMS_V1):
  when 1 is static:
    const
      NGTCP2_TRANSPORT_PARAMS_V1* = 1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1384:9
  else:
    let NGTCP2_TRANSPORT_PARAMS_V1* = 1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1384:9
else:
  static :
    hint("Declaration of " & "NGTCP2_TRANSPORT_PARAMS_V1" &
        " already exists, not redeclaring")
when not declared(NGTCP2_TRANSPORT_PARAMS_VERSION):
  when NGTCP2_TRANSPORT_PARAMS_V1 is typedesc:
    type
      NGTCP2_TRANSPORT_PARAMS_VERSION* = NGTCP2_TRANSPORT_PARAMS_V1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1385:9
  else:
    when NGTCP2_TRANSPORT_PARAMS_V1 is static:
      const
        NGTCP2_TRANSPORT_PARAMS_VERSION* = NGTCP2_TRANSPORT_PARAMS_V1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1385:9
    else:
      let NGTCP2_TRANSPORT_PARAMS_VERSION* = NGTCP2_TRANSPORT_PARAMS_V1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1385:9
else:
  static :
    hint("Declaration of " & "NGTCP2_TRANSPORT_PARAMS_VERSION" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CONN_INFO_V1):
  when 1 is static:
    const
      NGTCP2_CONN_INFO_V1* = 1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1555:9
  else:
    let NGTCP2_CONN_INFO_V1* = 1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1555:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CONN_INFO_V1" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CONN_INFO_VERSION):
  when NGTCP2_CONN_INFO_V1 is typedesc:
    type
      NGTCP2_CONN_INFO_VERSION* = NGTCP2_CONN_INFO_V1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1556:9
  else:
    when NGTCP2_CONN_INFO_V1 is static:
      const
        NGTCP2_CONN_INFO_VERSION* = NGTCP2_CONN_INFO_V1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1556:9
    else:
      let NGTCP2_CONN_INFO_VERSION* = NGTCP2_CONN_INFO_V1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1556:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CONN_INFO_VERSION" &
        " already exists, not redeclaring")
when not declared(NGTCP2_QLOG_WRITE_FLAG_NONE):
  when cast[cuint](0'i64) is static:
    const
      NGTCP2_QLOG_WRITE_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1637:9
  else:
    let NGTCP2_QLOG_WRITE_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1637:9
else:
  static :
    hint("Declaration of " & "NGTCP2_QLOG_WRITE_FLAG_NONE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_QLOG_WRITE_FLAG_FIN):
  when cast[cuint](1'i64) is static:
    const
      NGTCP2_QLOG_WRITE_FLAG_FIN* = cast[cuint](1'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1644:9
  else:
    let NGTCP2_QLOG_WRITE_FLAG_FIN* = cast[cuint](1'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1644:9
else:
  static :
    hint("Declaration of " & "NGTCP2_QLOG_WRITE_FLAG_FIN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_SETTINGS_V1):
  when 1 is static:
    const
      NGTCP2_SETTINGS_V1* = 1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1697:9
  else:
    let NGTCP2_SETTINGS_V1* = 1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1697:9
else:
  static :
    hint("Declaration of " & "NGTCP2_SETTINGS_V1" &
        " already exists, not redeclaring")
when not declared(NGTCP2_SETTINGS_V2):
  when 2 is static:
    const
      NGTCP2_SETTINGS_V2* = 2 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1698:9
  else:
    let NGTCP2_SETTINGS_V2* = 2 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1698:9
else:
  static :
    hint("Declaration of " & "NGTCP2_SETTINGS_V2" &
        " already exists, not redeclaring")
when not declared(NGTCP2_SETTINGS_VERSION):
  when NGTCP2_SETTINGS_V2 is typedesc:
    type
      NGTCP2_SETTINGS_VERSION* = NGTCP2_SETTINGS_V2 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1699:9
  else:
    when NGTCP2_SETTINGS_V2 is static:
      const
        NGTCP2_SETTINGS_VERSION* = NGTCP2_SETTINGS_V2 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1699:9
    else:
      let NGTCP2_SETTINGS_VERSION* = NGTCP2_SETTINGS_V2 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:1699:9
else:
  static :
    hint("Declaration of " & "NGTCP2_SETTINGS_VERSION" &
        " already exists, not redeclaring")
when not declared(NGTCP2_STREAM_DATA_FLAG_NONE):
  when cast[cuint](0'i64) is static:
    const
      NGTCP2_STREAM_DATA_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2657:9
  else:
    let NGTCP2_STREAM_DATA_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2657:9
else:
  static :
    hint("Declaration of " & "NGTCP2_STREAM_DATA_FLAG_NONE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_STREAM_DATA_FLAG_FIN):
  when cast[cuint](1'i64) is static:
    const
      NGTCP2_STREAM_DATA_FLAG_FIN* = cast[cuint](1'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2665:9
  else:
    let NGTCP2_STREAM_DATA_FLAG_FIN* = cast[cuint](1'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2665:9
else:
  static :
    hint("Declaration of " & "NGTCP2_STREAM_DATA_FLAG_FIN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_STREAM_DATA_FLAG_0RTT):
  when cast[cuint](2'i64) is static:
    const
      NGTCP2_STREAM_DATA_FLAG_0RTT* = cast[cuint](2'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2674:9
  else:
    let NGTCP2_STREAM_DATA_FLAG_0RTT* = cast[cuint](2'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2674:9
else:
  static :
    hint("Declaration of " & "NGTCP2_STREAM_DATA_FLAG_0RTT" &
        " already exists, not redeclaring")
when not declared(NGTCP2_STREAM_CLOSE_FLAG_NONE):
  when cast[cuint](0'i64) is static:
    const
      NGTCP2_STREAM_CLOSE_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2729:9
  else:
    let NGTCP2_STREAM_CLOSE_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2729:9
else:
  static :
    hint("Declaration of " & "NGTCP2_STREAM_CLOSE_FLAG_NONE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_STREAM_CLOSE_FLAG_APP_ERROR_CODE_SET):
  when cast[cuint](1'i64) is static:
    const
      NGTCP2_STREAM_CLOSE_FLAG_APP_ERROR_CODE_SET* = cast[cuint](1'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2737:9
  else:
    let NGTCP2_STREAM_CLOSE_FLAG_APP_ERROR_CODE_SET* = cast[cuint](1'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2737:9
else:
  static :
    hint("Declaration of " & "NGTCP2_STREAM_CLOSE_FLAG_APP_ERROR_CODE_SET" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PATH_VALIDATION_FLAG_NONE):
  when cast[cuint](0'i64) is static:
    const
      NGTCP2_PATH_VALIDATION_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2945:9
  else:
    let NGTCP2_PATH_VALIDATION_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2945:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PATH_VALIDATION_FLAG_NONE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PATH_VALIDATION_FLAG_PREFERRED_ADDR):
  when cast[cuint](1'i64) is static:
    const
      NGTCP2_PATH_VALIDATION_FLAG_PREFERRED_ADDR* = cast[cuint](1'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2954:9
  else:
    let NGTCP2_PATH_VALIDATION_FLAG_PREFERRED_ADDR* = cast[cuint](1'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2954:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PATH_VALIDATION_FLAG_PREFERRED_ADDR" &
        " already exists, not redeclaring")
when not declared(NGTCP2_PATH_VALIDATION_FLAG_NEW_TOKEN):
  when cast[cuint](2'i64) is static:
    const
      NGTCP2_PATH_VALIDATION_FLAG_NEW_TOKEN* = cast[cuint](2'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2963:9
  else:
    let NGTCP2_PATH_VALIDATION_FLAG_NEW_TOKEN* = cast[cuint](2'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:2963:9
else:
  static :
    hint("Declaration of " & "NGTCP2_PATH_VALIDATION_FLAG_NEW_TOKEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_DATAGRAM_FLAG_NONE):
  when cast[cuint](0'i64) is static:
    const
      NGTCP2_DATAGRAM_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3112:9
  else:
    let NGTCP2_DATAGRAM_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3112:9
else:
  static :
    hint("Declaration of " & "NGTCP2_DATAGRAM_FLAG_NONE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_DATAGRAM_FLAG_0RTT):
  when cast[cuint](1'i64) is static:
    const
      NGTCP2_DATAGRAM_FLAG_0RTT* = cast[cuint](1'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3121:9
  else:
    let NGTCP2_DATAGRAM_FLAG_0RTT* = cast[cuint](1'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3121:9
else:
  static :
    hint("Declaration of " & "NGTCP2_DATAGRAM_FLAG_0RTT" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CALLBACKS_V1):
  when 1 is static:
    const
      NGTCP2_CALLBACKS_V1* = 1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3255:9
  else:
    let NGTCP2_CALLBACKS_V1* = 1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3255:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CALLBACKS_V1" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CALLBACKS_VERSION):
  when NGTCP2_CALLBACKS_V1 is typedesc:
    type
      NGTCP2_CALLBACKS_VERSION* = NGTCP2_CALLBACKS_V1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3256:9
  else:
    when NGTCP2_CALLBACKS_V1 is static:
      const
        NGTCP2_CALLBACKS_VERSION* = NGTCP2_CALLBACKS_V1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3256:9
    else:
      let NGTCP2_CALLBACKS_VERSION* = NGTCP2_CALLBACKS_V1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:3256:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CALLBACKS_VERSION" &
        " already exists, not redeclaring")
when not declared(NGTCP2_WRITE_STREAM_FLAG_NONE):
  when cast[cuint](0'i64) is static:
    const
      NGTCP2_WRITE_STREAM_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4383:9
  else:
    let NGTCP2_WRITE_STREAM_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4383:9
else:
  static :
    hint("Declaration of " & "NGTCP2_WRITE_STREAM_FLAG_NONE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_WRITE_STREAM_FLAG_MORE):
  when cast[cuint](1'i64) is static:
    const
      NGTCP2_WRITE_STREAM_FLAG_MORE* = cast[cuint](1'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4391:9
  else:
    let NGTCP2_WRITE_STREAM_FLAG_MORE* = cast[cuint](1'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4391:9
else:
  static :
    hint("Declaration of " & "NGTCP2_WRITE_STREAM_FLAG_MORE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_WRITE_STREAM_FLAG_FIN):
  when cast[cuint](2'i64) is static:
    const
      NGTCP2_WRITE_STREAM_FLAG_FIN* = cast[cuint](2'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4399:9
  else:
    let NGTCP2_WRITE_STREAM_FLAG_FIN* = cast[cuint](2'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4399:9
else:
  static :
    hint("Declaration of " & "NGTCP2_WRITE_STREAM_FLAG_FIN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_WRITE_DATAGRAM_FLAG_NONE):
  when cast[cuint](0'i64) is static:
    const
      NGTCP2_WRITE_DATAGRAM_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4579:9
  else:
    let NGTCP2_WRITE_DATAGRAM_FLAG_NONE* = cast[cuint](0'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4579:9
else:
  static :
    hint("Declaration of " & "NGTCP2_WRITE_DATAGRAM_FLAG_NONE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_WRITE_DATAGRAM_FLAG_MORE):
  when cast[cuint](1'i64) is static:
    const
      NGTCP2_WRITE_DATAGRAM_FLAG_MORE* = cast[cuint](1'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4587:9
  else:
    let NGTCP2_WRITE_DATAGRAM_FLAG_MORE* = cast[cuint](1'i64) ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:4587:9
else:
  static :
    hint("Declaration of " & "NGTCP2_WRITE_DATAGRAM_FLAG_MORE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_VERSION_AGE):
  when 1 is static:
    const
      NGTCP2_VERSION_AGE* = 1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:5667:9
  else:
    let NGTCP2_VERSION_AGE* = 1 ## Generated based on /nim-ngtcp2/libs/ngtcp2/lib/includes/ngtcp2/ngtcp2.h:5667:9
else:
  static :
    hint("Declaration of " & "NGTCP2_VERSION_AGE" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CRYPTO_ERR_INTERNAL):
  when -201 is static:
    const
      NGTCP2_CRYPTO_ERR_INTERNAL* = -201 ## Generated based on /nim-ngtcp2/libs/ngtcp2/crypto/includes/ngtcp2/ngtcp2_crypto.h:52:9
  else:
    let NGTCP2_CRYPTO_ERR_INTERNAL* = -201 ## Generated based on /nim-ngtcp2/libs/ngtcp2/crypto/includes/ngtcp2/ngtcp2_crypto.h:52:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CRYPTO_ERR_INTERNAL" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CRYPTO_ERR_UNREADABLE_TOKEN):
  when -202 is static:
    const
      NGTCP2_CRYPTO_ERR_UNREADABLE_TOKEN* = -202 ## Generated based on /nim-ngtcp2/libs/ngtcp2/crypto/includes/ngtcp2/ngtcp2_crypto.h:61:9
  else:
    let NGTCP2_CRYPTO_ERR_UNREADABLE_TOKEN* = -202 ## Generated based on /nim-ngtcp2/libs/ngtcp2/crypto/includes/ngtcp2/ngtcp2_crypto.h:61:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CRYPTO_ERR_UNREADABLE_TOKEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CRYPTO_ERR_VERIFY_TOKEN):
  when -203 is static:
    const
      NGTCP2_CRYPTO_ERR_VERIFY_TOKEN* = -203 ## Generated based on /nim-ngtcp2/libs/ngtcp2/crypto/includes/ngtcp2/ngtcp2_crypto.h:70:9
  else:
    let NGTCP2_CRYPTO_ERR_VERIFY_TOKEN* = -203 ## Generated based on /nim-ngtcp2/libs/ngtcp2/crypto/includes/ngtcp2/ngtcp2_crypto.h:70:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CRYPTO_ERR_VERIFY_TOKEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CRYPTO_TOKEN_RAND_DATALEN):
  when 16 is static:
    const
      NGTCP2_CRYPTO_TOKEN_RAND_DATALEN* = 16 ## Generated based on /nim-ngtcp2/libs/ngtcp2/crypto/includes/ngtcp2/ngtcp2_crypto.h:571:9
  else:
    let NGTCP2_CRYPTO_TOKEN_RAND_DATALEN* = 16 ## Generated based on /nim-ngtcp2/libs/ngtcp2/crypto/includes/ngtcp2/ngtcp2_crypto.h:571:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CRYPTO_TOKEN_RAND_DATALEN" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CRYPTO_TOKEN_MAGIC_RETRY):
  when 182 is static:
    const
      NGTCP2_CRYPTO_TOKEN_MAGIC_RETRY* = 182 ## Generated based on /nim-ngtcp2/libs/ngtcp2/crypto/includes/ngtcp2/ngtcp2_crypto.h:579:9
  else:
    let NGTCP2_CRYPTO_TOKEN_MAGIC_RETRY* = 182 ## Generated based on /nim-ngtcp2/libs/ngtcp2/crypto/includes/ngtcp2/ngtcp2_crypto.h:579:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CRYPTO_TOKEN_MAGIC_RETRY" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CRYPTO_TOKEN_MAGIC_RETRY2):
  when 183 is static:
    const
      NGTCP2_CRYPTO_TOKEN_MAGIC_RETRY2* = 183 ## Generated based on /nim-ngtcp2/libs/ngtcp2/crypto/includes/ngtcp2/ngtcp2_crypto.h:587:9
  else:
    let NGTCP2_CRYPTO_TOKEN_MAGIC_RETRY2* = 183 ## Generated based on /nim-ngtcp2/libs/ngtcp2/crypto/includes/ngtcp2/ngtcp2_crypto.h:587:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CRYPTO_TOKEN_MAGIC_RETRY2" &
        " already exists, not redeclaring")
when not declared(NGTCP2_CRYPTO_TOKEN_MAGIC_REGULAR):
  when 54 is static:
    const
      NGTCP2_CRYPTO_TOKEN_MAGIC_REGULAR* = 54 ## Generated based on /nim-ngtcp2/libs/ngtcp2/crypto/includes/ngtcp2/ngtcp2_crypto.h:595:9
  else:
    let NGTCP2_CRYPTO_TOKEN_MAGIC_REGULAR* = 54 ## Generated based on /nim-ngtcp2/libs/ngtcp2/crypto/includes/ngtcp2/ngtcp2_crypto.h:595:9
else:
  static :
    hint("Declaration of " & "NGTCP2_CRYPTO_TOKEN_MAGIC_REGULAR" &
        " already exists, not redeclaring")
when not declared(PTLS_HAVE_LOG):
  when 1 is static:
    const
      PTLS_HAVE_LOG* = 1     ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:77:9
  else:
    let PTLS_HAVE_LOG* = 1   ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:77:9
else:
  static :
    hint("Declaration of " & "PTLS_HAVE_LOG" &
        " already exists, not redeclaring")
when not declared(PTLS_FUZZ_HANDSHAKE):
  when 0 is static:
    const
      PTLS_FUZZ_HANDSHAKE* = 0 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:82:9
  else:
    let PTLS_FUZZ_HANDSHAKE* = 0 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:82:9
else:
  static :
    hint("Declaration of " & "PTLS_FUZZ_HANDSHAKE" &
        " already exists, not redeclaring")
when not declared(PTLS_HELLO_RANDOM_SIZE):
  when 32 is static:
    const
      PTLS_HELLO_RANDOM_SIZE* = 32 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:85:9
  else:
    let PTLS_HELLO_RANDOM_SIZE* = 32 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:85:9
else:
  static :
    hint("Declaration of " & "PTLS_HELLO_RANDOM_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AES128_KEY_SIZE):
  when 16 is static:
    const
      PTLS_AES128_KEY_SIZE* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:87:9
  else:
    let PTLS_AES128_KEY_SIZE* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:87:9
else:
  static :
    hint("Declaration of " & "PTLS_AES128_KEY_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AES256_KEY_SIZE):
  when 32 is static:
    const
      PTLS_AES256_KEY_SIZE* = 32 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:88:9
  else:
    let PTLS_AES256_KEY_SIZE* = 32 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:88:9
else:
  static :
    hint("Declaration of " & "PTLS_AES256_KEY_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AES_BLOCK_SIZE):
  when 16 is static:
    const
      PTLS_AES_BLOCK_SIZE* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:89:9
  else:
    let PTLS_AES_BLOCK_SIZE* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:89:9
else:
  static :
    hint("Declaration of " & "PTLS_AES_BLOCK_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AES_IV_SIZE):
  when 16 is static:
    const
      PTLS_AES_IV_SIZE* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:90:9
  else:
    let PTLS_AES_IV_SIZE* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:90:9
else:
  static :
    hint("Declaration of " & "PTLS_AES_IV_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AESGCM_IV_SIZE):
  when 12 is static:
    const
      PTLS_AESGCM_IV_SIZE* = 12 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:91:9
  else:
    let PTLS_AESGCM_IV_SIZE* = 12 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:91:9
else:
  static :
    hint("Declaration of " & "PTLS_AESGCM_IV_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AESGCM_TAG_SIZE):
  when 16 is static:
    const
      PTLS_AESGCM_TAG_SIZE* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:92:9
  else:
    let PTLS_AESGCM_TAG_SIZE* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:92:9
else:
  static :
    hint("Declaration of " & "PTLS_AESGCM_TAG_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AESGCM_CONFIDENTIALITY_LIMIT):
  when 33554432 is static:
    const
      PTLS_AESGCM_CONFIDENTIALITY_LIMIT* = 33554432 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:93:9
  else:
    let PTLS_AESGCM_CONFIDENTIALITY_LIMIT* = 33554432 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:93:9
else:
  static :
    hint("Declaration of " & "PTLS_AESGCM_CONFIDENTIALITY_LIMIT" &
        " already exists, not redeclaring")
when not declared(PTLS_AESGCM_INTEGRITY_LIMIT):
  when cast[culonglong](18014398509481984'i64) is static:
    const
      PTLS_AESGCM_INTEGRITY_LIMIT* = cast[culonglong](18014398509481984'i64) ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:94:9
  else:
    let PTLS_AESGCM_INTEGRITY_LIMIT* = cast[culonglong](18014398509481984'i64) ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:94:9
else:
  static :
    hint("Declaration of " & "PTLS_AESGCM_INTEGRITY_LIMIT" &
        " already exists, not redeclaring")
when not declared(PTLS_AESCCM_CONFIDENTIALITY_LIMIT):
  when 11863283 is static:
    const
      PTLS_AESCCM_CONFIDENTIALITY_LIMIT* = 11863283 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:95:9
  else:
    let PTLS_AESCCM_CONFIDENTIALITY_LIMIT* = 11863283 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:95:9
else:
  static :
    hint("Declaration of " & "PTLS_AESCCM_CONFIDENTIALITY_LIMIT" &
        " already exists, not redeclaring")
when not declared(PTLS_AESCCM_INTEGRITY_LIMIT):
  when 11863283 is static:
    const
      PTLS_AESCCM_INTEGRITY_LIMIT* = 11863283 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:96:9
  else:
    let PTLS_AESCCM_INTEGRITY_LIMIT* = 11863283 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:96:9
else:
  static :
    hint("Declaration of " & "PTLS_AESCCM_INTEGRITY_LIMIT" &
        " already exists, not redeclaring")
when not declared(PTLS_CHACHA20_KEY_SIZE):
  when 32 is static:
    const
      PTLS_CHACHA20_KEY_SIZE* = 32 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:98:9
  else:
    let PTLS_CHACHA20_KEY_SIZE* = 32 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:98:9
else:
  static :
    hint("Declaration of " & "PTLS_CHACHA20_KEY_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_CHACHA20_IV_SIZE):
  when 16 is static:
    const
      PTLS_CHACHA20_IV_SIZE* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:99:9
  else:
    let PTLS_CHACHA20_IV_SIZE* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:99:9
else:
  static :
    hint("Declaration of " & "PTLS_CHACHA20_IV_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_CHACHA20POLY1305_IV_SIZE):
  when 12 is static:
    const
      PTLS_CHACHA20POLY1305_IV_SIZE* = 12 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:100:9
  else:
    let PTLS_CHACHA20POLY1305_IV_SIZE* = 12 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:100:9
else:
  static :
    hint("Declaration of " & "PTLS_CHACHA20POLY1305_IV_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_CHACHA20POLY1305_TAG_SIZE):
  when 16 is static:
    const
      PTLS_CHACHA20POLY1305_TAG_SIZE* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:101:9
  else:
    let PTLS_CHACHA20POLY1305_TAG_SIZE* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:101:9
else:
  static :
    hint("Declaration of " & "PTLS_CHACHA20POLY1305_TAG_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_CHACHA20POLY1305_CONFIDENTIALITY_LIMIT):
  when UINT64_MAX is typedesc:
    type
      PTLS_CHACHA20POLY1305_CONFIDENTIALITY_LIMIT* = UINT64_MAX ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:102:9
  else:
    when UINT64_MAX is static:
      const
        PTLS_CHACHA20POLY1305_CONFIDENTIALITY_LIMIT* = UINT64_MAX ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:102:9
    else:
      let PTLS_CHACHA20POLY1305_CONFIDENTIALITY_LIMIT* = UINT64_MAX ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:102:9
else:
  static :
    hint("Declaration of " & "PTLS_CHACHA20POLY1305_CONFIDENTIALITY_LIMIT" &
        " already exists, not redeclaring")
when not declared(PTLS_CHACHA20POLY1305_INTEGRITY_LIMIT):
  when cast[culonglong](68719476736'i64) is static:
    const
      PTLS_CHACHA20POLY1305_INTEGRITY_LIMIT* = cast[culonglong](68719476736'i64) ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:103:9
  else:
    let PTLS_CHACHA20POLY1305_INTEGRITY_LIMIT* = cast[culonglong](68719476736'i64) ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:103:9
else:
  static :
    hint("Declaration of " & "PTLS_CHACHA20POLY1305_INTEGRITY_LIMIT" &
        " already exists, not redeclaring")
when not declared(PTLS_AEGIS128L_KEY_SIZE):
  when 16 is static:
    const
      PTLS_AEGIS128L_KEY_SIZE* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:105:9
  else:
    let PTLS_AEGIS128L_KEY_SIZE* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:105:9
else:
  static :
    hint("Declaration of " & "PTLS_AEGIS128L_KEY_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AEGIS128L_IV_SIZE):
  when 16 is static:
    const
      PTLS_AEGIS128L_IV_SIZE* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:106:9
  else:
    let PTLS_AEGIS128L_IV_SIZE* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:106:9
else:
  static :
    hint("Declaration of " & "PTLS_AEGIS128L_IV_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AEGIS128L_TAG_SIZE):
  when 16 is static:
    const
      PTLS_AEGIS128L_TAG_SIZE* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:107:9
  else:
    let PTLS_AEGIS128L_TAG_SIZE* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:107:9
else:
  static :
    hint("Declaration of " & "PTLS_AEGIS128L_TAG_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AEGIS128L_CONFIDENTIALITY_LIMIT):
  when UINT64_MAX is typedesc:
    type
      PTLS_AEGIS128L_CONFIDENTIALITY_LIMIT* = UINT64_MAX ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:108:9
  else:
    when UINT64_MAX is static:
      const
        PTLS_AEGIS128L_CONFIDENTIALITY_LIMIT* = UINT64_MAX ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:108:9
    else:
      let PTLS_AEGIS128L_CONFIDENTIALITY_LIMIT* = UINT64_MAX ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:108:9
else:
  static :
    hint("Declaration of " & "PTLS_AEGIS128L_CONFIDENTIALITY_LIMIT" &
        " already exists, not redeclaring")
when not declared(PTLS_AEGIS128L_INTEGRITY_LIMIT):
  when cast[culonglong](281474976710656'i64) is static:
    const
      PTLS_AEGIS128L_INTEGRITY_LIMIT* = cast[culonglong](281474976710656'i64) ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:109:9
  else:
    let PTLS_AEGIS128L_INTEGRITY_LIMIT* = cast[culonglong](281474976710656'i64) ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:109:9
else:
  static :
    hint("Declaration of " & "PTLS_AEGIS128L_INTEGRITY_LIMIT" &
        " already exists, not redeclaring")
when not declared(PTLS_AEGIS256_KEY_SIZE):
  when 32 is static:
    const
      PTLS_AEGIS256_KEY_SIZE* = 32 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:111:9
  else:
    let PTLS_AEGIS256_KEY_SIZE* = 32 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:111:9
else:
  static :
    hint("Declaration of " & "PTLS_AEGIS256_KEY_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AEGIS256_IV_SIZE):
  when 32 is static:
    const
      PTLS_AEGIS256_IV_SIZE* = 32 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:112:9
  else:
    let PTLS_AEGIS256_IV_SIZE* = 32 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:112:9
else:
  static :
    hint("Declaration of " & "PTLS_AEGIS256_IV_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AEGIS256_TAG_SIZE):
  when 16 is static:
    const
      PTLS_AEGIS256_TAG_SIZE* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:113:9
  else:
    let PTLS_AEGIS256_TAG_SIZE* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:113:9
else:
  static :
    hint("Declaration of " & "PTLS_AEGIS256_TAG_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AEGIS256_CONFIDENTIALITY_LIMIT):
  when UINT64_MAX is typedesc:
    type
      PTLS_AEGIS256_CONFIDENTIALITY_LIMIT* = UINT64_MAX ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:114:9
  else:
    when UINT64_MAX is static:
      const
        PTLS_AEGIS256_CONFIDENTIALITY_LIMIT* = UINT64_MAX ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:114:9
    else:
      let PTLS_AEGIS256_CONFIDENTIALITY_LIMIT* = UINT64_MAX ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:114:9
else:
  static :
    hint("Declaration of " & "PTLS_AEGIS256_CONFIDENTIALITY_LIMIT" &
        " already exists, not redeclaring")
when not declared(PTLS_AEGIS256_INTEGRITY_LIMIT):
  when cast[culonglong](281474976710656'i64) is static:
    const
      PTLS_AEGIS256_INTEGRITY_LIMIT* = cast[culonglong](281474976710656'i64) ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:115:9
  else:
    let PTLS_AEGIS256_INTEGRITY_LIMIT* = cast[culonglong](281474976710656'i64) ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:115:9
else:
  static :
    hint("Declaration of " & "PTLS_AEGIS256_INTEGRITY_LIMIT" &
        " already exists, not redeclaring")
when not declared(PTLS_BLOWFISH_KEY_SIZE):
  when 16 is static:
    const
      PTLS_BLOWFISH_KEY_SIZE* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:117:9
  else:
    let PTLS_BLOWFISH_KEY_SIZE* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:117:9
else:
  static :
    hint("Declaration of " & "PTLS_BLOWFISH_KEY_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_BLOWFISH_BLOCK_SIZE):
  when 8 is static:
    const
      PTLS_BLOWFISH_BLOCK_SIZE* = 8 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:118:9
  else:
    let PTLS_BLOWFISH_BLOCK_SIZE* = 8 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:118:9
else:
  static :
    hint("Declaration of " & "PTLS_BLOWFISH_BLOCK_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_SHA256_BLOCK_SIZE):
  when 64 is static:
    const
      PTLS_SHA256_BLOCK_SIZE* = 64 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:120:9
  else:
    let PTLS_SHA256_BLOCK_SIZE* = 64 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:120:9
else:
  static :
    hint("Declaration of " & "PTLS_SHA256_BLOCK_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_SHA256_DIGEST_SIZE):
  when 32 is static:
    const
      PTLS_SHA256_DIGEST_SIZE* = 32 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:121:9
  else:
    let PTLS_SHA256_DIGEST_SIZE* = 32 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:121:9
else:
  static :
    hint("Declaration of " & "PTLS_SHA256_DIGEST_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_SHA384_BLOCK_SIZE):
  when 128 is static:
    const
      PTLS_SHA384_BLOCK_SIZE* = 128 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:123:9
  else:
    let PTLS_SHA384_BLOCK_SIZE* = 128 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:123:9
else:
  static :
    hint("Declaration of " & "PTLS_SHA384_BLOCK_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_SHA384_DIGEST_SIZE):
  when 48 is static:
    const
      PTLS_SHA384_DIGEST_SIZE* = 48 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:124:9
  else:
    let PTLS_SHA384_DIGEST_SIZE* = 48 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:124:9
else:
  static :
    hint("Declaration of " & "PTLS_SHA384_DIGEST_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_SHA512_BLOCK_SIZE):
  when 128 is static:
    const
      PTLS_SHA512_BLOCK_SIZE* = 128 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:126:9
  else:
    let PTLS_SHA512_BLOCK_SIZE* = 128 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:126:9
else:
  static :
    hint("Declaration of " & "PTLS_SHA512_BLOCK_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_SHA512_DIGEST_SIZE):
  when 64 is static:
    const
      PTLS_SHA512_DIGEST_SIZE* = 64 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:127:9
  else:
    let PTLS_SHA512_DIGEST_SIZE* = 64 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:127:9
else:
  static :
    hint("Declaration of " & "PTLS_SHA512_DIGEST_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_MAX_SECRET_SIZE):
  when 32 is static:
    const
      PTLS_MAX_SECRET_SIZE* = 32 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:129:9
  else:
    let PTLS_MAX_SECRET_SIZE* = 32 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:129:9
else:
  static :
    hint("Declaration of " & "PTLS_MAX_SECRET_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_MAX_IV_SIZE):
  when 32 is static:
    const
      PTLS_MAX_IV_SIZE* = 32 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:130:9
  else:
    let PTLS_MAX_IV_SIZE* = 32 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:130:9
else:
  static :
    hint("Declaration of " & "PTLS_MAX_IV_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_MAX_DIGEST_SIZE):
  when 64 is static:
    const
      PTLS_MAX_DIGEST_SIZE* = 64 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:131:9
  else:
    let PTLS_MAX_DIGEST_SIZE* = 64 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:131:9
else:
  static :
    hint("Declaration of " & "PTLS_MAX_DIGEST_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_PROTOCOL_VERSION_TLS12):
  when 771 is static:
    const
      PTLS_PROTOCOL_VERSION_TLS12* = 771 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:134:9
  else:
    let PTLS_PROTOCOL_VERSION_TLS12* = 771 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:134:9
else:
  static :
    hint("Declaration of " & "PTLS_PROTOCOL_VERSION_TLS12" &
        " already exists, not redeclaring")
when not declared(PTLS_PROTOCOL_VERSION_TLS13):
  when 772 is static:
    const
      PTLS_PROTOCOL_VERSION_TLS13* = 772 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:135:9
  else:
    let PTLS_PROTOCOL_VERSION_TLS13* = 772 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:135:9
else:
  static :
    hint("Declaration of " & "PTLS_PROTOCOL_VERSION_TLS13" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_AES_128_GCM_SHA256):
  when 4865 is static:
    const
      PTLS_CIPHER_SUITE_AES_128_GCM_SHA256* = 4865 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:138:9
  else:
    let PTLS_CIPHER_SUITE_AES_128_GCM_SHA256* = 4865 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:138:9
else:
  static :
    hint("Declaration of " & "PTLS_CIPHER_SUITE_AES_128_GCM_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_NAME_AES_128_GCM_SHA256):
  when "TLS_AES_128_GCM_SHA256" is static:
    const
      PTLS_CIPHER_SUITE_NAME_AES_128_GCM_SHA256* = "TLS_AES_128_GCM_SHA256" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:139:9
  else:
    let PTLS_CIPHER_SUITE_NAME_AES_128_GCM_SHA256* = "TLS_AES_128_GCM_SHA256" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:139:9
else:
  static :
    hint("Declaration of " & "PTLS_CIPHER_SUITE_NAME_AES_128_GCM_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_AES_256_GCM_SHA384):
  when 4866 is static:
    const
      PTLS_CIPHER_SUITE_AES_256_GCM_SHA384* = 4866 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:140:9
  else:
    let PTLS_CIPHER_SUITE_AES_256_GCM_SHA384* = 4866 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:140:9
else:
  static :
    hint("Declaration of " & "PTLS_CIPHER_SUITE_AES_256_GCM_SHA384" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_NAME_AES_256_GCM_SHA384):
  when "TLS_AES_256_GCM_SHA384" is static:
    const
      PTLS_CIPHER_SUITE_NAME_AES_256_GCM_SHA384* = "TLS_AES_256_GCM_SHA384" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:141:9
  else:
    let PTLS_CIPHER_SUITE_NAME_AES_256_GCM_SHA384* = "TLS_AES_256_GCM_SHA384" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:141:9
else:
  static :
    hint("Declaration of " & "PTLS_CIPHER_SUITE_NAME_AES_256_GCM_SHA384" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_CHACHA20_POLY1305_SHA256):
  when 4867 is static:
    const
      PTLS_CIPHER_SUITE_CHACHA20_POLY1305_SHA256* = 4867 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:142:9
  else:
    let PTLS_CIPHER_SUITE_CHACHA20_POLY1305_SHA256* = 4867 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:142:9
else:
  static :
    hint("Declaration of " & "PTLS_CIPHER_SUITE_CHACHA20_POLY1305_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_NAME_CHACHA20_POLY1305_SHA256):
  when "TLS_CHACHA20_POLY1305_SHA256" is static:
    const
      PTLS_CIPHER_SUITE_NAME_CHACHA20_POLY1305_SHA256* = "TLS_CHACHA20_POLY1305_SHA256" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:143:9
  else:
    let PTLS_CIPHER_SUITE_NAME_CHACHA20_POLY1305_SHA256* = "TLS_CHACHA20_POLY1305_SHA256" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:143:9
else:
  static :
    hint("Declaration of " & "PTLS_CIPHER_SUITE_NAME_CHACHA20_POLY1305_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_AEGIS256_SHA512):
  when 4870 is static:
    const
      PTLS_CIPHER_SUITE_AEGIS256_SHA512* = 4870 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:144:9
  else:
    let PTLS_CIPHER_SUITE_AEGIS256_SHA512* = 4870 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:144:9
else:
  static :
    hint("Declaration of " & "PTLS_CIPHER_SUITE_AEGIS256_SHA512" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_NAME_AEGIS256_SHA512):
  when "TLS_AEGIS_256_SHA512" is static:
    const
      PTLS_CIPHER_SUITE_NAME_AEGIS256_SHA512* = "TLS_AEGIS_256_SHA512" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:145:9
  else:
    let PTLS_CIPHER_SUITE_NAME_AEGIS256_SHA512* = "TLS_AEGIS_256_SHA512" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:145:9
else:
  static :
    hint("Declaration of " & "PTLS_CIPHER_SUITE_NAME_AEGIS256_SHA512" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_AEGIS128L_SHA256):
  when 4871 is static:
    const
      PTLS_CIPHER_SUITE_AEGIS128L_SHA256* = 4871 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:146:9
  else:
    let PTLS_CIPHER_SUITE_AEGIS128L_SHA256* = 4871 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:146:9
else:
  static :
    hint("Declaration of " & "PTLS_CIPHER_SUITE_AEGIS128L_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_NAME_AEGIS128L_SHA256):
  when "TLS_AEGIS_128L_SHA256" is static:
    const
      PTLS_CIPHER_SUITE_NAME_AEGIS128L_SHA256* = "TLS_AEGIS_128L_SHA256" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:147:9
  else:
    let PTLS_CIPHER_SUITE_NAME_AEGIS128L_SHA256* = "TLS_AEGIS_128L_SHA256" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:147:9
else:
  static :
    hint("Declaration of " & "PTLS_CIPHER_SUITE_NAME_AEGIS128L_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256):
  when 49195 is static:
    const
      PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256* = 49195 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:150:9
  else:
    let PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256* = 49195 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:150:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256):
  when "ECDHE-ECDSA-AES128-GCM-SHA256" is static:
    const
      PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256* = "ECDHE-ECDSA-AES128-GCM-SHA256" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:151:9
  else:
    let PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256* = "ECDHE-ECDSA-AES128-GCM-SHA256" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:151:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384):
  when 49196 is static:
    const
      PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384* = 49196 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:152:9
  else:
    let PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384* = 49196 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:152:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384):
  when "ECDHE-ECDSA-AES256-GCM-SHA384" is static:
    const
      PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384* = "ECDHE-ECDSA-AES256-GCM-SHA384" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:153:9
  else:
    let PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384* = "ECDHE-ECDSA-AES256-GCM-SHA384" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:153:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_AES_128_GCM_SHA256):
  when 49199 is static:
    const
      PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_AES_128_GCM_SHA256* = 49199 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:154:9
  else:
    let PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_AES_128_GCM_SHA256* = 49199 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:154:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_AES_128_GCM_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_AES_128_GCM_SHA256):
  when "ECDHE-RSA-AES128-GCM-SHA256" is static:
    const
      PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_AES_128_GCM_SHA256* = "ECDHE-RSA-AES128-GCM-SHA256" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:155:9
  else:
    let PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_AES_128_GCM_SHA256* = "ECDHE-RSA-AES128-GCM-SHA256" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:155:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_AES_128_GCM_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_AES_256_GCM_SHA384):
  when 49200 is static:
    const
      PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_AES_256_GCM_SHA384* = 49200 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:156:9
  else:
    let PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_AES_256_GCM_SHA384* = 49200 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:156:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_AES_256_GCM_SHA384" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_AES_256_GCM_SHA384):
  when "ECDHE-RSA-AES256-GCM-SHA384" is static:
    const
      PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_AES_256_GCM_SHA384* = "ECDHE-RSA-AES256-GCM-SHA384" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:157:9
  else:
    let PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_AES_256_GCM_SHA384* = "ECDHE-RSA-AES256-GCM-SHA384" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:157:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_AES_256_GCM_SHA384" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256):
  when 52392 is static:
    const
      PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256* = 52392 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:158:9
  else:
    let PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256* = 52392 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:158:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256):
  when "ECDHE-RSA-CHACHA20-POLY1305" is static:
    const
      PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256* = "ECDHE-RSA-CHACHA20-POLY1305" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:159:9
  else:
    let PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256* = "ECDHE-RSA-CHACHA20-POLY1305" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:159:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256):
  when 52393 is static:
    const
      PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256* = 52393 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:160:9
  else:
    let PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256* = 52393 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:160:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256):
  when "ECDHE-ECDSA-CHACHA20-POLY1305" is static:
    const
      PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256* = "ECDHE-ECDSA-CHACHA20-POLY1305" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:161:9
  else:
    let PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256* = "ECDHE-ECDSA-CHACHA20-POLY1305" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:161:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_SECP256R1):
  when 23 is static:
    const
      PTLS_GROUP_SECP256R1* = 23 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:164:9
  else:
    let PTLS_GROUP_SECP256R1* = 23 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:164:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_SECP256R1" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_NAME_SECP256R1):
  when "secp256r1" is static:
    const
      PTLS_GROUP_NAME_SECP256R1* = "secp256r1" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:165:9
  else:
    let PTLS_GROUP_NAME_SECP256R1* = "secp256r1" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:165:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_NAME_SECP256R1" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_SECP384R1):
  when 24 is static:
    const
      PTLS_GROUP_SECP384R1* = 24 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:166:9
  else:
    let PTLS_GROUP_SECP384R1* = 24 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:166:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_SECP384R1" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_NAME_SECP384R1):
  when "secp384r1" is static:
    const
      PTLS_GROUP_NAME_SECP384R1* = "secp384r1" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:167:9
  else:
    let PTLS_GROUP_NAME_SECP384R1* = "secp384r1" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:167:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_NAME_SECP384R1" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_SECP521R1):
  when 25 is static:
    const
      PTLS_GROUP_SECP521R1* = 25 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:168:9
  else:
    let PTLS_GROUP_SECP521R1* = 25 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:168:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_SECP521R1" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_NAME_SECP521R1):
  when "secp521r1" is static:
    const
      PTLS_GROUP_NAME_SECP521R1* = "secp521r1" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:169:9
  else:
    let PTLS_GROUP_NAME_SECP521R1* = "secp521r1" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:169:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_NAME_SECP521R1" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_X25519):
  when 29 is static:
    const
      PTLS_GROUP_X25519* = 29 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:170:9
  else:
    let PTLS_GROUP_X25519* = 29 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:170:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_X25519" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_NAME_X25519):
  when "x25519" is static:
    const
      PTLS_GROUP_NAME_X25519* = "x25519" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:171:9
  else:
    let PTLS_GROUP_NAME_X25519* = "x25519" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:171:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_NAME_X25519" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_X448):
  when 30 is static:
    const
      PTLS_GROUP_X448* = 30  ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:172:9
  else:
    let PTLS_GROUP_X448* = 30 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:172:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_X448" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_NAME_X448):
  when "x448" is static:
    const
      PTLS_GROUP_NAME_X448* = "x448" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:173:9
  else:
    let PTLS_GROUP_NAME_X448* = "x448" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:173:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_NAME_X448" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_X25519MLKEM768):
  when 4588 is static:
    const
      PTLS_GROUP_X25519MLKEM768* = 4588 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:174:9
  else:
    let PTLS_GROUP_X25519MLKEM768* = 4588 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:174:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_X25519MLKEM768" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_NAME_X25519MLKEM768):
  when "X25519MLKEM768" is static:
    const
      PTLS_GROUP_NAME_X25519MLKEM768* = "X25519MLKEM768" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:175:9
  else:
    let PTLS_GROUP_NAME_X25519MLKEM768* = "X25519MLKEM768" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:175:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_NAME_X25519MLKEM768" &
        " already exists, not redeclaring")
when not declared(PTLS_SIGNATURE_RSA_PKCS1_SHA1):
  when 513 is static:
    const
      PTLS_SIGNATURE_RSA_PKCS1_SHA1* = 513 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:178:9
  else:
    let PTLS_SIGNATURE_RSA_PKCS1_SHA1* = 513 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:178:9
else:
  static :
    hint("Declaration of " & "PTLS_SIGNATURE_RSA_PKCS1_SHA1" &
        " already exists, not redeclaring")
when not declared(PTLS_SIGNATURE_RSA_PKCS1_SHA256):
  when 1025 is static:
    const
      PTLS_SIGNATURE_RSA_PKCS1_SHA256* = 1025 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:179:9
  else:
    let PTLS_SIGNATURE_RSA_PKCS1_SHA256* = 1025 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:179:9
else:
  static :
    hint("Declaration of " & "PTLS_SIGNATURE_RSA_PKCS1_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_SIGNATURE_ECDSA_SECP256R1_SHA256):
  when 1027 is static:
    const
      PTLS_SIGNATURE_ECDSA_SECP256R1_SHA256* = 1027 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:180:9
  else:
    let PTLS_SIGNATURE_ECDSA_SECP256R1_SHA256* = 1027 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:180:9
else:
  static :
    hint("Declaration of " & "PTLS_SIGNATURE_ECDSA_SECP256R1_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_SIGNATURE_ECDSA_SECP384R1_SHA384):
  when 1283 is static:
    const
      PTLS_SIGNATURE_ECDSA_SECP384R1_SHA384* = 1283 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:181:9
  else:
    let PTLS_SIGNATURE_ECDSA_SECP384R1_SHA384* = 1283 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:181:9
else:
  static :
    hint("Declaration of " & "PTLS_SIGNATURE_ECDSA_SECP384R1_SHA384" &
        " already exists, not redeclaring")
when not declared(PTLS_SIGNATURE_ECDSA_SECP521R1_SHA512):
  when 1539 is static:
    const
      PTLS_SIGNATURE_ECDSA_SECP521R1_SHA512* = 1539 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:182:9
  else:
    let PTLS_SIGNATURE_ECDSA_SECP521R1_SHA512* = 1539 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:182:9
else:
  static :
    hint("Declaration of " & "PTLS_SIGNATURE_ECDSA_SECP521R1_SHA512" &
        " already exists, not redeclaring")
when not declared(PTLS_SIGNATURE_RSA_PSS_RSAE_SHA256):
  when 2052 is static:
    const
      PTLS_SIGNATURE_RSA_PSS_RSAE_SHA256* = 2052 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:183:9
  else:
    let PTLS_SIGNATURE_RSA_PSS_RSAE_SHA256* = 2052 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:183:9
else:
  static :
    hint("Declaration of " & "PTLS_SIGNATURE_RSA_PSS_RSAE_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_SIGNATURE_RSA_PSS_RSAE_SHA384):
  when 2053 is static:
    const
      PTLS_SIGNATURE_RSA_PSS_RSAE_SHA384* = 2053 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:184:9
  else:
    let PTLS_SIGNATURE_RSA_PSS_RSAE_SHA384* = 2053 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:184:9
else:
  static :
    hint("Declaration of " & "PTLS_SIGNATURE_RSA_PSS_RSAE_SHA384" &
        " already exists, not redeclaring")
when not declared(PTLS_SIGNATURE_RSA_PSS_RSAE_SHA512):
  when 2054 is static:
    const
      PTLS_SIGNATURE_RSA_PSS_RSAE_SHA512* = 2054 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:185:9
  else:
    let PTLS_SIGNATURE_RSA_PSS_RSAE_SHA512* = 2054 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:185:9
else:
  static :
    hint("Declaration of " & "PTLS_SIGNATURE_RSA_PSS_RSAE_SHA512" &
        " already exists, not redeclaring")
when not declared(PTLS_SIGNATURE_ED25519):
  when 2055 is static:
    const
      PTLS_SIGNATURE_ED25519* = 2055 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:186:9
  else:
    let PTLS_SIGNATURE_ED25519* = 2055 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:186:9
else:
  static :
    hint("Declaration of " & "PTLS_SIGNATURE_ED25519" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_MODE_BASE):
  when 0 is static:
    const
      PTLS_HPKE_MODE_BASE* = 0 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:189:9
  else:
    let PTLS_HPKE_MODE_BASE* = 0 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:189:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_MODE_BASE" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_MODE_PSK):
  when 1 is static:
    const
      PTLS_HPKE_MODE_PSK* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:190:9
  else:
    let PTLS_HPKE_MODE_PSK* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:190:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_MODE_PSK" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_MODE_AUTH):
  when 2 is static:
    const
      PTLS_HPKE_MODE_AUTH* = 2 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:191:9
  else:
    let PTLS_HPKE_MODE_AUTH* = 2 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:191:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_MODE_AUTH" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_MODE_AUTH_PSK):
  when 3 is static:
    const
      PTLS_HPKE_MODE_AUTH_PSK* = 3 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:192:9
  else:
    let PTLS_HPKE_MODE_AUTH_PSK* = 3 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:192:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_MODE_AUTH_PSK" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_KEM_P256_SHA256):
  when 16 is static:
    const
      PTLS_HPKE_KEM_P256_SHA256* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:193:9
  else:
    let PTLS_HPKE_KEM_P256_SHA256* = 16 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:193:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_KEM_P256_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_KEM_P384_SHA384):
  when 17 is static:
    const
      PTLS_HPKE_KEM_P384_SHA384* = 17 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:194:9
  else:
    let PTLS_HPKE_KEM_P384_SHA384* = 17 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:194:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_KEM_P384_SHA384" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_KEM_X25519_SHA256):
  when 32 is static:
    const
      PTLS_HPKE_KEM_X25519_SHA256* = 32 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:195:9
  else:
    let PTLS_HPKE_KEM_X25519_SHA256* = 32 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:195:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_KEM_X25519_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_HKDF_SHA256):
  when 1 is static:
    const
      PTLS_HPKE_HKDF_SHA256* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:196:9
  else:
    let PTLS_HPKE_HKDF_SHA256* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:196:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_HKDF_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_HKDF_SHA384):
  when 2 is static:
    const
      PTLS_HPKE_HKDF_SHA384* = 2 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:197:9
  else:
    let PTLS_HPKE_HKDF_SHA384* = 2 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:197:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_HKDF_SHA384" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_HKDF_SHA512):
  when 3 is static:
    const
      PTLS_HPKE_HKDF_SHA512* = 3 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:198:9
  else:
    let PTLS_HPKE_HKDF_SHA512* = 3 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:198:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_HKDF_SHA512" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_AEAD_AES_128_GCM):
  when 1 is static:
    const
      PTLS_HPKE_AEAD_AES_128_GCM* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:199:9
  else:
    let PTLS_HPKE_AEAD_AES_128_GCM* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:199:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_AEAD_AES_128_GCM" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_AEAD_AES_256_GCM):
  when 2 is static:
    const
      PTLS_HPKE_AEAD_AES_256_GCM* = 2 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:200:9
  else:
    let PTLS_HPKE_AEAD_AES_256_GCM* = 2 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:200:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_AEAD_AES_256_GCM" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_AEAD_CHACHA20POLY1305):
  when 3 is static:
    const
      PTLS_HPKE_AEAD_CHACHA20POLY1305* = 3 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:201:9
  else:
    let PTLS_HPKE_AEAD_CHACHA20POLY1305* = 3 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:201:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_AEAD_CHACHA20POLY1305" &
        " already exists, not redeclaring")
when not declared(PTLS_ERROR_CLASS_SELF_ALERT):
  when 0 is static:
    const
      PTLS_ERROR_CLASS_SELF_ALERT* = 0 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:204:9
  else:
    let PTLS_ERROR_CLASS_SELF_ALERT* = 0 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:204:9
else:
  static :
    hint("Declaration of " & "PTLS_ERROR_CLASS_SELF_ALERT" &
        " already exists, not redeclaring")
when not declared(PTLS_ERROR_CLASS_PEER_ALERT):
  when 256 is static:
    const
      PTLS_ERROR_CLASS_PEER_ALERT* = 256 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:205:9
  else:
    let PTLS_ERROR_CLASS_PEER_ALERT* = 256 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:205:9
else:
  static :
    hint("Declaration of " & "PTLS_ERROR_CLASS_PEER_ALERT" &
        " already exists, not redeclaring")
when not declared(PTLS_ERROR_CLASS_INTERNAL):
  when 512 is static:
    const
      PTLS_ERROR_CLASS_INTERNAL* = 512 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:206:9
  else:
    let PTLS_ERROR_CLASS_INTERNAL* = 512 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:206:9
else:
  static :
    hint("Declaration of " & "PTLS_ERROR_CLASS_INTERNAL" &
        " already exists, not redeclaring")
when not declared(PTLS_HKDF_EXPAND_LABEL_PREFIX):
  when "tls13 " is static:
    const
      PTLS_HKDF_EXPAND_LABEL_PREFIX* = "tls13 " ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:214:9
  else:
    let PTLS_HKDF_EXPAND_LABEL_PREFIX* = "tls13 " ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:214:9
else:
  static :
    hint("Declaration of " & "PTLS_HKDF_EXPAND_LABEL_PREFIX" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_LEVEL_WARNING):
  when 1 is static:
    const
      PTLS_ALERT_LEVEL_WARNING* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:217:9
  else:
    let PTLS_ALERT_LEVEL_WARNING* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:217:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_LEVEL_WARNING" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_LEVEL_FATAL):
  when 2 is static:
    const
      PTLS_ALERT_LEVEL_FATAL* = 2 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:218:9
  else:
    let PTLS_ALERT_LEVEL_FATAL* = 2 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:218:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_LEVEL_FATAL" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_CLOSE_NOTIFY):
  when 0 is static:
    const
      PTLS_ALERT_CLOSE_NOTIFY* = 0 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:220:9
  else:
    let PTLS_ALERT_CLOSE_NOTIFY* = 0 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:220:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_CLOSE_NOTIFY" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_UNEXPECTED_MESSAGE):
  when 10 is static:
    const
      PTLS_ALERT_UNEXPECTED_MESSAGE* = 10 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:221:9
  else:
    let PTLS_ALERT_UNEXPECTED_MESSAGE* = 10 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:221:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_UNEXPECTED_MESSAGE" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_BAD_RECORD_MAC):
  when 20 is static:
    const
      PTLS_ALERT_BAD_RECORD_MAC* = 20 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:222:9
  else:
    let PTLS_ALERT_BAD_RECORD_MAC* = 20 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:222:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_BAD_RECORD_MAC" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_HANDSHAKE_FAILURE):
  when 40 is static:
    const
      PTLS_ALERT_HANDSHAKE_FAILURE* = 40 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:223:9
  else:
    let PTLS_ALERT_HANDSHAKE_FAILURE* = 40 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:223:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_HANDSHAKE_FAILURE" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_BAD_CERTIFICATE):
  when 42 is static:
    const
      PTLS_ALERT_BAD_CERTIFICATE* = 42 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:224:9
  else:
    let PTLS_ALERT_BAD_CERTIFICATE* = 42 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:224:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_BAD_CERTIFICATE" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_UNSUPPORTED_CERTIFICATE):
  when 43 is static:
    const
      PTLS_ALERT_UNSUPPORTED_CERTIFICATE* = 43 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:225:9
  else:
    let PTLS_ALERT_UNSUPPORTED_CERTIFICATE* = 43 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:225:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_UNSUPPORTED_CERTIFICATE" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_CERTIFICATE_REVOKED):
  when 44 is static:
    const
      PTLS_ALERT_CERTIFICATE_REVOKED* = 44 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:226:9
  else:
    let PTLS_ALERT_CERTIFICATE_REVOKED* = 44 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:226:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_CERTIFICATE_REVOKED" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_CERTIFICATE_EXPIRED):
  when 45 is static:
    const
      PTLS_ALERT_CERTIFICATE_EXPIRED* = 45 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:227:9
  else:
    let PTLS_ALERT_CERTIFICATE_EXPIRED* = 45 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:227:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_CERTIFICATE_EXPIRED" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_CERTIFICATE_UNKNOWN):
  when 46 is static:
    const
      PTLS_ALERT_CERTIFICATE_UNKNOWN* = 46 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:228:9
  else:
    let PTLS_ALERT_CERTIFICATE_UNKNOWN* = 46 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:228:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_CERTIFICATE_UNKNOWN" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_ILLEGAL_PARAMETER):
  when 47 is static:
    const
      PTLS_ALERT_ILLEGAL_PARAMETER* = 47 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:229:9
  else:
    let PTLS_ALERT_ILLEGAL_PARAMETER* = 47 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:229:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_ILLEGAL_PARAMETER" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_UNKNOWN_CA):
  when 48 is static:
    const
      PTLS_ALERT_UNKNOWN_CA* = 48 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:230:9
  else:
    let PTLS_ALERT_UNKNOWN_CA* = 48 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:230:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_UNKNOWN_CA" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_ACCESS_DENIED):
  when 49 is static:
    const
      PTLS_ALERT_ACCESS_DENIED* = 49 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:231:9
  else:
    let PTLS_ALERT_ACCESS_DENIED* = 49 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:231:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_ACCESS_DENIED" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_DECODE_ERROR):
  when 50 is static:
    const
      PTLS_ALERT_DECODE_ERROR* = 50 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:232:9
  else:
    let PTLS_ALERT_DECODE_ERROR* = 50 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:232:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_DECODE_ERROR" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_DECRYPT_ERROR):
  when 51 is static:
    const
      PTLS_ALERT_DECRYPT_ERROR* = 51 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:233:9
  else:
    let PTLS_ALERT_DECRYPT_ERROR* = 51 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:233:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_DECRYPT_ERROR" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_PROTOCOL_VERSION):
  when 70 is static:
    const
      PTLS_ALERT_PROTOCOL_VERSION* = 70 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:234:9
  else:
    let PTLS_ALERT_PROTOCOL_VERSION* = 70 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:234:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_PROTOCOL_VERSION" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_INTERNAL_ERROR):
  when 80 is static:
    const
      PTLS_ALERT_INTERNAL_ERROR* = 80 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:235:9
  else:
    let PTLS_ALERT_INTERNAL_ERROR* = 80 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:235:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_INTERNAL_ERROR" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_USER_CANCELED):
  when 90 is static:
    const
      PTLS_ALERT_USER_CANCELED* = 90 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:236:9
  else:
    let PTLS_ALERT_USER_CANCELED* = 90 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:236:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_USER_CANCELED" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_MISSING_EXTENSION):
  when 109 is static:
    const
      PTLS_ALERT_MISSING_EXTENSION* = 109 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:237:9
  else:
    let PTLS_ALERT_MISSING_EXTENSION* = 109 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:237:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_MISSING_EXTENSION" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_UNSUPPORTED_EXTENSION):
  when 110 is static:
    const
      PTLS_ALERT_UNSUPPORTED_EXTENSION* = 110 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:238:9
  else:
    let PTLS_ALERT_UNSUPPORTED_EXTENSION* = 110 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:238:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_UNSUPPORTED_EXTENSION" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_UNRECOGNIZED_NAME):
  when 112 is static:
    const
      PTLS_ALERT_UNRECOGNIZED_NAME* = 112 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:239:9
  else:
    let PTLS_ALERT_UNRECOGNIZED_NAME* = 112 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:239:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_UNRECOGNIZED_NAME" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_UNKNOWN_PSK_IDENTITY):
  when 115 is static:
    const
      PTLS_ALERT_UNKNOWN_PSK_IDENTITY* = 115 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:240:9
  else:
    let PTLS_ALERT_UNKNOWN_PSK_IDENTITY* = 115 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:240:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_UNKNOWN_PSK_IDENTITY" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_CERTIFICATE_REQUIRED):
  when 116 is static:
    const
      PTLS_ALERT_CERTIFICATE_REQUIRED* = 116 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:241:9
  else:
    let PTLS_ALERT_CERTIFICATE_REQUIRED* = 116 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:241:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_CERTIFICATE_REQUIRED" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_NO_APPLICATION_PROTOCOL):
  when 120 is static:
    const
      PTLS_ALERT_NO_APPLICATION_PROTOCOL* = 120 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:242:9
  else:
    let PTLS_ALERT_NO_APPLICATION_PROTOCOL* = 120 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:242:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_NO_APPLICATION_PROTOCOL" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_ECH_REQUIRED):
  when 121 is static:
    const
      PTLS_ALERT_ECH_REQUIRED* = 121 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:243:9
  else:
    let PTLS_ALERT_ECH_REQUIRED* = 121 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:243:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_ECH_REQUIRED" &
        " already exists, not redeclaring")
when not declared(PTLS_TLS12_MASTER_SECRET_SIZE):
  when 48 is static:
    const
      PTLS_TLS12_MASTER_SECRET_SIZE* = 48 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:246:9
  else:
    let PTLS_TLS12_MASTER_SECRET_SIZE* = 48 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:246:9
else:
  static :
    hint("Declaration of " & "PTLS_TLS12_MASTER_SECRET_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_TLS12_AAD_SIZE):
  when 13 is static:
    const
      PTLS_TLS12_AAD_SIZE* = 13 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:247:9
  else:
    let PTLS_TLS12_AAD_SIZE* = 13 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:247:9
else:
  static :
    hint("Declaration of " & "PTLS_TLS12_AAD_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_TLS12_AESGCM_FIXED_IV_SIZE):
  when 4 is static:
    const
      PTLS_TLS12_AESGCM_FIXED_IV_SIZE* = 4 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:248:9
  else:
    let PTLS_TLS12_AESGCM_FIXED_IV_SIZE* = 4 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:248:9
else:
  static :
    hint("Declaration of " & "PTLS_TLS12_AESGCM_FIXED_IV_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_TLS12_AESGCM_RECORD_IV_SIZE):
  when 8 is static:
    const
      PTLS_TLS12_AESGCM_RECORD_IV_SIZE* = 8 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:249:9
  else:
    let PTLS_TLS12_AESGCM_RECORD_IV_SIZE* = 8 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:249:9
else:
  static :
    hint("Declaration of " & "PTLS_TLS12_AESGCM_RECORD_IV_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_TLS12_CHACHAPOLY_FIXED_IV_SIZE):
  when 12 is static:
    const
      PTLS_TLS12_CHACHAPOLY_FIXED_IV_SIZE* = 12 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:250:9
  else:
    let PTLS_TLS12_CHACHAPOLY_FIXED_IV_SIZE* = 12 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:250:9
else:
  static :
    hint("Declaration of " & "PTLS_TLS12_CHACHAPOLY_FIXED_IV_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_TLS12_CHACHAPOLY_RECORD_IV_SIZE):
  when 0 is static:
    const
      PTLS_TLS12_CHACHAPOLY_RECORD_IV_SIZE* = 0 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:251:9
  else:
    let PTLS_TLS12_CHACHAPOLY_RECORD_IV_SIZE* = 0 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:251:9
else:
  static :
    hint("Declaration of " & "PTLS_TLS12_CHACHAPOLY_RECORD_IV_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_CLIENT_HELLO):
  when 1 is static:
    const
      PTLS_HANDSHAKE_TYPE_CLIENT_HELLO* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:283:9
  else:
    let PTLS_HANDSHAKE_TYPE_CLIENT_HELLO* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:283:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_CLIENT_HELLO" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_SERVER_HELLO):
  when 2 is static:
    const
      PTLS_HANDSHAKE_TYPE_SERVER_HELLO* = 2 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:284:9
  else:
    let PTLS_HANDSHAKE_TYPE_SERVER_HELLO* = 2 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:284:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_SERVER_HELLO" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_NEW_SESSION_TICKET):
  when 4 is static:
    const
      PTLS_HANDSHAKE_TYPE_NEW_SESSION_TICKET* = 4 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:285:9
  else:
    let PTLS_HANDSHAKE_TYPE_NEW_SESSION_TICKET* = 4 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:285:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_NEW_SESSION_TICKET" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_END_OF_EARLY_DATA):
  when 5 is static:
    const
      PTLS_HANDSHAKE_TYPE_END_OF_EARLY_DATA* = 5 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:286:9
  else:
    let PTLS_HANDSHAKE_TYPE_END_OF_EARLY_DATA* = 5 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:286:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_END_OF_EARLY_DATA" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_ENCRYPTED_EXTENSIONS):
  when 8 is static:
    const
      PTLS_HANDSHAKE_TYPE_ENCRYPTED_EXTENSIONS* = 8 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:287:9
  else:
    let PTLS_HANDSHAKE_TYPE_ENCRYPTED_EXTENSIONS* = 8 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:287:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_ENCRYPTED_EXTENSIONS" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_CERTIFICATE):
  when 11 is static:
    const
      PTLS_HANDSHAKE_TYPE_CERTIFICATE* = 11 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:288:9
  else:
    let PTLS_HANDSHAKE_TYPE_CERTIFICATE* = 11 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:288:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_CERTIFICATE" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_CERTIFICATE_REQUEST):
  when 13 is static:
    const
      PTLS_HANDSHAKE_TYPE_CERTIFICATE_REQUEST* = 13 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:289:9
  else:
    let PTLS_HANDSHAKE_TYPE_CERTIFICATE_REQUEST* = 13 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:289:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_CERTIFICATE_REQUEST" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_CERTIFICATE_VERIFY):
  when 15 is static:
    const
      PTLS_HANDSHAKE_TYPE_CERTIFICATE_VERIFY* = 15 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:290:9
  else:
    let PTLS_HANDSHAKE_TYPE_CERTIFICATE_VERIFY* = 15 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:290:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_CERTIFICATE_VERIFY" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_FINISHED):
  when 20 is static:
    const
      PTLS_HANDSHAKE_TYPE_FINISHED* = 20 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:291:9
  else:
    let PTLS_HANDSHAKE_TYPE_FINISHED* = 20 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:291:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_FINISHED" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_KEY_UPDATE):
  when 24 is static:
    const
      PTLS_HANDSHAKE_TYPE_KEY_UPDATE* = 24 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:292:9
  else:
    let PTLS_HANDSHAKE_TYPE_KEY_UPDATE* = 24 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:292:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_KEY_UPDATE" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_COMPRESSED_CERTIFICATE):
  when 25 is static:
    const
      PTLS_HANDSHAKE_TYPE_COMPRESSED_CERTIFICATE* = 25 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:293:9
  else:
    let PTLS_HANDSHAKE_TYPE_COMPRESSED_CERTIFICATE* = 25 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:293:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_COMPRESSED_CERTIFICATE" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_MESSAGE_HASH):
  when 254 is static:
    const
      PTLS_HANDSHAKE_TYPE_MESSAGE_HASH* = 254 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:294:9
  else:
    let PTLS_HANDSHAKE_TYPE_MESSAGE_HASH* = 254 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:294:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_MESSAGE_HASH" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_PSEUDO_HRR):
  when -1 is static:
    const
      PTLS_HANDSHAKE_TYPE_PSEUDO_HRR* = -1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:295:9
  else:
    let PTLS_HANDSHAKE_TYPE_PSEUDO_HRR* = -1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:295:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_PSEUDO_HRR" &
        " already exists, not redeclaring")
when not declared(PTLS_CERTIFICATE_TYPE_X509):
  when 0 is static:
    const
      PTLS_CERTIFICATE_TYPE_X509* = 0 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:297:9
  else:
    let PTLS_CERTIFICATE_TYPE_X509* = 0 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:297:9
else:
  static :
    hint("Declaration of " & "PTLS_CERTIFICATE_TYPE_X509" &
        " already exists, not redeclaring")
when not declared(PTLS_CERTIFICATE_TYPE_RAW_PUBLIC_KEY):
  when 2 is static:
    const
      PTLS_CERTIFICATE_TYPE_RAW_PUBLIC_KEY* = 2 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:298:9
  else:
    let PTLS_CERTIFICATE_TYPE_RAW_PUBLIC_KEY* = 2 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:298:9
else:
  static :
    hint("Declaration of " & "PTLS_CERTIFICATE_TYPE_RAW_PUBLIC_KEY" &
        " already exists, not redeclaring")
when not declared(PTLS_DEFAULT_MAX_TICKETS_TO_SERVE):
  when 4 is static:
    const
      PTLS_DEFAULT_MAX_TICKETS_TO_SERVE* = 4 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:321:9
  else:
    let PTLS_DEFAULT_MAX_TICKETS_TO_SERVE* = 4 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:321:9
else:
  static :
    hint("Declaration of " & "PTLS_DEFAULT_MAX_TICKETS_TO_SERVE" &
        " already exists, not redeclaring")
when not declared(PTLS_ENCODE_QUICINT_CAPACITY):
  when 8 is static:
    const
      PTLS_ENCODE_QUICINT_CAPACITY* = 8 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:1219:9
  else:
    let PTLS_ENCODE_QUICINT_CAPACITY* = 8 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:1219:9
else:
  static :
    hint("Declaration of " & "PTLS_ENCODE_QUICINT_CAPACITY" &
        " already exists, not redeclaring")
when not declared(PTLS_QUICINT_MAX):
  when 4611686018427387903 is static:
    const
      PTLS_QUICINT_MAX* = 4611686018427387903'i64 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:1221:9
  else:
    let PTLS_QUICINT_MAX* = 4611686018427387903'i64 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:1221:9
else:
  static :
    hint("Declaration of " & "PTLS_QUICINT_MAX" &
        " already exists, not redeclaring")
when not declared(PTLS_QUICINT_LONGEST_STR):
  when "4611686018427387903" is static:
    const
      PTLS_QUICINT_LONGEST_STR* = "4611686018427387903" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:1222:9
  else:
    let PTLS_QUICINT_LONGEST_STR* = "4611686018427387903" ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls.h:1222:9
else:
  static :
    hint("Declaration of " & "PTLS_QUICINT_LONGEST_STR" &
        " already exists, not redeclaring")
when not declared(PTLS_OPENSSL_HAVE_CHACHA20_POLY1305):
  when 1 is static:
    const
      PTLS_OPENSSL_HAVE_CHACHA20_POLY1305* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:37:9
  else:
    let PTLS_OPENSSL_HAVE_CHACHA20_POLY1305* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:37:9
else:
  static :
    hint("Declaration of " & "PTLS_OPENSSL_HAVE_CHACHA20_POLY1305" &
        " already exists, not redeclaring")
when not declared(PTLS_OPENSSL_HAVE_ASYNC):
  when 1 is static:
    const
      PTLS_OPENSSL_HAVE_ASYNC* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:44:9
  else:
    let PTLS_OPENSSL_HAVE_ASYNC* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:44:9
else:
  static :
    hint("Declaration of " & "PTLS_OPENSSL_HAVE_ASYNC" &
        " already exists, not redeclaring")
when not declared(PTLS_OPENSSL_HAVE_SECP384R1):
  when 1 is static:
    const
      PTLS_OPENSSL_HAVE_SECP384R1* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:51:9
  else:
    let PTLS_OPENSSL_HAVE_SECP384R1* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:51:9
else:
  static :
    hint("Declaration of " & "PTLS_OPENSSL_HAVE_SECP384R1" &
        " already exists, not redeclaring")
when not declared(PTLS_OPENSSL_HAS_SECP384R1):
  when 1 is static:
    const
      PTLS_OPENSSL_HAS_SECP384R1* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:52:9
  else:
    let PTLS_OPENSSL_HAS_SECP384R1* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:52:9
else:
  static :
    hint("Declaration of " & "PTLS_OPENSSL_HAS_SECP384R1" &
        " already exists, not redeclaring")
when not declared(PTLS_OPENSSL_HAVE_SECP521R1):
  when 1 is static:
    const
      PTLS_OPENSSL_HAVE_SECP521R1* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:56:9
  else:
    let PTLS_OPENSSL_HAVE_SECP521R1* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:56:9
else:
  static :
    hint("Declaration of " & "PTLS_OPENSSL_HAVE_SECP521R1" &
        " already exists, not redeclaring")
when not declared(PTLS_OPENSSL_HAS_SECP521R1):
  when 1 is static:
    const
      PTLS_OPENSSL_HAS_SECP521R1* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:57:9
  else:
    let PTLS_OPENSSL_HAS_SECP521R1* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:57:9
else:
  static :
    hint("Declaration of " & "PTLS_OPENSSL_HAS_SECP521R1" &
        " already exists, not redeclaring")
when not declared(PTLS_OPENSSL_HAVE_ED25519):
  when 1 is static:
    const
      PTLS_OPENSSL_HAVE_ED25519* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:61:9
  else:
    let PTLS_OPENSSL_HAVE_ED25519* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:61:9
else:
  static :
    hint("Declaration of " & "PTLS_OPENSSL_HAVE_ED25519" &
        " already exists, not redeclaring")
when not declared(PTLS_OPENSSL_HAVE_X25519):
  when 1 is static:
    const
      PTLS_OPENSSL_HAVE_X25519* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:64:9
  else:
    let PTLS_OPENSSL_HAVE_X25519* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:64:9
else:
  static :
    hint("Declaration of " & "PTLS_OPENSSL_HAVE_X25519" &
        " already exists, not redeclaring")
when not declared(PTLS_OPENSSL_HAS_X25519):
  when 1 is static:
    const
      PTLS_OPENSSL_HAS_X25519* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:65:9
  else:
    let PTLS_OPENSSL_HAS_X25519* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:65:9
else:
  static :
    hint("Declaration of " & "PTLS_OPENSSL_HAS_X25519" &
        " already exists, not redeclaring")
when not declared(PTLS_OPENSSL_HAVE_X25519MLKEM768):
  when 0 is static:
    const
      PTLS_OPENSSL_HAVE_X25519MLKEM768* = 0 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:75:9
  else:
    let PTLS_OPENSSL_HAVE_X25519MLKEM768* = 0 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:75:9
else:
  static :
    hint("Declaration of " & "PTLS_OPENSSL_HAVE_X25519MLKEM768" &
        " already exists, not redeclaring")
when not declared(PTLS_OPENSSL_HAVE_BF):
  when 1 is static:
    const
      PTLS_OPENSSL_HAVE_BF* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:80:9
  else:
    let PTLS_OPENSSL_HAVE_BF* = 1 ## Generated based on /nim-ngtcp2/libs/picotls/include/picotls/openssl.h:80:9
else:
  static :
    hint("Declaration of " & "PTLS_OPENSSL_HAVE_BF" &
        " already exists, not redeclaring")
when not declared(ngtcp2_cid_init):
  proc ngtcp2_cid_init*(cid: ptr ngtcp2_cid_553648620; data: ptr uint8;
                        datalen: csize_t): void {.cdecl,
      importc: "ngtcp2_cid_init".}
else:
  static :
    hint("Declaration of " & "ngtcp2_cid_init" &
        " already exists, not redeclaring")
when not declared(ngtcp2_cid_eq):
  proc ngtcp2_cid_eq*(a: ptr ngtcp2_cid_553648620; b: ptr ngtcp2_cid_553648620): cint {.
      cdecl, importc: "ngtcp2_cid_eq".}
else:
  static :
    hint("Declaration of " & "ngtcp2_cid_eq" &
        " already exists, not redeclaring")
when not declared(ngtcp2_transport_params_encode_versioned):
  proc ngtcp2_transport_params_encode_versioned*(dest: ptr uint8;
      destlen: csize_t; transport_params_version: cint;
      params: ptr ngtcp2_transport_params_553648664): ngtcp2_ssize_553648586 {.
      cdecl, importc: "ngtcp2_transport_params_encode_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_transport_params_encode_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_transport_params_decode_versioned):
  proc ngtcp2_transport_params_decode_versioned*(transport_params_version: cint;
      params: ptr ngtcp2_transport_params_553648664; data: ptr uint8;
      datalen: csize_t): cint {.cdecl, importc: "ngtcp2_transport_params_decode_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_transport_params_decode_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_transport_params_decode_new):
  proc ngtcp2_transport_params_decode_new*(
      pparams: ptr ptr ngtcp2_transport_params_553648664; data: ptr uint8;
      datalen: csize_t; mem: ptr ngtcp2_mem_553648600): cint {.cdecl,
      importc: "ngtcp2_transport_params_decode_new".}
else:
  static :
    hint("Declaration of " & "ngtcp2_transport_params_decode_new" &
        " already exists, not redeclaring")
when not declared(ngtcp2_transport_params_del):
  proc ngtcp2_transport_params_del*(params: ptr ngtcp2_transport_params_553648664;
                                    mem: ptr ngtcp2_mem_553648600): void {.
      cdecl, importc: "ngtcp2_transport_params_del".}
else:
  static :
    hint("Declaration of " & "ngtcp2_transport_params_del" &
        " already exists, not redeclaring")
when not declared(ngtcp2_pkt_decode_version_cid):
  proc ngtcp2_pkt_decode_version_cid*(dest: ptr ngtcp2_version_cid_553648735;
                                      data: ptr uint8; datalen: csize_t;
                                      short_dcidlen: csize_t): cint {.cdecl,
      importc: "ngtcp2_pkt_decode_version_cid".}
else:
  static :
    hint("Declaration of " & "ngtcp2_pkt_decode_version_cid" &
        " already exists, not redeclaring")
when not declared(ngtcp2_pkt_decode_hd_long):
  proc ngtcp2_pkt_decode_hd_long*(dest: ptr ngtcp2_pkt_hd_553648628;
                                  pkt: ptr uint8; pktlen: csize_t): ngtcp2_ssize_553648586 {.
      cdecl, importc: "ngtcp2_pkt_decode_hd_long".}
else:
  static :
    hint("Declaration of " & "ngtcp2_pkt_decode_hd_long" &
        " already exists, not redeclaring")
when not declared(ngtcp2_pkt_decode_hd_short):
  proc ngtcp2_pkt_decode_hd_short*(dest: ptr ngtcp2_pkt_hd_553648628;
                                   pkt: ptr uint8; pktlen: csize_t;
                                   dcidlen: csize_t): ngtcp2_ssize_553648586 {.
      cdecl, importc: "ngtcp2_pkt_decode_hd_short".}
else:
  static :
    hint("Declaration of " & "ngtcp2_pkt_decode_hd_short" &
        " already exists, not redeclaring")
when not declared(ngtcp2_pkt_write_stateless_reset):
  proc ngtcp2_pkt_write_stateless_reset*(dest: ptr uint8; destlen: csize_t;
      stateless_reset_token: ptr uint8; rand: ptr uint8; randlen: csize_t): ngtcp2_ssize_553648586 {.
      cdecl, importc: "ngtcp2_pkt_write_stateless_reset".}
else:
  static :
    hint("Declaration of " & "ngtcp2_pkt_write_stateless_reset" &
        " already exists, not redeclaring")
when not declared(ngtcp2_pkt_write_version_negotiation):
  proc ngtcp2_pkt_write_version_negotiation*(dest: ptr uint8; destlen: csize_t;
      unused_random: uint8; dcid: ptr uint8; dcidlen: csize_t; scid: ptr uint8;
      scidlen: csize_t; sv: ptr uint32; nsv: csize_t): ngtcp2_ssize_553648586 {.
      cdecl, importc: "ngtcp2_pkt_write_version_negotiation".}
else:
  static :
    hint("Declaration of " & "ngtcp2_pkt_write_version_negotiation" &
        " already exists, not redeclaring")
when not declared(ngtcp2_pkt_write_connection_close):
  proc ngtcp2_pkt_write_connection_close*(dest: ptr uint8; destlen: csize_t;
      version: uint32; dcid: ptr ngtcp2_cid_553648620; scid: ptr ngtcp2_cid_553648620;
      error_code: uint64; reason: ptr uint8; reasonlen: csize_t;
      encrypt: ngtcp2_encrypt_553648757; aead: ptr ngtcp2_crypto_aead_553648715;
      aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723; iv: ptr uint8;
      hp_mask: ngtcp2_hp_mask_553648761; hp: ptr ngtcp2_crypto_cipher_553648719;
      hp_ctx: ptr ngtcp2_crypto_cipher_ctx_553648727): ngtcp2_ssize_553648586 {.
      cdecl, importc: "ngtcp2_pkt_write_connection_close".}
else:
  static :
    hint("Declaration of " & "ngtcp2_pkt_write_connection_close" &
        " already exists, not redeclaring")
when not declared(ngtcp2_pkt_write_retry):
  proc ngtcp2_pkt_write_retry*(dest: ptr uint8; destlen: csize_t;
                               version: uint32; dcid: ptr ngtcp2_cid_553648620;
                               scid: ptr ngtcp2_cid_553648620;
                               odcid: ptr ngtcp2_cid_553648620;
                               token: ptr uint8; tokenlen: csize_t;
                               encrypt: ngtcp2_encrypt_553648757;
                               aead: ptr ngtcp2_crypto_aead_553648715;
                               aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723): ngtcp2_ssize_553648586 {.
      cdecl, importc: "ngtcp2_pkt_write_retry".}
else:
  static :
    hint("Declaration of " & "ngtcp2_pkt_write_retry" &
        " already exists, not redeclaring")
when not declared(ngtcp2_accept):
  proc ngtcp2_accept*(dest: ptr ngtcp2_pkt_hd_553648628; pkt: ptr uint8;
                      pktlen: csize_t): cint {.cdecl, importc: "ngtcp2_accept".}
else:
  static :
    hint("Declaration of " & "ngtcp2_accept" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_client_new_versioned):
  proc ngtcp2_conn_client_new_versioned*(pconn: ptr ptr ngtcp2_conn_553648737;
      dcid: ptr ngtcp2_cid_553648620; scid: ptr ngtcp2_cid_553648620;
      path: ptr ngtcp2_path_553648703; client_chosen_version: uint32;
      callbacks_version: cint; callbacks: ptr ngtcp2_callbacks_553648821;
      settings_version: cint; settings: ptr ngtcp2_settings_553648695;
      transport_params_version: cint; params: ptr ngtcp2_transport_params_553648664;
      mem: ptr ngtcp2_mem_553648600; user_data: pointer): cint {.cdecl,
      importc: "ngtcp2_conn_client_new_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_client_new_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_server_new_versioned):
  proc ngtcp2_conn_server_new_versioned*(pconn: ptr ptr ngtcp2_conn_553648737;
      dcid: ptr ngtcp2_cid_553648620; scid: ptr ngtcp2_cid_553648620;
      path: ptr ngtcp2_path_553648703; client_chosen_version: uint32;
      callbacks_version: cint; callbacks: ptr ngtcp2_callbacks_553648821;
      settings_version: cint; settings: ptr ngtcp2_settings_553648695;
      transport_params_version: cint; params: ptr ngtcp2_transport_params_553648664;
      mem: ptr ngtcp2_mem_553648600; user_data: pointer): cint {.cdecl,
      importc: "ngtcp2_conn_server_new_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_server_new_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_del):
  proc ngtcp2_conn_del*(conn: ptr ngtcp2_conn_553648737): void {.cdecl,
      importc: "ngtcp2_conn_del".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_del" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_read_pkt_versioned):
  proc ngtcp2_conn_read_pkt_versioned*(conn: ptr ngtcp2_conn_553648737;
                                       path: ptr ngtcp2_path_553648703;
                                       pkt_info_version: cint;
                                       pi: ptr ngtcp2_pkt_info_553648604;
                                       pkt: ptr uint8; pktlen: csize_t;
                                       ts: ngtcp2_tstamp_553648614): cint {.
      cdecl, importc: "ngtcp2_conn_read_pkt_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_read_pkt_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_write_pkt_versioned):
  proc ngtcp2_conn_write_pkt_versioned*(conn: ptr ngtcp2_conn_553648737;
                                        path: ptr ngtcp2_path_553648703;
                                        pkt_info_version: cint;
                                        pi: ptr ngtcp2_pkt_info_553648604;
                                        dest: ptr uint8; destlen: csize_t;
                                        ts: ngtcp2_tstamp_553648614): ngtcp2_ssize_553648586 {.
      cdecl, importc: "ngtcp2_conn_write_pkt_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_write_pkt_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_tls_handshake_completed):
  proc ngtcp2_conn_tls_handshake_completed*(conn: ptr ngtcp2_conn_553648737): void {.
      cdecl, importc: "ngtcp2_conn_tls_handshake_completed".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_tls_handshake_completed" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_handshake_completed):
  proc ngtcp2_conn_get_handshake_completed*(conn: ptr ngtcp2_conn_553648737): cint {.
      cdecl, importc: "ngtcp2_conn_get_handshake_completed".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_handshake_completed" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_install_initial_key):
  proc ngtcp2_conn_install_initial_key*(conn: ptr ngtcp2_conn_553648737;
      rx_aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723; rx_iv: ptr uint8;
      rx_hp_ctx: ptr ngtcp2_crypto_cipher_ctx_553648727; tx_aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723;
                                        tx_iv: ptr uint8; tx_hp_ctx: ptr ngtcp2_crypto_cipher_ctx_553648727;
                                        ivlen: csize_t): cint {.cdecl,
      importc: "ngtcp2_conn_install_initial_key".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_install_initial_key" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_install_vneg_initial_key):
  proc ngtcp2_conn_install_vneg_initial_key*(conn: ptr ngtcp2_conn_553648737;
      version: uint32; rx_aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723;
      rx_iv: ptr uint8; rx_hp_ctx: ptr ngtcp2_crypto_cipher_ctx_553648727;
      tx_aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723; tx_iv: ptr uint8;
      tx_hp_ctx: ptr ngtcp2_crypto_cipher_ctx_553648727; ivlen: csize_t): cint {.
      cdecl, importc: "ngtcp2_conn_install_vneg_initial_key".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_install_vneg_initial_key" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_install_rx_handshake_key):
  proc ngtcp2_conn_install_rx_handshake_key*(conn: ptr ngtcp2_conn_553648737;
      aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723; iv: ptr uint8;
      ivlen: csize_t; hp_ctx: ptr ngtcp2_crypto_cipher_ctx_553648727): cint {.
      cdecl, importc: "ngtcp2_conn_install_rx_handshake_key".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_install_rx_handshake_key" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_install_tx_handshake_key):
  proc ngtcp2_conn_install_tx_handshake_key*(conn: ptr ngtcp2_conn_553648737;
      aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723; iv: ptr uint8;
      ivlen: csize_t; hp_ctx: ptr ngtcp2_crypto_cipher_ctx_553648727): cint {.
      cdecl, importc: "ngtcp2_conn_install_tx_handshake_key".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_install_tx_handshake_key" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_install_0rtt_key):
  proc ngtcp2_conn_install_0rtt_key*(conn: ptr ngtcp2_conn_553648737;
                                     aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723;
                                     iv: ptr uint8; ivlen: csize_t;
                                     hp_ctx: ptr ngtcp2_crypto_cipher_ctx_553648727): cint {.
      cdecl, importc: "ngtcp2_conn_install_0rtt_key".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_install_0rtt_key" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_install_rx_key):
  proc ngtcp2_conn_install_rx_key*(conn: ptr ngtcp2_conn_553648737;
                                   secret: ptr uint8; secretlen: csize_t;
                                   aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723;
                                   iv: ptr uint8; ivlen: csize_t;
                                   hp_ctx: ptr ngtcp2_crypto_cipher_ctx_553648727): cint {.
      cdecl, importc: "ngtcp2_conn_install_rx_key".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_install_rx_key" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_install_tx_key):
  proc ngtcp2_conn_install_tx_key*(conn: ptr ngtcp2_conn_553648737;
                                   secret: ptr uint8; secretlen: csize_t;
                                   aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723;
                                   iv: ptr uint8; ivlen: csize_t;
                                   hp_ctx: ptr ngtcp2_crypto_cipher_ctx_553648727): cint {.
      cdecl, importc: "ngtcp2_conn_install_tx_key".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_install_tx_key" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_initiate_key_update):
  proc ngtcp2_conn_initiate_key_update*(conn: ptr ngtcp2_conn_553648737;
                                        ts: ngtcp2_tstamp_553648614): cint {.
      cdecl, importc: "ngtcp2_conn_initiate_key_update".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_initiate_key_update" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_tls_error):
  proc ngtcp2_conn_set_tls_error*(conn: ptr ngtcp2_conn_553648737; liberr: cint): void {.
      cdecl, importc: "ngtcp2_conn_set_tls_error".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_tls_error" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_tls_error):
  proc ngtcp2_conn_get_tls_error*(conn: ptr ngtcp2_conn_553648737): cint {.
      cdecl, importc: "ngtcp2_conn_get_tls_error".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_tls_error" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_tls_alert):
  proc ngtcp2_conn_set_tls_alert*(conn: ptr ngtcp2_conn_553648737; alert: uint8): void {.
      cdecl, importc: "ngtcp2_conn_set_tls_alert".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_tls_alert" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_tls_alert):
  proc ngtcp2_conn_get_tls_alert*(conn: ptr ngtcp2_conn_553648737): uint8 {.
      cdecl, importc: "ngtcp2_conn_get_tls_alert".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_tls_alert" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_keep_alive_timeout):
  proc ngtcp2_conn_set_keep_alive_timeout*(conn: ptr ngtcp2_conn_553648737;
      timeout: ngtcp2_duration_553648616): void {.cdecl,
      importc: "ngtcp2_conn_set_keep_alive_timeout".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_keep_alive_timeout" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_expiry):
  proc ngtcp2_conn_get_expiry*(conn: ptr ngtcp2_conn_553648737): ngtcp2_tstamp_553648614 {.
      cdecl, importc: "ngtcp2_conn_get_expiry".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_expiry" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_handle_expiry):
  proc ngtcp2_conn_handle_expiry*(conn: ptr ngtcp2_conn_553648737;
                                  ts: ngtcp2_tstamp_553648614): cint {.cdecl,
      importc: "ngtcp2_conn_handle_expiry".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_handle_expiry" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_pto):
  proc ngtcp2_conn_get_pto*(conn: ptr ngtcp2_conn_553648737): ngtcp2_duration_553648616 {.
      cdecl, importc: "ngtcp2_conn_get_pto".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_pto" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_decode_and_set_remote_transport_params):
  proc ngtcp2_conn_decode_and_set_remote_transport_params*(
      conn: ptr ngtcp2_conn_553648737; data: ptr uint8; datalen: csize_t): cint {.
      cdecl, importc: "ngtcp2_conn_decode_and_set_remote_transport_params".}
else:
  static :
    hint("Declaration of " &
        "ngtcp2_conn_decode_and_set_remote_transport_params" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_remote_transport_params):
  proc ngtcp2_conn_get_remote_transport_params*(conn: ptr ngtcp2_conn_553648737): ptr ngtcp2_transport_params_553648664 {.
      cdecl, importc: "ngtcp2_conn_get_remote_transport_params".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_remote_transport_params" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_encode_0rtt_transport_params):
  proc ngtcp2_conn_encode_0rtt_transport_params*(conn: ptr ngtcp2_conn_553648737;
      dest: ptr uint8; destlen: csize_t): ngtcp2_ssize_553648586 {.cdecl,
      importc: "ngtcp2_conn_encode_0rtt_transport_params".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_encode_0rtt_transport_params" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_decode_and_set_0rtt_transport_params):
  proc ngtcp2_conn_decode_and_set_0rtt_transport_params*(conn: ptr ngtcp2_conn_553648737;
      data: ptr uint8; datalen: csize_t): cint {.cdecl,
      importc: "ngtcp2_conn_decode_and_set_0rtt_transport_params".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_decode_and_set_0rtt_transport_params" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_local_transport_params_versioned):
  proc ngtcp2_conn_set_local_transport_params_versioned*(conn: ptr ngtcp2_conn_553648737;
      transport_params_version: cint; params: ptr ngtcp2_transport_params_553648664): cint {.
      cdecl, importc: "ngtcp2_conn_set_local_transport_params_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_local_transport_params_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_local_transport_params):
  proc ngtcp2_conn_get_local_transport_params*(conn: ptr ngtcp2_conn_553648737): ptr ngtcp2_transport_params_553648664 {.
      cdecl, importc: "ngtcp2_conn_get_local_transport_params".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_local_transport_params" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_encode_local_transport_params):
  proc ngtcp2_conn_encode_local_transport_params*(conn: ptr ngtcp2_conn_553648737;
      dest: ptr uint8; destlen: csize_t): ngtcp2_ssize_553648586 {.cdecl,
      importc: "ngtcp2_conn_encode_local_transport_params".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_encode_local_transport_params" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_open_bidi_stream):
  proc ngtcp2_conn_open_bidi_stream*(conn: ptr ngtcp2_conn_553648737;
                                     pstream_id: ptr int64;
                                     stream_user_data: pointer): cint {.cdecl,
      importc: "ngtcp2_conn_open_bidi_stream".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_open_bidi_stream" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_open_uni_stream):
  proc ngtcp2_conn_open_uni_stream*(conn: ptr ngtcp2_conn_553648737;
                                    pstream_id: ptr int64;
                                    stream_user_data: pointer): cint {.cdecl,
      importc: "ngtcp2_conn_open_uni_stream".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_open_uni_stream" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_shutdown_stream):
  proc ngtcp2_conn_shutdown_stream*(conn: ptr ngtcp2_conn_553648737;
                                    flags: uint32; stream_id: int64;
                                    app_error_code: uint64): cint {.cdecl,
      importc: "ngtcp2_conn_shutdown_stream".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_shutdown_stream" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_shutdown_stream_write):
  proc ngtcp2_conn_shutdown_stream_write*(conn: ptr ngtcp2_conn_553648737;
      flags: uint32; stream_id: int64; app_error_code: uint64): cint {.cdecl,
      importc: "ngtcp2_conn_shutdown_stream_write".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_shutdown_stream_write" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_shutdown_stream_read):
  proc ngtcp2_conn_shutdown_stream_read*(conn: ptr ngtcp2_conn_553648737;
      flags: uint32; stream_id: int64; app_error_code: uint64): cint {.cdecl,
      importc: "ngtcp2_conn_shutdown_stream_read".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_shutdown_stream_read" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_write_stream_versioned):
  proc ngtcp2_conn_write_stream_versioned*(conn: ptr ngtcp2_conn_553648737;
      path: ptr ngtcp2_path_553648703; pkt_info_version: cint;
      pi: ptr ngtcp2_pkt_info_553648604; dest: ptr uint8; destlen: csize_t;
      pdatalen: ptr ngtcp2_ssize_553648586; flags: uint32; stream_id: int64;
      data: ptr uint8; datalen: csize_t; ts: ngtcp2_tstamp_553648614): ngtcp2_ssize_553648586 {.
      cdecl, importc: "ngtcp2_conn_write_stream_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_write_stream_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_writev_stream_versioned):
  proc ngtcp2_conn_writev_stream_versioned*(conn: ptr ngtcp2_conn_553648737;
      path: ptr ngtcp2_path_553648703; pkt_info_version: cint;
      pi: ptr ngtcp2_pkt_info_553648604; dest: ptr uint8; destlen: csize_t;
      pdatalen: ptr ngtcp2_ssize_553648586; flags: uint32; stream_id: int64;
      datav: ptr ngtcp2_vec_553648624; datavcnt: csize_t; ts: ngtcp2_tstamp_553648614): ngtcp2_ssize_553648586 {.
      cdecl, importc: "ngtcp2_conn_writev_stream_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_writev_stream_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_write_datagram_versioned):
  proc ngtcp2_conn_write_datagram_versioned*(conn: ptr ngtcp2_conn_553648737;
      path: ptr ngtcp2_path_553648703; pkt_info_version: cint;
      pi: ptr ngtcp2_pkt_info_553648604; dest: ptr uint8; destlen: csize_t;
      paccepted: ptr cint; flags: uint32; dgram_id: uint64; data: ptr uint8;
      datalen: csize_t; ts: ngtcp2_tstamp_553648614): ngtcp2_ssize_553648586 {.
      cdecl, importc: "ngtcp2_conn_write_datagram_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_write_datagram_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_writev_datagram_versioned):
  proc ngtcp2_conn_writev_datagram_versioned*(conn: ptr ngtcp2_conn_553648737;
      path: ptr ngtcp2_path_553648703; pkt_info_version: cint;
      pi: ptr ngtcp2_pkt_info_553648604; dest: ptr uint8; destlen: csize_t;
      paccepted: ptr cint; flags: uint32; dgram_id: uint64;
      datav: ptr ngtcp2_vec_553648624; datavcnt: csize_t; ts: ngtcp2_tstamp_553648614): ngtcp2_ssize_553648586 {.
      cdecl, importc: "ngtcp2_conn_writev_datagram_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_writev_datagram_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_in_closing_period):
  proc ngtcp2_conn_in_closing_period*(conn: ptr ngtcp2_conn_553648737): cint {.
      cdecl, importc: "ngtcp2_conn_in_closing_period".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_in_closing_period" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_in_draining_period):
  proc ngtcp2_conn_in_draining_period*(conn: ptr ngtcp2_conn_553648737): cint {.
      cdecl, importc: "ngtcp2_conn_in_draining_period".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_in_draining_period" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_extend_max_stream_offset):
  proc ngtcp2_conn_extend_max_stream_offset*(conn: ptr ngtcp2_conn_553648737;
      stream_id: int64; datalen: uint64): cint {.cdecl,
      importc: "ngtcp2_conn_extend_max_stream_offset".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_extend_max_stream_offset" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_extend_max_offset):
  proc ngtcp2_conn_extend_max_offset*(conn: ptr ngtcp2_conn_553648737;
                                      datalen: uint64): void {.cdecl,
      importc: "ngtcp2_conn_extend_max_offset".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_extend_max_offset" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_extend_max_streams_bidi):
  proc ngtcp2_conn_extend_max_streams_bidi*(conn: ptr ngtcp2_conn_553648737;
      n: csize_t): void {.cdecl, importc: "ngtcp2_conn_extend_max_streams_bidi".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_extend_max_streams_bidi" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_extend_max_streams_uni):
  proc ngtcp2_conn_extend_max_streams_uni*(conn: ptr ngtcp2_conn_553648737;
      n: csize_t): void {.cdecl, importc: "ngtcp2_conn_extend_max_streams_uni".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_extend_max_streams_uni" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_dcid):
  proc ngtcp2_conn_get_dcid*(conn: ptr ngtcp2_conn_553648737): ptr ngtcp2_cid_553648620 {.
      cdecl, importc: "ngtcp2_conn_get_dcid".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_dcid" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_client_initial_dcid):
  proc ngtcp2_conn_get_client_initial_dcid*(conn: ptr ngtcp2_conn_553648737): ptr ngtcp2_cid_553648620 {.
      cdecl, importc: "ngtcp2_conn_get_client_initial_dcid".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_client_initial_dcid" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_scid):
  proc ngtcp2_conn_get_scid*(conn: ptr ngtcp2_conn_553648737;
                             dest: ptr ngtcp2_cid_553648620): csize_t {.cdecl,
      importc: "ngtcp2_conn_get_scid".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_scid" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_active_dcid):
  proc ngtcp2_conn_get_active_dcid*(conn: ptr ngtcp2_conn_553648737;
                                    dest: ptr ngtcp2_cid_token_553648825): csize_t {.
      cdecl, importc: "ngtcp2_conn_get_active_dcid".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_active_dcid" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_client_chosen_version):
  proc ngtcp2_conn_get_client_chosen_version*(conn: ptr ngtcp2_conn_553648737): uint32 {.
      cdecl, importc: "ngtcp2_conn_get_client_chosen_version".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_client_chosen_version" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_negotiated_version):
  proc ngtcp2_conn_get_negotiated_version*(conn: ptr ngtcp2_conn_553648737): uint32 {.
      cdecl, importc: "ngtcp2_conn_get_negotiated_version".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_negotiated_version" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_tls_early_data_rejected):
  proc ngtcp2_conn_tls_early_data_rejected*(conn: ptr ngtcp2_conn_553648737): cint {.
      cdecl, importc: "ngtcp2_conn_tls_early_data_rejected".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_tls_early_data_rejected" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_tls_early_data_rejected):
  proc ngtcp2_conn_get_tls_early_data_rejected*(conn: ptr ngtcp2_conn_553648737): cint {.
      cdecl, importc: "ngtcp2_conn_get_tls_early_data_rejected".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_tls_early_data_rejected" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_conn_info_versioned):
  proc ngtcp2_conn_get_conn_info_versioned*(conn: ptr ngtcp2_conn_553648737;
      conn_info_version: cint; cinfo: ptr ngtcp2_conn_info_553648668): void {.
      cdecl, importc: "ngtcp2_conn_get_conn_info_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_conn_info_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_submit_crypto_data):
  proc ngtcp2_conn_submit_crypto_data*(conn: ptr ngtcp2_conn_553648737;
      encryption_level: ngtcp2_encryption_level_553648745; data: ptr uint8;
                                       datalen: csize_t): cint {.cdecl,
      importc: "ngtcp2_conn_submit_crypto_data".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_submit_crypto_data" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_submit_new_token):
  proc ngtcp2_conn_submit_new_token*(conn: ptr ngtcp2_conn_553648737;
                                     token: ptr uint8; tokenlen: csize_t): cint {.
      cdecl, importc: "ngtcp2_conn_submit_new_token".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_submit_new_token" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_local_addr):
  proc ngtcp2_conn_set_local_addr*(conn: ptr ngtcp2_conn_553648737;
                                   addr_arg: ptr ngtcp2_addr_553648699): void {.
      cdecl, importc: "ngtcp2_conn_set_local_addr".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_local_addr" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_path_user_data):
  proc ngtcp2_conn_set_path_user_data*(conn: ptr ngtcp2_conn_553648737;
                                       path_user_data: pointer): void {.cdecl,
      importc: "ngtcp2_conn_set_path_user_data".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_path_user_data" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_path):
  proc ngtcp2_conn_get_path*(conn: ptr ngtcp2_conn_553648737): ptr ngtcp2_path_553648703 {.
      cdecl, importc: "ngtcp2_conn_get_path".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_path" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_max_tx_udp_payload_size):
  proc ngtcp2_conn_get_max_tx_udp_payload_size*(conn: ptr ngtcp2_conn_553648737): csize_t {.
      cdecl, importc: "ngtcp2_conn_get_max_tx_udp_payload_size".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_max_tx_udp_payload_size" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_path_max_tx_udp_payload_size):
  proc ngtcp2_conn_get_path_max_tx_udp_payload_size*(conn: ptr ngtcp2_conn_553648737): csize_t {.
      cdecl, importc: "ngtcp2_conn_get_path_max_tx_udp_payload_size".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_path_max_tx_udp_payload_size" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_initiate_immediate_migration):
  proc ngtcp2_conn_initiate_immediate_migration*(conn: ptr ngtcp2_conn_553648737;
      path: ptr ngtcp2_path_553648703; ts: ngtcp2_tstamp_553648614): cint {.
      cdecl, importc: "ngtcp2_conn_initiate_immediate_migration".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_initiate_immediate_migration" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_initiate_migration):
  proc ngtcp2_conn_initiate_migration*(conn: ptr ngtcp2_conn_553648737;
                                       path: ptr ngtcp2_path_553648703;
                                       ts: ngtcp2_tstamp_553648614): cint {.
      cdecl, importc: "ngtcp2_conn_initiate_migration".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_initiate_migration" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_max_data_left):
  proc ngtcp2_conn_get_max_data_left*(conn: ptr ngtcp2_conn_553648737): uint64 {.
      cdecl, importc: "ngtcp2_conn_get_max_data_left".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_max_data_left" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_max_stream_data_left):
  proc ngtcp2_conn_get_max_stream_data_left*(conn: ptr ngtcp2_conn_553648737;
      stream_id: int64): uint64 {.cdecl, importc: "ngtcp2_conn_get_max_stream_data_left".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_max_stream_data_left" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_streams_bidi_left):
  proc ngtcp2_conn_get_streams_bidi_left*(conn: ptr ngtcp2_conn_553648737): uint64 {.
      cdecl, importc: "ngtcp2_conn_get_streams_bidi_left".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_streams_bidi_left" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_streams_uni_left):
  proc ngtcp2_conn_get_streams_uni_left*(conn: ptr ngtcp2_conn_553648737): uint64 {.
      cdecl, importc: "ngtcp2_conn_get_streams_uni_left".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_streams_uni_left" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_cwnd_left):
  proc ngtcp2_conn_get_cwnd_left*(conn: ptr ngtcp2_conn_553648737): uint64 {.
      cdecl, importc: "ngtcp2_conn_get_cwnd_left".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_cwnd_left" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_initial_crypto_ctx):
  proc ngtcp2_conn_set_initial_crypto_ctx*(conn: ptr ngtcp2_conn_553648737;
      ctx: ptr ngtcp2_crypto_ctx_553648731): void {.cdecl,
      importc: "ngtcp2_conn_set_initial_crypto_ctx".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_initial_crypto_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_initial_crypto_ctx):
  proc ngtcp2_conn_get_initial_crypto_ctx*(conn: ptr ngtcp2_conn_553648737): ptr ngtcp2_crypto_ctx_553648731 {.
      cdecl, importc: "ngtcp2_conn_get_initial_crypto_ctx".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_initial_crypto_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_crypto_ctx):
  proc ngtcp2_conn_set_crypto_ctx*(conn: ptr ngtcp2_conn_553648737;
                                   ctx: ptr ngtcp2_crypto_ctx_553648731): void {.
      cdecl, importc: "ngtcp2_conn_set_crypto_ctx".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_crypto_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_crypto_ctx):
  proc ngtcp2_conn_get_crypto_ctx*(conn: ptr ngtcp2_conn_553648737): ptr ngtcp2_crypto_ctx_553648731 {.
      cdecl, importc: "ngtcp2_conn_get_crypto_ctx".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_crypto_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_0rtt_crypto_ctx):
  proc ngtcp2_conn_set_0rtt_crypto_ctx*(conn: ptr ngtcp2_conn_553648737;
                                        ctx: ptr ngtcp2_crypto_ctx_553648731): void {.
      cdecl, importc: "ngtcp2_conn_set_0rtt_crypto_ctx".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_0rtt_crypto_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_0rtt_crypto_ctx):
  proc ngtcp2_conn_get_0rtt_crypto_ctx*(conn: ptr ngtcp2_conn_553648737): ptr ngtcp2_crypto_ctx_553648731 {.
      cdecl, importc: "ngtcp2_conn_get_0rtt_crypto_ctx".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_0rtt_crypto_ctx" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_tls_native_handle):
  proc ngtcp2_conn_get_tls_native_handle*(conn: ptr ngtcp2_conn_553648737): pointer {.
      cdecl, importc: "ngtcp2_conn_get_tls_native_handle".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_tls_native_handle" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_tls_native_handle):
  proc ngtcp2_conn_set_tls_native_handle*(conn: ptr ngtcp2_conn_553648737;
      tls_native_handle: pointer): void {.cdecl,
      importc: "ngtcp2_conn_set_tls_native_handle".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_tls_native_handle" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_retry_aead):
  proc ngtcp2_conn_set_retry_aead*(conn: ptr ngtcp2_conn_553648737;
                                   aead: ptr ngtcp2_crypto_aead_553648715;
                                   aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723): void {.
      cdecl, importc: "ngtcp2_conn_set_retry_aead".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_retry_aead" &
        " already exists, not redeclaring")
when not declared(ngtcp2_ccerr_default):
  proc ngtcp2_ccerr_default*(ccerr: ptr ngtcp2_ccerr_553648833): void {.cdecl,
      importc: "ngtcp2_ccerr_default".}
else:
  static :
    hint("Declaration of " & "ngtcp2_ccerr_default" &
        " already exists, not redeclaring")
when not declared(ngtcp2_ccerr_set_transport_error):
  proc ngtcp2_ccerr_set_transport_error*(ccerr: ptr ngtcp2_ccerr_553648833;
      error_code: uint64; reason: ptr uint8; reasonlen: csize_t): void {.cdecl,
      importc: "ngtcp2_ccerr_set_transport_error".}
else:
  static :
    hint("Declaration of " & "ngtcp2_ccerr_set_transport_error" &
        " already exists, not redeclaring")
when not declared(ngtcp2_ccerr_set_liberr):
  proc ngtcp2_ccerr_set_liberr*(ccerr: ptr ngtcp2_ccerr_553648833; liberr: cint;
                                reason: ptr uint8; reasonlen: csize_t): void {.
      cdecl, importc: "ngtcp2_ccerr_set_liberr".}
else:
  static :
    hint("Declaration of " & "ngtcp2_ccerr_set_liberr" &
        " already exists, not redeclaring")
when not declared(ngtcp2_ccerr_set_tls_alert):
  proc ngtcp2_ccerr_set_tls_alert*(ccerr: ptr ngtcp2_ccerr_553648833;
                                   tls_alert: uint8; reason: ptr uint8;
                                   reasonlen: csize_t): void {.cdecl,
      importc: "ngtcp2_ccerr_set_tls_alert".}
else:
  static :
    hint("Declaration of " & "ngtcp2_ccerr_set_tls_alert" &
        " already exists, not redeclaring")
when not declared(ngtcp2_ccerr_set_application_error):
  proc ngtcp2_ccerr_set_application_error*(ccerr: ptr ngtcp2_ccerr_553648833;
      error_code: uint64; reason: ptr uint8; reasonlen: csize_t): void {.cdecl,
      importc: "ngtcp2_ccerr_set_application_error".}
else:
  static :
    hint("Declaration of " & "ngtcp2_ccerr_set_application_error" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_write_connection_close_versioned):
  proc ngtcp2_conn_write_connection_close_versioned*(conn: ptr ngtcp2_conn_553648737;
      path: ptr ngtcp2_path_553648703; pkt_info_version: cint;
      pi: ptr ngtcp2_pkt_info_553648604; dest: ptr uint8; destlen: csize_t;
      ccerr: ptr ngtcp2_ccerr_553648833; ts: ngtcp2_tstamp_553648614): ngtcp2_ssize_553648586 {.
      cdecl, importc: "ngtcp2_conn_write_connection_close_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_write_connection_close_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_ccerr):
  proc ngtcp2_conn_get_ccerr*(conn: ptr ngtcp2_conn_553648737): ptr ngtcp2_ccerr_553648833 {.
      cdecl, importc: "ngtcp2_conn_get_ccerr".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_ccerr" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_is_local_stream):
  proc ngtcp2_conn_is_local_stream*(conn: ptr ngtcp2_conn_553648737;
                                    stream_id: int64): cint {.cdecl,
      importc: "ngtcp2_conn_is_local_stream".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_is_local_stream" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_is_server):
  proc ngtcp2_conn_is_server*(conn: ptr ngtcp2_conn_553648737): cint {.cdecl,
      importc: "ngtcp2_conn_is_server".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_is_server" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_after_retry):
  proc ngtcp2_conn_after_retry*(conn: ptr ngtcp2_conn_553648737): cint {.cdecl,
      importc: "ngtcp2_conn_after_retry".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_after_retry" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_set_stream_user_data):
  proc ngtcp2_conn_set_stream_user_data*(conn: ptr ngtcp2_conn_553648737;
      stream_id: int64; stream_user_data: pointer): cint {.cdecl,
      importc: "ngtcp2_conn_set_stream_user_data".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_set_stream_user_data" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_update_pkt_tx_time):
  proc ngtcp2_conn_update_pkt_tx_time*(conn: ptr ngtcp2_conn_553648737;
                                       ts: ngtcp2_tstamp_553648614): void {.
      cdecl, importc: "ngtcp2_conn_update_pkt_tx_time".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_update_pkt_tx_time" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_send_quantum):
  proc ngtcp2_conn_get_send_quantum*(conn: ptr ngtcp2_conn_553648737): csize_t {.
      cdecl, importc: "ngtcp2_conn_get_send_quantum".}
else:
  static :
    hint("Declaration of " & "ngtcp2_conn_get_send_quantum" &
        " already exists, not redeclaring")
when not declared(ngtcp2_conn_get_stream_loss_count):
  proc ngtcp2_conn_get_stream_loss_count*(conn: ptr ngtcp2_conn_553648737;
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
  proc ngtcp2_addr_init*(dest: ptr ngtcp2_addr_553648699;
                         addr_arg: ptr ngtcp2_sockaddr_553648634;
                         addrlen: ngtcp2_socklen_553648646): ptr ngtcp2_addr_553648699 {.
      cdecl, importc: "ngtcp2_addr_init".}
else:
  static :
    hint("Declaration of " & "ngtcp2_addr_init" &
        " already exists, not redeclaring")
when not declared(ngtcp2_addr_copy_byte):
  proc ngtcp2_addr_copy_byte*(dest: ptr ngtcp2_addr_553648699;
                              addr_arg: ptr ngtcp2_sockaddr_553648634;
                              addrlen: ngtcp2_socklen_553648646): void {.cdecl,
      importc: "ngtcp2_addr_copy_byte".}
else:
  static :
    hint("Declaration of " & "ngtcp2_addr_copy_byte" &
        " already exists, not redeclaring")
when not declared(ngtcp2_path_storage_init):
  proc ngtcp2_path_storage_init*(ps: ptr ngtcp2_path_storage_553648707;
                                 local_addr: ptr ngtcp2_sockaddr_553648634;
                                 local_addrlen: ngtcp2_socklen_553648646;
                                 remote_addr: ptr ngtcp2_sockaddr_553648634;
                                 remote_addrlen: ngtcp2_socklen_553648646;
                                 user_data: pointer): void {.cdecl,
      importc: "ngtcp2_path_storage_init".}
else:
  static :
    hint("Declaration of " & "ngtcp2_path_storage_init" &
        " already exists, not redeclaring")
when not declared(ngtcp2_path_storage_zero):
  proc ngtcp2_path_storage_zero*(ps: ptr ngtcp2_path_storage_553648707): void {.
      cdecl, importc: "ngtcp2_path_storage_zero".}
else:
  static :
    hint("Declaration of " & "ngtcp2_path_storage_zero" &
        " already exists, not redeclaring")
when not declared(ngtcp2_settings_default_versioned):
  proc ngtcp2_settings_default_versioned*(settings_version: cint;
      settings: ptr ngtcp2_settings_553648695): void {.cdecl,
      importc: "ngtcp2_settings_default_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_settings_default_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_transport_params_default_versioned):
  proc ngtcp2_transport_params_default_versioned*(
      transport_params_version: cint; params: ptr ngtcp2_transport_params_553648664): void {.
      cdecl, importc: "ngtcp2_transport_params_default_versioned".}
else:
  static :
    hint("Declaration of " & "ngtcp2_transport_params_default_versioned" &
        " already exists, not redeclaring")
when not declared(ngtcp2_mem_default):
  proc ngtcp2_mem_default*(): ptr ngtcp2_mem_553648600 {.cdecl,
      importc: "ngtcp2_mem_default".}
else:
  static :
    hint("Declaration of " & "ngtcp2_mem_default" &
        " already exists, not redeclaring")
when not declared(ngtcp2_version):
  proc ngtcp2_version*(least_version: cint): ptr ngtcp2_info_553648837 {.cdecl,
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
  proc ngtcp2_path_copy*(dest: ptr ngtcp2_path_553648703; src: ptr ngtcp2_path_553648703): void {.
      cdecl, importc: "ngtcp2_path_copy".}
else:
  static :
    hint("Declaration of " & "ngtcp2_path_copy" &
        " already exists, not redeclaring")
when not declared(ngtcp2_path_eq):
  proc ngtcp2_path_eq*(a: ptr ngtcp2_path_553648703; b: ptr ngtcp2_path_553648703): cint {.
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
when not declared(ngtcp2_crypto_ctx_tls):
  proc ngtcp2_crypto_ctx_tls*(ctx: ptr ngtcp2_crypto_ctx_553648731;
                              tls_native_handle: pointer): ptr ngtcp2_crypto_ctx_553648731 {.
      cdecl, importc: "ngtcp2_crypto_ctx_tls".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_ctx_tls" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_ctx_tls_early):
  proc ngtcp2_crypto_ctx_tls_early*(ctx: ptr ngtcp2_crypto_ctx_553648731;
                                    tls_native_handle: pointer): ptr ngtcp2_crypto_ctx_553648731 {.
      cdecl, importc: "ngtcp2_crypto_ctx_tls_early".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_ctx_tls_early" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_md_init):
  proc ngtcp2_crypto_md_init*(md: ptr ngtcp2_crypto_md_553648711;
                              md_native_handle: pointer): ptr ngtcp2_crypto_md_553648711 {.
      cdecl, importc: "ngtcp2_crypto_md_init".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_md_init" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_md_hashlen):
  proc ngtcp2_crypto_md_hashlen*(md: ptr ngtcp2_crypto_md_553648711): csize_t {.
      cdecl, importc: "ngtcp2_crypto_md_hashlen".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_md_hashlen" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_aead_keylen):
  proc ngtcp2_crypto_aead_keylen*(aead: ptr ngtcp2_crypto_aead_553648715): csize_t {.
      cdecl, importc: "ngtcp2_crypto_aead_keylen".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_aead_keylen" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_aead_noncelen):
  proc ngtcp2_crypto_aead_noncelen*(aead: ptr ngtcp2_crypto_aead_553648715): csize_t {.
      cdecl, importc: "ngtcp2_crypto_aead_noncelen".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_aead_noncelen" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_hkdf_extract):
  proc ngtcp2_crypto_hkdf_extract*(dest: ptr uint8; md: ptr ngtcp2_crypto_md_553648711;
                                   secret: ptr uint8; secretlen: csize_t;
                                   salt: ptr uint8; saltlen: csize_t): cint {.
      cdecl, importc: "ngtcp2_crypto_hkdf_extract".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_hkdf_extract" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_hkdf_expand):
  proc ngtcp2_crypto_hkdf_expand*(dest: ptr uint8; destlen: csize_t;
                                  md: ptr ngtcp2_crypto_md_553648711;
                                  secret: ptr uint8; secretlen: csize_t;
                                  info: ptr uint8; infolen: csize_t): cint {.
      cdecl, importc: "ngtcp2_crypto_hkdf_expand".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_hkdf_expand" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_hkdf):
  proc ngtcp2_crypto_hkdf*(dest: ptr uint8; destlen: csize_t;
                           md: ptr ngtcp2_crypto_md_553648711;
                           secret: ptr uint8; secretlen: csize_t;
                           salt: ptr uint8; saltlen: csize_t; info: ptr uint8;
                           infolen: csize_t): cint {.cdecl,
      importc: "ngtcp2_crypto_hkdf".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_hkdf" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_packet_protection_ivlen):
  proc ngtcp2_crypto_packet_protection_ivlen*(aead: ptr ngtcp2_crypto_aead_553648715): csize_t {.
      cdecl, importc: "ngtcp2_crypto_packet_protection_ivlen".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_packet_protection_ivlen" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_encrypt):
  proc ngtcp2_crypto_encrypt*(dest: ptr uint8; aead: ptr ngtcp2_crypto_aead_553648715;
                              aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723;
                              plaintext: ptr uint8; plaintextlen: csize_t;
                              nonce: ptr uint8; noncelen: csize_t;
                              aad: ptr uint8; aadlen: csize_t): cint {.cdecl,
      importc: "ngtcp2_crypto_encrypt".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_encrypt" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_encrypt_cb):
  proc ngtcp2_crypto_encrypt_cb*(dest: ptr uint8; aead: ptr ngtcp2_crypto_aead_553648715;
                                 aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723;
                                 plaintext: ptr uint8; plaintextlen: csize_t;
                                 nonce: ptr uint8; noncelen: csize_t;
                                 aad: ptr uint8; aadlen: csize_t): cint {.cdecl,
      importc: "ngtcp2_crypto_encrypt_cb".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_encrypt_cb" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_decrypt):
  proc ngtcp2_crypto_decrypt*(dest: ptr uint8; aead: ptr ngtcp2_crypto_aead_553648715;
                              aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723;
                              ciphertext: ptr uint8; ciphertextlen: csize_t;
                              nonce: ptr uint8; noncelen: csize_t;
                              aad: ptr uint8; aadlen: csize_t): cint {.cdecl,
      importc: "ngtcp2_crypto_decrypt".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_decrypt" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_decrypt_cb):
  proc ngtcp2_crypto_decrypt_cb*(dest: ptr uint8; aead: ptr ngtcp2_crypto_aead_553648715;
                                 aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723;
                                 ciphertext: ptr uint8; ciphertextlen: csize_t;
                                 nonce: ptr uint8; noncelen: csize_t;
                                 aad: ptr uint8; aadlen: csize_t): cint {.cdecl,
      importc: "ngtcp2_crypto_decrypt_cb".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_decrypt_cb" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_hp_mask):
  proc ngtcp2_crypto_hp_mask*(dest: ptr uint8; hp: ptr ngtcp2_crypto_cipher_553648719;
                              hp_ctx: ptr ngtcp2_crypto_cipher_ctx_553648727;
                              sample: ptr uint8): cint {.cdecl,
      importc: "ngtcp2_crypto_hp_mask".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_hp_mask" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_hp_mask_cb):
  proc ngtcp2_crypto_hp_mask_cb*(dest: ptr uint8; hp: ptr ngtcp2_crypto_cipher_553648719;
                                 hp_ctx: ptr ngtcp2_crypto_cipher_ctx_553648727;
                                 sample: ptr uint8): cint {.cdecl,
      importc: "ngtcp2_crypto_hp_mask_cb".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_hp_mask_cb" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_derive_and_install_rx_key):
  proc ngtcp2_crypto_derive_and_install_rx_key*(conn: ptr ngtcp2_conn_553648737;
      key: ptr uint8; iv: ptr uint8; hp: ptr uint8;
      level: ngtcp2_encryption_level_553648745; secret: ptr uint8;
      secretlen: csize_t): cint {.cdecl, importc: "ngtcp2_crypto_derive_and_install_rx_key".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_derive_and_install_rx_key" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_derive_and_install_tx_key):
  proc ngtcp2_crypto_derive_and_install_tx_key*(conn: ptr ngtcp2_conn_553648737;
      key: ptr uint8; iv: ptr uint8; hp: ptr uint8;
      level: ngtcp2_encryption_level_553648745; secret: ptr uint8;
      secretlen: csize_t): cint {.cdecl, importc: "ngtcp2_crypto_derive_and_install_tx_key".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_derive_and_install_tx_key" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_update_key):
  proc ngtcp2_crypto_update_key*(conn: ptr ngtcp2_conn_553648737;
                                 rx_secret: ptr uint8; tx_secret: ptr uint8;
                                 rx_aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723;
                                 rx_key: ptr uint8; rx_iv: ptr uint8;
                                 tx_aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723;
                                 tx_key: ptr uint8; tx_iv: ptr uint8;
                                 current_rx_secret: ptr uint8;
                                 current_tx_secret: ptr uint8;
                                 secretlen: csize_t): cint {.cdecl,
      importc: "ngtcp2_crypto_update_key".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_update_key" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_update_key_cb):
  proc ngtcp2_crypto_update_key_cb*(conn: ptr ngtcp2_conn_553648737;
                                    rx_secret: ptr uint8; tx_secret: ptr uint8;
                                    rx_aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723;
                                    rx_iv: ptr uint8;
                                    tx_aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723;
                                    tx_iv: ptr uint8;
                                    current_rx_secret: ptr uint8;
                                    current_tx_secret: ptr uint8;
                                    secretlen: csize_t; user_data: pointer): cint {.
      cdecl, importc: "ngtcp2_crypto_update_key_cb".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_update_key_cb" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_client_initial_cb):
  proc ngtcp2_crypto_client_initial_cb*(conn: ptr ngtcp2_conn_553648737;
                                        user_data: pointer): cint {.cdecl,
      importc: "ngtcp2_crypto_client_initial_cb".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_client_initial_cb" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_recv_retry_cb):
  proc ngtcp2_crypto_recv_retry_cb*(conn: ptr ngtcp2_conn_553648737;
                                    hd: ptr ngtcp2_pkt_hd_553648628;
                                    user_data: pointer): cint {.cdecl,
      importc: "ngtcp2_crypto_recv_retry_cb".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_recv_retry_cb" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_recv_client_initial_cb):
  proc ngtcp2_crypto_recv_client_initial_cb*(conn: ptr ngtcp2_conn_553648737;
      dcid: ptr ngtcp2_cid_553648620; user_data: pointer): cint {.cdecl,
      importc: "ngtcp2_crypto_recv_client_initial_cb".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_recv_client_initial_cb" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_read_write_crypto_data):
  proc ngtcp2_crypto_read_write_crypto_data*(conn: ptr ngtcp2_conn_553648737;
      encryption_level: ngtcp2_encryption_level_553648745; data: ptr uint8;
      datalen: csize_t): cint {.cdecl,
                                importc: "ngtcp2_crypto_read_write_crypto_data".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_read_write_crypto_data" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_recv_crypto_data_cb):
  proc ngtcp2_crypto_recv_crypto_data_cb*(conn: ptr ngtcp2_conn_553648737;
      encryption_level: ngtcp2_encryption_level_553648745; offset: uint64;
      data: ptr uint8; datalen: csize_t; user_data: pointer): cint {.cdecl,
      importc: "ngtcp2_crypto_recv_crypto_data_cb".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_recv_crypto_data_cb" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_generate_stateless_reset_token):
  proc ngtcp2_crypto_generate_stateless_reset_token*(token: ptr uint8;
      secret: ptr uint8; secretlen: csize_t; cid: ptr ngtcp2_cid_553648620): cint {.
      cdecl, importc: "ngtcp2_crypto_generate_stateless_reset_token".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_generate_stateless_reset_token" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_generate_retry_token):
  proc ngtcp2_crypto_generate_retry_token*(token: ptr uint8; secret: ptr uint8;
      secretlen: csize_t; version: uint32; remote_addr: ptr ngtcp2_sockaddr_553648634;
      remote_addrlen: ngtcp2_socklen_553648646; retry_scid: ptr ngtcp2_cid_553648620;
      odcid: ptr ngtcp2_cid_553648620; ts: ngtcp2_tstamp_553648614): ngtcp2_ssize_553648586 {.
      cdecl, importc: "ngtcp2_crypto_generate_retry_token".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_generate_retry_token" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_verify_retry_token):
  proc ngtcp2_crypto_verify_retry_token*(odcid: ptr ngtcp2_cid_553648620;
      token: ptr uint8; tokenlen: csize_t; secret: ptr uint8;
      secretlen: csize_t; version: uint32; remote_addr: ptr ngtcp2_sockaddr_553648634;
      remote_addrlen: ngtcp2_socklen_553648646; dcid: ptr ngtcp2_cid_553648620;
      timeout: ngtcp2_duration_553648616; ts: ngtcp2_tstamp_553648614): cint {.
      cdecl, importc: "ngtcp2_crypto_verify_retry_token".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_verify_retry_token" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_generate_retry_token2):
  proc ngtcp2_crypto_generate_retry_token2*(token: ptr uint8; secret: ptr uint8;
      secretlen: csize_t; version: uint32; remote_addr: ptr ngtcp2_sockaddr_553648634;
      remote_addrlen: ngtcp2_socklen_553648646; retry_scid: ptr ngtcp2_cid_553648620;
      odcid: ptr ngtcp2_cid_553648620; ts: ngtcp2_tstamp_553648614): ngtcp2_ssize_553648586 {.
      cdecl, importc: "ngtcp2_crypto_generate_retry_token2".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_generate_retry_token2" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_verify_retry_token2):
  proc ngtcp2_crypto_verify_retry_token2*(odcid: ptr ngtcp2_cid_553648620;
      token: ptr uint8; tokenlen: csize_t; secret: ptr uint8;
      secretlen: csize_t; version: uint32; remote_addr: ptr ngtcp2_sockaddr_553648634;
      remote_addrlen: ngtcp2_socklen_553648646; dcid: ptr ngtcp2_cid_553648620;
      timeout: ngtcp2_duration_553648616; ts: ngtcp2_tstamp_553648614): cint {.
      cdecl, importc: "ngtcp2_crypto_verify_retry_token2".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_verify_retry_token2" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_generate_regular_token):
  proc ngtcp2_crypto_generate_regular_token*(token: ptr uint8;
      secret: ptr uint8; secretlen: csize_t; remote_addr: ptr ngtcp2_sockaddr_553648634;
      remote_addrlen: ngtcp2_socklen_553648646; ts: ngtcp2_tstamp_553648614): ngtcp2_ssize_553648586 {.
      cdecl, importc: "ngtcp2_crypto_generate_regular_token".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_generate_regular_token" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_verify_regular_token):
  proc ngtcp2_crypto_verify_regular_token*(token: ptr uint8; tokenlen: csize_t;
      secret: ptr uint8; secretlen: csize_t; remote_addr: ptr ngtcp2_sockaddr_553648634;
      remote_addrlen: ngtcp2_socklen_553648646; timeout: ngtcp2_duration_553648616;
      ts: ngtcp2_tstamp_553648614): cint {.cdecl,
      importc: "ngtcp2_crypto_verify_regular_token".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_verify_regular_token" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_write_connection_close):
  proc ngtcp2_crypto_write_connection_close*(dest: ptr uint8; destlen: csize_t;
      version: uint32; dcid: ptr ngtcp2_cid_553648620; scid: ptr ngtcp2_cid_553648620;
      error_code: uint64; reason: ptr uint8; reasonlen: csize_t): ngtcp2_ssize_553648586 {.
      cdecl, importc: "ngtcp2_crypto_write_connection_close".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_write_connection_close" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_write_retry):
  proc ngtcp2_crypto_write_retry*(dest: ptr uint8; destlen: csize_t;
                                  version: uint32; dcid: ptr ngtcp2_cid_553648620;
                                  scid: ptr ngtcp2_cid_553648620;
                                  odcid: ptr ngtcp2_cid_553648620;
                                  token: ptr uint8; tokenlen: csize_t): ngtcp2_ssize_553648586 {.
      cdecl, importc: "ngtcp2_crypto_write_retry".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_write_retry" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_aead_ctx_encrypt_init):
  proc ngtcp2_crypto_aead_ctx_encrypt_init*(
      aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723;
      aead: ptr ngtcp2_crypto_aead_553648715; key: ptr uint8; noncelen: csize_t): cint {.
      cdecl, importc: "ngtcp2_crypto_aead_ctx_encrypt_init".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_aead_ctx_encrypt_init" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_aead_ctx_decrypt_init):
  proc ngtcp2_crypto_aead_ctx_decrypt_init*(
      aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723;
      aead: ptr ngtcp2_crypto_aead_553648715; key: ptr uint8; noncelen: csize_t): cint {.
      cdecl, importc: "ngtcp2_crypto_aead_ctx_decrypt_init".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_aead_ctx_decrypt_init" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_aead_ctx_free):
  proc ngtcp2_crypto_aead_ctx_free*(aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723): void {.
      cdecl, importc: "ngtcp2_crypto_aead_ctx_free".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_aead_ctx_free" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_delete_crypto_aead_ctx_cb):
  proc ngtcp2_crypto_delete_crypto_aead_ctx_cb*(conn: ptr ngtcp2_conn_553648737;
      aead_ctx: ptr ngtcp2_crypto_aead_ctx_553648723; user_data: pointer): void {.
      cdecl, importc: "ngtcp2_crypto_delete_crypto_aead_ctx_cb".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_delete_crypto_aead_ctx_cb" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_delete_crypto_cipher_ctx_cb):
  proc ngtcp2_crypto_delete_crypto_cipher_ctx_cb*(conn: ptr ngtcp2_conn_553648737;
      cipher_ctx: ptr ngtcp2_crypto_cipher_ctx_553648727; user_data: pointer): void {.
      cdecl, importc: "ngtcp2_crypto_delete_crypto_cipher_ctx_cb".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_delete_crypto_cipher_ctx_cb" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_get_path_challenge_data_cb):
  proc ngtcp2_crypto_get_path_challenge_data_cb*(conn: ptr ngtcp2_conn_553648737;
      data: ptr uint8; user_data: pointer): cint {.cdecl,
      importc: "ngtcp2_crypto_get_path_challenge_data_cb".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_get_path_challenge_data_cb" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_version_negotiation_cb):
  proc ngtcp2_crypto_version_negotiation_cb*(conn: ptr ngtcp2_conn_553648737;
      version: uint32; client_dcid: ptr ngtcp2_cid_553648620; user_data: pointer): cint {.
      cdecl, importc: "ngtcp2_crypto_version_negotiation_cb".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_version_negotiation_cb" &
        " already exists, not redeclaring")
when not declared(ptls_buffer_release_memory):
  proc ptls_buffer_release_memory*(buf: ptr ptls_buffer_t_553648859): void {.
      cdecl, importc: "ptls_buffer__release_memory".}
else:
  static :
    hint("Declaration of " & "ptls_buffer_release_memory" &
        " already exists, not redeclaring")
when not declared(ptls_buffer_reserve):
  proc ptls_buffer_reserve*(buf: ptr ptls_buffer_t_553648859; delta: csize_t): cint {.
      cdecl, importc: "ptls_buffer_reserve".}
else:
  static :
    hint("Declaration of " & "ptls_buffer_reserve" &
        " already exists, not redeclaring")
when not declared(ptls_buffer_reserve_aligned):
  proc ptls_buffer_reserve_aligned*(buf: ptr ptls_buffer_t_553648859;
                                    delta: csize_t; align_bits: uint8): cint {.
      cdecl, importc: "ptls_buffer_reserve_aligned".}
else:
  static :
    hint("Declaration of " & "ptls_buffer_reserve_aligned" &
        " already exists, not redeclaring")
when not declared(ptls_buffer_do_pushv):
  proc ptls_buffer_do_pushv*(buf: ptr ptls_buffer_t_553648859; src: pointer;
                             len: csize_t): cint {.cdecl,
      importc: "ptls_buffer__do_pushv".}
else:
  static :
    hint("Declaration of " & "ptls_buffer_do_pushv" &
        " already exists, not redeclaring")
when not declared(ptls_buffer_adjust_quic_blocksize):
  proc ptls_buffer_adjust_quic_blocksize*(buf: ptr ptls_buffer_t_553648859;
      body_size: csize_t): cint {.cdecl,
                                  importc: "ptls_buffer__adjust_quic_blocksize".}
else:
  static :
    hint("Declaration of " & "ptls_buffer_adjust_quic_blocksize" &
        " already exists, not redeclaring")
when not declared(ptls_buffer_adjust_asn1_blocksize):
  proc ptls_buffer_adjust_asn1_blocksize*(buf: ptr ptls_buffer_t_553648859;
      body_size: csize_t): cint {.cdecl,
                                  importc: "ptls_buffer__adjust_asn1_blocksize".}
else:
  static :
    hint("Declaration of " & "ptls_buffer_adjust_asn1_blocksize" &
        " already exists, not redeclaring")
when not declared(ptls_buffer_push_asn1_ubigint):
  proc ptls_buffer_push_asn1_ubigint*(buf: ptr ptls_buffer_t_553648859;
                                      bignum: pointer; size: csize_t): cint {.
      cdecl, importc: "ptls_buffer_push_asn1_ubigint".}
else:
  static :
    hint("Declaration of " & "ptls_buffer_push_asn1_ubigint" &
        " already exists, not redeclaring")
when not declared(ptls_decode8):
  proc ptls_decode8*(value: ptr uint8; src: ptr ptr uint8; end_arg: ptr uint8): cint {.
      cdecl, importc: "ptls_decode8".}
else:
  static :
    hint("Declaration of " & "ptls_decode8" & " already exists, not redeclaring")
when not declared(ptls_decode16):
  proc ptls_decode16*(value: ptr uint16; src: ptr ptr uint8; end_arg: ptr uint8): cint {.
      cdecl, importc: "ptls_decode16".}
else:
  static :
    hint("Declaration of " & "ptls_decode16" &
        " already exists, not redeclaring")
when not declared(ptls_decode24):
  proc ptls_decode24*(value: ptr uint32; src: ptr ptr uint8; end_arg: ptr uint8): cint {.
      cdecl, importc: "ptls_decode24".}
else:
  static :
    hint("Declaration of " & "ptls_decode24" &
        " already exists, not redeclaring")
when not declared(ptls_decode32):
  proc ptls_decode32*(value: ptr uint32; src: ptr ptr uint8; end_arg: ptr uint8): cint {.
      cdecl, importc: "ptls_decode32".}
else:
  static :
    hint("Declaration of " & "ptls_decode32" &
        " already exists, not redeclaring")
when not declared(ptls_decode64):
  proc ptls_decode64*(value: ptr uint64; src: ptr ptr uint8; end_arg: ptr uint8): cint {.
      cdecl, importc: "ptls_decode64".}
else:
  static :
    hint("Declaration of " & "ptls_decode64" &
        " already exists, not redeclaring")
when not declared(ptls_decode_quicint):
  proc ptls_decode_quicint*(src: ptr ptr uint8; end_arg: ptr uint8): uint64 {.
      cdecl, importc: "ptls_decode_quicint".}
else:
  static :
    hint("Declaration of " & "ptls_decode_quicint" &
        " already exists, not redeclaring")
when not declared(ptls_log_conn_state_override):
  var ptls_log_conn_state_override* {.importc: "ptls_log_conn_state_override".}: ptr ptls_log_conn_state_t_553649009
else:
  static :
    hint("Declaration of " & "ptls_log_conn_state_override" &
        " already exists, not redeclaring")
when not declared(ptls_log):
  var ptls_log* {.importc: "ptls_log".}: struct_st_ptls_log_t_553649011
else:
  static :
    hint("Declaration of " & "ptls_log" & " already exists, not redeclaring")
when not declared(ptls_log_init_conn_state):
  proc ptls_log_init_conn_state*(state: ptr ptls_log_conn_state_t_553649009;
      random_bytes: proc (a0: pointer; a1: csize_t): void {.cdecl.}): void {.
      cdecl, importc: "ptls_log_init_conn_state".}
else:
  static :
    hint("Declaration of " & "ptls_log_init_conn_state" &
        " already exists, not redeclaring")
when not declared(ptls_log_num_lost):
  proc ptls_log_num_lost*(): csize_t {.cdecl, importc: "ptls_log_num_lost".}
else:
  static :
    hint("Declaration of " & "ptls_log_num_lost" &
        " already exists, not redeclaring")
when not declared(ptls_log_add_fd):
  proc ptls_log_add_fd*(fd: cint; sample_ratio: cfloat; points: cstring;
                        snis: cstring; addresses: cstring; appdata: cint): cint {.
      cdecl, importc: "ptls_log_add_fd".}
else:
  static :
    hint("Declaration of " & "ptls_log_add_fd" &
        " already exists, not redeclaring")
when not declared(ptls_log_recalc_point):
  proc ptls_log_recalc_point*(caller_locked: cint;
                              point: ptr struct_st_ptls_log_point_t_553649003): void {.
      cdecl, importc: "ptls_log__recalc_point".}
else:
  static :
    hint("Declaration of " & "ptls_log_recalc_point" &
        " already exists, not redeclaring")
when not declared(ptls_log_recalc_conn):
  proc ptls_log_recalc_conn*(caller_locked: cint;
                             conn: ptr struct_st_ptls_log_conn_state_t_553649005;
                             get_sni: proc (a0: pointer): cstring {.cdecl.};
                             get_sni_arg: pointer): void {.cdecl,
      importc: "ptls_log__recalc_conn".}
else:
  static :
    hint("Declaration of " & "ptls_log_recalc_conn" &
        " already exists, not redeclaring")
when not declared(ptls_log_do_push_element_safestr):
  proc ptls_log_do_push_element_safestr*(prefix: cstring; prefix_len: csize_t;
      s: cstring; l: csize_t): void {.cdecl, importc: "ptls_log__do_push_element_safestr".}
else:
  static :
    hint("Declaration of " & "ptls_log_do_push_element_safestr" &
        " already exists, not redeclaring")
when not declared(ptls_log_do_push_element_unsafestr):
  proc ptls_log_do_push_element_unsafestr*(prefix: cstring; prefix_len: csize_t;
      s: cstring; l: csize_t): void {.cdecl, importc: "ptls_log__do_push_element_unsafestr".}
else:
  static :
    hint("Declaration of " & "ptls_log_do_push_element_unsafestr" &
        " already exists, not redeclaring")
when not declared(ptls_log_do_push_element_hexdump):
  proc ptls_log_do_push_element_hexdump*(prefix: cstring; prefix_len: csize_t;
      s: pointer; l: csize_t): void {.cdecl, importc: "ptls_log__do_push_element_hexdump".}
else:
  static :
    hint("Declaration of " & "ptls_log_do_push_element_hexdump" &
        " already exists, not redeclaring")
when not declared(ptls_log_do_push_element_signed32):
  proc ptls_log_do_push_element_signed32*(prefix: cstring; prefix_len: csize_t;
      v: int32): void {.cdecl, importc: "ptls_log__do_push_element_signed32".}
else:
  static :
    hint("Declaration of " & "ptls_log_do_push_element_signed32" &
        " already exists, not redeclaring")
when not declared(ptls_log_do_push_element_signed64):
  proc ptls_log_do_push_element_signed64*(prefix: cstring; prefix_len: csize_t;
      v: int64): void {.cdecl, importc: "ptls_log__do_push_element_signed64".}
else:
  static :
    hint("Declaration of " & "ptls_log_do_push_element_signed64" &
        " already exists, not redeclaring")
when not declared(ptls_log_do_push_element_unsigned32):
  proc ptls_log_do_push_element_unsigned32*(prefix: cstring;
      prefix_len: csize_t; v: uint32): void {.cdecl,
      importc: "ptls_log__do_push_element_unsigned32".}
else:
  static :
    hint("Declaration of " & "ptls_log_do_push_element_unsigned32" &
        " already exists, not redeclaring")
when not declared(ptls_log_do_push_element_unsigned64):
  proc ptls_log_do_push_element_unsigned64*(prefix: cstring;
      prefix_len: csize_t; v: uint64): void {.cdecl,
      importc: "ptls_log__do_push_element_unsigned64".}
else:
  static :
    hint("Declaration of " & "ptls_log_do_push_element_unsigned64" &
        " already exists, not redeclaring")
when not declared(ptls_log_do_push_element_bool):
  proc ptls_log_do_push_element_bool*(prefix: cstring; prefix_len: csize_t;
                                      v: cint): void {.cdecl,
      importc: "ptls_log__do_push_element_bool".}
else:
  static :
    hint("Declaration of " & "ptls_log_do_push_element_bool" &
        " already exists, not redeclaring")
when not declared(ptls_log_do_push_appdata_element_unsafestr):
  proc ptls_log_do_push_appdata_element_unsafestr*(includes_appdata: cint;
      prefix: cstring; prefix_len: csize_t; s: cstring; l: csize_t): void {.
      cdecl, importc: "ptls_log__do_push_appdata_element_unsafestr".}
else:
  static :
    hint("Declaration of " & "ptls_log_do_push_appdata_element_unsafestr" &
        " already exists, not redeclaring")
when not declared(ptls_log_do_push_appdata_element_hexdump):
  proc ptls_log_do_push_appdata_element_hexdump*(includes_appdata: cint;
      prefix: cstring; prefix_len: csize_t; s: pointer; l: csize_t): void {.
      cdecl, importc: "ptls_log__do_push_appdata_element_hexdump".}
else:
  static :
    hint("Declaration of " & "ptls_log_do_push_appdata_element_hexdump" &
        " already exists, not redeclaring")
when not declared(ptls_log_do_write_start):
  proc ptls_log_do_write_start*(point: ptr struct_st_ptls_log_point_t_553649003;
                                add_time: cint): void {.cdecl,
      importc: "ptls_log__do_write_start".}
else:
  static :
    hint("Declaration of " & "ptls_log_do_write_start" &
        " already exists, not redeclaring")
when not declared(ptls_log_do_write_end):
  proc ptls_log_do_write_end*(point: ptr struct_st_ptls_log_point_t_553649003;
                              conn: ptr struct_st_ptls_log_conn_state_t_553649005;
                              get_sni: proc (a0: pointer): cstring {.cdecl.};
                              get_sni_arg: pointer; includes_appdata: cint): cint {.
      cdecl, importc: "ptls_log__do_write_end".}
else:
  static :
    hint("Declaration of " & "ptls_log_do_write_end" &
        " already exists, not redeclaring")
when not declared(ptls_client_new):
  proc ptls_client_new*(ctx: ptr ptls_context_t_553648847): ptr ptls_t_553648845 {.
      cdecl, importc: "ptls_client_new".}
else:
  static :
    hint("Declaration of " & "ptls_client_new" &
        " already exists, not redeclaring")
when not declared(ptls_server_new):
  proc ptls_server_new*(ctx: ptr ptls_context_t_553648847): ptr ptls_t_553648845 {.
      cdecl, importc: "ptls_server_new".}
else:
  static :
    hint("Declaration of " & "ptls_server_new" &
        " already exists, not redeclaring")
when not declared(ptls_build_tls12_export_params):
  proc ptls_build_tls12_export_params*(ctx: ptr ptls_context_t_553648847;
                                       output: ptr ptls_buffer_t_553648859;
                                       is_server: cint; session_reused: cint;
                                       cipher: ptr ptls_cipher_suite_t_553648905;
                                       master_secret: pointer;
                                       hello_randoms: pointer;
                                       next_send_record_iv: uint64;
                                       server_name: cstring;
                                       negotiated_protocol: ptls_iovec_t_553648855): cint {.
      cdecl, importc: "ptls_build_tls12_export_params".}
else:
  static :
    hint("Declaration of " & "ptls_build_tls12_export_params" &
        " already exists, not redeclaring")
when not declared(ptls_export):
  proc ptls_export*(tls: ptr ptls_t_553648845; output: ptr ptls_buffer_t_553648859): cint {.
      cdecl, importc: "ptls_export".}
else:
  static :
    hint("Declaration of " & "ptls_export" & " already exists, not redeclaring")
when not declared(ptls_import):
  proc ptls_import*(ctx: ptr ptls_context_t_553648847; tls: ptr ptr ptls_t_553648845;
                    params: ptls_iovec_t_553648855): cint {.cdecl,
      importc: "ptls_import".}
else:
  static :
    hint("Declaration of " & "ptls_import" & " already exists, not redeclaring")
when not declared(ptls_free):
  proc ptls_free*(tls: ptr ptls_t_553648845): void {.cdecl, importc: "ptls_free".}
else:
  static :
    hint("Declaration of " & "ptls_free" & " already exists, not redeclaring")
when not declared(ptls_get_context):
  proc ptls_get_context*(tls: ptr ptls_t_553648845): ptr ptls_context_t_553648847 {.
      cdecl, importc: "ptls_get_context".}
else:
  static :
    hint("Declaration of " & "ptls_get_context" &
        " already exists, not redeclaring")
when not declared(ptls_set_context):
  proc ptls_set_context*(tls: ptr ptls_t_553648845; ctx: ptr ptls_context_t_553648847): void {.
      cdecl, importc: "ptls_set_context".}
else:
  static :
    hint("Declaration of " & "ptls_set_context" &
        " already exists, not redeclaring")
when not declared(ptls_get_async_job):
  proc ptls_get_async_job*(tls: ptr ptls_t_553648845): ptr ptls_async_job_t_553648945 {.
      cdecl, importc: "ptls_get_async_job".}
else:
  static :
    hint("Declaration of " & "ptls_get_async_job" &
        " already exists, not redeclaring")
when not declared(ptls_get_client_random):
  proc ptls_get_client_random*(tls: ptr ptls_t_553648845): ptls_iovec_t_553648855 {.
      cdecl, importc: "ptls_get_client_random".}
else:
  static :
    hint("Declaration of " & "ptls_get_client_random" &
        " already exists, not redeclaring")
when not declared(ptls_get_cipher):
  proc ptls_get_cipher*(tls: ptr ptls_t_553648845): ptr ptls_cipher_suite_t_553648905 {.
      cdecl, importc: "ptls_get_cipher".}
else:
  static :
    hint("Declaration of " & "ptls_get_cipher" &
        " already exists, not redeclaring")
when not declared(ptls_find_cipher_suite):
  proc ptls_find_cipher_suite*(cipher_suites: ptr ptr ptls_cipher_suite_t_553648905;
                               id: uint16): ptr ptls_cipher_suite_t_553648905 {.
      cdecl, importc: "ptls_find_cipher_suite".}
else:
  static :
    hint("Declaration of " & "ptls_find_cipher_suite" &
        " already exists, not redeclaring")
when not declared(ptls_get_protocol_version):
  proc ptls_get_protocol_version*(tls: ptr ptls_t_553648845): uint16 {.cdecl,
      importc: "ptls_get_protocol_version".}
else:
  static :
    hint("Declaration of " & "ptls_get_protocol_version" &
        " already exists, not redeclaring")
when not declared(ptls_get_traffic_keys):
  proc ptls_get_traffic_keys*(tls: ptr ptls_t_553648845; is_enc: cint;
                              key: ptr uint8; iv: ptr uint8; seq: ptr uint64): cint {.
      cdecl, importc: "ptls_get_traffic_keys".}
else:
  static :
    hint("Declaration of " & "ptls_get_traffic_keys" &
        " already exists, not redeclaring")
when not declared(ptls_get_server_name):
  proc ptls_get_server_name*(tls: ptr ptls_t_553648845): cstring {.cdecl,
      importc: "ptls_get_server_name".}
else:
  static :
    hint("Declaration of " & "ptls_get_server_name" &
        " already exists, not redeclaring")
when not declared(ptls_set_server_name):
  proc ptls_set_server_name*(tls: ptr ptls_t_553648845; server_name: cstring;
                             server_name_len: csize_t): cint {.cdecl,
      importc: "ptls_set_server_name".}
else:
  static :
    hint("Declaration of " & "ptls_set_server_name" &
        " already exists, not redeclaring")
when not declared(ptls_get_negotiated_protocol):
  proc ptls_get_negotiated_protocol*(tls: ptr ptls_t_553648845): cstring {.
      cdecl, importc: "ptls_get_negotiated_protocol".}
else:
  static :
    hint("Declaration of " & "ptls_get_negotiated_protocol" &
        " already exists, not redeclaring")
when not declared(ptls_set_negotiated_protocol):
  proc ptls_set_negotiated_protocol*(tls: ptr ptls_t_553648845;
                                     protocol: cstring; protocol_len: csize_t): cint {.
      cdecl, importc: "ptls_set_negotiated_protocol".}
else:
  static :
    hint("Declaration of " & "ptls_set_negotiated_protocol" &
        " already exists, not redeclaring")
when not declared(ptls_handshake_is_complete):
  proc ptls_handshake_is_complete*(tls: ptr ptls_t_553648845): cint {.cdecl,
      importc: "ptls_handshake_is_complete".}
else:
  static :
    hint("Declaration of " & "ptls_handshake_is_complete" &
        " already exists, not redeclaring")
when not declared(ptls_is_psk_handshake):
  proc ptls_is_psk_handshake*(tls: ptr ptls_t_553648845): cint {.cdecl,
      importc: "ptls_is_psk_handshake".}
else:
  static :
    hint("Declaration of " & "ptls_is_psk_handshake" &
        " already exists, not redeclaring")
when not declared(ptls_is_ech_handshake):
  proc ptls_is_ech_handshake*(tls: ptr ptls_t_553648845; config_id: ptr uint8;
                              kem: ptr ptr ptls_hpke_kem_t_553648913;
                              cipher: ptr ptr ptls_hpke_cipher_suite_t_553648921): cint {.
      cdecl, importc: "ptls_is_ech_handshake".}
else:
  static :
    hint("Declaration of " & "ptls_is_ech_handshake" &
        " already exists, not redeclaring")
when not declared(ptls_get_data_ptr):
  proc ptls_get_data_ptr*(tls: ptr ptls_t_553648845): ptr pointer {.cdecl,
      importc: "ptls_get_data_ptr".}
else:
  static :
    hint("Declaration of " & "ptls_get_data_ptr" &
        " already exists, not redeclaring")
when not declared(ptls_get_log_state):
  proc ptls_get_log_state*(tls: ptr ptls_t_553648845): ptr ptls_log_conn_state_t_553649009 {.
      cdecl, importc: "ptls_get_log_state".}
else:
  static :
    hint("Declaration of " & "ptls_get_log_state" &
        " already exists, not redeclaring")
when not declared(ptls_handshake):
  proc ptls_handshake*(tls: ptr ptls_t_553648845; sendbuf: ptr ptls_buffer_t_553648859;
                       input: pointer; inlen: ptr csize_t;
                       args: ptr ptls_handshake_properties_t_553648999): cint {.
      cdecl, importc: "ptls_handshake".}
else:
  static :
    hint("Declaration of " & "ptls_handshake" &
        " already exists, not redeclaring")
when not declared(ptls_receive):
  proc ptls_receive*(tls: ptr ptls_t_553648845; plaintextbuf: ptr ptls_buffer_t_553648859;
                     input: pointer; len: ptr csize_t): cint {.cdecl,
      importc: "ptls_receive".}
else:
  static :
    hint("Declaration of " & "ptls_receive" & " already exists, not redeclaring")
when not declared(ptls_send):
  proc ptls_send*(tls: ptr ptls_t_553648845; sendbuf: ptr ptls_buffer_t_553648859;
                  input: pointer; inlen: csize_t): cint {.cdecl,
      importc: "ptls_send".}
else:
  static :
    hint("Declaration of " & "ptls_send" & " already exists, not redeclaring")
when not declared(ptls_update_key):
  proc ptls_update_key*(tls: ptr ptls_t_553648845; request_update: cint): cint {.
      cdecl, importc: "ptls_update_key".}
else:
  static :
    hint("Declaration of " & "ptls_update_key" &
        " already exists, not redeclaring")
when not declared(ptls_is_server):
  proc ptls_is_server*(tls: ptr ptls_t_553648845): cint {.cdecl,
      importc: "ptls_is_server".}
else:
  static :
    hint("Declaration of " & "ptls_is_server" &
        " already exists, not redeclaring")
when not declared(ptls_get_record_overhead):
  proc ptls_get_record_overhead*(tls: ptr ptls_t_553648845): csize_t {.cdecl,
      importc: "ptls_get_record_overhead".}
else:
  static :
    hint("Declaration of " & "ptls_get_record_overhead" &
        " already exists, not redeclaring")
when not declared(ptls_send_alert):
  proc ptls_send_alert*(tls: ptr ptls_t_553648845; sendbuf: ptr ptls_buffer_t_553648859;
                        level: uint8; description: uint8): cint {.cdecl,
      importc: "ptls_send_alert".}
else:
  static :
    hint("Declaration of " & "ptls_send_alert" &
        " already exists, not redeclaring")
when not declared(ptls_export_secret):
  proc ptls_export_secret*(tls: ptr ptls_t_553648845; output: pointer;
                           outlen: csize_t; label: cstring;
                           context_value: ptls_iovec_t_553648855; is_early: cint): cint {.
      cdecl, importc: "ptls_export_secret".}
else:
  static :
    hint("Declaration of " & "ptls_export_secret" &
        " already exists, not redeclaring")
when not declared(ptls_build_certificate_message):
  proc ptls_build_certificate_message*(buf: ptr ptls_buffer_t_553648859;
                                       request_context: ptls_iovec_t_553648855;
                                       certificates: ptr ptls_iovec_t_553648855;
                                       num_certificates: csize_t;
                                       ocsp_status: ptls_iovec_t_553648855): cint {.
      cdecl, importc: "ptls_build_certificate_message".}
else:
  static :
    hint("Declaration of " & "ptls_build_certificate_message" &
        " already exists, not redeclaring")
when not declared(ptls_calc_hash):
  proc ptls_calc_hash*(algo: ptr ptls_hash_algorithm_t_553648901;
                       output: pointer; src: pointer; len: csize_t): cint {.
      cdecl, importc: "ptls_calc_hash".}
else:
  static :
    hint("Declaration of " & "ptls_calc_hash" &
        " already exists, not redeclaring")
when not declared(ptls_hmac_create):
  proc ptls_hmac_create*(algo: ptr ptls_hash_algorithm_t_553648901;
                         key: pointer; key_size: csize_t): ptr ptls_hash_context_t_553648897 {.
      cdecl, importc: "ptls_hmac_create".}
else:
  static :
    hint("Declaration of " & "ptls_hmac_create" &
        " already exists, not redeclaring")
when not declared(ptls_hkdf_extract):
  proc ptls_hkdf_extract*(hash: ptr ptls_hash_algorithm_t_553648901;
                          output: pointer; salt: ptls_iovec_t_553648855;
                          ikm: ptls_iovec_t_553648855): cint {.cdecl,
      importc: "ptls_hkdf_extract".}
else:
  static :
    hint("Declaration of " & "ptls_hkdf_extract" &
        " already exists, not redeclaring")
when not declared(ptls_hkdf_expand):
  proc ptls_hkdf_expand*(hash: ptr ptls_hash_algorithm_t_553648901;
                         output: pointer; outlen: csize_t; prk: ptls_iovec_t_553648855;
                         info: ptls_iovec_t_553648855): cint {.cdecl,
      importc: "ptls_hkdf_expand".}
else:
  static :
    hint("Declaration of " & "ptls_hkdf_expand" &
        " already exists, not redeclaring")
when not declared(ptls_hkdf_expand_label):
  proc ptls_hkdf_expand_label*(algo: ptr ptls_hash_algorithm_t_553648901;
                               output: pointer; outlen: csize_t;
                               secret: ptls_iovec_t_553648855; label: cstring;
                               hash_value: ptls_iovec_t_553648855;
                               label_prefix: cstring): cint {.cdecl,
      importc: "ptls_hkdf_expand_label".}
else:
  static :
    hint("Declaration of " & "ptls_hkdf_expand_label" &
        " already exists, not redeclaring")
when not declared(ptls_tls12_phash):
  proc ptls_tls12_phash*(algo: ptr ptls_hash_algorithm_t_553648901;
                         output: pointer; outlen: csize_t; secret: ptls_iovec_t_553648855;
                         label: cstring; seed: ptls_iovec_t_553648855): cint {.
      cdecl, importc: "ptls_tls12_phash".}
else:
  static :
    hint("Declaration of " & "ptls_tls12_phash" &
        " already exists, not redeclaring")
when not declared(ptls_cipher_new):
  proc ptls_cipher_new*(algo: ptr ptls_cipher_algorithm_t_553648877;
                        is_enc: cint; key: pointer): ptr ptls_cipher_context_t_553648875 {.
      cdecl, importc: "ptls_cipher_new".}
else:
  static :
    hint("Declaration of " & "ptls_cipher_new" &
        " already exists, not redeclaring")
when not declared(ptls_cipher_free):
  proc ptls_cipher_free*(ctx: ptr ptls_cipher_context_t_553648875): void {.
      cdecl, importc: "ptls_cipher_free".}
else:
  static :
    hint("Declaration of " & "ptls_cipher_free" &
        " already exists, not redeclaring")
when not declared(ptls_aead_new):
  proc ptls_aead_new*(aead: ptr ptls_aead_algorithm_t_553648889;
                      hash: ptr ptls_hash_algorithm_t_553648901; is_enc: cint;
                      secret: pointer; label_prefix: cstring): ptr ptls_aead_context_t_553648887 {.
      cdecl, importc: "ptls_aead_new".}
else:
  static :
    hint("Declaration of " & "ptls_aead_new" &
        " already exists, not redeclaring")
when not declared(ptls_aead_new_direct):
  proc ptls_aead_new_direct*(aead: ptr ptls_aead_algorithm_t_553648889;
                             is_enc: cint; key: pointer; iv: pointer): ptr ptls_aead_context_t_553648887 {.
      cdecl, importc: "ptls_aead_new_direct".}
else:
  static :
    hint("Declaration of " & "ptls_aead_new_direct" &
        " already exists, not redeclaring")
when not declared(ptls_aead_free):
  proc ptls_aead_free*(ctx: ptr ptls_aead_context_t_553648887): void {.cdecl,
      importc: "ptls_aead_free".}
else:
  static :
    hint("Declaration of " & "ptls_aead_free" &
        " already exists, not redeclaring")
when not declared(ptls_aead_xor_iv):
  proc ptls_aead_xor_iv*(ctx: ptr ptls_aead_context_t_553648887; bytes: pointer;
                         len: csize_t): void {.cdecl,
      importc: "ptls_aead_xor_iv".}
else:
  static :
    hint("Declaration of " & "ptls_aead_xor_iv" &
        " already exists, not redeclaring")
when not declared(ptls_get_read_epoch):
  proc ptls_get_read_epoch*(tls: ptr ptls_t_553648845): csize_t {.cdecl,
      importc: "ptls_get_read_epoch".}
else:
  static :
    hint("Declaration of " & "ptls_get_read_epoch" &
        " already exists, not redeclaring")
when not declared(ptls_handle_message):
  proc ptls_handle_message*(tls: ptr ptls_t_553648845;
                            sendbuf: ptr ptls_buffer_t_553648859;
                            epoch_offsets: array[5'i64, csize_t];
                            in_epoch: csize_t; input: pointer; inlen: csize_t;
                            properties: ptr ptls_handshake_properties_t_553648999): cint {.
      cdecl, importc: "ptls_handle_message".}
else:
  static :
    hint("Declaration of " & "ptls_handle_message" &
        " already exists, not redeclaring")
when not declared(ptls_client_handle_message):
  proc ptls_client_handle_message*(tls: ptr ptls_t_553648845;
                                   sendbuf: ptr ptls_buffer_t_553648859;
                                   epoch_offsets: array[5'i64, csize_t];
                                   in_epoch: csize_t; input: pointer;
                                   inlen: csize_t;
                                   properties: ptr ptls_handshake_properties_t_553648999): cint {.
      cdecl, importc: "ptls_client_handle_message".}
else:
  static :
    hint("Declaration of " & "ptls_client_handle_message" &
        " already exists, not redeclaring")
when not declared(ptls_server_handle_message):
  proc ptls_server_handle_message*(tls: ptr ptls_t_553648845;
                                   sendbuf: ptr ptls_buffer_t_553648859;
                                   epoch_offsets: array[5'i64, csize_t];
                                   in_epoch: csize_t; input: pointer;
                                   inlen: csize_t;
                                   properties: ptr ptls_handshake_properties_t_553648999): cint {.
      cdecl, importc: "ptls_server_handle_message".}
else:
  static :
    hint("Declaration of " & "ptls_server_handle_message" &
        " already exists, not redeclaring")
when not declared(ptls_aead_build_iv):
  proc ptls_aead_build_iv*(algo: ptr ptls_aead_algorithm_t_553648889;
                           iv: ptr uint8; static_iv: ptr uint8; seq: uint64): void {.
      cdecl, importc: "ptls_aead__build_iv".}
else:
  static :
    hint("Declaration of " & "ptls_aead_build_iv" &
        " already exists, not redeclaring")
when not declared(ptls_key_schedule_update_hash):
  proc ptls_key_schedule_update_hash*(sched: ptr ptls_key_schedule_t_553648851;
                                      msg: ptr uint8; msglen: csize_t;
                                      use_outer: cint): void {.cdecl,
      importc: "ptls__key_schedule_update_hash".}
else:
  static :
    hint("Declaration of " & "ptls_key_schedule_update_hash" &
        " already exists, not redeclaring")
when not declared(ptls_clear_memory):
  var ptls_clear_memory* {.importc: "ptls_clear_memory".}: proc (a0: pointer;
      a1: csize_t): void {.cdecl.}
else:
  static :
    hint("Declaration of " & "ptls_clear_memory" &
        " already exists, not redeclaring")
when not declared(ptls_mem_equal):
  var ptls_mem_equal* {.importc: "ptls_mem_equal".}: proc (a0: pointer;
      a1: pointer; a2: csize_t): cint {.cdecl.}
else:
  static :
    hint("Declaration of " & "ptls_mem_equal" &
        " already exists, not redeclaring")
when not declared(ptls_server_name_is_ipaddr):
  proc ptls_server_name_is_ipaddr*(name: cstring): cint {.cdecl,
      importc: "ptls_server_name_is_ipaddr".}
else:
  static :
    hint("Declaration of " & "ptls_server_name_is_ipaddr" &
        " already exists, not redeclaring")
when not declared(ptls_ech_encode_config):
  proc ptls_ech_encode_config*(buf: ptr ptls_buffer_t_553648859;
                               config_id: uint8; kem: ptr ptls_hpke_kem_t_553648913;
                               public_key: ptls_iovec_t_553648855;
                               ciphers: ptr ptr ptls_hpke_cipher_suite_t_553648921;
                               max_name_length: uint8; public_name: cstring): cint {.
      cdecl, importc: "ptls_ech_encode_config".}
else:
  static :
    hint("Declaration of " & "ptls_ech_encode_config" &
        " already exists, not redeclaring")
when not declared(ptls_load_certificates):
  proc ptls_load_certificates*(ctx: ptr ptls_context_t_553648847;
                               cert_pem_file: cstring): cint {.cdecl,
      importc: "ptls_load_certificates".}
else:
  static :
    hint("Declaration of " & "ptls_load_certificates" &
        " already exists, not redeclaring")
when not declared(ptls_hpke_setup_base_s):
  proc ptls_hpke_setup_base_s*(kem: ptr ptls_hpke_kem_t_553648913;
                               cipher: ptr ptls_hpke_cipher_suite_t_553648921;
                               pk_s: ptr ptls_iovec_t_553648855;
                               ctx: ptr ptr ptls_aead_context_t_553648887;
                               pk_r: ptls_iovec_t_553648855; info: ptls_iovec_t_553648855): cint {.
      cdecl, importc: "ptls_hpke_setup_base_s".}
else:
  static :
    hint("Declaration of " & "ptls_hpke_setup_base_s" &
        " already exists, not redeclaring")
when not declared(ptls_hpke_setup_base_r):
  proc ptls_hpke_setup_base_r*(kem: ptr ptls_hpke_kem_t_553648913;
                               cipher: ptr ptls_hpke_cipher_suite_t_553648921;
                               keyex: ptr ptls_key_exchange_context_t_553648865;
                               ctx: ptr ptr ptls_aead_context_t_553648887;
                               pk_s: ptls_iovec_t_553648855; info: ptls_iovec_t_553648855): cint {.
      cdecl, importc: "ptls_hpke_setup_base_r".}
else:
  static :
    hint("Declaration of " & "ptls_hpke_setup_base_r" &
        " already exists, not redeclaring")
when not declared(ptls_hexdump):
  proc ptls_hexdump*(dst: cstring; src: pointer; len: csize_t): cstring {.cdecl,
      importc: "ptls_hexdump".}
else:
  static :
    hint("Declaration of " & "ptls_hexdump" & " already exists, not redeclaring")
when not declared(ptls_jsonescape):
  proc ptls_jsonescape*(buf: cstring; s: cstring; len: csize_t): cstring {.
      cdecl, importc: "ptls_jsonescape".}
else:
  static :
    hint("Declaration of " & "ptls_jsonescape" &
        " already exists, not redeclaring")
when not declared(ptls_build_v4_mapped_v6_address):
  proc ptls_build_v4_mapped_v6_address*(v6: ptr struct_in6_addr_553649007;
                                        v4: ptr struct_in_addr_553649013): void {.
      cdecl, importc: "ptls_build_v4_mapped_v6_address".}
else:
  static :
    hint("Declaration of " & "ptls_build_v4_mapped_v6_address" &
        " already exists, not redeclaring")
when not declared(ptls_get_time):
  var ptls_get_time* {.importc: "ptls_get_time".}: ptls_get_time_t_553648933
else:
  static :
    hint("Declaration of " & "ptls_get_time" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_secp256r1):
  var ptls_openssl_secp256r1* {.importc: "ptls_openssl_secp256r1".}: ptls_key_exchange_algorithm_t_553648869
else:
  static :
    hint("Declaration of " & "ptls_openssl_secp256r1" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_secp384r1):
  var ptls_openssl_secp384r1* {.importc: "ptls_openssl_secp384r1".}: ptls_key_exchange_algorithm_t_553648869
else:
  static :
    hint("Declaration of " & "ptls_openssl_secp384r1" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_secp521r1):
  var ptls_openssl_secp521r1* {.importc: "ptls_openssl_secp521r1".}: ptls_key_exchange_algorithm_t_553648869
else:
  static :
    hint("Declaration of " & "ptls_openssl_secp521r1" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_x25519):
  var ptls_openssl_x25519* {.importc: "ptls_openssl_x25519".}: ptls_key_exchange_algorithm_t_553648869
else:
  static :
    hint("Declaration of " & "ptls_openssl_x25519" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_key_exchanges):
  var ptls_openssl_key_exchanges* {.importc: "ptls_openssl_key_exchanges".}: ptr UncheckedArray[
      ptr ptls_key_exchange_algorithm_t_553648869]
else:
  static :
    hint("Declaration of " & "ptls_openssl_key_exchanges" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_key_exchanges_all):
  var ptls_openssl_key_exchanges_all* {.importc: "ptls_openssl_key_exchanges_all".}: ptr UncheckedArray[
      ptr ptls_key_exchange_algorithm_t_553648869]
else:
  static :
    hint("Declaration of " & "ptls_openssl_key_exchanges_all" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_aes128ecb):
  var ptls_openssl_aes128ecb* {.importc: "ptls_openssl_aes128ecb".}: ptls_cipher_algorithm_t_553648877
else:
  static :
    hint("Declaration of " & "ptls_openssl_aes128ecb" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_aes128ctr):
  var ptls_openssl_aes128ctr* {.importc: "ptls_openssl_aes128ctr".}: ptls_cipher_algorithm_t_553648877
else:
  static :
    hint("Declaration of " & "ptls_openssl_aes128ctr" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_aes128gcm):
  var ptls_openssl_aes128gcm* {.importc: "ptls_openssl_aes128gcm".}: ptls_aead_algorithm_t_553648889
else:
  static :
    hint("Declaration of " & "ptls_openssl_aes128gcm" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_aes256ecb):
  var ptls_openssl_aes256ecb* {.importc: "ptls_openssl_aes256ecb".}: ptls_cipher_algorithm_t_553648877
else:
  static :
    hint("Declaration of " & "ptls_openssl_aes256ecb" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_aes256ctr):
  var ptls_openssl_aes256ctr* {.importc: "ptls_openssl_aes256ctr".}: ptls_cipher_algorithm_t_553648877
else:
  static :
    hint("Declaration of " & "ptls_openssl_aes256ctr" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_aes256gcm):
  var ptls_openssl_aes256gcm* {.importc: "ptls_openssl_aes256gcm".}: ptls_aead_algorithm_t_553648889
else:
  static :
    hint("Declaration of " & "ptls_openssl_aes256gcm" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_sha256):
  var ptls_openssl_sha256* {.importc: "ptls_openssl_sha256".}: ptls_hash_algorithm_t_553648901
else:
  static :
    hint("Declaration of " & "ptls_openssl_sha256" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_sha384):
  var ptls_openssl_sha384* {.importc: "ptls_openssl_sha384".}: ptls_hash_algorithm_t_553648901
else:
  static :
    hint("Declaration of " & "ptls_openssl_sha384" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_sha512):
  var ptls_openssl_sha512* {.importc: "ptls_openssl_sha512".}: ptls_hash_algorithm_t_553648901
else:
  static :
    hint("Declaration of " & "ptls_openssl_sha512" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_aes128gcmsha256):
  var ptls_openssl_aes128gcmsha256* {.importc: "ptls_openssl_aes128gcmsha256".}: ptls_cipher_suite_t_553648905
else:
  static :
    hint("Declaration of " & "ptls_openssl_aes128gcmsha256" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_aes256gcmsha384):
  var ptls_openssl_aes256gcmsha384* {.importc: "ptls_openssl_aes256gcmsha384".}: ptls_cipher_suite_t_553648905
else:
  static :
    hint("Declaration of " & "ptls_openssl_aes256gcmsha384" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_cipher_suites):
  var ptls_openssl_cipher_suites* {.importc: "ptls_openssl_cipher_suites".}: ptr UncheckedArray[
      ptr ptls_cipher_suite_t_553648905]
else:
  static :
    hint("Declaration of " & "ptls_openssl_cipher_suites" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_cipher_suites_all):
  var ptls_openssl_cipher_suites_all* {.importc: "ptls_openssl_cipher_suites_all".}: ptr UncheckedArray[
      ptr ptls_cipher_suite_t_553648905]
else:
  static :
    hint("Declaration of " & "ptls_openssl_cipher_suites_all" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_tls12_cipher_suites):
  var ptls_openssl_tls12_cipher_suites* {.
      importc: "ptls_openssl_tls12_cipher_suites".}: ptr UncheckedArray[
      ptr ptls_cipher_suite_t_553648905]
else:
  static :
    hint("Declaration of " & "ptls_openssl_tls12_cipher_suites" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_chacha20):
  var ptls_openssl_chacha20* {.importc: "ptls_openssl_chacha20".}: ptls_cipher_algorithm_t_553648877
else:
  static :
    hint("Declaration of " & "ptls_openssl_chacha20" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_chacha20poly1305):
  var ptls_openssl_chacha20poly1305* {.importc: "ptls_openssl_chacha20poly1305".}: ptls_aead_algorithm_t_553648889
else:
  static :
    hint("Declaration of " & "ptls_openssl_chacha20poly1305" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_chacha20poly1305sha256):
  var ptls_openssl_chacha20poly1305sha256*
      {.importc: "ptls_openssl_chacha20poly1305sha256".}: ptls_cipher_suite_t_553648905
else:
  static :
    hint("Declaration of " & "ptls_openssl_chacha20poly1305sha256" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_tls12_ecdhe_rsa_aes128gcmsha256):
  var ptls_openssl_tls12_ecdhe_rsa_aes128gcmsha256*
      {.importc: "ptls_openssl_tls12_ecdhe_rsa_aes128gcmsha256".}: ptls_cipher_suite_t_553648905
else:
  static :
    hint("Declaration of " & "ptls_openssl_tls12_ecdhe_rsa_aes128gcmsha256" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_tls12_ecdhe_ecdsa_aes128gcmsha256):
  var ptls_openssl_tls12_ecdhe_ecdsa_aes128gcmsha256*
      {.importc: "ptls_openssl_tls12_ecdhe_ecdsa_aes128gcmsha256".}: ptls_cipher_suite_t_553648905
else:
  static :
    hint("Declaration of " & "ptls_openssl_tls12_ecdhe_ecdsa_aes128gcmsha256" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_tls12_ecdhe_rsa_aes256gcmsha384):
  var ptls_openssl_tls12_ecdhe_rsa_aes256gcmsha384*
      {.importc: "ptls_openssl_tls12_ecdhe_rsa_aes256gcmsha384".}: ptls_cipher_suite_t_553648905
else:
  static :
    hint("Declaration of " & "ptls_openssl_tls12_ecdhe_rsa_aes256gcmsha384" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_tls12_ecdhe_ecdsa_aes256gcmsha384):
  var ptls_openssl_tls12_ecdhe_ecdsa_aes256gcmsha384*
      {.importc: "ptls_openssl_tls12_ecdhe_ecdsa_aes256gcmsha384".}: ptls_cipher_suite_t_553648905
else:
  static :
    hint("Declaration of " & "ptls_openssl_tls12_ecdhe_ecdsa_aes256gcmsha384" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_tls12_ecdhe_rsa_chacha20poly1305sha256):
  var ptls_openssl_tls12_ecdhe_rsa_chacha20poly1305sha256*
      {.importc: "ptls_openssl_tls12_ecdhe_rsa_chacha20poly1305sha256".}: ptls_cipher_suite_t_553648905
else:
  static :
    hint("Declaration of " &
        "ptls_openssl_tls12_ecdhe_rsa_chacha20poly1305sha256" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_tls12_ecdhe_ecdsa_chacha20poly1305sha256):
  var ptls_openssl_tls12_ecdhe_ecdsa_chacha20poly1305sha256*
      {.importc: "ptls_openssl_tls12_ecdhe_ecdsa_chacha20poly1305sha256".}: ptls_cipher_suite_t_553648905
else:
  static :
    hint("Declaration of " &
        "ptls_openssl_tls12_ecdhe_ecdsa_chacha20poly1305sha256" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_bfecb):
  var ptls_openssl_bfecb* {.importc: "ptls_openssl_bfecb".}: ptls_cipher_algorithm_t_553648877
else:
  static :
    hint("Declaration of " & "ptls_openssl_bfecb" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_hpke_kem_p256sha256):
  var ptls_openssl_hpke_kem_p256sha256* {.
      importc: "ptls_openssl_hpke_kem_p256sha256".}: ptls_hpke_kem_t_553648913
else:
  static :
    hint("Declaration of " & "ptls_openssl_hpke_kem_p256sha256" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_hpke_kem_p384sha384):
  var ptls_openssl_hpke_kem_p384sha384* {.
      importc: "ptls_openssl_hpke_kem_p384sha384".}: ptls_hpke_kem_t_553648913
else:
  static :
    hint("Declaration of " & "ptls_openssl_hpke_kem_p384sha384" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_hpke_kem_x25519sha256):
  var ptls_openssl_hpke_kem_x25519sha256*
      {.importc: "ptls_openssl_hpke_kem_x25519sha256".}: ptls_hpke_kem_t_553648913
else:
  static :
    hint("Declaration of " & "ptls_openssl_hpke_kem_x25519sha256" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_hpke_kems):
  var ptls_openssl_hpke_kems* {.importc: "ptls_openssl_hpke_kems".}: ptr UncheckedArray[
      ptr ptls_hpke_kem_t_553648913]
else:
  static :
    hint("Declaration of " & "ptls_openssl_hpke_kems" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_hpke_aes128gcmsha256):
  var ptls_openssl_hpke_aes128gcmsha256* {.
      importc: "ptls_openssl_hpke_aes128gcmsha256".}: ptls_hpke_cipher_suite_t_553648921
else:
  static :
    hint("Declaration of " & "ptls_openssl_hpke_aes128gcmsha256" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_hpke_aes128gcmsha512):
  var ptls_openssl_hpke_aes128gcmsha512* {.
      importc: "ptls_openssl_hpke_aes128gcmsha512".}: ptls_hpke_cipher_suite_t_553648921
else:
  static :
    hint("Declaration of " & "ptls_openssl_hpke_aes128gcmsha512" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_hpke_aes256gcmsha384):
  var ptls_openssl_hpke_aes256gcmsha384* {.
      importc: "ptls_openssl_hpke_aes256gcmsha384".}: ptls_hpke_cipher_suite_t_553648921
else:
  static :
    hint("Declaration of " & "ptls_openssl_hpke_aes256gcmsha384" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_hpke_chacha20poly1305sha256):
  var ptls_openssl_hpke_chacha20poly1305sha256*
      {.importc: "ptls_openssl_hpke_chacha20poly1305sha256".}: ptls_hpke_cipher_suite_t_553648921
else:
  static :
    hint("Declaration of " & "ptls_openssl_hpke_chacha20poly1305sha256" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_hpke_cipher_suites):
  var ptls_openssl_hpke_cipher_suites* {.
      importc: "ptls_openssl_hpke_cipher_suites".}: ptr UncheckedArray[
      ptr ptls_hpke_cipher_suite_t_553648921]
else:
  static :
    hint("Declaration of " & "ptls_openssl_hpke_cipher_suites" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_random_bytes):
  proc ptls_openssl_random_bytes*(buf: pointer; len: csize_t): void {.cdecl,
      importc: "ptls_openssl_random_bytes".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_random_bytes" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_create_key_exchange):
  proc ptls_openssl_create_key_exchange*(
      ctx: ptr ptr ptls_key_exchange_context_t_553648865; pkey: ptr EVP_PKEY_553649015): cint {.
      cdecl, importc: "ptls_openssl_create_key_exchange".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_create_key_exchange" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_lookup_signature_schemes):
  proc ptls_openssl_lookup_signature_schemes*(key: ptr EVP_PKEY_553649015): ptr ptls_openssl_signature_scheme_t_553649021 {.
      cdecl, importc: "ptls_openssl_lookup_signature_schemes".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_lookup_signature_schemes" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_select_signature_scheme):
  proc ptls_openssl_select_signature_scheme*(
      available: ptr ptls_openssl_signature_scheme_t_553649021;
      algorithms: ptr uint16; num_algorithms: csize_t): ptr ptls_openssl_signature_scheme_t_553649021 {.
      cdecl, importc: "ptls_openssl_select_signature_scheme".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_select_signature_scheme" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_init_sign_certificate):
  proc ptls_openssl_init_sign_certificate*(
      self: ptr ptls_openssl_sign_certificate_t_553649025; key: ptr EVP_PKEY_553649015): cint {.
      cdecl, importc: "ptls_openssl_init_sign_certificate".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_init_sign_certificate" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_dispose_sign_certificate):
  proc ptls_openssl_dispose_sign_certificate*(
      self: ptr ptls_openssl_sign_certificate_t_553649025): void {.cdecl,
      importc: "ptls_openssl_dispose_sign_certificate".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_dispose_sign_certificate" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_load_certificates):
  proc ptls_openssl_load_certificates*(ctx: ptr ptls_context_t_553648847;
                                       cert: ptr X509_553649027;
                                       chain: ptr struct_stack_st_X509): cint {.
      cdecl, importc: "ptls_openssl_load_certificates".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_load_certificates" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_init_verify_certificate):
  proc ptls_openssl_init_verify_certificate*(
      self: ptr ptls_openssl_verify_certificate_t_553649041;
      store: ptr X509_STORE_553649039): cint {.cdecl,
      importc: "ptls_openssl_init_verify_certificate".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_init_verify_certificate" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_dispose_verify_certificate):
  proc ptls_openssl_dispose_verify_certificate*(
      self: ptr ptls_openssl_verify_certificate_t_553649041): void {.cdecl,
      importc: "ptls_openssl_dispose_verify_certificate".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_dispose_verify_certificate" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_create_default_certificate_store):
  proc ptls_openssl_create_default_certificate_store*(): ptr X509_STORE_553649039 {.
      cdecl, importc: "ptls_openssl_create_default_certificate_store".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_create_default_certificate_store" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_raw_pubkey_init_verify_certificate):
  proc ptls_openssl_raw_pubkey_init_verify_certificate*(
      self: ptr ptls_openssl_raw_pubkey_verify_certificate_t_553649031;
      pubkey: ptr EVP_PKEY_553649015): cint {.cdecl,
      importc: "ptls_openssl_raw_pubkey_init_verify_certificate".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_raw_pubkey_init_verify_certificate" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_raw_pubkey_dispose_verify_certificate):
  proc ptls_openssl_raw_pubkey_dispose_verify_certificate*(
      self: ptr ptls_openssl_raw_pubkey_verify_certificate_t_553649031): void {.
      cdecl, importc: "ptls_openssl_raw_pubkey_dispose_verify_certificate".}
else:
  static :
    hint("Declaration of " &
        "ptls_openssl_raw_pubkey_dispose_verify_certificate" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_encrypt_ticket):
  proc ptls_openssl_encrypt_ticket*(dst: ptr ptls_buffer_t_553648859;
                                    src: ptls_iovec_t_553648855; cb: proc (
      a0: ptr uint8; a1: ptr uint8; a2: ptr EVP_CIPHER_CTX_553649043;
      a3: ptr HMAC_CTX_553649045; a4: cint): cint {.cdecl.}): cint {.cdecl,
      importc: "ptls_openssl_encrypt_ticket".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_encrypt_ticket" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_decrypt_ticket):
  proc ptls_openssl_decrypt_ticket*(dst: ptr ptls_buffer_t_553648859;
                                    src: ptls_iovec_t_553648855; cb: proc (
      a0: ptr uint8; a1: ptr uint8; a2: ptr EVP_CIPHER_CTX_553649043;
      a3: ptr HMAC_CTX_553649045; a4: cint): cint {.cdecl.}): cint {.cdecl,
      importc: "ptls_openssl_decrypt_ticket".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_decrypt_ticket" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_encrypt_ticket_evp):
  proc ptls_openssl_encrypt_ticket_evp*(dst: ptr ptls_buffer_t_553648859;
                                        src: ptls_iovec_t_553648855; cb: proc (
      a0: ptr uint8; a1: ptr uint8; a2: ptr EVP_CIPHER_CTX_553649043;
      a3: ptr EVP_MAC_CTX_553649047; a4: cint): cint {.cdecl.}): cint {.cdecl,
      importc: "ptls_openssl_encrypt_ticket_evp".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_encrypt_ticket_evp" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_decrypt_ticket_evp):
  proc ptls_openssl_decrypt_ticket_evp*(dst: ptr ptls_buffer_t_553648859;
                                        src: ptls_iovec_t_553648855; cb: proc (
      a0: ptr uint8; a1: ptr uint8; a2: ptr EVP_CIPHER_CTX_553649043;
      a3: ptr EVP_MAC_CTX_553649047; a4: cint): cint {.cdecl.}): cint {.cdecl,
      importc: "ptls_openssl_decrypt_ticket_evp".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_decrypt_ticket_evp" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_picotls_ctx_init):
  proc ngtcp2_crypto_picotls_ctx_init*(cptls: ptr ngtcp2_crypto_picotls_ctx_553649051): void {.
      cdecl, importc: "ngtcp2_crypto_picotls_ctx_init".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_picotls_ctx_init" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_picotls_from_epoch):
  proc ngtcp2_crypto_picotls_from_epoch*(epoch: csize_t): ngtcp2_encryption_level_553648745 {.
      cdecl, importc: "ngtcp2_crypto_picotls_from_epoch".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_picotls_from_epoch" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_picotls_from_ngtcp2_encryption_level):
  proc ngtcp2_crypto_picotls_from_ngtcp2_encryption_level*(
      encryption_level: ngtcp2_encryption_level_553648745): csize_t {.cdecl,
      importc: "ngtcp2_crypto_picotls_from_ngtcp2_encryption_level".}
else:
  static :
    hint("Declaration of " &
        "ngtcp2_crypto_picotls_from_ngtcp2_encryption_level" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_picotls_configure_server_context):
  proc ngtcp2_crypto_picotls_configure_server_context*(ctx: ptr ptls_context_t_553648847): cint {.
      cdecl, importc: "ngtcp2_crypto_picotls_configure_server_context".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_picotls_configure_server_context" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_picotls_configure_client_context):
  proc ngtcp2_crypto_picotls_configure_client_context*(ctx: ptr ptls_context_t_553648847): cint {.
      cdecl, importc: "ngtcp2_crypto_picotls_configure_client_context".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_picotls_configure_client_context" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_picotls_configure_server_session):
  proc ngtcp2_crypto_picotls_configure_server_session*(
      cptls: ptr ngtcp2_crypto_picotls_ctx_553649051): cint {.cdecl,
      importc: "ngtcp2_crypto_picotls_configure_server_session".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_picotls_configure_server_session" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_picotls_configure_client_session):
  proc ngtcp2_crypto_picotls_configure_client_session*(
      cptls: ptr ngtcp2_crypto_picotls_ctx_553649051; conn: ptr ngtcp2_conn_553648737): cint {.
      cdecl, importc: "ngtcp2_crypto_picotls_configure_client_session".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_picotls_configure_client_session" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_picotls_deconfigure_session):
  proc ngtcp2_crypto_picotls_deconfigure_session*(
      cptls: ptr ngtcp2_crypto_picotls_ctx_553649051): void {.cdecl,
      importc: "ngtcp2_crypto_picotls_deconfigure_session".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_picotls_deconfigure_session" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_picotls_collect_extension):
  proc ngtcp2_crypto_picotls_collect_extension*(ptls: ptr ptls_t_553648845;
      properties: ptr struct_st_ptls_handshake_properties_t_553648997;
      type_arg: uint16): cint {.cdecl, importc: "ngtcp2_crypto_picotls_collect_extension".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_picotls_collect_extension" &
        " already exists, not redeclaring")
when not declared(ngtcp2_crypto_picotls_collected_extensions):
  proc ngtcp2_crypto_picotls_collected_extensions*(ptls: ptr ptls_t_553648845;
      properties: ptr struct_st_ptls_handshake_properties_t_553648997;
      extensions: ptr ptls_raw_extension_t_553648991): cint {.cdecl,
      importc: "ngtcp2_crypto_picotls_collected_extensions".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_picotls_collected_extensions" &
        " already exists, not redeclaring")
when not declared(ptls_cred_buffer_set_from_file):
  proc ptls_cred_buffer_set_from_file*(buf: ptr ptls_cred_buffer_t_553649055;
                                       fname: cstring): cint {.cdecl,
      importc: "ptls_cred_buffer_set_from_file".}
else:
  static :
    hint("Declaration of " & "ptls_cred_buffer_set_from_file" &
        " already exists, not redeclaring")
when not declared(ptls_cred_buffer_set_from_string):
  proc ptls_cred_buffer_set_from_string*(buf: ptr ptls_cred_buffer_t_553649055;
      s: cstring): cint {.cdecl, importc: "ptls_cred_buffer_set_from_string".}
else:
  static :
    hint("Declaration of " & "ptls_cred_buffer_set_from_string" &
        " already exists, not redeclaring")
when not declared(ptls_cred_buffer_dispose):
  proc ptls_cred_buffer_dispose*(buf: ptr ptls_cred_buffer_t_553649055): void {.
      cdecl, importc: "ptls_cred_buffer_dispose".}
else:
  static :
    hint("Declaration of " & "ptls_cred_buffer_dispose" &
        " already exists, not redeclaring")
when not declared(ptls_cred_buffer_rewind):
  proc ptls_cred_buffer_rewind*(buf: ptr ptls_cred_buffer_t_553649055): void {.
      cdecl, importc: "ptls_cred_buffer_rewind".}
else:
  static :
    hint("Declaration of " & "ptls_cred_buffer_rewind" &
        " already exists, not redeclaring")
when not declared(ptls_cred_buffer_gets):
  proc ptls_cred_buffer_gets*(s: cstring; n: cint; buf: ptr ptls_cred_buffer_t_553649055): cstring {.
      cdecl, importc: "ptls_cred_buffer_gets".}
else:
  static :
    hint("Declaration of " & "ptls_cred_buffer_gets" &
        " already exists, not redeclaring")
when not declared(ptls_load_certificates_from_memory):
  proc ptls_load_certificates_from_memory*(ctx: ptr ptls_context_t_553648847;
      mem: ptr ptls_cred_buffer_t_553649055): cint {.cdecl,
      importc: "ptls_load_certificates_from_memory".}
else:
  static :
    hint("Declaration of " & "ptls_load_certificates_from_memory" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_init_sign_certificate_with_mem_key):
  proc ptls_openssl_init_sign_certificate_with_mem_key*(
      self: ptr ptls_openssl_sign_certificate_t_553649025; buf: pointer;
      len: cint): cint {.cdecl, importc: "ptls_openssl_init_sign_certificate_with_mem_key".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_init_sign_certificate_with_mem_key" &
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
type
  ptls_handshake_properties_t_anon0_t* = struct_st_ptls_handshake_properties_t_anon0_t
  ptls_handshake_properties_t_anon0_t_client_t* =
    struct_st_ptls_handshake_properties_t_anon0_t_client_t
  ptls_handshake_properties_t_anon0_t_client_t_negotiated_protocols_t* =
    struct_st_ptls_handshake_properties_t_anon0_t_client_t_negotiated_protocols_t
  ptls_handshake_properties_t_anon0_t_client_t_ech_t* =
    struct_st_ptls_handshake_properties_t_anon0_t_client_t_ech_t
  ptls_handshake_properties_t_anon0_t_server_t* =
    struct_st_ptls_handshake_properties_t_anon0_t_server_t
  ptls_handshake_properties_t_anon0_t_server_t_selected_psk_binder_t* =
    struct_st_ptls_handshake_properties_t_anon0_t_server_t_selected_psk_binder_t
  ptls_handshake_properties_t_anon0_t_server_t_cookie_t* =
    struct_st_ptls_handshake_properties_t_anon0_t_server_t_cookie_t

# OpenSSL/QuicTLS crypto support
# OpenSSL/QuicTLS type definitions
type
  SSL_CTX* = pointer
  OSSL_ENCRYPTION_LEVEL* = enum
    OSSL_ENCRYPTION_LEVEL_INITIAL = 0
    OSSL_ENCRYPTION_LEVEL_EARLY_DATA = 1
    OSSL_ENCRYPTION_LEVEL_HANDSHAKE = 2
    OSSL_ENCRYPTION_LEVEL_APPLICATION = 3

# ngtcp2_crypto_quictls error constants
const
  NGTCP2_CRYPTO_QUICTLS_ERR_TLS_WANT_X509_LOOKUP* = -10001
  NGTCP2_CRYPTO_QUICTLS_ERR_TLS_WANT_CLIENT_HELLO_CB* = -10002

# ngtcp2_crypto_quictls function bindings
when not declared(ngtcp2_crypto_quictls_init):
  proc ngtcp2_crypto_quictls_init*(): cint {.
      cdecl, importc: "ngtcp2_crypto_quictls_init".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_quictls_init" &
        " already exists, not redeclaring")

when not declared(ngtcp2_crypto_quictls_from_ossl_encryption_level):
  proc ngtcp2_crypto_quictls_from_ossl_encryption_level*(
      ossl_level: OSSL_ENCRYPTION_LEVEL): ngtcp2_encryption_level_553648745 {.
      cdecl, importc: "ngtcp2_crypto_quictls_from_ossl_encryption_level".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_quictls_from_ossl_encryption_level" &
        " already exists, not redeclaring")

when not declared(ngtcp2_crypto_quictls_from_ngtcp2_encryption_level):
  proc ngtcp2_crypto_quictls_from_ngtcp2_encryption_level*(
      encryption_level: ngtcp2_encryption_level_553648745): OSSL_ENCRYPTION_LEVEL {.
      cdecl, importc: "ngtcp2_crypto_quictls_from_ngtcp2_encryption_level".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_quictls_from_ngtcp2_encryption_level" &
        " already exists, not redeclaring")

when not declared(ngtcp2_crypto_quictls_configure_server_context):
  proc ngtcp2_crypto_quictls_configure_server_context*(ssl_ctx: SSL_CTX): cint {.
      cdecl, importc: "ngtcp2_crypto_quictls_configure_server_context".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_quictls_configure_server_context" &
        " already exists, not redeclaring")

when not declared(ngtcp2_crypto_quictls_configure_client_context):
  proc ngtcp2_crypto_quictls_configure_client_context*(ssl_ctx: SSL_CTX): cint {.
      cdecl, importc: "ngtcp2_crypto_quictls_configure_client_context".}
else:
  static :
    hint("Declaration of " & "ngtcp2_crypto_quictls_configure_client_context" &
        " already exists, not redeclaring")
