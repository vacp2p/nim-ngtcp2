
{.warning[UnusedImport]: off.}
{.hint[XDeclaredButNotUsed]: off.}
from macros import hint, warning, newLit, getSize

from os import parentDir

when not declared(ownSizeOf):
  macro ownSizeof(x: typed): untyped =
    newLit(x.getSize)

type
  enum_en_ptls_hash_final_mode_t_536871416* {.size: sizeof(cuint).} = enum
    PTLS_HASH_FINAL_MODE_FREE = 0, PTLS_HASH_FINAL_MODE_RESET = 1,
    PTLS_HASH_FINAL_MODE_SNAPSHOT = 2
type
  enum_en_ptls_early_data_acceptance_t_536871525* {.size: sizeof(cuint).} = enum
    PTLS_EARLY_DATA_ACCEPTANCE_UNKNOWN = 0, PTLS_EARLY_DATA_REJECTED = 1,
    PTLS_EARLY_DATA_ACCEPTED = 2
when not declared(struct_st_ptls_t):
  type
    struct_st_ptls_t* = object
else:
  static :
    hint("Declaration of " & "struct_st_ptls_t" &
        " already exists, not redeclaring")
when not declared(UINT64_MAX):
  type
    UINT64_MAX* = object
else:
  static :
    hint("Declaration of " & "UINT64_MAX" & " already exists, not redeclaring")
when not declared(struct_st_ptls_key_schedule_t):
  type
    struct_st_ptls_key_schedule_t* = object
else:
  static :
    hint("Declaration of " & "struct_st_ptls_key_schedule_t" &
        " already exists, not redeclaring")
when not declared(struct_x509_store_st):
  type
    struct_x509_store_st* = object
else:
  static :
    hint("Declaration of " & "struct_x509_store_st" &
        " already exists, not redeclaring")
when not declared(struct_x509_st):
  type
    struct_x509_st* = object
else:
  static :
    hint("Declaration of " & "struct_x509_st" &
        " already exists, not redeclaring")
when not declared(struct_evp_md_st):
  type
    struct_evp_md_st* = object
else:
  static :
    hint("Declaration of " & "struct_evp_md_st" &
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
when not declared(struct_evp_cipher_ctx_st):
  type
    struct_evp_cipher_ctx_st* = object
else:
  static :
    hint("Declaration of " & "struct_evp_cipher_ctx_st" &
        " already exists, not redeclaring")
when not declared(struct_stack_st_X509):
  type
    struct_stack_st_X509* = object
else:
  static :
    hint("Declaration of " & "struct_stack_st_X509" &
        " already exists, not redeclaring")
when not declared(struct_hmac_ctx_st):
  type
    struct_hmac_ctx_st* = object
else:
  static :
    hint("Declaration of " & "struct_hmac_ctx_st" &
        " already exists, not redeclaring")
when not declared(struct_evp_mac_ctx_st):
  type
    struct_evp_mac_ctx_st* = object
else:
  static :
    hint("Declaration of " & "struct_evp_mac_ctx_st" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_traffic_protection_t):
  type
    struct_st_ptls_traffic_protection_t* = object
else:
  static :
    hint("Declaration of " & "struct_st_ptls_traffic_protection_t" &
        " already exists, not redeclaring")
type
  ptls_t_536871370 = struct_st_ptls_t ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:323:26
  ptls_context_t_536871372 = struct_st_ptls_context_t_536871375 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:324:34
  struct_st_ptls_context_t_certificates_t {.pure, inheritable, bycopy.} = object
    list*: ptr ptls_iovec_t_536871381
    count*: csize_t
  struct_st_ptls_context_t_pre_shared_key_t {.pure, inheritable, bycopy.} = object
    identity*: ptls_iovec_t_536871381
    secret*: ptls_iovec_t_536871381
    hash*: ptr ptls_hash_algorithm_t_536871427
  struct_st_ptls_context_t_ech_t_client_t {.pure, inheritable, bycopy.} = object
    ciphers*: ptr ptr ptls_hpke_cipher_suite_t_536871447
    kems*: ptr ptr ptls_hpke_kem_t_536871439
  struct_st_ptls_context_t_ech_t_server_t {.pure, inheritable, bycopy.} = object
    create_opener*: ptr ptls_ech_create_opener_t_536871520
    retry_configs*: ptls_iovec_t_536871381
  struct_st_ptls_context_t_ech_t {.pure, inheritable, bycopy.} = object
    client*: struct_st_ptls_context_t_ech_t_client_t
    server*: struct_st_ptls_context_t_ech_t_server_t
  struct_st_ptls_context_t_ticket_context_t {.pure, inheritable, bycopy.} = object
    bytes*: array[32'i64, uint8]
    is_set* {.bitsize: 1'i64.}: cuint
  struct_st_ptls_context_t_client_ca_names_t {.pure, inheritable, bycopy.} = object
    list*: ptr ptls_iovec_t_536871381
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
  struct_st_ptls_context_t_536871374 {.pure, inheritable, bycopy.} = object
    random_bytes*: proc (a0: pointer; a1: csize_t): void {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:854:8
    get_time*: ptr ptls_get_time_t_536871466
    key_exchanges*: ptr ptr ptls_key_exchange_algorithm_t_536871395
    cipher_suites*: ptr ptr ptls_cipher_suite_t_536871431
    certificates*: struct_st_ptls_context_t_certificates_t
    pre_shared_key*: struct_st_ptls_context_t_pre_shared_key_t
    ech*: struct_st_ptls_context_t_ech_t
    on_client_hello*: ptr ptls_on_client_hello_t_536871470
    emit_certificate*: ptr ptls_emit_certificate_t_536871474
    sign_certificate*: ptr ptls_sign_certificate_t_536871482
    verify_certificate*: ptr ptls_verify_certificate_t_536871486
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
    encrypt_ticket*: ptr ptls_encrypt_ticket_t_536871490
    save_ticket*: ptr ptls_save_ticket_t_536871494
    log_event*: ptr ptls_log_event_t_536871498
    update_open_count*: ptr ptls_update_open_count_t_536871504
    update_traffic_key*: ptr ptls_update_traffic_key_t_536871508
    decompress_certificate*: ptr ptls_decompress_certificate_t_536871516
    on_extension*: ptr ptls_on_extension_t_536871512
    tls12_cipher_suites*: ptr ptr ptls_cipher_suite_t_536871431
    ticket_context*: struct_st_ptls_context_t_ticket_context_t
    client_ca_names*: struct_st_ptls_context_t_client_ca_names_t
    ticket_requests*: struct_st_ptls_context_t_ticket_requests_t
  ptls_key_schedule_t_536871376 = struct_st_ptls_key_schedule_t ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:325:39
  struct_st_ptls_iovec_t_536871378 {.pure, inheritable, bycopy.} = object
    base*: ptr uint8         ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:330:16
    len*: csize_t
  ptls_iovec_t_536871380 = struct_st_ptls_iovec_t_536871379 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:333:3
  struct_st_ptls_buffer_t_536871382 {.pure, inheritable, bycopy.} = object
    base*: ptr uint8         ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:338:16
    capacity*: csize_t
    off*: csize_t
    is_allocated*: uint8
    align_bits*: uint8
  ptls_buffer_t_536871384 = struct_st_ptls_buffer_t_536871383 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:344:3
  struct_st_ptls_key_exchange_context_t_536871386 {.pure, inheritable, bycopy.} = object
    algo*: ptr struct_st_ptls_key_exchange_algorithm_t_536871389 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:349:16
    pubkey*: ptls_iovec_t_536871381
    on_exchange*: proc (a0: ptr ptr struct_st_ptls_key_exchange_context_t_536871387;
                        a1: cint; a2: ptr ptls_iovec_t_536871381;
                        a3: ptls_iovec_t_536871381): cint {.cdecl.}
  struct_st_ptls_key_exchange_algorithm_t_536871388 {.pure, inheritable, bycopy.} = object
    id*: uint16              ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:371:22
    create*: proc (a0: ptr struct_st_ptls_key_exchange_algorithm_t_536871389;
                   a1: ptr ptr ptls_key_exchange_context_t_536871391): cint {.
        cdecl.}
    exchange*: proc (a0: ptr struct_st_ptls_key_exchange_algorithm_t_536871389;
                     a1: ptr ptls_iovec_t_536871381; a2: ptr ptls_iovec_t_536871381;
                     a3: ptls_iovec_t_536871381): cint {.cdecl.}
    data*: intptr_t_536871393
    name*: cstring
  ptls_key_exchange_context_t_536871390 = struct_st_ptls_key_exchange_context_t_536871387 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:366:3
  intptr_t_536871392 = clong ## Generated based on /usr/include/stdint.h:76:19
  ptls_key_exchange_algorithm_t_536871394 = struct_st_ptls_key_exchange_algorithm_t_536871389 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:398:3
  struct_st_ptls_cipher_context_t_536871396 {.pure, inheritable, bycopy.} = object
    algo*: ptr struct_st_ptls_cipher_algorithm_t_536871399 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:403:16
    do_dispose*: proc (a0: ptr struct_st_ptls_cipher_context_t_536871397): void {.
        cdecl.}
    do_init*: proc (a0: ptr struct_st_ptls_cipher_context_t_536871397;
                    a1: pointer): void {.cdecl.}
    do_transform*: proc (a0: ptr struct_st_ptls_cipher_context_t_536871397;
                         a1: pointer; a2: pointer; a3: csize_t): void {.cdecl.}
  struct_st_ptls_cipher_algorithm_t_536871398 {.pure, inheritable, bycopy.} = object
    name*: cstring           ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:414:22
    key_size*: csize_t
    block_size*: csize_t
    iv_size*: csize_t
    context_size*: csize_t
    setup_crypto*: proc (a0: ptr ptls_cipher_context_t_536871401; a1: cint;
                         a2: pointer): cint {.cdecl.}
  ptls_cipher_context_t_536871400 = struct_st_ptls_cipher_context_t_536871397 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:409:3
  ptls_cipher_algorithm_t_536871402 = struct_st_ptls_cipher_algorithm_t_536871399 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:421:3
  struct_st_ptls_aead_supplementary_encryption_t_536871404 {.pure, inheritable,
      bycopy.} = object
    ctx*: ptr ptls_cipher_context_t_536871401 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:427:16
    input*: pointer
    output*: array[16'i64, uint8]
  ptls_aead_supplementary_encryption_t_536871406 = struct_st_ptls_aead_supplementary_encryption_t_536871405 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:442:3
  struct_st_ptls_aead_context_t_536871408 {.pure, inheritable, bycopy.} = object
    algo*: ptr struct_st_ptls_aead_algorithm_t_536871411 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:450:16
    dispose_crypto*: proc (a0: ptr struct_st_ptls_aead_context_t_536871409): void {.
        cdecl.}
    do_get_iv*: proc (a0: ptr struct_st_ptls_aead_context_t_536871409;
                      a1: pointer): void {.cdecl.}
    do_set_iv*: proc (a0: ptr struct_st_ptls_aead_context_t_536871409;
                      a1: pointer): void {.cdecl.}
    do_encrypt_init*: proc (a0: ptr struct_st_ptls_aead_context_t_536871409;
                            a1: uint64; a2: pointer; a3: csize_t): void {.cdecl.}
    do_encrypt_update*: proc (a0: ptr struct_st_ptls_aead_context_t_536871409;
                              a1: pointer; a2: pointer; a3: csize_t): csize_t {.
        cdecl.}
    do_encrypt_final*: proc (a0: ptr struct_st_ptls_aead_context_t_536871409;
                             a1: pointer): csize_t {.cdecl.}
    do_encrypt*: proc (a0: ptr struct_st_ptls_aead_context_t_536871409;
                       a1: pointer; a2: pointer; a3: csize_t; a4: uint64;
                       a5: pointer; a6: csize_t;
                       a7: ptr ptls_aead_supplementary_encryption_t_536871407): void {.
        cdecl.}
    do_encrypt_v*: proc (a0: ptr struct_st_ptls_aead_context_t_536871409;
                         a1: pointer; a2: ptr ptls_iovec_t_536871381;
                         a3: csize_t; a4: uint64; a5: pointer; a6: csize_t): void {.
        cdecl.}
    do_decrypt*: proc (a0: ptr struct_st_ptls_aead_context_t_536871409;
                       a1: pointer; a2: pointer; a3: csize_t; a4: uint64;
                       a5: pointer; a6: csize_t): csize_t {.cdecl.}
  struct_st_ptls_aead_algorithm_t_tls12_t {.pure, inheritable, bycopy.} = object
    fixed_iv_size*: csize_t
    record_iv_size*: csize_t
  struct_st_ptls_aead_algorithm_t_536871410 {.pure, inheritable, bycopy.} = object
    name*: cstring           ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:505:22
    confidentiality_limit*: uint64
    integrity_limit*: uint64
    ctr_cipher*: ptr ptls_cipher_algorithm_t_536871403
    ecb_cipher*: ptr ptls_cipher_algorithm_t_536871403
    key_size*: csize_t
    iv_size*: csize_t
    tag_size*: csize_t
    tls12*: struct_st_ptls_aead_algorithm_t_tls12_t
    non_temporal* {.bitsize: 1'i64.}: cuint
    align_bits*: uint8
    context_size*: csize_t
    setup_crypto*: proc (a0: ptr ptls_aead_context_t_536871413; a1: cint;
                         a2: pointer; a3: pointer): cint {.cdecl.}
  ptls_aead_context_t_536871412 = struct_st_ptls_aead_context_t_536871409 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:500:3
  ptls_aead_algorithm_t_536871414 = struct_st_ptls_aead_algorithm_t_536871411 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:566:3
  ptls_hash_final_mode_t_536871418 = enum_en_ptls_hash_final_mode_t_536871417 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:584:3
  struct_st_ptls_hash_context_t_536871420 {.pure, inheritable, bycopy.} = object
    update*: proc (a0: ptr struct_st_ptls_hash_context_t_536871421; a1: pointer;
                   a2: csize_t): void {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:589:16
    final*: proc (a0: ptr struct_st_ptls_hash_context_t_536871421; a1: pointer;
                  a2: ptls_hash_final_mode_t_536871419): void {.cdecl.}
    clone_private*: proc (a0: ptr struct_st_ptls_hash_context_t_536871421): ptr struct_st_ptls_hash_context_t_536871421 {.
        cdecl.}
  ptls_hash_context_t_536871422 = struct_st_ptls_hash_context_t_536871421 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:602:3
  struct_st_ptls_hash_algorithm_t_536871424 {.pure, inheritable, bycopy.} = object
    name*: cstring           ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:607:22
    block_size*: csize_t
    digest_size*: csize_t
    create*: proc (): ptr ptls_hash_context_t_536871423 {.cdecl.}
    empty_digest*: array[64'i64, uint8]
  ptls_hash_algorithm_t_536871426 = struct_st_ptls_hash_algorithm_t_536871425 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:628:3
  struct_st_ptls_cipher_suite_t_536871428 {.pure, inheritable, bycopy.} = object
    id*: uint16              ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:630:22
    aead*: ptr ptls_aead_algorithm_t_536871415
    hash*: ptr ptls_hash_algorithm_t_536871427
    name*: cstring
  ptls_cipher_suite_t_536871430 = struct_st_ptls_cipher_suite_t_536871429 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:647:3
  struct_st_ptls_message_emitter_t_536871432 {.pure, inheritable, bycopy.} = object
    buf*: ptr ptls_buffer_t_536871385 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:651:16
    enc*: ptr struct_st_ptls_traffic_protection_t
    record_header_length*: csize_t
    begin_message*: proc (a0: ptr struct_st_ptls_message_emitter_t_536871433): cint {.
        cdecl.}
    commit_message*: proc (a0: ptr struct_st_ptls_message_emitter_t_536871433): cint {.
        cdecl.}
  ptls_message_emitter_t_536871434 = struct_st_ptls_message_emitter_t_536871433 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:657:3
  struct_st_ptls_hpke_kem_t_536871436 {.pure, inheritable, bycopy.} = object
    id*: uint16              ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:662:22
    keyex*: ptr ptls_key_exchange_algorithm_t_536871395
    hash*: ptr ptls_hash_algorithm_t_536871427
  ptls_hpke_kem_t_536871438 = struct_st_ptls_hpke_kem_t_536871437 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:666:3
  struct_st_ptls_hpke_cipher_suite_id_t_536871440 {.pure, inheritable, bycopy.} = object
    kdf*: uint16             ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:668:16
    aead*: uint16
  ptls_hpke_cipher_suite_id_t_536871442 = struct_st_ptls_hpke_cipher_suite_id_t_536871441 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:671:3
  struct_st_ptls_hpke_cipher_suite_t_536871444 {.pure, inheritable, bycopy.} = object
    id*: ptls_hpke_cipher_suite_id_t_536871443 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:673:22
    name*: cstring
    hash*: ptr ptls_hash_algorithm_t_536871427
    aead*: ptr ptls_aead_algorithm_t_536871415
  ptls_hpke_cipher_suite_t_536871446 = struct_st_ptls_hpke_cipher_suite_t_536871445 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:678:3
  struct_st_ptls_client_hello_psk_identity_t_536871455 {.pure, inheritable,
      bycopy.} = object
    identity*: ptls_iovec_t_536871381 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:690:16
    obfuscated_ticket_age*: uint32
    binder*: ptls_iovec_t_536871381
  ptls_client_hello_psk_identity_t_536871457 = struct_st_ptls_client_hello_psk_identity_t_536871456 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:694:3
  struct_st_ptls_on_client_hello_parameters_t_negotiated_protocols_t {.pure,
      inheritable, bycopy.} = object
    list*: ptr ptls_iovec_t_536871381
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
    list*: ptr ptls_client_hello_psk_identity_t_536871458
    count*: csize_t
  struct_st_ptls_on_client_hello_parameters_t_536871459 {.pure, inheritable,
      bycopy.} = object
    server_name*: ptls_iovec_t_536871381 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:699:16
    raw_message*: ptls_iovec_t_536871381
    cipher_suites*: ptls_iovec_t_536871381
    negotiated_protocols*: struct_st_ptls_on_client_hello_parameters_t_negotiated_protocols_t
    signature_algorithms*: struct_st_ptls_on_client_hello_parameters_t_signature_algorithms_t
    certificate_compression_algorithms*: struct_st_ptls_on_client_hello_parameters_t_certificate_compression_algorithms_t
    server_certificate_types*: struct_st_ptls_on_client_hello_parameters_t_server_certificate_types_t
    psk_identities*: struct_st_ptls_on_client_hello_parameters_t_psk_identities_t
    incompatible_version* {.bitsize: 1'i64.}: cuint
  ptls_on_client_hello_parameters_t_536871461 = struct_st_ptls_on_client_hello_parameters_t_536871460 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:739:3
  struct_st_ptls_get_time_t_536871463 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_get_time_t_536871464): uint64 {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:744:1
  ptls_get_time_t_536871465 = struct_st_ptls_get_time_t_536871464 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:744:1
  struct_st_ptls_on_client_hello_t_536871467 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_on_client_hello_t_536871468;
               a1: ptr ptls_t_536871371;
               a2: ptr ptls_on_client_hello_parameters_t_536871462): cint {.
        cdecl.}              ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:749:1
  ptls_on_client_hello_t_536871469 = struct_st_ptls_on_client_hello_t_536871468 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:749:1
  struct_st_ptls_emit_certificate_t_536871471 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_emit_certificate_t_536871472;
               a1: ptr ptls_t_536871371; a2: ptr ptls_message_emitter_t_536871435;
               a3: ptr ptls_key_schedule_t_536871377; a4: ptls_iovec_t_536871381;
               a5: cint; a6: ptr uint16; a7: csize_t): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:753:1
  ptls_emit_certificate_t_536871473 = struct_st_ptls_emit_certificate_t_536871472 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:753:1
  struct_st_ptls_async_job_t_536871475 {.pure, inheritable, bycopy.} = object
    destroy_private*: proc (a0: ptr struct_st_ptls_async_job_t_536871476): void {.
        cdecl.}              ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:763:16
    get_fd*: proc (a0: ptr struct_st_ptls_async_job_t_536871476): cint {.cdecl.}
    set_completion_callback*: proc (a0: ptr struct_st_ptls_async_job_t_536871476;
                                    a1: proc (a0: pointer): void {.cdecl.};
                                    a2: pointer): void {.cdecl.}
  ptls_async_job_t_536871477 = struct_st_ptls_async_job_t_536871476 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:773:3
  struct_st_ptls_sign_certificate_t_536871479 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_sign_certificate_t_536871480;
               a1: ptr ptls_t_536871371; a2: ptr ptr ptls_async_job_t_536871478;
               a3: ptr uint16; a4: ptr ptls_buffer_t_536871385;
               a5: ptls_iovec_t_536871381; a6: ptr uint16; a7: csize_t): cint {.
        cdecl.}              ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:778:1
  ptls_sign_certificate_t_536871481 = struct_st_ptls_sign_certificate_t_536871480 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:778:1
  struct_st_ptls_verify_certificate_t_536871483 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_verify_certificate_t_536871484;
               a1: ptr ptls_t_536871371; a2: cstring; a3: proc (a0: pointer;
        a1: uint16; a2: ptls_iovec_t_536871381; a3: ptls_iovec_t_536871381): cint {.
        cdecl.}; a4: ptr pointer; a5: ptr ptls_iovec_t_536871381; a6: csize_t): cint {.
        cdecl.}              ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:789:16
    algos*: ptr uint16
  ptls_verify_certificate_t_536871485 = struct_st_ptls_verify_certificate_t_536871484 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:797:3
  struct_st_ptls_encrypt_ticket_t_536871487 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_encrypt_ticket_t_536871488;
               a1: ptr ptls_t_536871371; a2: cint; a3: ptr ptls_buffer_t_536871385;
               a4: ptls_iovec_t_536871381): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:804:1
  ptls_encrypt_ticket_t_536871489 = struct_st_ptls_encrypt_ticket_t_536871488 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:804:1
  struct_st_ptls_save_ticket_t_536871491 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_save_ticket_t_536871492; a1: ptr ptls_t_536871371;
               a2: ptls_iovec_t_536871381): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:808:1
  ptls_save_ticket_t_536871493 = struct_st_ptls_save_ticket_t_536871492 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:808:1
  struct_st_ptls_log_event_t_536871495 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_log_event_t_536871496; a1: ptr ptls_t_536871371;
               a2: cstring; a3: cstring): void {.cdecl, varargs.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:812:16
  ptls_log_event_t_536871497 = struct_st_ptls_log_event_t_536871496 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:815:3
  struct_st_ptls_update_open_count_t_536871499 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_update_open_count_t_536871500; a1: ssize_t_536871502): void {.
        cdecl.}              ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:819:1
  ssize_t_536871501 = compiler_ssize_t_536871582 ## Generated based on /usr/include/stdio.h:78:19
  ptls_update_open_count_t_536871503 = struct_st_ptls_update_open_count_t_536871500 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:819:1
  struct_st_ptls_update_traffic_key_t_536871505 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_update_traffic_key_t_536871506;
               a1: ptr ptls_t_536871371; a2: cint; a3: csize_t; a4: pointer): cint {.
        cdecl.}              ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:824:1
  ptls_update_traffic_key_t_536871507 = struct_st_ptls_update_traffic_key_t_536871506 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:824:1
  struct_st_ptls_on_extension_t_536871509 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_on_extension_t_536871510; a1: ptr ptls_t_536871371;
               a2: uint8; a3: uint16; a4: ptls_iovec_t_536871381): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:828:1
  ptls_on_extension_t_536871511 = struct_st_ptls_on_extension_t_536871510 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:828:1
  struct_st_ptls_decompress_certificate_t_536871513 {.pure, inheritable, bycopy.} = object
    supported_algorithms*: ptr uint16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:832:16
    cb*: proc (a0: ptr struct_st_ptls_decompress_certificate_t_536871514;
               a1: ptr ptls_t_536871371; a2: uint16; a3: ptls_iovec_t_536871381;
               a4: ptls_iovec_t_536871381): cint {.cdecl.}
  ptls_decompress_certificate_t_536871515 = struct_st_ptls_decompress_certificate_t_536871514 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:842:3
  struct_st_ptls_ech_create_opener_t_536871517 {.pure, inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_ech_create_opener_t_536871518;
               a1: ptr ptr ptls_hpke_kem_t_536871439;
               a2: ptr ptr ptls_hpke_cipher_suite_t_536871447; a3: ptr ptls_t_536871371;
               a4: uint8; a5: ptls_hpke_cipher_suite_id_t_536871443;
               a6: ptls_iovec_t_536871381; a7: ptls_iovec_t_536871381): ptr ptls_aead_context_t_536871413 {.
        cdecl.}              ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:848:1
  ptls_ech_create_opener_t_536871519 = struct_st_ptls_ech_create_opener_t_536871518 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:848:1
  struct_st_ptls_raw_extension_t_536871521 {.pure, inheritable, bycopy.} = object
    type_field*: uint16      ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:1059:16
    data*: ptls_iovec_t_536871381
  ptls_raw_extension_t_536871523 = struct_st_ptls_raw_extension_t_536871522 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:1062:3
  ptls_early_data_acceptance_t_536871527 = enum_en_ptls_early_data_acceptance_t_536871526 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:1068:3
  struct_st_ptls_handshake_properties_t_anon0_t_client_t_negotiated_protocols_t {.
      pure, inheritable, bycopy.} = object
    list*: ptr ptls_iovec_t_536871381
    count*: csize_t
  struct_st_ptls_handshake_properties_t_anon0_t_client_t_ech_t {.pure,
      inheritable, bycopy.} = object
    configs*: ptls_iovec_t_536871381
    retry_configs*: ptr ptls_iovec_t_536871381
  struct_st_ptls_handshake_properties_t_anon0_t_client_t {.pure, inheritable,
      bycopy.} = object
    negotiated_protocols*: struct_st_ptls_handshake_properties_t_anon0_t_client_t_negotiated_protocols_t
    session_ticket*: ptls_iovec_t_536871381
    max_early_data_size*: ptr csize_t
    early_data_acceptance*: ptls_early_data_acceptance_t_536871528
    negotiate_before_key_exchange* {.bitsize: 1'i64.}: cuint
    ech*: struct_st_ptls_handshake_properties_t_anon0_t_client_t_ech_t
  struct_st_ptls_handshake_properties_t_anon0_t_server_t_selected_psk_binder_t {.
      pure, inheritable, bycopy.} = object
    base*: array[64'i64, uint8]
    len*: csize_t
  struct_st_ptls_handshake_properties_t_anon0_t_server_t_cookie_t {.pure,
      inheritable, bycopy.} = object
    key*: pointer
    additional_data*: ptls_iovec_t_536871381
  struct_st_ptls_handshake_properties_t_anon0_t_server_t {.pure, inheritable,
      bycopy.} = object
    selected_psk_binder*: struct_st_ptls_handshake_properties_t_anon0_t_server_t_selected_psk_binder_t
    cookie*: struct_st_ptls_handshake_properties_t_anon0_t_server_t_cookie_t
    enforce_retry* {.bitsize: 1'i64.}: cuint
    retry_uses_cookie* {.bitsize: 1'i64.}: cuint
  struct_st_ptls_handshake_properties_t_anon0_t {.union, bycopy.} = object
    client*: struct_st_ptls_handshake_properties_t_anon0_t_client_t
    server*: struct_st_ptls_handshake_properties_t_anon0_t_server_t
  struct_st_ptls_handshake_properties_t_536871529 {.pure, inheritable, bycopy.} = object
    anon0*: struct_st_ptls_handshake_properties_t_anon0_t ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:1078:16
    additional_extensions*: ptr ptls_raw_extension_t_536871524
    collect_extension*: proc (a0: ptr ptls_t_536871371;
                              a1: ptr struct_st_ptls_handshake_properties_t_536871530;
                              a2: uint16): cint {.cdecl.}
    collected_extensions*: proc (a0: ptr ptls_t_536871371;
                                 a1: ptr struct_st_ptls_handshake_properties_t_536871530;
                                 a2: ptr ptls_raw_extension_t_536871524): cint {.
        cdecl.}
  ptls_handshake_properties_t_536871531 = struct_st_ptls_handshake_properties_t_536871530 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:1167:3
  struct_st_ptls_log_state_t_536871533 {.pure, inheritable, bycopy.} = object
    active_conns*: uint32    ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:1492:8
    generation*: uint64
  struct_st_ptls_log_point_t_536871535 {.pure, inheritable, bycopy.} = object
    name*: cstring           ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:1506:8
    state*: struct_st_ptls_log_state_t_536871534
  struct_st_ptls_log_conn_state_t_536871537 {.pure, inheritable, bycopy.} = object
    random_private*: cfloat  ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:1514:16
    address*: struct_in6_addr_536871540
    state*: struct_st_ptls_log_state_t_536871534
  struct_in6_addr_compiler_in6_u_t {.union, bycopy.} = object
    compiler_u6_addr8*: array[16'i64, uint8]
    compiler_u6_addr16*: array[8'i64, uint16]
    compiler_u6_addr32*: array[4'i64, uint32]
  struct_in6_addr_536871539 {.pure, inheritable, bycopy.} = object
    compiler_in6_u*: struct_in6_addr_compiler_in6_u_t ## Generated based on /usr/include/netinet/in.h:221:8
  ptls_log_conn_state_t_536871541 = struct_st_ptls_log_conn_state_t_536871538 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:1525:3
  struct_st_ptls_log_t_536871543 {.pure, inheritable, bycopy.} = object
    may_include_appdata* {.bitsize: 1'i64.}: cuint ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:1535:15
    dummy_conn_state*: ptls_log_conn_state_t_536871542
    internal_generation*: uint64
  struct_in_addr_536871545 {.pure, inheritable, bycopy.} = object
    s_addr*: in_addr_t_536871584 ## Generated based on /usr/include/netinet/in.h:31:8
  EVP_PKEY_536871547 = struct_evp_pkey_st ## Generated based on /usr/include/openssl/types.h:107:28
  struct_st_ptls_openssl_signature_scheme_t_536871549 {.pure, inheritable,
      bycopy.} = object
    scheme_id*: uint16       ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:150:16
    scheme_md*: proc (): ptr EVP_MD_536871552 {.cdecl.}
  EVP_MD_536871551 = struct_evp_md_st ## Generated based on /usr/include/openssl/types.h:103:26
  ptls_openssl_signature_scheme_t_536871553 = struct_st_ptls_openssl_signature_scheme_t_536871550 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:153:3
  struct_st_ptls_openssl_sign_certificate_t_536871555 {.pure, inheritable,
      bycopy.} = object
    super*: ptls_sign_certificate_t_536871482 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:165:16
    key*: ptr EVP_PKEY_536871548
    schemes*: ptr ptls_openssl_signature_scheme_t_536871554
    async* {.bitsize: 1'i64.}: cuint
  ptls_openssl_sign_certificate_t_536871557 = struct_st_ptls_openssl_sign_certificate_t_536871556 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:177:3
  X509_536871559 = struct_x509_st ## Generated based on /usr/include/openssl/types.h:157:24
  struct_st_ptls_openssl_raw_pubkey_verify_certificate_t_536871561 {.pure,
      inheritable, bycopy.} = object
    super*: ptls_verify_certificate_t_536871486 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:183:16
    expected_pubkey*: ptr EVP_PKEY_536871548
  ptls_openssl_raw_pubkey_verify_certificate_t_536871563 = struct_st_ptls_openssl_raw_pubkey_verify_certificate_t_536871562 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:186:3
  struct_st_ptls_openssl_override_verify_certificate_t_536871565 {.pure,
      inheritable, bycopy.} = object
    cb*: proc (a0: ptr struct_st_ptls_openssl_override_verify_certificate_t_536871566;
               a1: ptr ptls_t_536871371; a2: cint; a3: cint; a4: ptr X509_536871560;
               a5: ptr struct_stack_st_X509): cint {.cdecl.} ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:195:1
  ptls_openssl_override_verify_certificate_t_536871567 = struct_st_ptls_openssl_override_verify_certificate_t_536871566 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:195:1
  struct_st_ptls_openssl_verify_certificate_t_536871569 {.pure, inheritable,
      bycopy.} = object
    super*: ptls_verify_certificate_t_536871486 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:198:16
    cert_store*: ptr X509_STORE_536871572
    override_callback*: ptr ptls_openssl_override_verify_certificate_t_536871568
  X509_STORE_536871571 = struct_x509_store_st ## Generated based on /usr/include/openssl/types.h:164:30
  ptls_openssl_verify_certificate_t_536871573 = struct_st_ptls_openssl_verify_certificate_t_536871570 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:202:3
  EVP_CIPHER_CTX_536871575 = struct_evp_cipher_ctx_st ## Generated based on /usr/include/openssl/types.h:102:34
  HMAC_CTX_536871577 = struct_hmac_ctx_st ## Generated based on /usr/include/openssl/types.h:132:28
  EVP_MAC_CTX_536871579 = struct_evp_mac_ctx_st ## Generated based on /usr/include/openssl/types.h:106:31
  compiler_ssize_t_536871581 = clong ## Generated based on /usr/include/x86_64-linux-gnu/bits/types.h:194:27
  in_addr_t_536871583 = uint32 ## Generated based on /usr/include/netinet/in.h:30:18
  ptls_openssl_override_verify_certificate_t_536871568 = (when declared(
      ptls_openssl_override_verify_certificate_t):
    when ownSizeof(ptls_openssl_override_verify_certificate_t) !=
        ownSizeof(ptls_openssl_override_verify_certificate_t_536871567):
      static :
        warning("Declaration of " & "ptls_openssl_override_verify_certificate_t" &
            " exists but with different size")
    ptls_openssl_override_verify_certificate_t
   else:
    ptls_openssl_override_verify_certificate_t_536871567)
  ptls_client_hello_psk_identity_t_536871458 = (when declared(
      ptls_client_hello_psk_identity_t):
    when ownSizeof(ptls_client_hello_psk_identity_t) !=
        ownSizeof(ptls_client_hello_psk_identity_t_536871457):
      static :
        warning("Declaration of " & "ptls_client_hello_psk_identity_t" &
            " exists but with different size")
    ptls_client_hello_psk_identity_t
   else:
    ptls_client_hello_psk_identity_t_536871457)
  struct_st_ptls_update_open_count_t_536871500 = (when declared(
      struct_st_ptls_update_open_count_t):
    when ownSizeof(struct_st_ptls_update_open_count_t) !=
        ownSizeof(struct_st_ptls_update_open_count_t_536871499):
      static :
        warning("Declaration of " & "struct_st_ptls_update_open_count_t" &
            " exists but with different size")
    struct_st_ptls_update_open_count_t
   else:
    struct_st_ptls_update_open_count_t_536871499)
  struct_st_ptls_key_exchange_algorithm_t_536871389 = (when declared(
      struct_st_ptls_key_exchange_algorithm_t):
    when ownSizeof(struct_st_ptls_key_exchange_algorithm_t) !=
        ownSizeof(struct_st_ptls_key_exchange_algorithm_t_536871388):
      static :
        warning("Declaration of " & "struct_st_ptls_key_exchange_algorithm_t" &
            " exists but with different size")
    struct_st_ptls_key_exchange_algorithm_t
   else:
    struct_st_ptls_key_exchange_algorithm_t_536871388)
  ptls_emit_certificate_t_536871474 = (when declared(ptls_emit_certificate_t):
    when ownSizeof(ptls_emit_certificate_t) !=
        ownSizeof(ptls_emit_certificate_t_536871473):
      static :
        warning("Declaration of " & "ptls_emit_certificate_t" &
            " exists but with different size")
    ptls_emit_certificate_t
   else:
    ptls_emit_certificate_t_536871473)
  enum_en_ptls_early_data_acceptance_t_536871526 = (when declared(
      enum_en_ptls_early_data_acceptance_t):
    when ownSizeof(enum_en_ptls_early_data_acceptance_t) !=
        ownSizeof(enum_en_ptls_early_data_acceptance_t_536871525):
      static :
        warning("Declaration of " & "enum_en_ptls_early_data_acceptance_t" &
            " exists but with different size")
    enum_en_ptls_early_data_acceptance_t
   else:
    enum_en_ptls_early_data_acceptance_t_536871525)
  struct_st_ptls_aead_algorithm_t_536871411 = (when declared(
      struct_st_ptls_aead_algorithm_t):
    when ownSizeof(struct_st_ptls_aead_algorithm_t) !=
        ownSizeof(struct_st_ptls_aead_algorithm_t_536871410):
      static :
        warning("Declaration of " & "struct_st_ptls_aead_algorithm_t" &
            " exists but with different size")
    struct_st_ptls_aead_algorithm_t
   else:
    struct_st_ptls_aead_algorithm_t_536871410)
  struct_in_addr_536871546 = (when declared(struct_in_addr):
    when ownSizeof(struct_in_addr) != ownSizeof(struct_in_addr_536871545):
      static :
        warning("Declaration of " & "struct_in_addr" &
            " exists but with different size")
    struct_in_addr
   else:
    struct_in_addr_536871545)
  struct_st_ptls_hash_context_t_536871421 = (when declared(
      struct_st_ptls_hash_context_t):
    when ownSizeof(struct_st_ptls_hash_context_t) !=
        ownSizeof(struct_st_ptls_hash_context_t_536871420):
      static :
        warning("Declaration of " & "struct_st_ptls_hash_context_t" &
            " exists but with different size")
    struct_st_ptls_hash_context_t
   else:
    struct_st_ptls_hash_context_t_536871420)
  struct_st_ptls_message_emitter_t_536871433 = (when declared(
      struct_st_ptls_message_emitter_t):
    when ownSizeof(struct_st_ptls_message_emitter_t) !=
        ownSizeof(struct_st_ptls_message_emitter_t_536871432):
      static :
        warning("Declaration of " & "struct_st_ptls_message_emitter_t" &
            " exists but with different size")
    struct_st_ptls_message_emitter_t
   else:
    struct_st_ptls_message_emitter_t_536871432)
  ptls_hpke_cipher_suite_t_536871447 = (when declared(ptls_hpke_cipher_suite_t):
    when ownSizeof(ptls_hpke_cipher_suite_t) !=
        ownSizeof(ptls_hpke_cipher_suite_t_536871446):
      static :
        warning("Declaration of " & "ptls_hpke_cipher_suite_t" &
            " exists but with different size")
    ptls_hpke_cipher_suite_t
   else:
    ptls_hpke_cipher_suite_t_536871446)
  ptls_aead_context_t_536871413 = (when declared(ptls_aead_context_t):
    when ownSizeof(ptls_aead_context_t) != ownSizeof(ptls_aead_context_t_536871412):
      static :
        warning("Declaration of " & "ptls_aead_context_t" &
            " exists but with different size")
    ptls_aead_context_t
   else:
    ptls_aead_context_t_536871412)
  ptls_openssl_verify_certificate_t_536871574 = (when declared(
      ptls_openssl_verify_certificate_t):
    when ownSizeof(ptls_openssl_verify_certificate_t) !=
        ownSizeof(ptls_openssl_verify_certificate_t_536871573):
      static :
        warning("Declaration of " & "ptls_openssl_verify_certificate_t" &
            " exists but with different size")
    ptls_openssl_verify_certificate_t
   else:
    ptls_openssl_verify_certificate_t_536871573)
  struct_st_ptls_aead_context_t_536871409 = (when declared(
      struct_st_ptls_aead_context_t):
    when ownSizeof(struct_st_ptls_aead_context_t) !=
        ownSizeof(struct_st_ptls_aead_context_t_536871408):
      static :
        warning("Declaration of " & "struct_st_ptls_aead_context_t" &
            " exists but with different size")
    struct_st_ptls_aead_context_t
   else:
    struct_st_ptls_aead_context_t_536871408)
  struct_st_ptls_decompress_certificate_t_536871514 = (when declared(
      struct_st_ptls_decompress_certificate_t):
    when ownSizeof(struct_st_ptls_decompress_certificate_t) !=
        ownSizeof(struct_st_ptls_decompress_certificate_t_536871513):
      static :
        warning("Declaration of " & "struct_st_ptls_decompress_certificate_t" &
            " exists but with different size")
    struct_st_ptls_decompress_certificate_t
   else:
    struct_st_ptls_decompress_certificate_t_536871513)
  ptls_hpke_cipher_suite_id_t_536871443 = (when declared(
      ptls_hpke_cipher_suite_id_t):
    when ownSizeof(ptls_hpke_cipher_suite_id_t) !=
        ownSizeof(ptls_hpke_cipher_suite_id_t_536871442):
      static :
        warning("Declaration of " & "ptls_hpke_cipher_suite_id_t" &
            " exists but with different size")
    ptls_hpke_cipher_suite_id_t
   else:
    ptls_hpke_cipher_suite_id_t_536871442)
  ptls_key_exchange_context_t_536871391 = (when declared(
      ptls_key_exchange_context_t):
    when ownSizeof(ptls_key_exchange_context_t) !=
        ownSizeof(ptls_key_exchange_context_t_536871390):
      static :
        warning("Declaration of " & "ptls_key_exchange_context_t" &
            " exists but with different size")
    ptls_key_exchange_context_t
   else:
    ptls_key_exchange_context_t_536871390)
  struct_st_ptls_on_extension_t_536871510 = (when declared(
      struct_st_ptls_on_extension_t):
    when ownSizeof(struct_st_ptls_on_extension_t) !=
        ownSizeof(struct_st_ptls_on_extension_t_536871509):
      static :
        warning("Declaration of " & "struct_st_ptls_on_extension_t" &
            " exists but with different size")
    struct_st_ptls_on_extension_t
   else:
    struct_st_ptls_on_extension_t_536871509)
  struct_st_ptls_on_client_hello_t_536871468 = (when declared(
      struct_st_ptls_on_client_hello_t):
    when ownSizeof(struct_st_ptls_on_client_hello_t) !=
        ownSizeof(struct_st_ptls_on_client_hello_t_536871467):
      static :
        warning("Declaration of " & "struct_st_ptls_on_client_hello_t" &
            " exists but with different size")
    struct_st_ptls_on_client_hello_t
   else:
    struct_st_ptls_on_client_hello_t_536871467)
  struct_st_ptls_hpke_cipher_suite_id_t_536871441 = (when declared(
      struct_st_ptls_hpke_cipher_suite_id_t):
    when ownSizeof(struct_st_ptls_hpke_cipher_suite_id_t) !=
        ownSizeof(struct_st_ptls_hpke_cipher_suite_id_t_536871440):
      static :
        warning("Declaration of " & "struct_st_ptls_hpke_cipher_suite_id_t" &
            " exists but with different size")
    struct_st_ptls_hpke_cipher_suite_id_t
   else:
    struct_st_ptls_hpke_cipher_suite_id_t_536871440)
  EVP_MD_536871552 = (when declared(EVP_MD):
    when ownSizeof(EVP_MD) != ownSizeof(EVP_MD_536871551):
      static :
        warning("Declaration of " & "EVP_MD" & " exists but with different size")
    EVP_MD
   else:
    EVP_MD_536871551)
  ptls_cipher_suite_t_536871431 = (when declared(ptls_cipher_suite_t):
    when ownSizeof(ptls_cipher_suite_t) != ownSizeof(ptls_cipher_suite_t_536871430):
      static :
        warning("Declaration of " & "ptls_cipher_suite_t" &
            " exists but with different size")
    ptls_cipher_suite_t
   else:
    ptls_cipher_suite_t_536871430)
  struct_st_ptls_iovec_t_536871379 = (when declared(struct_st_ptls_iovec_t):
    when ownSizeof(struct_st_ptls_iovec_t) != ownSizeof(struct_st_ptls_iovec_t_536871378):
      static :
        warning("Declaration of " & "struct_st_ptls_iovec_t" &
            " exists but with different size")
    struct_st_ptls_iovec_t
   else:
    struct_st_ptls_iovec_t_536871378)
  ptls_encrypt_ticket_t_536871490 = (when declared(ptls_encrypt_ticket_t):
    when ownSizeof(ptls_encrypt_ticket_t) != ownSizeof(ptls_encrypt_ticket_t_536871489):
      static :
        warning("Declaration of " & "ptls_encrypt_ticket_t" &
            " exists but with different size")
    ptls_encrypt_ticket_t
   else:
    ptls_encrypt_ticket_t_536871489)
  ptls_message_emitter_t_536871435 = (when declared(ptls_message_emitter_t):
    when ownSizeof(ptls_message_emitter_t) != ownSizeof(ptls_message_emitter_t_536871434):
      static :
        warning("Declaration of " & "ptls_message_emitter_t" &
            " exists but with different size")
    ptls_message_emitter_t
   else:
    ptls_message_emitter_t_536871434)
  enum_en_ptls_hash_final_mode_t_536871417 = (when declared(
      enum_en_ptls_hash_final_mode_t):
    when ownSizeof(enum_en_ptls_hash_final_mode_t) !=
        ownSizeof(enum_en_ptls_hash_final_mode_t_536871416):
      static :
        warning("Declaration of " & "enum_en_ptls_hash_final_mode_t" &
            " exists but with different size")
    enum_en_ptls_hash_final_mode_t
   else:
    enum_en_ptls_hash_final_mode_t_536871416)
  EVP_CIPHER_CTX_536871576 = (when declared(EVP_CIPHER_CTX):
    when ownSizeof(EVP_CIPHER_CTX) != ownSizeof(EVP_CIPHER_CTX_536871575):
      static :
        warning("Declaration of " & "EVP_CIPHER_CTX" &
            " exists but with different size")
    EVP_CIPHER_CTX
   else:
    EVP_CIPHER_CTX_536871575)
  struct_st_ptls_context_t_536871375 = (when declared(struct_st_ptls_context_t):
    when ownSizeof(struct_st_ptls_context_t) !=
        ownSizeof(struct_st_ptls_context_t_536871374):
      static :
        warning("Declaration of " & "struct_st_ptls_context_t" &
            " exists but with different size")
    struct_st_ptls_context_t
   else:
    struct_st_ptls_context_t_536871374)
  struct_st_ptls_aead_supplementary_encryption_t_536871405 = (when declared(
      struct_st_ptls_aead_supplementary_encryption_t):
    when ownSizeof(struct_st_ptls_aead_supplementary_encryption_t) !=
        ownSizeof(struct_st_ptls_aead_supplementary_encryption_t_536871404):
      static :
        warning("Declaration of " &
            "struct_st_ptls_aead_supplementary_encryption_t" &
            " exists but with different size")
    struct_st_ptls_aead_supplementary_encryption_t
   else:
    struct_st_ptls_aead_supplementary_encryption_t_536871404)
  struct_st_ptls_cipher_suite_t_536871429 = (when declared(
      struct_st_ptls_cipher_suite_t):
    when ownSizeof(struct_st_ptls_cipher_suite_t) !=
        ownSizeof(struct_st_ptls_cipher_suite_t_536871428):
      static :
        warning("Declaration of " & "struct_st_ptls_cipher_suite_t" &
            " exists but with different size")
    struct_st_ptls_cipher_suite_t
   else:
    struct_st_ptls_cipher_suite_t_536871428)
  ptls_cipher_algorithm_t_536871403 = (when declared(ptls_cipher_algorithm_t):
    when ownSizeof(ptls_cipher_algorithm_t) !=
        ownSizeof(ptls_cipher_algorithm_t_536871402):
      static :
        warning("Declaration of " & "ptls_cipher_algorithm_t" &
            " exists but with different size")
    ptls_cipher_algorithm_t
   else:
    ptls_cipher_algorithm_t_536871402)
  ptls_openssl_sign_certificate_t_536871558 = (when declared(
      ptls_openssl_sign_certificate_t):
    when ownSizeof(ptls_openssl_sign_certificate_t) !=
        ownSizeof(ptls_openssl_sign_certificate_t_536871557):
      static :
        warning("Declaration of " & "ptls_openssl_sign_certificate_t" &
            " exists but with different size")
    ptls_openssl_sign_certificate_t
   else:
    ptls_openssl_sign_certificate_t_536871557)
  X509_536871560 = (when declared(X509):
    when ownSizeof(X509) != ownSizeof(X509_536871559):
      static :
        warning("Declaration of " & "X509" & " exists but with different size")
    X509
   else:
    X509_536871559)
  compiler_ssize_t_536871582 = (when declared(compiler_ssize_t):
    when ownSizeof(compiler_ssize_t) != ownSizeof(compiler_ssize_t_536871581):
      static :
        warning("Declaration of " & "compiler_ssize_t" &
            " exists but with different size")
    compiler_ssize_t
   else:
    compiler_ssize_t_536871581)
  ptls_hpke_kem_t_536871439 = (when declared(ptls_hpke_kem_t):
    when ownSizeof(ptls_hpke_kem_t) != ownSizeof(ptls_hpke_kem_t_536871438):
      static :
        warning("Declaration of " & "ptls_hpke_kem_t" &
            " exists but with different size")
    ptls_hpke_kem_t
   else:
    ptls_hpke_kem_t_536871438)
  ptls_key_schedule_t_536871377 = (when declared(ptls_key_schedule_t):
    when ownSizeof(ptls_key_schedule_t) != ownSizeof(ptls_key_schedule_t_536871376):
      static :
        warning("Declaration of " & "ptls_key_schedule_t" &
            " exists but with different size")
    ptls_key_schedule_t
   else:
    ptls_key_schedule_t_536871376)
  ptls_key_exchange_algorithm_t_536871395 = (when declared(
      ptls_key_exchange_algorithm_t):
    when ownSizeof(ptls_key_exchange_algorithm_t) !=
        ownSizeof(ptls_key_exchange_algorithm_t_536871394):
      static :
        warning("Declaration of " & "ptls_key_exchange_algorithm_t" &
            " exists but with different size")
    ptls_key_exchange_algorithm_t
   else:
    ptls_key_exchange_algorithm_t_536871394)
  ptls_aead_supplementary_encryption_t_536871407 = (when declared(
      ptls_aead_supplementary_encryption_t):
    when ownSizeof(ptls_aead_supplementary_encryption_t) !=
        ownSizeof(ptls_aead_supplementary_encryption_t_536871406):
      static :
        warning("Declaration of " & "ptls_aead_supplementary_encryption_t" &
            " exists but with different size")
    ptls_aead_supplementary_encryption_t
   else:
    ptls_aead_supplementary_encryption_t_536871406)
  struct_st_ptls_sign_certificate_t_536871480 = (when declared(
      struct_st_ptls_sign_certificate_t):
    when ownSizeof(struct_st_ptls_sign_certificate_t) !=
        ownSizeof(struct_st_ptls_sign_certificate_t_536871479):
      static :
        warning("Declaration of " & "struct_st_ptls_sign_certificate_t" &
            " exists but with different size")
    struct_st_ptls_sign_certificate_t
   else:
    struct_st_ptls_sign_certificate_t_536871479)
  ptls_on_extension_t_536871512 = (when declared(ptls_on_extension_t):
    when ownSizeof(ptls_on_extension_t) != ownSizeof(ptls_on_extension_t_536871511):
      static :
        warning("Declaration of " & "ptls_on_extension_t" &
            " exists but with different size")
    ptls_on_extension_t
   else:
    ptls_on_extension_t_536871511)
  EVP_MAC_CTX_536871580 = (when declared(EVP_MAC_CTX):
    when ownSizeof(EVP_MAC_CTX) != ownSizeof(EVP_MAC_CTX_536871579):
      static :
        warning("Declaration of " & "EVP_MAC_CTX" &
            " exists but with different size")
    EVP_MAC_CTX
   else:
    EVP_MAC_CTX_536871579)
  struct_st_ptls_emit_certificate_t_536871472 = (when declared(
      struct_st_ptls_emit_certificate_t):
    when ownSizeof(struct_st_ptls_emit_certificate_t) !=
        ownSizeof(struct_st_ptls_emit_certificate_t_536871471):
      static :
        warning("Declaration of " & "struct_st_ptls_emit_certificate_t" &
            " exists but with different size")
    struct_st_ptls_emit_certificate_t
   else:
    struct_st_ptls_emit_certificate_t_536871471)
  ptls_raw_extension_t_536871524 = (when declared(ptls_raw_extension_t):
    when ownSizeof(ptls_raw_extension_t) != ownSizeof(ptls_raw_extension_t_536871523):
      static :
        warning("Declaration of " & "ptls_raw_extension_t" &
            " exists but with different size")
    ptls_raw_extension_t
   else:
    ptls_raw_extension_t_536871523)
  struct_in6_addr_536871540 = (when declared(struct_in6_addr):
    when ownSizeof(struct_in6_addr) != ownSizeof(struct_in6_addr_536871539):
      static :
        warning("Declaration of " & "struct_in6_addr" &
            " exists but with different size")
    struct_in6_addr
   else:
    struct_in6_addr_536871539)
  struct_st_ptls_hash_algorithm_t_536871425 = (when declared(
      struct_st_ptls_hash_algorithm_t):
    when ownSizeof(struct_st_ptls_hash_algorithm_t) !=
        ownSizeof(struct_st_ptls_hash_algorithm_t_536871424):
      static :
        warning("Declaration of " & "struct_st_ptls_hash_algorithm_t" &
            " exists but with different size")
    struct_st_ptls_hash_algorithm_t
   else:
    struct_st_ptls_hash_algorithm_t_536871424)
  ptls_iovec_t_536871381 = (when declared(ptls_iovec_t):
    when ownSizeof(ptls_iovec_t) != ownSizeof(ptls_iovec_t_536871380):
      static :
        warning("Declaration of " & "ptls_iovec_t" &
            " exists but with different size")
    ptls_iovec_t
   else:
    ptls_iovec_t_536871380)
  ptls_hash_context_t_536871423 = (when declared(ptls_hash_context_t):
    when ownSizeof(ptls_hash_context_t) != ownSizeof(ptls_hash_context_t_536871422):
      static :
        warning("Declaration of " & "ptls_hash_context_t" &
            " exists but with different size")
    ptls_hash_context_t
   else:
    ptls_hash_context_t_536871422)
  ptls_verify_certificate_t_536871486 = (when declared(ptls_verify_certificate_t):
    when ownSizeof(ptls_verify_certificate_t) !=
        ownSizeof(ptls_verify_certificate_t_536871485):
      static :
        warning("Declaration of " & "ptls_verify_certificate_t" &
            " exists but with different size")
    ptls_verify_certificate_t
   else:
    ptls_verify_certificate_t_536871485)
  ptls_buffer_t_536871385 = (when declared(ptls_buffer_t):
    when ownSizeof(ptls_buffer_t) != ownSizeof(ptls_buffer_t_536871384):
      static :
        warning("Declaration of " & "ptls_buffer_t" &
            " exists but with different size")
    ptls_buffer_t
   else:
    ptls_buffer_t_536871384)
  ssize_t_536871502 = (when declared(ssize_t):
    when ownSizeof(ssize_t) != ownSizeof(ssize_t_536871501):
      static :
        warning("Declaration of " & "ssize_t" &
            " exists but with different size")
    ssize_t
   else:
    ssize_t_536871501)
  ptls_handshake_properties_t_536871532 = (when declared(
      ptls_handshake_properties_t):
    when ownSizeof(ptls_handshake_properties_t) !=
        ownSizeof(ptls_handshake_properties_t_536871531):
      static :
        warning("Declaration of " & "ptls_handshake_properties_t" &
            " exists but with different size")
    ptls_handshake_properties_t
   else:
    ptls_handshake_properties_t_536871531)
  struct_st_ptls_log_t_536871544 = (when declared(struct_st_ptls_log_t):
    when ownSizeof(struct_st_ptls_log_t) != ownSizeof(struct_st_ptls_log_t_536871543):
      static :
        warning("Declaration of " & "struct_st_ptls_log_t" &
            " exists but with different size")
    struct_st_ptls_log_t
   else:
    struct_st_ptls_log_t_536871543)
  ptls_aead_algorithm_t_536871415 = (when declared(ptls_aead_algorithm_t):
    when ownSizeof(ptls_aead_algorithm_t) != ownSizeof(ptls_aead_algorithm_t_536871414):
      static :
        warning("Declaration of " & "ptls_aead_algorithm_t" &
            " exists but with different size")
    ptls_aead_algorithm_t
   else:
    ptls_aead_algorithm_t_536871414)
  struct_st_ptls_on_client_hello_parameters_t_536871460 = (when declared(
      struct_st_ptls_on_client_hello_parameters_t):
    when ownSizeof(struct_st_ptls_on_client_hello_parameters_t) !=
        ownSizeof(struct_st_ptls_on_client_hello_parameters_t_536871459):
      static :
        warning("Declaration of " &
            "struct_st_ptls_on_client_hello_parameters_t" &
            " exists but with different size")
    struct_st_ptls_on_client_hello_parameters_t
   else:
    struct_st_ptls_on_client_hello_parameters_t_536871459)
  ptls_early_data_acceptance_t_536871528 = (when declared(
      ptls_early_data_acceptance_t):
    when ownSizeof(ptls_early_data_acceptance_t) !=
        ownSizeof(ptls_early_data_acceptance_t_536871527):
      static :
        warning("Declaration of " & "ptls_early_data_acceptance_t" &
            " exists but with different size")
    ptls_early_data_acceptance_t
   else:
    ptls_early_data_acceptance_t_536871527)
  ptls_get_time_t_536871466 = (when declared(ptls_get_time_t):
    when ownSizeof(ptls_get_time_t) != ownSizeof(ptls_get_time_t_536871465):
      static :
        warning("Declaration of " & "ptls_get_time_t" &
            " exists but with different size")
    ptls_get_time_t
   else:
    ptls_get_time_t_536871465)
  ptls_decompress_certificate_t_536871516 = (when declared(
      ptls_decompress_certificate_t):
    when ownSizeof(ptls_decompress_certificate_t) !=
        ownSizeof(ptls_decompress_certificate_t_536871515):
      static :
        warning("Declaration of " & "ptls_decompress_certificate_t" &
            " exists but with different size")
    ptls_decompress_certificate_t
   else:
    ptls_decompress_certificate_t_536871515)
  ptls_ech_create_opener_t_536871520 = (when declared(ptls_ech_create_opener_t):
    when ownSizeof(ptls_ech_create_opener_t) !=
        ownSizeof(ptls_ech_create_opener_t_536871519):
      static :
        warning("Declaration of " & "ptls_ech_create_opener_t" &
            " exists but with different size")
    ptls_ech_create_opener_t
   else:
    ptls_ech_create_opener_t_536871519)
  ptls_openssl_raw_pubkey_verify_certificate_t_536871564 = (when declared(
      ptls_openssl_raw_pubkey_verify_certificate_t):
    when ownSizeof(ptls_openssl_raw_pubkey_verify_certificate_t) !=
        ownSizeof(ptls_openssl_raw_pubkey_verify_certificate_t_536871563):
      static :
        warning("Declaration of " &
            "ptls_openssl_raw_pubkey_verify_certificate_t" &
            " exists but with different size")
    ptls_openssl_raw_pubkey_verify_certificate_t
   else:
    ptls_openssl_raw_pubkey_verify_certificate_t_536871563)
  intptr_t_536871393 = (when declared(intptr_t):
    when ownSizeof(intptr_t) != ownSizeof(intptr_t_536871392):
      static :
        warning("Declaration of " & "intptr_t" &
            " exists but with different size")
    intptr_t
   else:
    intptr_t_536871392)
  ptls_update_traffic_key_t_536871508 = (when declared(ptls_update_traffic_key_t):
    when ownSizeof(ptls_update_traffic_key_t) !=
        ownSizeof(ptls_update_traffic_key_t_536871507):
      static :
        warning("Declaration of " & "ptls_update_traffic_key_t" &
            " exists but with different size")
    ptls_update_traffic_key_t
   else:
    ptls_update_traffic_key_t_536871507)
  ptls_log_event_t_536871498 = (when declared(ptls_log_event_t):
    when ownSizeof(ptls_log_event_t) != ownSizeof(ptls_log_event_t_536871497):
      static :
        warning("Declaration of " & "ptls_log_event_t" &
            " exists but with different size")
    ptls_log_event_t
   else:
    ptls_log_event_t_536871497)
  ptls_t_536871371 = (when declared(ptls_t):
    when ownSizeof(ptls_t) != ownSizeof(ptls_t_536871370):
      static :
        warning("Declaration of " & "ptls_t" & " exists but with different size")
    ptls_t
   else:
    ptls_t_536871370)
  struct_st_ptls_cipher_algorithm_t_536871399 = (when declared(
      struct_st_ptls_cipher_algorithm_t):
    when ownSizeof(struct_st_ptls_cipher_algorithm_t) !=
        ownSizeof(struct_st_ptls_cipher_algorithm_t_536871398):
      static :
        warning("Declaration of " & "struct_st_ptls_cipher_algorithm_t" &
            " exists but with different size")
    struct_st_ptls_cipher_algorithm_t
   else:
    struct_st_ptls_cipher_algorithm_t_536871398)
  struct_st_ptls_hpke_kem_t_536871437 = (when declared(struct_st_ptls_hpke_kem_t):
    when ownSizeof(struct_st_ptls_hpke_kem_t) !=
        ownSizeof(struct_st_ptls_hpke_kem_t_536871436):
      static :
        warning("Declaration of " & "struct_st_ptls_hpke_kem_t" &
            " exists but with different size")
    struct_st_ptls_hpke_kem_t
   else:
    struct_st_ptls_hpke_kem_t_536871436)
  struct_st_ptls_openssl_signature_scheme_t_536871550 = (when declared(
      struct_st_ptls_openssl_signature_scheme_t):
    when ownSizeof(struct_st_ptls_openssl_signature_scheme_t) !=
        ownSizeof(struct_st_ptls_openssl_signature_scheme_t_536871549):
      static :
        warning("Declaration of " & "struct_st_ptls_openssl_signature_scheme_t" &
            " exists but with different size")
    struct_st_ptls_openssl_signature_scheme_t
   else:
    struct_st_ptls_openssl_signature_scheme_t_536871549)
  struct_st_ptls_raw_extension_t_536871522 = (when declared(
      struct_st_ptls_raw_extension_t):
    when ownSizeof(struct_st_ptls_raw_extension_t) !=
        ownSizeof(struct_st_ptls_raw_extension_t_536871521):
      static :
        warning("Declaration of " & "struct_st_ptls_raw_extension_t" &
            " exists but with different size")
    struct_st_ptls_raw_extension_t
   else:
    struct_st_ptls_raw_extension_t_536871521)
  struct_st_ptls_openssl_raw_pubkey_verify_certificate_t_536871562 = (when declared(
      struct_st_ptls_openssl_raw_pubkey_verify_certificate_t):
    when ownSizeof(struct_st_ptls_openssl_raw_pubkey_verify_certificate_t) !=
        ownSizeof(struct_st_ptls_openssl_raw_pubkey_verify_certificate_t_536871561):
      static :
        warning("Declaration of " &
            "struct_st_ptls_openssl_raw_pubkey_verify_certificate_t" &
            " exists but with different size")
    struct_st_ptls_openssl_raw_pubkey_verify_certificate_t
   else:
    struct_st_ptls_openssl_raw_pubkey_verify_certificate_t_536871561)
  struct_st_ptls_ech_create_opener_t_536871518 = (when declared(
      struct_st_ptls_ech_create_opener_t):
    when ownSizeof(struct_st_ptls_ech_create_opener_t) !=
        ownSizeof(struct_st_ptls_ech_create_opener_t_536871517):
      static :
        warning("Declaration of " & "struct_st_ptls_ech_create_opener_t" &
            " exists but with different size")
    struct_st_ptls_ech_create_opener_t
   else:
    struct_st_ptls_ech_create_opener_t_536871517)
  struct_st_ptls_log_point_t_536871536 = (when declared(
      struct_st_ptls_log_point_t):
    when ownSizeof(struct_st_ptls_log_point_t) !=
        ownSizeof(struct_st_ptls_log_point_t_536871535):
      static :
        warning("Declaration of " & "struct_st_ptls_log_point_t" &
            " exists but with different size")
    struct_st_ptls_log_point_t
   else:
    struct_st_ptls_log_point_t_536871535)
  struct_st_ptls_key_exchange_context_t_536871387 = (when declared(
      struct_st_ptls_key_exchange_context_t):
    when ownSizeof(struct_st_ptls_key_exchange_context_t) !=
        ownSizeof(struct_st_ptls_key_exchange_context_t_536871386):
      static :
        warning("Declaration of " & "struct_st_ptls_key_exchange_context_t" &
            " exists but with different size")
    struct_st_ptls_key_exchange_context_t
   else:
    struct_st_ptls_key_exchange_context_t_536871386)
  struct_st_ptls_verify_certificate_t_536871484 = (when declared(
      struct_st_ptls_verify_certificate_t):
    when ownSizeof(struct_st_ptls_verify_certificate_t) !=
        ownSizeof(struct_st_ptls_verify_certificate_t_536871483):
      static :
        warning("Declaration of " & "struct_st_ptls_verify_certificate_t" &
            " exists but with different size")
    struct_st_ptls_verify_certificate_t
   else:
    struct_st_ptls_verify_certificate_t_536871483)
  in_addr_t_536871584 = (when declared(in_addr_t):
    when ownSizeof(in_addr_t) != ownSizeof(in_addr_t_536871583):
      static :
        warning("Declaration of " & "in_addr_t" &
            " exists but with different size")
    in_addr_t
   else:
    in_addr_t_536871583)
  ptls_hash_final_mode_t_536871419 = (when declared(ptls_hash_final_mode_t):
    when ownSizeof(ptls_hash_final_mode_t) != ownSizeof(ptls_hash_final_mode_t_536871418):
      static :
        warning("Declaration of " & "ptls_hash_final_mode_t" &
            " exists but with different size")
    ptls_hash_final_mode_t
   else:
    ptls_hash_final_mode_t_536871418)
  struct_st_ptls_cipher_context_t_536871397 = (when declared(
      struct_st_ptls_cipher_context_t):
    when ownSizeof(struct_st_ptls_cipher_context_t) !=
        ownSizeof(struct_st_ptls_cipher_context_t_536871396):
      static :
        warning("Declaration of " & "struct_st_ptls_cipher_context_t" &
            " exists but with different size")
    struct_st_ptls_cipher_context_t
   else:
    struct_st_ptls_cipher_context_t_536871396)
  EVP_PKEY_536871548 = (when declared(EVP_PKEY):
    when ownSizeof(EVP_PKEY) != ownSizeof(EVP_PKEY_536871547):
      static :
        warning("Declaration of " & "EVP_PKEY" &
            " exists but with different size")
    EVP_PKEY
   else:
    EVP_PKEY_536871547)
  struct_st_ptls_log_conn_state_t_536871538 = (when declared(
      struct_st_ptls_log_conn_state_t):
    when ownSizeof(struct_st_ptls_log_conn_state_t) !=
        ownSizeof(struct_st_ptls_log_conn_state_t_536871537):
      static :
        warning("Declaration of " & "struct_st_ptls_log_conn_state_t" &
            " exists but with different size")
    struct_st_ptls_log_conn_state_t
   else:
    struct_st_ptls_log_conn_state_t_536871537)
  struct_st_ptls_update_traffic_key_t_536871506 = (when declared(
      struct_st_ptls_update_traffic_key_t):
    when ownSizeof(struct_st_ptls_update_traffic_key_t) !=
        ownSizeof(struct_st_ptls_update_traffic_key_t_536871505):
      static :
        warning("Declaration of " & "struct_st_ptls_update_traffic_key_t" &
            " exists but with different size")
    struct_st_ptls_update_traffic_key_t
   else:
    struct_st_ptls_update_traffic_key_t_536871505)
  struct_st_ptls_encrypt_ticket_t_536871488 = (when declared(
      struct_st_ptls_encrypt_ticket_t):
    when ownSizeof(struct_st_ptls_encrypt_ticket_t) !=
        ownSizeof(struct_st_ptls_encrypt_ticket_t_536871487):
      static :
        warning("Declaration of " & "struct_st_ptls_encrypt_ticket_t" &
            " exists but with different size")
    struct_st_ptls_encrypt_ticket_t
   else:
    struct_st_ptls_encrypt_ticket_t_536871487)
  ptls_save_ticket_t_536871494 = (when declared(ptls_save_ticket_t):
    when ownSizeof(ptls_save_ticket_t) != ownSizeof(ptls_save_ticket_t_536871493):
      static :
        warning("Declaration of " & "ptls_save_ticket_t" &
            " exists but with different size")
    ptls_save_ticket_t
   else:
    ptls_save_ticket_t_536871493)
  ptls_on_client_hello_parameters_t_536871462 = (when declared(
      ptls_on_client_hello_parameters_t):
    when ownSizeof(ptls_on_client_hello_parameters_t) !=
        ownSizeof(ptls_on_client_hello_parameters_t_536871461):
      static :
        warning("Declaration of " & "ptls_on_client_hello_parameters_t" &
            " exists but with different size")
    ptls_on_client_hello_parameters_t
   else:
    ptls_on_client_hello_parameters_t_536871461)
  struct_st_ptls_save_ticket_t_536871492 = (when declared(
      struct_st_ptls_save_ticket_t):
    when ownSizeof(struct_st_ptls_save_ticket_t) !=
        ownSizeof(struct_st_ptls_save_ticket_t_536871491):
      static :
        warning("Declaration of " & "struct_st_ptls_save_ticket_t" &
            " exists but with different size")
    struct_st_ptls_save_ticket_t
   else:
    struct_st_ptls_save_ticket_t_536871491)
  ptls_update_open_count_t_536871504 = (when declared(ptls_update_open_count_t):
    when ownSizeof(ptls_update_open_count_t) !=
        ownSizeof(ptls_update_open_count_t_536871503):
      static :
        warning("Declaration of " & "ptls_update_open_count_t" &
            " exists but with different size")
    ptls_update_open_count_t
   else:
    ptls_update_open_count_t_536871503)
  struct_st_ptls_client_hello_psk_identity_t_536871456 = (when declared(
      struct_st_ptls_client_hello_psk_identity_t):
    when ownSizeof(struct_st_ptls_client_hello_psk_identity_t) !=
        ownSizeof(struct_st_ptls_client_hello_psk_identity_t_536871455):
      static :
        warning("Declaration of " & "struct_st_ptls_client_hello_psk_identity_t" &
            " exists but with different size")
    struct_st_ptls_client_hello_psk_identity_t
   else:
    struct_st_ptls_client_hello_psk_identity_t_536871455)
  X509_STORE_536871572 = (when declared(X509_STORE):
    when ownSizeof(X509_STORE) != ownSizeof(X509_STORE_536871571):
      static :
        warning("Declaration of " & "X509_STORE" &
            " exists but with different size")
    X509_STORE
   else:
    X509_STORE_536871571)
  struct_st_ptls_buffer_t_536871383 = (when declared(struct_st_ptls_buffer_t):
    when ownSizeof(struct_st_ptls_buffer_t) !=
        ownSizeof(struct_st_ptls_buffer_t_536871382):
      static :
        warning("Declaration of " & "struct_st_ptls_buffer_t" &
            " exists but with different size")
    struct_st_ptls_buffer_t
   else:
    struct_st_ptls_buffer_t_536871382)
  ptls_sign_certificate_t_536871482 = (when declared(ptls_sign_certificate_t):
    when ownSizeof(ptls_sign_certificate_t) !=
        ownSizeof(ptls_sign_certificate_t_536871481):
      static :
        warning("Declaration of " & "ptls_sign_certificate_t" &
            " exists but with different size")
    ptls_sign_certificate_t
   else:
    ptls_sign_certificate_t_536871481)
  ptls_context_t_536871373 = (when declared(ptls_context_t):
    when ownSizeof(ptls_context_t) != ownSizeof(ptls_context_t_536871372):
      static :
        warning("Declaration of " & "ptls_context_t" &
            " exists but with different size")
    ptls_context_t
   else:
    ptls_context_t_536871372)
  struct_st_ptls_log_event_t_536871496 = (when declared(
      struct_st_ptls_log_event_t):
    when ownSizeof(struct_st_ptls_log_event_t) !=
        ownSizeof(struct_st_ptls_log_event_t_536871495):
      static :
        warning("Declaration of " & "struct_st_ptls_log_event_t" &
            " exists but with different size")
    struct_st_ptls_log_event_t
   else:
    struct_st_ptls_log_event_t_536871495)
  struct_st_ptls_log_state_t_536871534 = (when declared(
      struct_st_ptls_log_state_t):
    when ownSizeof(struct_st_ptls_log_state_t) !=
        ownSizeof(struct_st_ptls_log_state_t_536871533):
      static :
        warning("Declaration of " & "struct_st_ptls_log_state_t" &
            " exists but with different size")
    struct_st_ptls_log_state_t
   else:
    struct_st_ptls_log_state_t_536871533)
  ptls_openssl_signature_scheme_t_536871554 = (when declared(
      ptls_openssl_signature_scheme_t):
    when ownSizeof(ptls_openssl_signature_scheme_t) !=
        ownSizeof(ptls_openssl_signature_scheme_t_536871553):
      static :
        warning("Declaration of " & "ptls_openssl_signature_scheme_t" &
            " exists but with different size")
    ptls_openssl_signature_scheme_t
   else:
    ptls_openssl_signature_scheme_t_536871553)
  HMAC_CTX_536871578 = (when declared(HMAC_CTX):
    when ownSizeof(HMAC_CTX) != ownSizeof(HMAC_CTX_536871577):
      static :
        warning("Declaration of " & "HMAC_CTX" &
            " exists but with different size")
    HMAC_CTX
   else:
    HMAC_CTX_536871577)
  struct_st_ptls_openssl_override_verify_certificate_t_536871566 = (when declared(
      struct_st_ptls_openssl_override_verify_certificate_t):
    when ownSizeof(struct_st_ptls_openssl_override_verify_certificate_t) !=
        ownSizeof(struct_st_ptls_openssl_override_verify_certificate_t_536871565):
      static :
        warning("Declaration of " &
            "struct_st_ptls_openssl_override_verify_certificate_t" &
            " exists but with different size")
    struct_st_ptls_openssl_override_verify_certificate_t
   else:
    struct_st_ptls_openssl_override_verify_certificate_t_536871565)
  struct_st_ptls_openssl_verify_certificate_t_536871570 = (when declared(
      struct_st_ptls_openssl_verify_certificate_t):
    when ownSizeof(struct_st_ptls_openssl_verify_certificate_t) !=
        ownSizeof(struct_st_ptls_openssl_verify_certificate_t_536871569):
      static :
        warning("Declaration of " &
            "struct_st_ptls_openssl_verify_certificate_t" &
            " exists but with different size")
    struct_st_ptls_openssl_verify_certificate_t
   else:
    struct_st_ptls_openssl_verify_certificate_t_536871569)
  struct_st_ptls_async_job_t_536871476 = (when declared(
      struct_st_ptls_async_job_t):
    when ownSizeof(struct_st_ptls_async_job_t) !=
        ownSizeof(struct_st_ptls_async_job_t_536871475):
      static :
        warning("Declaration of " & "struct_st_ptls_async_job_t" &
            " exists but with different size")
    struct_st_ptls_async_job_t
   else:
    struct_st_ptls_async_job_t_536871475)
  ptls_log_conn_state_t_536871542 = (when declared(ptls_log_conn_state_t):
    when ownSizeof(ptls_log_conn_state_t) != ownSizeof(ptls_log_conn_state_t_536871541):
      static :
        warning("Declaration of " & "ptls_log_conn_state_t" &
            " exists but with different size")
    ptls_log_conn_state_t
   else:
    ptls_log_conn_state_t_536871541)
  struct_st_ptls_openssl_sign_certificate_t_536871556 = (when declared(
      struct_st_ptls_openssl_sign_certificate_t):
    when ownSizeof(struct_st_ptls_openssl_sign_certificate_t) !=
        ownSizeof(struct_st_ptls_openssl_sign_certificate_t_536871555):
      static :
        warning("Declaration of " & "struct_st_ptls_openssl_sign_certificate_t" &
            " exists but with different size")
    struct_st_ptls_openssl_sign_certificate_t
   else:
    struct_st_ptls_openssl_sign_certificate_t_536871555)
  ptls_on_client_hello_t_536871470 = (when declared(ptls_on_client_hello_t):
    when ownSizeof(ptls_on_client_hello_t) != ownSizeof(ptls_on_client_hello_t_536871469):
      static :
        warning("Declaration of " & "ptls_on_client_hello_t" &
            " exists but with different size")
    ptls_on_client_hello_t
   else:
    ptls_on_client_hello_t_536871469)
  ptls_async_job_t_536871478 = (when declared(ptls_async_job_t):
    when ownSizeof(ptls_async_job_t) != ownSizeof(ptls_async_job_t_536871477):
      static :
        warning("Declaration of " & "ptls_async_job_t" &
            " exists but with different size")
    ptls_async_job_t
   else:
    ptls_async_job_t_536871477)
  ptls_hash_algorithm_t_536871427 = (when declared(ptls_hash_algorithm_t):
    when ownSizeof(ptls_hash_algorithm_t) != ownSizeof(ptls_hash_algorithm_t_536871426):
      static :
        warning("Declaration of " & "ptls_hash_algorithm_t" &
            " exists but with different size")
    ptls_hash_algorithm_t
   else:
    ptls_hash_algorithm_t_536871426)
  ptls_cipher_context_t_536871401 = (when declared(ptls_cipher_context_t):
    when ownSizeof(ptls_cipher_context_t) != ownSizeof(ptls_cipher_context_t_536871400):
      static :
        warning("Declaration of " & "ptls_cipher_context_t" &
            " exists but with different size")
    ptls_cipher_context_t
   else:
    ptls_cipher_context_t_536871400)
  struct_st_ptls_hpke_cipher_suite_t_536871445 = (when declared(
      struct_st_ptls_hpke_cipher_suite_t):
    when ownSizeof(struct_st_ptls_hpke_cipher_suite_t) !=
        ownSizeof(struct_st_ptls_hpke_cipher_suite_t_536871444):
      static :
        warning("Declaration of " & "struct_st_ptls_hpke_cipher_suite_t" &
            " exists but with different size")
    struct_st_ptls_hpke_cipher_suite_t
   else:
    struct_st_ptls_hpke_cipher_suite_t_536871444)
  struct_st_ptls_get_time_t_536871464 = (when declared(struct_st_ptls_get_time_t):
    when ownSizeof(struct_st_ptls_get_time_t) !=
        ownSizeof(struct_st_ptls_get_time_t_536871463):
      static :
        warning("Declaration of " & "struct_st_ptls_get_time_t" &
            " exists but with different size")
    struct_st_ptls_get_time_t
   else:
    struct_st_ptls_get_time_t_536871463)
  struct_st_ptls_handshake_properties_t_536871530 = (when declared(
      struct_st_ptls_handshake_properties_t):
    when ownSizeof(struct_st_ptls_handshake_properties_t) !=
        ownSizeof(struct_st_ptls_handshake_properties_t_536871529):
      static :
        warning("Declaration of " & "struct_st_ptls_handshake_properties_t" &
            " exists but with different size")
    struct_st_ptls_handshake_properties_t
   else:
    struct_st_ptls_handshake_properties_t_536871529)
when not declared(ptls_openssl_override_verify_certificate_t):
  type
    ptls_openssl_override_verify_certificate_t* = ptls_openssl_override_verify_certificate_t_536871567
else:
  static :
    hint("Declaration of " & "ptls_openssl_override_verify_certificate_t" &
        " already exists, not redeclaring")
when not declared(ptls_client_hello_psk_identity_t):
  type
    ptls_client_hello_psk_identity_t* = ptls_client_hello_psk_identity_t_536871457
else:
  static :
    hint("Declaration of " & "ptls_client_hello_psk_identity_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_update_open_count_t):
  type
    struct_st_ptls_update_open_count_t* = struct_st_ptls_update_open_count_t_536871499
else:
  static :
    hint("Declaration of " & "struct_st_ptls_update_open_count_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_key_exchange_algorithm_t):
  type
    struct_st_ptls_key_exchange_algorithm_t* = struct_st_ptls_key_exchange_algorithm_t_536871388
else:
  static :
    hint("Declaration of " & "struct_st_ptls_key_exchange_algorithm_t" &
        " already exists, not redeclaring")
when not declared(ptls_emit_certificate_t):
  type
    ptls_emit_certificate_t* = ptls_emit_certificate_t_536871473
else:
  static :
    hint("Declaration of " & "ptls_emit_certificate_t" &
        " already exists, not redeclaring")
when not declared(enum_en_ptls_early_data_acceptance_t):
  type
    enum_en_ptls_early_data_acceptance_t* = enum_en_ptls_early_data_acceptance_t_536871525
else:
  static :
    hint("Declaration of " & "enum_en_ptls_early_data_acceptance_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_aead_algorithm_t):
  type
    struct_st_ptls_aead_algorithm_t* = struct_st_ptls_aead_algorithm_t_536871410
else:
  static :
    hint("Declaration of " & "struct_st_ptls_aead_algorithm_t" &
        " already exists, not redeclaring")
when not declared(struct_in_addr):
  type
    struct_in_addr* = struct_in_addr_536871545
else:
  static :
    hint("Declaration of " & "struct_in_addr" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_hash_context_t):
  type
    struct_st_ptls_hash_context_t* = struct_st_ptls_hash_context_t_536871420
else:
  static :
    hint("Declaration of " & "struct_st_ptls_hash_context_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_message_emitter_t):
  type
    struct_st_ptls_message_emitter_t* = struct_st_ptls_message_emitter_t_536871432
else:
  static :
    hint("Declaration of " & "struct_st_ptls_message_emitter_t" &
        " already exists, not redeclaring")
when not declared(ptls_hpke_cipher_suite_t):
  type
    ptls_hpke_cipher_suite_t* = ptls_hpke_cipher_suite_t_536871446
else:
  static :
    hint("Declaration of " & "ptls_hpke_cipher_suite_t" &
        " already exists, not redeclaring")
when not declared(ptls_aead_context_t):
  type
    ptls_aead_context_t* = ptls_aead_context_t_536871412
else:
  static :
    hint("Declaration of " & "ptls_aead_context_t" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_verify_certificate_t):
  type
    ptls_openssl_verify_certificate_t* = ptls_openssl_verify_certificate_t_536871573
else:
  static :
    hint("Declaration of " & "ptls_openssl_verify_certificate_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_aead_context_t):
  type
    struct_st_ptls_aead_context_t* = struct_st_ptls_aead_context_t_536871408
else:
  static :
    hint("Declaration of " & "struct_st_ptls_aead_context_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_decompress_certificate_t):
  type
    struct_st_ptls_decompress_certificate_t* = struct_st_ptls_decompress_certificate_t_536871513
else:
  static :
    hint("Declaration of " & "struct_st_ptls_decompress_certificate_t" &
        " already exists, not redeclaring")
when not declared(ptls_hpke_cipher_suite_id_t):
  type
    ptls_hpke_cipher_suite_id_t* = ptls_hpke_cipher_suite_id_t_536871442
else:
  static :
    hint("Declaration of " & "ptls_hpke_cipher_suite_id_t" &
        " already exists, not redeclaring")
when not declared(ptls_key_exchange_context_t):
  type
    ptls_key_exchange_context_t* = ptls_key_exchange_context_t_536871390
else:
  static :
    hint("Declaration of " & "ptls_key_exchange_context_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_on_extension_t):
  type
    struct_st_ptls_on_extension_t* = struct_st_ptls_on_extension_t_536871509
else:
  static :
    hint("Declaration of " & "struct_st_ptls_on_extension_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_on_client_hello_t):
  type
    struct_st_ptls_on_client_hello_t* = struct_st_ptls_on_client_hello_t_536871467
else:
  static :
    hint("Declaration of " & "struct_st_ptls_on_client_hello_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_hpke_cipher_suite_id_t):
  type
    struct_st_ptls_hpke_cipher_suite_id_t* = struct_st_ptls_hpke_cipher_suite_id_t_536871440
else:
  static :
    hint("Declaration of " & "struct_st_ptls_hpke_cipher_suite_id_t" &
        " already exists, not redeclaring")
when not declared(EVP_MD):
  type
    EVP_MD* = EVP_MD_536871551
else:
  static :
    hint("Declaration of " & "EVP_MD" & " already exists, not redeclaring")
when not declared(ptls_cipher_suite_t):
  type
    ptls_cipher_suite_t* = ptls_cipher_suite_t_536871430
else:
  static :
    hint("Declaration of " & "ptls_cipher_suite_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_iovec_t):
  type
    struct_st_ptls_iovec_t* = struct_st_ptls_iovec_t_536871378
else:
  static :
    hint("Declaration of " & "struct_st_ptls_iovec_t" &
        " already exists, not redeclaring")
when not declared(ptls_encrypt_ticket_t):
  type
    ptls_encrypt_ticket_t* = ptls_encrypt_ticket_t_536871489
else:
  static :
    hint("Declaration of " & "ptls_encrypt_ticket_t" &
        " already exists, not redeclaring")
when not declared(ptls_message_emitter_t):
  type
    ptls_message_emitter_t* = ptls_message_emitter_t_536871434
else:
  static :
    hint("Declaration of " & "ptls_message_emitter_t" &
        " already exists, not redeclaring")
when not declared(enum_en_ptls_hash_final_mode_t):
  type
    enum_en_ptls_hash_final_mode_t* = enum_en_ptls_hash_final_mode_t_536871416
else:
  static :
    hint("Declaration of " & "enum_en_ptls_hash_final_mode_t" &
        " already exists, not redeclaring")
when not declared(EVP_CIPHER_CTX):
  type
    EVP_CIPHER_CTX* = EVP_CIPHER_CTX_536871575
else:
  static :
    hint("Declaration of " & "EVP_CIPHER_CTX" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_context_t):
  type
    struct_st_ptls_context_t* = struct_st_ptls_context_t_536871374
else:
  static :
    hint("Declaration of " & "struct_st_ptls_context_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_aead_supplementary_encryption_t):
  type
    struct_st_ptls_aead_supplementary_encryption_t* = struct_st_ptls_aead_supplementary_encryption_t_536871404
else:
  static :
    hint("Declaration of " & "struct_st_ptls_aead_supplementary_encryption_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_cipher_suite_t):
  type
    struct_st_ptls_cipher_suite_t* = struct_st_ptls_cipher_suite_t_536871428
else:
  static :
    hint("Declaration of " & "struct_st_ptls_cipher_suite_t" &
        " already exists, not redeclaring")
when not declared(ptls_cipher_algorithm_t):
  type
    ptls_cipher_algorithm_t* = ptls_cipher_algorithm_t_536871402
else:
  static :
    hint("Declaration of " & "ptls_cipher_algorithm_t" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_sign_certificate_t):
  type
    ptls_openssl_sign_certificate_t* = ptls_openssl_sign_certificate_t_536871557
else:
  static :
    hint("Declaration of " & "ptls_openssl_sign_certificate_t" &
        " already exists, not redeclaring")
when not declared(X509):
  type
    X509* = X509_536871559
else:
  static :
    hint("Declaration of " & "X509" & " already exists, not redeclaring")
when not declared(compiler_ssize_t):
  type
    compiler_ssize_t* = compiler_ssize_t_536871581
else:
  static :
    hint("Declaration of " & "compiler_ssize_t" &
        " already exists, not redeclaring")
when not declared(ptls_hpke_kem_t):
  type
    ptls_hpke_kem_t* = ptls_hpke_kem_t_536871438
else:
  static :
    hint("Declaration of " & "ptls_hpke_kem_t" &
        " already exists, not redeclaring")
when not declared(ptls_key_schedule_t):
  type
    ptls_key_schedule_t* = ptls_key_schedule_t_536871376
else:
  static :
    hint("Declaration of " & "ptls_key_schedule_t" &
        " already exists, not redeclaring")
when not declared(ptls_key_exchange_algorithm_t):
  type
    ptls_key_exchange_algorithm_t* = ptls_key_exchange_algorithm_t_536871394
else:
  static :
    hint("Declaration of " & "ptls_key_exchange_algorithm_t" &
        " already exists, not redeclaring")
when not declared(ptls_aead_supplementary_encryption_t):
  type
    ptls_aead_supplementary_encryption_t* = ptls_aead_supplementary_encryption_t_536871406
else:
  static :
    hint("Declaration of " & "ptls_aead_supplementary_encryption_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_sign_certificate_t):
  type
    struct_st_ptls_sign_certificate_t* = struct_st_ptls_sign_certificate_t_536871479
else:
  static :
    hint("Declaration of " & "struct_st_ptls_sign_certificate_t" &
        " already exists, not redeclaring")
when not declared(ptls_on_extension_t):
  type
    ptls_on_extension_t* = ptls_on_extension_t_536871511
else:
  static :
    hint("Declaration of " & "ptls_on_extension_t" &
        " already exists, not redeclaring")
when not declared(EVP_MAC_CTX):
  type
    EVP_MAC_CTX* = EVP_MAC_CTX_536871579
else:
  static :
    hint("Declaration of " & "EVP_MAC_CTX" & " already exists, not redeclaring")
when not declared(struct_st_ptls_emit_certificate_t):
  type
    struct_st_ptls_emit_certificate_t* = struct_st_ptls_emit_certificate_t_536871471
else:
  static :
    hint("Declaration of " & "struct_st_ptls_emit_certificate_t" &
        " already exists, not redeclaring")
when not declared(ptls_raw_extension_t):
  type
    ptls_raw_extension_t* = ptls_raw_extension_t_536871523
else:
  static :
    hint("Declaration of " & "ptls_raw_extension_t" &
        " already exists, not redeclaring")
when not declared(struct_in6_addr):
  type
    struct_in6_addr* = struct_in6_addr_536871539
else:
  static :
    hint("Declaration of " & "struct_in6_addr" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_hash_algorithm_t):
  type
    struct_st_ptls_hash_algorithm_t* = struct_st_ptls_hash_algorithm_t_536871424
else:
  static :
    hint("Declaration of " & "struct_st_ptls_hash_algorithm_t" &
        " already exists, not redeclaring")
when not declared(ptls_iovec_t):
  type
    ptls_iovec_t* = ptls_iovec_t_536871380
else:
  static :
    hint("Declaration of " & "ptls_iovec_t" & " already exists, not redeclaring")
when not declared(ptls_hash_context_t):
  type
    ptls_hash_context_t* = ptls_hash_context_t_536871422
else:
  static :
    hint("Declaration of " & "ptls_hash_context_t" &
        " already exists, not redeclaring")
when not declared(ptls_verify_certificate_t):
  type
    ptls_verify_certificate_t* = ptls_verify_certificate_t_536871485
else:
  static :
    hint("Declaration of " & "ptls_verify_certificate_t" &
        " already exists, not redeclaring")
when not declared(ptls_buffer_t):
  type
    ptls_buffer_t* = ptls_buffer_t_536871384
else:
  static :
    hint("Declaration of " & "ptls_buffer_t" &
        " already exists, not redeclaring")
when not declared(ssize_t):
  type
    ssize_t* = ssize_t_536871501
else:
  static :
    hint("Declaration of " & "ssize_t" & " already exists, not redeclaring")
when not declared(ptls_handshake_properties_t):
  type
    ptls_handshake_properties_t* = ptls_handshake_properties_t_536871531
else:
  static :
    hint("Declaration of " & "ptls_handshake_properties_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_log_t):
  type
    struct_st_ptls_log_t* = struct_st_ptls_log_t_536871543
else:
  static :
    hint("Declaration of " & "struct_st_ptls_log_t" &
        " already exists, not redeclaring")
when not declared(ptls_aead_algorithm_t):
  type
    ptls_aead_algorithm_t* = ptls_aead_algorithm_t_536871414
else:
  static :
    hint("Declaration of " & "ptls_aead_algorithm_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_on_client_hello_parameters_t):
  type
    struct_st_ptls_on_client_hello_parameters_t* = struct_st_ptls_on_client_hello_parameters_t_536871459
else:
  static :
    hint("Declaration of " & "struct_st_ptls_on_client_hello_parameters_t" &
        " already exists, not redeclaring")
when not declared(ptls_early_data_acceptance_t):
  type
    ptls_early_data_acceptance_t* = ptls_early_data_acceptance_t_536871527
else:
  static :
    hint("Declaration of " & "ptls_early_data_acceptance_t" &
        " already exists, not redeclaring")
when not declared(ptls_get_time_t):
  type
    ptls_get_time_t* = ptls_get_time_t_536871465
else:
  static :
    hint("Declaration of " & "ptls_get_time_t" &
        " already exists, not redeclaring")
when not declared(ptls_decompress_certificate_t):
  type
    ptls_decompress_certificate_t* = ptls_decompress_certificate_t_536871515
else:
  static :
    hint("Declaration of " & "ptls_decompress_certificate_t" &
        " already exists, not redeclaring")
when not declared(ptls_ech_create_opener_t):
  type
    ptls_ech_create_opener_t* = ptls_ech_create_opener_t_536871519
else:
  static :
    hint("Declaration of " & "ptls_ech_create_opener_t" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_raw_pubkey_verify_certificate_t):
  type
    ptls_openssl_raw_pubkey_verify_certificate_t* = ptls_openssl_raw_pubkey_verify_certificate_t_536871563
else:
  static :
    hint("Declaration of " & "ptls_openssl_raw_pubkey_verify_certificate_t" &
        " already exists, not redeclaring")
when not declared(intptr_t):
  type
    intptr_t* = intptr_t_536871392
else:
  static :
    hint("Declaration of " & "intptr_t" & " already exists, not redeclaring")
when not declared(ptls_update_traffic_key_t):
  type
    ptls_update_traffic_key_t* = ptls_update_traffic_key_t_536871507
else:
  static :
    hint("Declaration of " & "ptls_update_traffic_key_t" &
        " already exists, not redeclaring")
when not declared(ptls_log_event_t):
  type
    ptls_log_event_t* = ptls_log_event_t_536871497
else:
  static :
    hint("Declaration of " & "ptls_log_event_t" &
        " already exists, not redeclaring")
when not declared(ptls_t):
  type
    ptls_t* = ptls_t_536871370
else:
  static :
    hint("Declaration of " & "ptls_t" & " already exists, not redeclaring")
when not declared(struct_st_ptls_cipher_algorithm_t):
  type
    struct_st_ptls_cipher_algorithm_t* = struct_st_ptls_cipher_algorithm_t_536871398
else:
  static :
    hint("Declaration of " & "struct_st_ptls_cipher_algorithm_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_hpke_kem_t):
  type
    struct_st_ptls_hpke_kem_t* = struct_st_ptls_hpke_kem_t_536871436
else:
  static :
    hint("Declaration of " & "struct_st_ptls_hpke_kem_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_openssl_signature_scheme_t):
  type
    struct_st_ptls_openssl_signature_scheme_t* = struct_st_ptls_openssl_signature_scheme_t_536871549
else:
  static :
    hint("Declaration of " & "struct_st_ptls_openssl_signature_scheme_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_raw_extension_t):
  type
    struct_st_ptls_raw_extension_t* = struct_st_ptls_raw_extension_t_536871521
else:
  static :
    hint("Declaration of " & "struct_st_ptls_raw_extension_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_openssl_raw_pubkey_verify_certificate_t):
  type
    struct_st_ptls_openssl_raw_pubkey_verify_certificate_t* = struct_st_ptls_openssl_raw_pubkey_verify_certificate_t_536871561
else:
  static :
    hint("Declaration of " &
        "struct_st_ptls_openssl_raw_pubkey_verify_certificate_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_ech_create_opener_t):
  type
    struct_st_ptls_ech_create_opener_t* = struct_st_ptls_ech_create_opener_t_536871517
else:
  static :
    hint("Declaration of " & "struct_st_ptls_ech_create_opener_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_log_point_t):
  type
    struct_st_ptls_log_point_t* = struct_st_ptls_log_point_t_536871535
else:
  static :
    hint("Declaration of " & "struct_st_ptls_log_point_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_key_exchange_context_t):
  type
    struct_st_ptls_key_exchange_context_t* = struct_st_ptls_key_exchange_context_t_536871386
else:
  static :
    hint("Declaration of " & "struct_st_ptls_key_exchange_context_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_verify_certificate_t):
  type
    struct_st_ptls_verify_certificate_t* = struct_st_ptls_verify_certificate_t_536871483
else:
  static :
    hint("Declaration of " & "struct_st_ptls_verify_certificate_t" &
        " already exists, not redeclaring")
when not declared(in_addr_t):
  type
    in_addr_t* = in_addr_t_536871583
else:
  static :
    hint("Declaration of " & "in_addr_t" & " already exists, not redeclaring")
when not declared(ptls_hash_final_mode_t):
  type
    ptls_hash_final_mode_t* = ptls_hash_final_mode_t_536871418
else:
  static :
    hint("Declaration of " & "ptls_hash_final_mode_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_cipher_context_t):
  type
    struct_st_ptls_cipher_context_t* = struct_st_ptls_cipher_context_t_536871396
else:
  static :
    hint("Declaration of " & "struct_st_ptls_cipher_context_t" &
        " already exists, not redeclaring")
when not declared(EVP_PKEY):
  type
    EVP_PKEY* = EVP_PKEY_536871547
else:
  static :
    hint("Declaration of " & "EVP_PKEY" & " already exists, not redeclaring")
when not declared(struct_st_ptls_log_conn_state_t):
  type
    struct_st_ptls_log_conn_state_t* = struct_st_ptls_log_conn_state_t_536871537
else:
  static :
    hint("Declaration of " & "struct_st_ptls_log_conn_state_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_update_traffic_key_t):
  type
    struct_st_ptls_update_traffic_key_t* = struct_st_ptls_update_traffic_key_t_536871505
else:
  static :
    hint("Declaration of " & "struct_st_ptls_update_traffic_key_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_encrypt_ticket_t):
  type
    struct_st_ptls_encrypt_ticket_t* = struct_st_ptls_encrypt_ticket_t_536871487
else:
  static :
    hint("Declaration of " & "struct_st_ptls_encrypt_ticket_t" &
        " already exists, not redeclaring")
when not declared(ptls_save_ticket_t):
  type
    ptls_save_ticket_t* = ptls_save_ticket_t_536871493
else:
  static :
    hint("Declaration of " & "ptls_save_ticket_t" &
        " already exists, not redeclaring")
when not declared(ptls_on_client_hello_parameters_t):
  type
    ptls_on_client_hello_parameters_t* = ptls_on_client_hello_parameters_t_536871461
else:
  static :
    hint("Declaration of " & "ptls_on_client_hello_parameters_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_save_ticket_t):
  type
    struct_st_ptls_save_ticket_t* = struct_st_ptls_save_ticket_t_536871491
else:
  static :
    hint("Declaration of " & "struct_st_ptls_save_ticket_t" &
        " already exists, not redeclaring")
when not declared(ptls_update_open_count_t):
  type
    ptls_update_open_count_t* = ptls_update_open_count_t_536871503
else:
  static :
    hint("Declaration of " & "ptls_update_open_count_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_client_hello_psk_identity_t):
  type
    struct_st_ptls_client_hello_psk_identity_t* = struct_st_ptls_client_hello_psk_identity_t_536871455
else:
  static :
    hint("Declaration of " & "struct_st_ptls_client_hello_psk_identity_t" &
        " already exists, not redeclaring")
when not declared(X509_STORE):
  type
    X509_STORE* = X509_STORE_536871571
else:
  static :
    hint("Declaration of " & "X509_STORE" & " already exists, not redeclaring")
when not declared(struct_st_ptls_buffer_t):
  type
    struct_st_ptls_buffer_t* = struct_st_ptls_buffer_t_536871382
else:
  static :
    hint("Declaration of " & "struct_st_ptls_buffer_t" &
        " already exists, not redeclaring")
when not declared(ptls_sign_certificate_t):
  type
    ptls_sign_certificate_t* = ptls_sign_certificate_t_536871481
else:
  static :
    hint("Declaration of " & "ptls_sign_certificate_t" &
        " already exists, not redeclaring")
when not declared(ptls_context_t):
  type
    ptls_context_t* = ptls_context_t_536871372
else:
  static :
    hint("Declaration of " & "ptls_context_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_log_event_t):
  type
    struct_st_ptls_log_event_t* = struct_st_ptls_log_event_t_536871495
else:
  static :
    hint("Declaration of " & "struct_st_ptls_log_event_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_log_state_t):
  type
    struct_st_ptls_log_state_t* = struct_st_ptls_log_state_t_536871533
else:
  static :
    hint("Declaration of " & "struct_st_ptls_log_state_t" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_signature_scheme_t):
  type
    ptls_openssl_signature_scheme_t* = ptls_openssl_signature_scheme_t_536871553
else:
  static :
    hint("Declaration of " & "ptls_openssl_signature_scheme_t" &
        " already exists, not redeclaring")
when not declared(HMAC_CTX):
  type
    HMAC_CTX* = HMAC_CTX_536871577
else:
  static :
    hint("Declaration of " & "HMAC_CTX" & " already exists, not redeclaring")
when not declared(struct_st_ptls_openssl_override_verify_certificate_t):
  type
    struct_st_ptls_openssl_override_verify_certificate_t* = struct_st_ptls_openssl_override_verify_certificate_t_536871565
else:
  static :
    hint("Declaration of " &
        "struct_st_ptls_openssl_override_verify_certificate_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_openssl_verify_certificate_t):
  type
    struct_st_ptls_openssl_verify_certificate_t* = struct_st_ptls_openssl_verify_certificate_t_536871569
else:
  static :
    hint("Declaration of " & "struct_st_ptls_openssl_verify_certificate_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_async_job_t):
  type
    struct_st_ptls_async_job_t* = struct_st_ptls_async_job_t_536871475
else:
  static :
    hint("Declaration of " & "struct_st_ptls_async_job_t" &
        " already exists, not redeclaring")
when not declared(ptls_log_conn_state_t):
  type
    ptls_log_conn_state_t* = ptls_log_conn_state_t_536871541
else:
  static :
    hint("Declaration of " & "ptls_log_conn_state_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_openssl_sign_certificate_t):
  type
    struct_st_ptls_openssl_sign_certificate_t* = struct_st_ptls_openssl_sign_certificate_t_536871555
else:
  static :
    hint("Declaration of " & "struct_st_ptls_openssl_sign_certificate_t" &
        " already exists, not redeclaring")
when not declared(ptls_on_client_hello_t):
  type
    ptls_on_client_hello_t* = ptls_on_client_hello_t_536871469
else:
  static :
    hint("Declaration of " & "ptls_on_client_hello_t" &
        " already exists, not redeclaring")
when not declared(ptls_async_job_t):
  type
    ptls_async_job_t* = ptls_async_job_t_536871477
else:
  static :
    hint("Declaration of " & "ptls_async_job_t" &
        " already exists, not redeclaring")
when not declared(ptls_hash_algorithm_t):
  type
    ptls_hash_algorithm_t* = ptls_hash_algorithm_t_536871426
else:
  static :
    hint("Declaration of " & "ptls_hash_algorithm_t" &
        " already exists, not redeclaring")
when not declared(ptls_cipher_context_t):
  type
    ptls_cipher_context_t* = ptls_cipher_context_t_536871400
else:
  static :
    hint("Declaration of " & "ptls_cipher_context_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_hpke_cipher_suite_t):
  type
    struct_st_ptls_hpke_cipher_suite_t* = struct_st_ptls_hpke_cipher_suite_t_536871444
else:
  static :
    hint("Declaration of " & "struct_st_ptls_hpke_cipher_suite_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_get_time_t):
  type
    struct_st_ptls_get_time_t* = struct_st_ptls_get_time_t_536871463
else:
  static :
    hint("Declaration of " & "struct_st_ptls_get_time_t" &
        " already exists, not redeclaring")
when not declared(struct_st_ptls_handshake_properties_t):
  type
    struct_st_ptls_handshake_properties_t* = struct_st_ptls_handshake_properties_t_536871529
else:
  static :
    hint("Declaration of " & "struct_st_ptls_handshake_properties_t" &
        " already exists, not redeclaring")
when not declared(PTLS_HAVE_LOG):
  when 1 is static:
    const
      PTLS_HAVE_LOG* = 1     ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:77:9
  else:
    let PTLS_HAVE_LOG* = 1   ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:77:9
else:
  static :
    hint("Declaration of " & "PTLS_HAVE_LOG" &
        " already exists, not redeclaring")
when not declared(PTLS_FUZZ_HANDSHAKE):
  when 0 is static:
    const
      PTLS_FUZZ_HANDSHAKE* = 0 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:82:9
  else:
    let PTLS_FUZZ_HANDSHAKE* = 0 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:82:9
else:
  static :
    hint("Declaration of " & "PTLS_FUZZ_HANDSHAKE" &
        " already exists, not redeclaring")
when not declared(PTLS_HELLO_RANDOM_SIZE):
  when 32 is static:
    const
      PTLS_HELLO_RANDOM_SIZE* = 32 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:85:9
  else:
    let PTLS_HELLO_RANDOM_SIZE* = 32 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:85:9
else:
  static :
    hint("Declaration of " & "PTLS_HELLO_RANDOM_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AES128_KEY_SIZE):
  when 16 is static:
    const
      PTLS_AES128_KEY_SIZE* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:87:9
  else:
    let PTLS_AES128_KEY_SIZE* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:87:9
else:
  static :
    hint("Declaration of " & "PTLS_AES128_KEY_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AES256_KEY_SIZE):
  when 32 is static:
    const
      PTLS_AES256_KEY_SIZE* = 32 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:88:9
  else:
    let PTLS_AES256_KEY_SIZE* = 32 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:88:9
else:
  static :
    hint("Declaration of " & "PTLS_AES256_KEY_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AES_BLOCK_SIZE):
  when 16 is static:
    const
      PTLS_AES_BLOCK_SIZE* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:89:9
  else:
    let PTLS_AES_BLOCK_SIZE* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:89:9
else:
  static :
    hint("Declaration of " & "PTLS_AES_BLOCK_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AES_IV_SIZE):
  when 16 is static:
    const
      PTLS_AES_IV_SIZE* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:90:9
  else:
    let PTLS_AES_IV_SIZE* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:90:9
else:
  static :
    hint("Declaration of " & "PTLS_AES_IV_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AESGCM_IV_SIZE):
  when 12 is static:
    const
      PTLS_AESGCM_IV_SIZE* = 12 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:91:9
  else:
    let PTLS_AESGCM_IV_SIZE* = 12 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:91:9
else:
  static :
    hint("Declaration of " & "PTLS_AESGCM_IV_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AESGCM_TAG_SIZE):
  when 16 is static:
    const
      PTLS_AESGCM_TAG_SIZE* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:92:9
  else:
    let PTLS_AESGCM_TAG_SIZE* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:92:9
else:
  static :
    hint("Declaration of " & "PTLS_AESGCM_TAG_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AESGCM_CONFIDENTIALITY_LIMIT):
  when 33554432 is static:
    const
      PTLS_AESGCM_CONFIDENTIALITY_LIMIT* = 33554432 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:93:9
  else:
    let PTLS_AESGCM_CONFIDENTIALITY_LIMIT* = 33554432 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:93:9
else:
  static :
    hint("Declaration of " & "PTLS_AESGCM_CONFIDENTIALITY_LIMIT" &
        " already exists, not redeclaring")
when not declared(PTLS_AESGCM_INTEGRITY_LIMIT):
  when cast[culonglong](18014398509481984'i64) is static:
    const
      PTLS_AESGCM_INTEGRITY_LIMIT* = cast[culonglong](18014398509481984'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:94:9
  else:
    let PTLS_AESGCM_INTEGRITY_LIMIT* = cast[culonglong](18014398509481984'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:94:9
else:
  static :
    hint("Declaration of " & "PTLS_AESGCM_INTEGRITY_LIMIT" &
        " already exists, not redeclaring")
when not declared(PTLS_AESCCM_CONFIDENTIALITY_LIMIT):
  when 11863283 is static:
    const
      PTLS_AESCCM_CONFIDENTIALITY_LIMIT* = 11863283 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:95:9
  else:
    let PTLS_AESCCM_CONFIDENTIALITY_LIMIT* = 11863283 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:95:9
else:
  static :
    hint("Declaration of " & "PTLS_AESCCM_CONFIDENTIALITY_LIMIT" &
        " already exists, not redeclaring")
when not declared(PTLS_AESCCM_INTEGRITY_LIMIT):
  when 11863283 is static:
    const
      PTLS_AESCCM_INTEGRITY_LIMIT* = 11863283 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:96:9
  else:
    let PTLS_AESCCM_INTEGRITY_LIMIT* = 11863283 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:96:9
else:
  static :
    hint("Declaration of " & "PTLS_AESCCM_INTEGRITY_LIMIT" &
        " already exists, not redeclaring")
when not declared(PTLS_CHACHA20_KEY_SIZE):
  when 32 is static:
    const
      PTLS_CHACHA20_KEY_SIZE* = 32 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:98:9
  else:
    let PTLS_CHACHA20_KEY_SIZE* = 32 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:98:9
else:
  static :
    hint("Declaration of " & "PTLS_CHACHA20_KEY_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_CHACHA20_IV_SIZE):
  when 16 is static:
    const
      PTLS_CHACHA20_IV_SIZE* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:99:9
  else:
    let PTLS_CHACHA20_IV_SIZE* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:99:9
else:
  static :
    hint("Declaration of " & "PTLS_CHACHA20_IV_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_CHACHA20POLY1305_IV_SIZE):
  when 12 is static:
    const
      PTLS_CHACHA20POLY1305_IV_SIZE* = 12 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:100:9
  else:
    let PTLS_CHACHA20POLY1305_IV_SIZE* = 12 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:100:9
else:
  static :
    hint("Declaration of " & "PTLS_CHACHA20POLY1305_IV_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_CHACHA20POLY1305_TAG_SIZE):
  when 16 is static:
    const
      PTLS_CHACHA20POLY1305_TAG_SIZE* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:101:9
  else:
    let PTLS_CHACHA20POLY1305_TAG_SIZE* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:101:9
else:
  static :
    hint("Declaration of " & "PTLS_CHACHA20POLY1305_TAG_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_CHACHA20POLY1305_CONFIDENTIALITY_LIMIT):
  when UINT64_MAX is typedesc:
    type
      PTLS_CHACHA20POLY1305_CONFIDENTIALITY_LIMIT* = UINT64_MAX ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:102:9
  else:
    when UINT64_MAX is static:
      const
        PTLS_CHACHA20POLY1305_CONFIDENTIALITY_LIMIT* = UINT64_MAX ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:102:9
    else:
      let PTLS_CHACHA20POLY1305_CONFIDENTIALITY_LIMIT* = UINT64_MAX ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:102:9
else:
  static :
    hint("Declaration of " & "PTLS_CHACHA20POLY1305_CONFIDENTIALITY_LIMIT" &
        " already exists, not redeclaring")
when not declared(PTLS_CHACHA20POLY1305_INTEGRITY_LIMIT):
  when cast[culonglong](68719476736'i64) is static:
    const
      PTLS_CHACHA20POLY1305_INTEGRITY_LIMIT* = cast[culonglong](68719476736'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:103:9
  else:
    let PTLS_CHACHA20POLY1305_INTEGRITY_LIMIT* = cast[culonglong](68719476736'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:103:9
else:
  static :
    hint("Declaration of " & "PTLS_CHACHA20POLY1305_INTEGRITY_LIMIT" &
        " already exists, not redeclaring")
when not declared(PTLS_AEGIS128L_KEY_SIZE):
  when 16 is static:
    const
      PTLS_AEGIS128L_KEY_SIZE* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:105:9
  else:
    let PTLS_AEGIS128L_KEY_SIZE* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:105:9
else:
  static :
    hint("Declaration of " & "PTLS_AEGIS128L_KEY_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AEGIS128L_IV_SIZE):
  when 16 is static:
    const
      PTLS_AEGIS128L_IV_SIZE* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:106:9
  else:
    let PTLS_AEGIS128L_IV_SIZE* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:106:9
else:
  static :
    hint("Declaration of " & "PTLS_AEGIS128L_IV_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AEGIS128L_TAG_SIZE):
  when 16 is static:
    const
      PTLS_AEGIS128L_TAG_SIZE* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:107:9
  else:
    let PTLS_AEGIS128L_TAG_SIZE* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:107:9
else:
  static :
    hint("Declaration of " & "PTLS_AEGIS128L_TAG_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AEGIS128L_CONFIDENTIALITY_LIMIT):
  when UINT64_MAX is typedesc:
    type
      PTLS_AEGIS128L_CONFIDENTIALITY_LIMIT* = UINT64_MAX ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:108:9
  else:
    when UINT64_MAX is static:
      const
        PTLS_AEGIS128L_CONFIDENTIALITY_LIMIT* = UINT64_MAX ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:108:9
    else:
      let PTLS_AEGIS128L_CONFIDENTIALITY_LIMIT* = UINT64_MAX ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:108:9
else:
  static :
    hint("Declaration of " & "PTLS_AEGIS128L_CONFIDENTIALITY_LIMIT" &
        " already exists, not redeclaring")
when not declared(PTLS_AEGIS128L_INTEGRITY_LIMIT):
  when cast[culonglong](281474976710656'i64) is static:
    const
      PTLS_AEGIS128L_INTEGRITY_LIMIT* = cast[culonglong](281474976710656'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:109:9
  else:
    let PTLS_AEGIS128L_INTEGRITY_LIMIT* = cast[culonglong](281474976710656'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:109:9
else:
  static :
    hint("Declaration of " & "PTLS_AEGIS128L_INTEGRITY_LIMIT" &
        " already exists, not redeclaring")
when not declared(PTLS_AEGIS256_KEY_SIZE):
  when 32 is static:
    const
      PTLS_AEGIS256_KEY_SIZE* = 32 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:111:9
  else:
    let PTLS_AEGIS256_KEY_SIZE* = 32 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:111:9
else:
  static :
    hint("Declaration of " & "PTLS_AEGIS256_KEY_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AEGIS256_IV_SIZE):
  when 32 is static:
    const
      PTLS_AEGIS256_IV_SIZE* = 32 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:112:9
  else:
    let PTLS_AEGIS256_IV_SIZE* = 32 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:112:9
else:
  static :
    hint("Declaration of " & "PTLS_AEGIS256_IV_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AEGIS256_TAG_SIZE):
  when 16 is static:
    const
      PTLS_AEGIS256_TAG_SIZE* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:113:9
  else:
    let PTLS_AEGIS256_TAG_SIZE* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:113:9
else:
  static :
    hint("Declaration of " & "PTLS_AEGIS256_TAG_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_AEGIS256_CONFIDENTIALITY_LIMIT):
  when UINT64_MAX is typedesc:
    type
      PTLS_AEGIS256_CONFIDENTIALITY_LIMIT* = UINT64_MAX ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:114:9
  else:
    when UINT64_MAX is static:
      const
        PTLS_AEGIS256_CONFIDENTIALITY_LIMIT* = UINT64_MAX ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:114:9
    else:
      let PTLS_AEGIS256_CONFIDENTIALITY_LIMIT* = UINT64_MAX ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:114:9
else:
  static :
    hint("Declaration of " & "PTLS_AEGIS256_CONFIDENTIALITY_LIMIT" &
        " already exists, not redeclaring")
when not declared(PTLS_AEGIS256_INTEGRITY_LIMIT):
  when cast[culonglong](281474976710656'i64) is static:
    const
      PTLS_AEGIS256_INTEGRITY_LIMIT* = cast[culonglong](281474976710656'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:115:9
  else:
    let PTLS_AEGIS256_INTEGRITY_LIMIT* = cast[culonglong](281474976710656'i64) ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:115:9
else:
  static :
    hint("Declaration of " & "PTLS_AEGIS256_INTEGRITY_LIMIT" &
        " already exists, not redeclaring")
when not declared(PTLS_BLOWFISH_KEY_SIZE):
  when 16 is static:
    const
      PTLS_BLOWFISH_KEY_SIZE* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:117:9
  else:
    let PTLS_BLOWFISH_KEY_SIZE* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:117:9
else:
  static :
    hint("Declaration of " & "PTLS_BLOWFISH_KEY_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_BLOWFISH_BLOCK_SIZE):
  when 8 is static:
    const
      PTLS_BLOWFISH_BLOCK_SIZE* = 8 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:118:9
  else:
    let PTLS_BLOWFISH_BLOCK_SIZE* = 8 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:118:9
else:
  static :
    hint("Declaration of " & "PTLS_BLOWFISH_BLOCK_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_SHA256_BLOCK_SIZE):
  when 64 is static:
    const
      PTLS_SHA256_BLOCK_SIZE* = 64 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:120:9
  else:
    let PTLS_SHA256_BLOCK_SIZE* = 64 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:120:9
else:
  static :
    hint("Declaration of " & "PTLS_SHA256_BLOCK_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_SHA256_DIGEST_SIZE):
  when 32 is static:
    const
      PTLS_SHA256_DIGEST_SIZE* = 32 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:121:9
  else:
    let PTLS_SHA256_DIGEST_SIZE* = 32 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:121:9
else:
  static :
    hint("Declaration of " & "PTLS_SHA256_DIGEST_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_SHA384_BLOCK_SIZE):
  when 128 is static:
    const
      PTLS_SHA384_BLOCK_SIZE* = 128 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:123:9
  else:
    let PTLS_SHA384_BLOCK_SIZE* = 128 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:123:9
else:
  static :
    hint("Declaration of " & "PTLS_SHA384_BLOCK_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_SHA384_DIGEST_SIZE):
  when 48 is static:
    const
      PTLS_SHA384_DIGEST_SIZE* = 48 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:124:9
  else:
    let PTLS_SHA384_DIGEST_SIZE* = 48 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:124:9
else:
  static :
    hint("Declaration of " & "PTLS_SHA384_DIGEST_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_SHA512_BLOCK_SIZE):
  when 128 is static:
    const
      PTLS_SHA512_BLOCK_SIZE* = 128 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:126:9
  else:
    let PTLS_SHA512_BLOCK_SIZE* = 128 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:126:9
else:
  static :
    hint("Declaration of " & "PTLS_SHA512_BLOCK_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_SHA512_DIGEST_SIZE):
  when 64 is static:
    const
      PTLS_SHA512_DIGEST_SIZE* = 64 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:127:9
  else:
    let PTLS_SHA512_DIGEST_SIZE* = 64 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:127:9
else:
  static :
    hint("Declaration of " & "PTLS_SHA512_DIGEST_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_MAX_SECRET_SIZE):
  when 32 is static:
    const
      PTLS_MAX_SECRET_SIZE* = 32 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:129:9
  else:
    let PTLS_MAX_SECRET_SIZE* = 32 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:129:9
else:
  static :
    hint("Declaration of " & "PTLS_MAX_SECRET_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_MAX_IV_SIZE):
  when 32 is static:
    const
      PTLS_MAX_IV_SIZE* = 32 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:130:9
  else:
    let PTLS_MAX_IV_SIZE* = 32 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:130:9
else:
  static :
    hint("Declaration of " & "PTLS_MAX_IV_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_MAX_DIGEST_SIZE):
  when 64 is static:
    const
      PTLS_MAX_DIGEST_SIZE* = 64 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:131:9
  else:
    let PTLS_MAX_DIGEST_SIZE* = 64 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:131:9
else:
  static :
    hint("Declaration of " & "PTLS_MAX_DIGEST_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_PROTOCOL_VERSION_TLS12):
  when 771 is static:
    const
      PTLS_PROTOCOL_VERSION_TLS12* = 771 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:134:9
  else:
    let PTLS_PROTOCOL_VERSION_TLS12* = 771 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:134:9
else:
  static :
    hint("Declaration of " & "PTLS_PROTOCOL_VERSION_TLS12" &
        " already exists, not redeclaring")
when not declared(PTLS_PROTOCOL_VERSION_TLS13):
  when 772 is static:
    const
      PTLS_PROTOCOL_VERSION_TLS13* = 772 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:135:9
  else:
    let PTLS_PROTOCOL_VERSION_TLS13* = 772 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:135:9
else:
  static :
    hint("Declaration of " & "PTLS_PROTOCOL_VERSION_TLS13" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_AES_128_GCM_SHA256):
  when 4865 is static:
    const
      PTLS_CIPHER_SUITE_AES_128_GCM_SHA256* = 4865 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:138:9
  else:
    let PTLS_CIPHER_SUITE_AES_128_GCM_SHA256* = 4865 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:138:9
else:
  static :
    hint("Declaration of " & "PTLS_CIPHER_SUITE_AES_128_GCM_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_NAME_AES_128_GCM_SHA256):
  when "TLS_AES_128_GCM_SHA256" is static:
    const
      PTLS_CIPHER_SUITE_NAME_AES_128_GCM_SHA256* = "TLS_AES_128_GCM_SHA256" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:139:9
  else:
    let PTLS_CIPHER_SUITE_NAME_AES_128_GCM_SHA256* = "TLS_AES_128_GCM_SHA256" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:139:9
else:
  static :
    hint("Declaration of " & "PTLS_CIPHER_SUITE_NAME_AES_128_GCM_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_AES_256_GCM_SHA384):
  when 4866 is static:
    const
      PTLS_CIPHER_SUITE_AES_256_GCM_SHA384* = 4866 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:140:9
  else:
    let PTLS_CIPHER_SUITE_AES_256_GCM_SHA384* = 4866 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:140:9
else:
  static :
    hint("Declaration of " & "PTLS_CIPHER_SUITE_AES_256_GCM_SHA384" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_NAME_AES_256_GCM_SHA384):
  when "TLS_AES_256_GCM_SHA384" is static:
    const
      PTLS_CIPHER_SUITE_NAME_AES_256_GCM_SHA384* = "TLS_AES_256_GCM_SHA384" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:141:9
  else:
    let PTLS_CIPHER_SUITE_NAME_AES_256_GCM_SHA384* = "TLS_AES_256_GCM_SHA384" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:141:9
else:
  static :
    hint("Declaration of " & "PTLS_CIPHER_SUITE_NAME_AES_256_GCM_SHA384" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_CHACHA20_POLY1305_SHA256):
  when 4867 is static:
    const
      PTLS_CIPHER_SUITE_CHACHA20_POLY1305_SHA256* = 4867 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:142:9
  else:
    let PTLS_CIPHER_SUITE_CHACHA20_POLY1305_SHA256* = 4867 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:142:9
else:
  static :
    hint("Declaration of " & "PTLS_CIPHER_SUITE_CHACHA20_POLY1305_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_NAME_CHACHA20_POLY1305_SHA256):
  when "TLS_CHACHA20_POLY1305_SHA256" is static:
    const
      PTLS_CIPHER_SUITE_NAME_CHACHA20_POLY1305_SHA256* = "TLS_CHACHA20_POLY1305_SHA256" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:143:9
  else:
    let PTLS_CIPHER_SUITE_NAME_CHACHA20_POLY1305_SHA256* = "TLS_CHACHA20_POLY1305_SHA256" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:143:9
else:
  static :
    hint("Declaration of " & "PTLS_CIPHER_SUITE_NAME_CHACHA20_POLY1305_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_AEGIS256_SHA512):
  when 4870 is static:
    const
      PTLS_CIPHER_SUITE_AEGIS256_SHA512* = 4870 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:144:9
  else:
    let PTLS_CIPHER_SUITE_AEGIS256_SHA512* = 4870 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:144:9
else:
  static :
    hint("Declaration of " & "PTLS_CIPHER_SUITE_AEGIS256_SHA512" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_NAME_AEGIS256_SHA512):
  when "TLS_AEGIS_256_SHA512" is static:
    const
      PTLS_CIPHER_SUITE_NAME_AEGIS256_SHA512* = "TLS_AEGIS_256_SHA512" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:145:9
  else:
    let PTLS_CIPHER_SUITE_NAME_AEGIS256_SHA512* = "TLS_AEGIS_256_SHA512" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:145:9
else:
  static :
    hint("Declaration of " & "PTLS_CIPHER_SUITE_NAME_AEGIS256_SHA512" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_AEGIS128L_SHA256):
  when 4871 is static:
    const
      PTLS_CIPHER_SUITE_AEGIS128L_SHA256* = 4871 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:146:9
  else:
    let PTLS_CIPHER_SUITE_AEGIS128L_SHA256* = 4871 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:146:9
else:
  static :
    hint("Declaration of " & "PTLS_CIPHER_SUITE_AEGIS128L_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_NAME_AEGIS128L_SHA256):
  when "TLS_AEGIS_128L_SHA256" is static:
    const
      PTLS_CIPHER_SUITE_NAME_AEGIS128L_SHA256* = "TLS_AEGIS_128L_SHA256" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:147:9
  else:
    let PTLS_CIPHER_SUITE_NAME_AEGIS128L_SHA256* = "TLS_AEGIS_128L_SHA256" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:147:9
else:
  static :
    hint("Declaration of " & "PTLS_CIPHER_SUITE_NAME_AEGIS128L_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256):
  when 49195 is static:
    const
      PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256* = 49195 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:150:9
  else:
    let PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256* = 49195 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:150:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256):
  when "ECDHE-ECDSA-AES128-GCM-SHA256" is static:
    const
      PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256* = "ECDHE-ECDSA-AES128-GCM-SHA256" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:151:9
  else:
    let PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256* = "ECDHE-ECDSA-AES128-GCM-SHA256" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:151:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384):
  when 49196 is static:
    const
      PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384* = 49196 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:152:9
  else:
    let PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384* = 49196 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:152:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384):
  when "ECDHE-ECDSA-AES256-GCM-SHA384" is static:
    const
      PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384* = "ECDHE-ECDSA-AES256-GCM-SHA384" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:153:9
  else:
    let PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384* = "ECDHE-ECDSA-AES256-GCM-SHA384" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:153:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_AES_128_GCM_SHA256):
  when 49199 is static:
    const
      PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_AES_128_GCM_SHA256* = 49199 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:154:9
  else:
    let PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_AES_128_GCM_SHA256* = 49199 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:154:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_AES_128_GCM_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_AES_128_GCM_SHA256):
  when "ECDHE-RSA-AES128-GCM-SHA256" is static:
    const
      PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_AES_128_GCM_SHA256* = "ECDHE-RSA-AES128-GCM-SHA256" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:155:9
  else:
    let PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_AES_128_GCM_SHA256* = "ECDHE-RSA-AES128-GCM-SHA256" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:155:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_AES_128_GCM_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_AES_256_GCM_SHA384):
  when 49200 is static:
    const
      PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_AES_256_GCM_SHA384* = 49200 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:156:9
  else:
    let PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_AES_256_GCM_SHA384* = 49200 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:156:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_AES_256_GCM_SHA384" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_AES_256_GCM_SHA384):
  when "ECDHE-RSA-AES256-GCM-SHA384" is static:
    const
      PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_AES_256_GCM_SHA384* = "ECDHE-RSA-AES256-GCM-SHA384" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:157:9
  else:
    let PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_AES_256_GCM_SHA384* = "ECDHE-RSA-AES256-GCM-SHA384" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:157:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_AES_256_GCM_SHA384" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256):
  when 52392 is static:
    const
      PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256* = 52392 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:158:9
  else:
    let PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256* = 52392 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:158:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256):
  when "ECDHE-RSA-CHACHA20-POLY1305" is static:
    const
      PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256* = "ECDHE-RSA-CHACHA20-POLY1305" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:159:9
  else:
    let PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256* = "ECDHE-RSA-CHACHA20-POLY1305" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:159:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_NAME_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256):
  when 52393 is static:
    const
      PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256* = 52393 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:160:9
  else:
    let PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256* = 52393 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:160:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256):
  when "ECDHE-ECDSA-CHACHA20-POLY1305" is static:
    const
      PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256* = "ECDHE-ECDSA-CHACHA20-POLY1305" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:161:9
  else:
    let PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256* = "ECDHE-ECDSA-CHACHA20-POLY1305" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:161:9
else:
  static :
    hint("Declaration of " &
        "PTLS_CIPHER_SUITE_NAME_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_SECP256R1):
  when 23 is static:
    const
      PTLS_GROUP_SECP256R1* = 23 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:164:9
  else:
    let PTLS_GROUP_SECP256R1* = 23 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:164:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_SECP256R1" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_NAME_SECP256R1):
  when "secp256r1" is static:
    const
      PTLS_GROUP_NAME_SECP256R1* = "secp256r1" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:165:9
  else:
    let PTLS_GROUP_NAME_SECP256R1* = "secp256r1" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:165:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_NAME_SECP256R1" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_SECP384R1):
  when 24 is static:
    const
      PTLS_GROUP_SECP384R1* = 24 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:166:9
  else:
    let PTLS_GROUP_SECP384R1* = 24 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:166:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_SECP384R1" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_NAME_SECP384R1):
  when "secp384r1" is static:
    const
      PTLS_GROUP_NAME_SECP384R1* = "secp384r1" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:167:9
  else:
    let PTLS_GROUP_NAME_SECP384R1* = "secp384r1" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:167:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_NAME_SECP384R1" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_SECP521R1):
  when 25 is static:
    const
      PTLS_GROUP_SECP521R1* = 25 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:168:9
  else:
    let PTLS_GROUP_SECP521R1* = 25 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:168:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_SECP521R1" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_NAME_SECP521R1):
  when "secp521r1" is static:
    const
      PTLS_GROUP_NAME_SECP521R1* = "secp521r1" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:169:9
  else:
    let PTLS_GROUP_NAME_SECP521R1* = "secp521r1" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:169:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_NAME_SECP521R1" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_X25519):
  when 29 is static:
    const
      PTLS_GROUP_X25519* = 29 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:170:9
  else:
    let PTLS_GROUP_X25519* = 29 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:170:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_X25519" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_NAME_X25519):
  when "x25519" is static:
    const
      PTLS_GROUP_NAME_X25519* = "x25519" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:171:9
  else:
    let PTLS_GROUP_NAME_X25519* = "x25519" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:171:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_NAME_X25519" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_X448):
  when 30 is static:
    const
      PTLS_GROUP_X448* = 30  ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:172:9
  else:
    let PTLS_GROUP_X448* = 30 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:172:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_X448" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_NAME_X448):
  when "x448" is static:
    const
      PTLS_GROUP_NAME_X448* = "x448" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:173:9
  else:
    let PTLS_GROUP_NAME_X448* = "x448" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:173:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_NAME_X448" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_X25519MLKEM768):
  when 4588 is static:
    const
      PTLS_GROUP_X25519MLKEM768* = 4588 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:174:9
  else:
    let PTLS_GROUP_X25519MLKEM768* = 4588 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:174:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_X25519MLKEM768" &
        " already exists, not redeclaring")
when not declared(PTLS_GROUP_NAME_X25519MLKEM768):
  when "X25519MLKEM768" is static:
    const
      PTLS_GROUP_NAME_X25519MLKEM768* = "X25519MLKEM768" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:175:9
  else:
    let PTLS_GROUP_NAME_X25519MLKEM768* = "X25519MLKEM768" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:175:9
else:
  static :
    hint("Declaration of " & "PTLS_GROUP_NAME_X25519MLKEM768" &
        " already exists, not redeclaring")
when not declared(PTLS_SIGNATURE_RSA_PKCS1_SHA1):
  when 513 is static:
    const
      PTLS_SIGNATURE_RSA_PKCS1_SHA1* = 513 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:178:9
  else:
    let PTLS_SIGNATURE_RSA_PKCS1_SHA1* = 513 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:178:9
else:
  static :
    hint("Declaration of " & "PTLS_SIGNATURE_RSA_PKCS1_SHA1" &
        " already exists, not redeclaring")
when not declared(PTLS_SIGNATURE_RSA_PKCS1_SHA256):
  when 1025 is static:
    const
      PTLS_SIGNATURE_RSA_PKCS1_SHA256* = 1025 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:179:9
  else:
    let PTLS_SIGNATURE_RSA_PKCS1_SHA256* = 1025 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:179:9
else:
  static :
    hint("Declaration of " & "PTLS_SIGNATURE_RSA_PKCS1_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_SIGNATURE_ECDSA_SECP256R1_SHA256):
  when 1027 is static:
    const
      PTLS_SIGNATURE_ECDSA_SECP256R1_SHA256* = 1027 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:180:9
  else:
    let PTLS_SIGNATURE_ECDSA_SECP256R1_SHA256* = 1027 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:180:9
else:
  static :
    hint("Declaration of " & "PTLS_SIGNATURE_ECDSA_SECP256R1_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_SIGNATURE_ECDSA_SECP384R1_SHA384):
  when 1283 is static:
    const
      PTLS_SIGNATURE_ECDSA_SECP384R1_SHA384* = 1283 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:181:9
  else:
    let PTLS_SIGNATURE_ECDSA_SECP384R1_SHA384* = 1283 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:181:9
else:
  static :
    hint("Declaration of " & "PTLS_SIGNATURE_ECDSA_SECP384R1_SHA384" &
        " already exists, not redeclaring")
when not declared(PTLS_SIGNATURE_ECDSA_SECP521R1_SHA512):
  when 1539 is static:
    const
      PTLS_SIGNATURE_ECDSA_SECP521R1_SHA512* = 1539 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:182:9
  else:
    let PTLS_SIGNATURE_ECDSA_SECP521R1_SHA512* = 1539 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:182:9
else:
  static :
    hint("Declaration of " & "PTLS_SIGNATURE_ECDSA_SECP521R1_SHA512" &
        " already exists, not redeclaring")
when not declared(PTLS_SIGNATURE_RSA_PSS_RSAE_SHA256):
  when 2052 is static:
    const
      PTLS_SIGNATURE_RSA_PSS_RSAE_SHA256* = 2052 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:183:9
  else:
    let PTLS_SIGNATURE_RSA_PSS_RSAE_SHA256* = 2052 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:183:9
else:
  static :
    hint("Declaration of " & "PTLS_SIGNATURE_RSA_PSS_RSAE_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_SIGNATURE_RSA_PSS_RSAE_SHA384):
  when 2053 is static:
    const
      PTLS_SIGNATURE_RSA_PSS_RSAE_SHA384* = 2053 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:184:9
  else:
    let PTLS_SIGNATURE_RSA_PSS_RSAE_SHA384* = 2053 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:184:9
else:
  static :
    hint("Declaration of " & "PTLS_SIGNATURE_RSA_PSS_RSAE_SHA384" &
        " already exists, not redeclaring")
when not declared(PTLS_SIGNATURE_RSA_PSS_RSAE_SHA512):
  when 2054 is static:
    const
      PTLS_SIGNATURE_RSA_PSS_RSAE_SHA512* = 2054 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:185:9
  else:
    let PTLS_SIGNATURE_RSA_PSS_RSAE_SHA512* = 2054 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:185:9
else:
  static :
    hint("Declaration of " & "PTLS_SIGNATURE_RSA_PSS_RSAE_SHA512" &
        " already exists, not redeclaring")
when not declared(PTLS_SIGNATURE_ED25519):
  when 2055 is static:
    const
      PTLS_SIGNATURE_ED25519* = 2055 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:186:9
  else:
    let PTLS_SIGNATURE_ED25519* = 2055 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:186:9
else:
  static :
    hint("Declaration of " & "PTLS_SIGNATURE_ED25519" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_MODE_BASE):
  when 0 is static:
    const
      PTLS_HPKE_MODE_BASE* = 0 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:189:9
  else:
    let PTLS_HPKE_MODE_BASE* = 0 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:189:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_MODE_BASE" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_MODE_PSK):
  when 1 is static:
    const
      PTLS_HPKE_MODE_PSK* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:190:9
  else:
    let PTLS_HPKE_MODE_PSK* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:190:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_MODE_PSK" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_MODE_AUTH):
  when 2 is static:
    const
      PTLS_HPKE_MODE_AUTH* = 2 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:191:9
  else:
    let PTLS_HPKE_MODE_AUTH* = 2 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:191:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_MODE_AUTH" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_MODE_AUTH_PSK):
  when 3 is static:
    const
      PTLS_HPKE_MODE_AUTH_PSK* = 3 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:192:9
  else:
    let PTLS_HPKE_MODE_AUTH_PSK* = 3 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:192:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_MODE_AUTH_PSK" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_KEM_P256_SHA256):
  when 16 is static:
    const
      PTLS_HPKE_KEM_P256_SHA256* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:193:9
  else:
    let PTLS_HPKE_KEM_P256_SHA256* = 16 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:193:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_KEM_P256_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_KEM_P384_SHA384):
  when 17 is static:
    const
      PTLS_HPKE_KEM_P384_SHA384* = 17 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:194:9
  else:
    let PTLS_HPKE_KEM_P384_SHA384* = 17 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:194:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_KEM_P384_SHA384" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_KEM_X25519_SHA256):
  when 32 is static:
    const
      PTLS_HPKE_KEM_X25519_SHA256* = 32 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:195:9
  else:
    let PTLS_HPKE_KEM_X25519_SHA256* = 32 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:195:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_KEM_X25519_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_HKDF_SHA256):
  when 1 is static:
    const
      PTLS_HPKE_HKDF_SHA256* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:196:9
  else:
    let PTLS_HPKE_HKDF_SHA256* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:196:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_HKDF_SHA256" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_HKDF_SHA384):
  when 2 is static:
    const
      PTLS_HPKE_HKDF_SHA384* = 2 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:197:9
  else:
    let PTLS_HPKE_HKDF_SHA384* = 2 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:197:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_HKDF_SHA384" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_HKDF_SHA512):
  when 3 is static:
    const
      PTLS_HPKE_HKDF_SHA512* = 3 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:198:9
  else:
    let PTLS_HPKE_HKDF_SHA512* = 3 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:198:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_HKDF_SHA512" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_AEAD_AES_128_GCM):
  when 1 is static:
    const
      PTLS_HPKE_AEAD_AES_128_GCM* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:199:9
  else:
    let PTLS_HPKE_AEAD_AES_128_GCM* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:199:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_AEAD_AES_128_GCM" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_AEAD_AES_256_GCM):
  when 2 is static:
    const
      PTLS_HPKE_AEAD_AES_256_GCM* = 2 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:200:9
  else:
    let PTLS_HPKE_AEAD_AES_256_GCM* = 2 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:200:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_AEAD_AES_256_GCM" &
        " already exists, not redeclaring")
when not declared(PTLS_HPKE_AEAD_CHACHA20POLY1305):
  when 3 is static:
    const
      PTLS_HPKE_AEAD_CHACHA20POLY1305* = 3 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:201:9
  else:
    let PTLS_HPKE_AEAD_CHACHA20POLY1305* = 3 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:201:9
else:
  static :
    hint("Declaration of " & "PTLS_HPKE_AEAD_CHACHA20POLY1305" &
        " already exists, not redeclaring")
when not declared(PTLS_ERROR_CLASS_SELF_ALERT):
  when 0 is static:
    const
      PTLS_ERROR_CLASS_SELF_ALERT* = 0 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:204:9
  else:
    let PTLS_ERROR_CLASS_SELF_ALERT* = 0 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:204:9
else:
  static :
    hint("Declaration of " & "PTLS_ERROR_CLASS_SELF_ALERT" &
        " already exists, not redeclaring")
when not declared(PTLS_ERROR_CLASS_PEER_ALERT):
  when 256 is static:
    const
      PTLS_ERROR_CLASS_PEER_ALERT* = 256 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:205:9
  else:
    let PTLS_ERROR_CLASS_PEER_ALERT* = 256 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:205:9
else:
  static :
    hint("Declaration of " & "PTLS_ERROR_CLASS_PEER_ALERT" &
        " already exists, not redeclaring")
when not declared(PTLS_ERROR_CLASS_INTERNAL):
  when 512 is static:
    const
      PTLS_ERROR_CLASS_INTERNAL* = 512 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:206:9
  else:
    let PTLS_ERROR_CLASS_INTERNAL* = 512 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:206:9
else:
  static :
    hint("Declaration of " & "PTLS_ERROR_CLASS_INTERNAL" &
        " already exists, not redeclaring")
when not declared(PTLS_HKDF_EXPAND_LABEL_PREFIX):
  when "tls13 " is static:
    const
      PTLS_HKDF_EXPAND_LABEL_PREFIX* = "tls13 " ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:214:9
  else:
    let PTLS_HKDF_EXPAND_LABEL_PREFIX* = "tls13 " ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:214:9
else:
  static :
    hint("Declaration of " & "PTLS_HKDF_EXPAND_LABEL_PREFIX" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_LEVEL_WARNING):
  when 1 is static:
    const
      PTLS_ALERT_LEVEL_WARNING* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:217:9
  else:
    let PTLS_ALERT_LEVEL_WARNING* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:217:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_LEVEL_WARNING" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_LEVEL_FATAL):
  when 2 is static:
    const
      PTLS_ALERT_LEVEL_FATAL* = 2 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:218:9
  else:
    let PTLS_ALERT_LEVEL_FATAL* = 2 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:218:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_LEVEL_FATAL" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_CLOSE_NOTIFY):
  when 0 is static:
    const
      PTLS_ALERT_CLOSE_NOTIFY* = 0 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:220:9
  else:
    let PTLS_ALERT_CLOSE_NOTIFY* = 0 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:220:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_CLOSE_NOTIFY" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_UNEXPECTED_MESSAGE):
  when 10 is static:
    const
      PTLS_ALERT_UNEXPECTED_MESSAGE* = 10 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:221:9
  else:
    let PTLS_ALERT_UNEXPECTED_MESSAGE* = 10 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:221:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_UNEXPECTED_MESSAGE" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_BAD_RECORD_MAC):
  when 20 is static:
    const
      PTLS_ALERT_BAD_RECORD_MAC* = 20 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:222:9
  else:
    let PTLS_ALERT_BAD_RECORD_MAC* = 20 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:222:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_BAD_RECORD_MAC" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_HANDSHAKE_FAILURE):
  when 40 is static:
    const
      PTLS_ALERT_HANDSHAKE_FAILURE* = 40 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:223:9
  else:
    let PTLS_ALERT_HANDSHAKE_FAILURE* = 40 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:223:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_HANDSHAKE_FAILURE" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_BAD_CERTIFICATE):
  when 42 is static:
    const
      PTLS_ALERT_BAD_CERTIFICATE* = 42 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:224:9
  else:
    let PTLS_ALERT_BAD_CERTIFICATE* = 42 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:224:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_BAD_CERTIFICATE" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_UNSUPPORTED_CERTIFICATE):
  when 43 is static:
    const
      PTLS_ALERT_UNSUPPORTED_CERTIFICATE* = 43 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:225:9
  else:
    let PTLS_ALERT_UNSUPPORTED_CERTIFICATE* = 43 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:225:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_UNSUPPORTED_CERTIFICATE" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_CERTIFICATE_REVOKED):
  when 44 is static:
    const
      PTLS_ALERT_CERTIFICATE_REVOKED* = 44 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:226:9
  else:
    let PTLS_ALERT_CERTIFICATE_REVOKED* = 44 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:226:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_CERTIFICATE_REVOKED" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_CERTIFICATE_EXPIRED):
  when 45 is static:
    const
      PTLS_ALERT_CERTIFICATE_EXPIRED* = 45 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:227:9
  else:
    let PTLS_ALERT_CERTIFICATE_EXPIRED* = 45 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:227:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_CERTIFICATE_EXPIRED" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_CERTIFICATE_UNKNOWN):
  when 46 is static:
    const
      PTLS_ALERT_CERTIFICATE_UNKNOWN* = 46 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:228:9
  else:
    let PTLS_ALERT_CERTIFICATE_UNKNOWN* = 46 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:228:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_CERTIFICATE_UNKNOWN" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_ILLEGAL_PARAMETER):
  when 47 is static:
    const
      PTLS_ALERT_ILLEGAL_PARAMETER* = 47 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:229:9
  else:
    let PTLS_ALERT_ILLEGAL_PARAMETER* = 47 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:229:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_ILLEGAL_PARAMETER" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_UNKNOWN_CA):
  when 48 is static:
    const
      PTLS_ALERT_UNKNOWN_CA* = 48 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:230:9
  else:
    let PTLS_ALERT_UNKNOWN_CA* = 48 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:230:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_UNKNOWN_CA" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_ACCESS_DENIED):
  when 49 is static:
    const
      PTLS_ALERT_ACCESS_DENIED* = 49 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:231:9
  else:
    let PTLS_ALERT_ACCESS_DENIED* = 49 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:231:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_ACCESS_DENIED" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_DECODE_ERROR):
  when 50 is static:
    const
      PTLS_ALERT_DECODE_ERROR* = 50 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:232:9
  else:
    let PTLS_ALERT_DECODE_ERROR* = 50 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:232:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_DECODE_ERROR" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_DECRYPT_ERROR):
  when 51 is static:
    const
      PTLS_ALERT_DECRYPT_ERROR* = 51 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:233:9
  else:
    let PTLS_ALERT_DECRYPT_ERROR* = 51 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:233:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_DECRYPT_ERROR" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_PROTOCOL_VERSION):
  when 70 is static:
    const
      PTLS_ALERT_PROTOCOL_VERSION* = 70 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:234:9
  else:
    let PTLS_ALERT_PROTOCOL_VERSION* = 70 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:234:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_PROTOCOL_VERSION" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_INTERNAL_ERROR):
  when 80 is static:
    const
      PTLS_ALERT_INTERNAL_ERROR* = 80 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:235:9
  else:
    let PTLS_ALERT_INTERNAL_ERROR* = 80 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:235:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_INTERNAL_ERROR" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_USER_CANCELED):
  when 90 is static:
    const
      PTLS_ALERT_USER_CANCELED* = 90 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:236:9
  else:
    let PTLS_ALERT_USER_CANCELED* = 90 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:236:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_USER_CANCELED" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_MISSING_EXTENSION):
  when 109 is static:
    const
      PTLS_ALERT_MISSING_EXTENSION* = 109 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:237:9
  else:
    let PTLS_ALERT_MISSING_EXTENSION* = 109 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:237:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_MISSING_EXTENSION" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_UNSUPPORTED_EXTENSION):
  when 110 is static:
    const
      PTLS_ALERT_UNSUPPORTED_EXTENSION* = 110 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:238:9
  else:
    let PTLS_ALERT_UNSUPPORTED_EXTENSION* = 110 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:238:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_UNSUPPORTED_EXTENSION" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_UNRECOGNIZED_NAME):
  when 112 is static:
    const
      PTLS_ALERT_UNRECOGNIZED_NAME* = 112 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:239:9
  else:
    let PTLS_ALERT_UNRECOGNIZED_NAME* = 112 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:239:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_UNRECOGNIZED_NAME" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_UNKNOWN_PSK_IDENTITY):
  when 115 is static:
    const
      PTLS_ALERT_UNKNOWN_PSK_IDENTITY* = 115 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:240:9
  else:
    let PTLS_ALERT_UNKNOWN_PSK_IDENTITY* = 115 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:240:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_UNKNOWN_PSK_IDENTITY" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_CERTIFICATE_REQUIRED):
  when 116 is static:
    const
      PTLS_ALERT_CERTIFICATE_REQUIRED* = 116 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:241:9
  else:
    let PTLS_ALERT_CERTIFICATE_REQUIRED* = 116 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:241:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_CERTIFICATE_REQUIRED" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_NO_APPLICATION_PROTOCOL):
  when 120 is static:
    const
      PTLS_ALERT_NO_APPLICATION_PROTOCOL* = 120 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:242:9
  else:
    let PTLS_ALERT_NO_APPLICATION_PROTOCOL* = 120 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:242:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_NO_APPLICATION_PROTOCOL" &
        " already exists, not redeclaring")
when not declared(PTLS_ALERT_ECH_REQUIRED):
  when 121 is static:
    const
      PTLS_ALERT_ECH_REQUIRED* = 121 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:243:9
  else:
    let PTLS_ALERT_ECH_REQUIRED* = 121 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:243:9
else:
  static :
    hint("Declaration of " & "PTLS_ALERT_ECH_REQUIRED" &
        " already exists, not redeclaring")
when not declared(PTLS_TLS12_MASTER_SECRET_SIZE):
  when 48 is static:
    const
      PTLS_TLS12_MASTER_SECRET_SIZE* = 48 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:246:9
  else:
    let PTLS_TLS12_MASTER_SECRET_SIZE* = 48 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:246:9
else:
  static :
    hint("Declaration of " & "PTLS_TLS12_MASTER_SECRET_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_TLS12_AAD_SIZE):
  when 13 is static:
    const
      PTLS_TLS12_AAD_SIZE* = 13 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:247:9
  else:
    let PTLS_TLS12_AAD_SIZE* = 13 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:247:9
else:
  static :
    hint("Declaration of " & "PTLS_TLS12_AAD_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_TLS12_AESGCM_FIXED_IV_SIZE):
  when 4 is static:
    const
      PTLS_TLS12_AESGCM_FIXED_IV_SIZE* = 4 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:248:9
  else:
    let PTLS_TLS12_AESGCM_FIXED_IV_SIZE* = 4 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:248:9
else:
  static :
    hint("Declaration of " & "PTLS_TLS12_AESGCM_FIXED_IV_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_TLS12_AESGCM_RECORD_IV_SIZE):
  when 8 is static:
    const
      PTLS_TLS12_AESGCM_RECORD_IV_SIZE* = 8 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:249:9
  else:
    let PTLS_TLS12_AESGCM_RECORD_IV_SIZE* = 8 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:249:9
else:
  static :
    hint("Declaration of " & "PTLS_TLS12_AESGCM_RECORD_IV_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_TLS12_CHACHAPOLY_FIXED_IV_SIZE):
  when 12 is static:
    const
      PTLS_TLS12_CHACHAPOLY_FIXED_IV_SIZE* = 12 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:250:9
  else:
    let PTLS_TLS12_CHACHAPOLY_FIXED_IV_SIZE* = 12 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:250:9
else:
  static :
    hint("Declaration of " & "PTLS_TLS12_CHACHAPOLY_FIXED_IV_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_TLS12_CHACHAPOLY_RECORD_IV_SIZE):
  when 0 is static:
    const
      PTLS_TLS12_CHACHAPOLY_RECORD_IV_SIZE* = 0 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:251:9
  else:
    let PTLS_TLS12_CHACHAPOLY_RECORD_IV_SIZE* = 0 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:251:9
else:
  static :
    hint("Declaration of " & "PTLS_TLS12_CHACHAPOLY_RECORD_IV_SIZE" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_CLIENT_HELLO):
  when 1 is static:
    const
      PTLS_HANDSHAKE_TYPE_CLIENT_HELLO* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:283:9
  else:
    let PTLS_HANDSHAKE_TYPE_CLIENT_HELLO* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:283:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_CLIENT_HELLO" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_SERVER_HELLO):
  when 2 is static:
    const
      PTLS_HANDSHAKE_TYPE_SERVER_HELLO* = 2 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:284:9
  else:
    let PTLS_HANDSHAKE_TYPE_SERVER_HELLO* = 2 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:284:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_SERVER_HELLO" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_NEW_SESSION_TICKET):
  when 4 is static:
    const
      PTLS_HANDSHAKE_TYPE_NEW_SESSION_TICKET* = 4 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:285:9
  else:
    let PTLS_HANDSHAKE_TYPE_NEW_SESSION_TICKET* = 4 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:285:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_NEW_SESSION_TICKET" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_END_OF_EARLY_DATA):
  when 5 is static:
    const
      PTLS_HANDSHAKE_TYPE_END_OF_EARLY_DATA* = 5 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:286:9
  else:
    let PTLS_HANDSHAKE_TYPE_END_OF_EARLY_DATA* = 5 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:286:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_END_OF_EARLY_DATA" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_ENCRYPTED_EXTENSIONS):
  when 8 is static:
    const
      PTLS_HANDSHAKE_TYPE_ENCRYPTED_EXTENSIONS* = 8 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:287:9
  else:
    let PTLS_HANDSHAKE_TYPE_ENCRYPTED_EXTENSIONS* = 8 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:287:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_ENCRYPTED_EXTENSIONS" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_CERTIFICATE):
  when 11 is static:
    const
      PTLS_HANDSHAKE_TYPE_CERTIFICATE* = 11 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:288:9
  else:
    let PTLS_HANDSHAKE_TYPE_CERTIFICATE* = 11 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:288:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_CERTIFICATE" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_CERTIFICATE_REQUEST):
  when 13 is static:
    const
      PTLS_HANDSHAKE_TYPE_CERTIFICATE_REQUEST* = 13 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:289:9
  else:
    let PTLS_HANDSHAKE_TYPE_CERTIFICATE_REQUEST* = 13 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:289:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_CERTIFICATE_REQUEST" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_CERTIFICATE_VERIFY):
  when 15 is static:
    const
      PTLS_HANDSHAKE_TYPE_CERTIFICATE_VERIFY* = 15 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:290:9
  else:
    let PTLS_HANDSHAKE_TYPE_CERTIFICATE_VERIFY* = 15 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:290:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_CERTIFICATE_VERIFY" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_FINISHED):
  when 20 is static:
    const
      PTLS_HANDSHAKE_TYPE_FINISHED* = 20 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:291:9
  else:
    let PTLS_HANDSHAKE_TYPE_FINISHED* = 20 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:291:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_FINISHED" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_KEY_UPDATE):
  when 24 is static:
    const
      PTLS_HANDSHAKE_TYPE_KEY_UPDATE* = 24 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:292:9
  else:
    let PTLS_HANDSHAKE_TYPE_KEY_UPDATE* = 24 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:292:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_KEY_UPDATE" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_COMPRESSED_CERTIFICATE):
  when 25 is static:
    const
      PTLS_HANDSHAKE_TYPE_COMPRESSED_CERTIFICATE* = 25 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:293:9
  else:
    let PTLS_HANDSHAKE_TYPE_COMPRESSED_CERTIFICATE* = 25 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:293:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_COMPRESSED_CERTIFICATE" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_MESSAGE_HASH):
  when 254 is static:
    const
      PTLS_HANDSHAKE_TYPE_MESSAGE_HASH* = 254 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:294:9
  else:
    let PTLS_HANDSHAKE_TYPE_MESSAGE_HASH* = 254 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:294:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_MESSAGE_HASH" &
        " already exists, not redeclaring")
when not declared(PTLS_HANDSHAKE_TYPE_PSEUDO_HRR):
  when -1 is static:
    const
      PTLS_HANDSHAKE_TYPE_PSEUDO_HRR* = -1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:295:9
  else:
    let PTLS_HANDSHAKE_TYPE_PSEUDO_HRR* = -1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:295:9
else:
  static :
    hint("Declaration of " & "PTLS_HANDSHAKE_TYPE_PSEUDO_HRR" &
        " already exists, not redeclaring")
when not declared(PTLS_CERTIFICATE_TYPE_X509):
  when 0 is static:
    const
      PTLS_CERTIFICATE_TYPE_X509* = 0 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:297:9
  else:
    let PTLS_CERTIFICATE_TYPE_X509* = 0 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:297:9
else:
  static :
    hint("Declaration of " & "PTLS_CERTIFICATE_TYPE_X509" &
        " already exists, not redeclaring")
when not declared(PTLS_CERTIFICATE_TYPE_RAW_PUBLIC_KEY):
  when 2 is static:
    const
      PTLS_CERTIFICATE_TYPE_RAW_PUBLIC_KEY* = 2 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:298:9
  else:
    let PTLS_CERTIFICATE_TYPE_RAW_PUBLIC_KEY* = 2 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:298:9
else:
  static :
    hint("Declaration of " & "PTLS_CERTIFICATE_TYPE_RAW_PUBLIC_KEY" &
        " already exists, not redeclaring")
when not declared(PTLS_DEFAULT_MAX_TICKETS_TO_SERVE):
  when 4 is static:
    const
      PTLS_DEFAULT_MAX_TICKETS_TO_SERVE* = 4 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:321:9
  else:
    let PTLS_DEFAULT_MAX_TICKETS_TO_SERVE* = 4 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:321:9
else:
  static :
    hint("Declaration of " & "PTLS_DEFAULT_MAX_TICKETS_TO_SERVE" &
        " already exists, not redeclaring")
when not declared(PTLS_ENCODE_QUICINT_CAPACITY):
  when 8 is static:
    const
      PTLS_ENCODE_QUICINT_CAPACITY* = 8 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:1219:9
  else:
    let PTLS_ENCODE_QUICINT_CAPACITY* = 8 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:1219:9
else:
  static :
    hint("Declaration of " & "PTLS_ENCODE_QUICINT_CAPACITY" &
        " already exists, not redeclaring")
when not declared(PTLS_QUICINT_MAX):
  when 4611686018427387903 is static:
    const
      PTLS_QUICINT_MAX* = 4611686018427387903'i64 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:1221:9
  else:
    let PTLS_QUICINT_MAX* = 4611686018427387903'i64 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:1221:9
else:
  static :
    hint("Declaration of " & "PTLS_QUICINT_MAX" &
        " already exists, not redeclaring")
when not declared(PTLS_QUICINT_LONGEST_STR):
  when "4611686018427387903" is static:
    const
      PTLS_QUICINT_LONGEST_STR* = "4611686018427387903" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:1222:9
  else:
    let PTLS_QUICINT_LONGEST_STR* = "4611686018427387903" ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/../picotls.h:1222:9
else:
  static :
    hint("Declaration of " & "PTLS_QUICINT_LONGEST_STR" &
        " already exists, not redeclaring")
when not declared(PTLS_OPENSSL_HAVE_CHACHA20_POLY1305):
  when 1 is static:
    const
      PTLS_OPENSSL_HAVE_CHACHA20_POLY1305* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:37:9
  else:
    let PTLS_OPENSSL_HAVE_CHACHA20_POLY1305* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:37:9
else:
  static :
    hint("Declaration of " & "PTLS_OPENSSL_HAVE_CHACHA20_POLY1305" &
        " already exists, not redeclaring")
when not declared(PTLS_OPENSSL_HAVE_ASYNC):
  when 1 is static:
    const
      PTLS_OPENSSL_HAVE_ASYNC* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:44:9
  else:
    let PTLS_OPENSSL_HAVE_ASYNC* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:44:9
else:
  static :
    hint("Declaration of " & "PTLS_OPENSSL_HAVE_ASYNC" &
        " already exists, not redeclaring")
when not declared(PTLS_OPENSSL_HAVE_SECP384R1):
  when 1 is static:
    const
      PTLS_OPENSSL_HAVE_SECP384R1* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:51:9
  else:
    let PTLS_OPENSSL_HAVE_SECP384R1* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:51:9
else:
  static :
    hint("Declaration of " & "PTLS_OPENSSL_HAVE_SECP384R1" &
        " already exists, not redeclaring")
when not declared(PTLS_OPENSSL_HAS_SECP384R1):
  when 1 is static:
    const
      PTLS_OPENSSL_HAS_SECP384R1* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:52:9
  else:
    let PTLS_OPENSSL_HAS_SECP384R1* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:52:9
else:
  static :
    hint("Declaration of " & "PTLS_OPENSSL_HAS_SECP384R1" &
        " already exists, not redeclaring")
when not declared(PTLS_OPENSSL_HAVE_SECP521R1):
  when 1 is static:
    const
      PTLS_OPENSSL_HAVE_SECP521R1* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:56:9
  else:
    let PTLS_OPENSSL_HAVE_SECP521R1* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:56:9
else:
  static :
    hint("Declaration of " & "PTLS_OPENSSL_HAVE_SECP521R1" &
        " already exists, not redeclaring")
when not declared(PTLS_OPENSSL_HAS_SECP521R1):
  when 1 is static:
    const
      PTLS_OPENSSL_HAS_SECP521R1* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:57:9
  else:
    let PTLS_OPENSSL_HAS_SECP521R1* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:57:9
else:
  static :
    hint("Declaration of " & "PTLS_OPENSSL_HAS_SECP521R1" &
        " already exists, not redeclaring")
when not declared(PTLS_OPENSSL_HAVE_ED25519):
  when 1 is static:
    const
      PTLS_OPENSSL_HAVE_ED25519* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:61:9
  else:
    let PTLS_OPENSSL_HAVE_ED25519* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:61:9
else:
  static :
    hint("Declaration of " & "PTLS_OPENSSL_HAVE_ED25519" &
        " already exists, not redeclaring")
when not declared(PTLS_OPENSSL_HAVE_X25519):
  when 1 is static:
    const
      PTLS_OPENSSL_HAVE_X25519* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:64:9
  else:
    let PTLS_OPENSSL_HAVE_X25519* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:64:9
else:
  static :
    hint("Declaration of " & "PTLS_OPENSSL_HAVE_X25519" &
        " already exists, not redeclaring")
when not declared(PTLS_OPENSSL_HAS_X25519):
  when 1 is static:
    const
      PTLS_OPENSSL_HAS_X25519* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:65:9
  else:
    let PTLS_OPENSSL_HAS_X25519* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:65:9
else:
  static :
    hint("Declaration of " & "PTLS_OPENSSL_HAS_X25519" &
        " already exists, not redeclaring")
when not declared(PTLS_OPENSSL_HAVE_X25519MLKEM768):
  when 0 is static:
    const
      PTLS_OPENSSL_HAVE_X25519MLKEM768* = 0 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:75:9
  else:
    let PTLS_OPENSSL_HAVE_X25519MLKEM768* = 0 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:75:9
else:
  static :
    hint("Declaration of " & "PTLS_OPENSSL_HAVE_X25519MLKEM768" &
        " already exists, not redeclaring")
when not declared(PTLS_OPENSSL_HAVE_BF):
  when 1 is static:
    const
      PTLS_OPENSSL_HAVE_BF* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:80:9
  else:
    let PTLS_OPENSSL_HAVE_BF* = 1 ## Generated based on /home/r/vacp2p/nim-ngtcp2/libs/picotls/include/picotls/openssl.h:80:9
else:
  static :
    hint("Declaration of " & "PTLS_OPENSSL_HAVE_BF" &
        " already exists, not redeclaring")
when not declared(ptls_buffer_release_memory):
  proc ptls_buffer_release_memory*(buf: ptr ptls_buffer_t_536871385): void {.
      cdecl, importc: "ptls_buffer__release_memory".}
else:
  static :
    hint("Declaration of " & "ptls_buffer_release_memory" &
        " already exists, not redeclaring")
when not declared(ptls_buffer_reserve):
  proc ptls_buffer_reserve*(buf: ptr ptls_buffer_t_536871385; delta: csize_t): cint {.
      cdecl, importc: "ptls_buffer_reserve".}
else:
  static :
    hint("Declaration of " & "ptls_buffer_reserve" &
        " already exists, not redeclaring")
when not declared(ptls_buffer_reserve_aligned):
  proc ptls_buffer_reserve_aligned*(buf: ptr ptls_buffer_t_536871385;
                                    delta: csize_t; align_bits: uint8): cint {.
      cdecl, importc: "ptls_buffer_reserve_aligned".}
else:
  static :
    hint("Declaration of " & "ptls_buffer_reserve_aligned" &
        " already exists, not redeclaring")
when not declared(ptls_buffer_do_pushv):
  proc ptls_buffer_do_pushv*(buf: ptr ptls_buffer_t_536871385; src: pointer;
                             len: csize_t): cint {.cdecl,
      importc: "ptls_buffer__do_pushv".}
else:
  static :
    hint("Declaration of " & "ptls_buffer_do_pushv" &
        " already exists, not redeclaring")
when not declared(ptls_buffer_adjust_quic_blocksize):
  proc ptls_buffer_adjust_quic_blocksize*(buf: ptr ptls_buffer_t_536871385;
      body_size: csize_t): cint {.cdecl,
                                  importc: "ptls_buffer__adjust_quic_blocksize".}
else:
  static :
    hint("Declaration of " & "ptls_buffer_adjust_quic_blocksize" &
        " already exists, not redeclaring")
when not declared(ptls_buffer_adjust_asn1_blocksize):
  proc ptls_buffer_adjust_asn1_blocksize*(buf: ptr ptls_buffer_t_536871385;
      body_size: csize_t): cint {.cdecl,
                                  importc: "ptls_buffer__adjust_asn1_blocksize".}
else:
  static :
    hint("Declaration of " & "ptls_buffer_adjust_asn1_blocksize" &
        " already exists, not redeclaring")
when not declared(ptls_buffer_push_asn1_ubigint):
  proc ptls_buffer_push_asn1_ubigint*(buf: ptr ptls_buffer_t_536871385;
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
  var ptls_log_conn_state_override* {.importc: "ptls_log_conn_state_override".}: ptr ptls_log_conn_state_t_536871542
else:
  static :
    hint("Declaration of " & "ptls_log_conn_state_override" &
        " already exists, not redeclaring")
when not declared(ptls_log):
  var ptls_log* {.importc: "ptls_log".}: struct_st_ptls_log_t_536871544
else:
  static :
    hint("Declaration of " & "ptls_log" & " already exists, not redeclaring")
when not declared(ptls_log_init_conn_state):
  proc ptls_log_init_conn_state*(state: ptr ptls_log_conn_state_t_536871542;
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
                              point: ptr struct_st_ptls_log_point_t_536871536): void {.
      cdecl, importc: "ptls_log__recalc_point".}
else:
  static :
    hint("Declaration of " & "ptls_log_recalc_point" &
        " already exists, not redeclaring")
when not declared(ptls_log_recalc_conn):
  proc ptls_log_recalc_conn*(caller_locked: cint;
                             conn: ptr struct_st_ptls_log_conn_state_t_536871538;
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
  proc ptls_log_do_write_start*(point: ptr struct_st_ptls_log_point_t_536871536;
                                add_time: cint): void {.cdecl,
      importc: "ptls_log__do_write_start".}
else:
  static :
    hint("Declaration of " & "ptls_log_do_write_start" &
        " already exists, not redeclaring")
when not declared(ptls_log_do_write_end):
  proc ptls_log_do_write_end*(point: ptr struct_st_ptls_log_point_t_536871536;
                              conn: ptr struct_st_ptls_log_conn_state_t_536871538;
                              get_sni: proc (a0: pointer): cstring {.cdecl.};
                              get_sni_arg: pointer; includes_appdata: cint): cint {.
      cdecl, importc: "ptls_log__do_write_end".}
else:
  static :
    hint("Declaration of " & "ptls_log_do_write_end" &
        " already exists, not redeclaring")
when not declared(ptls_client_new):
  proc ptls_client_new*(ctx: ptr ptls_context_t_536871373): ptr ptls_t_536871371 {.
      cdecl, importc: "ptls_client_new".}
else:
  static :
    hint("Declaration of " & "ptls_client_new" &
        " already exists, not redeclaring")
when not declared(ptls_server_new):
  proc ptls_server_new*(ctx: ptr ptls_context_t_536871373): ptr ptls_t_536871371 {.
      cdecl, importc: "ptls_server_new".}
else:
  static :
    hint("Declaration of " & "ptls_server_new" &
        " already exists, not redeclaring")
when not declared(ptls_build_tls12_export_params):
  proc ptls_build_tls12_export_params*(ctx: ptr ptls_context_t_536871373;
                                       output: ptr ptls_buffer_t_536871385;
                                       is_server: cint; session_reused: cint;
                                       cipher: ptr ptls_cipher_suite_t_536871431;
                                       master_secret: pointer;
                                       hello_randoms: pointer;
                                       next_send_record_iv: uint64;
                                       server_name: cstring;
                                       negotiated_protocol: ptls_iovec_t_536871381): cint {.
      cdecl, importc: "ptls_build_tls12_export_params".}
else:
  static :
    hint("Declaration of " & "ptls_build_tls12_export_params" &
        " already exists, not redeclaring")
when not declared(ptls_export):
  proc ptls_export*(tls: ptr ptls_t_536871371; output: ptr ptls_buffer_t_536871385): cint {.
      cdecl, importc: "ptls_export".}
else:
  static :
    hint("Declaration of " & "ptls_export" & " already exists, not redeclaring")
when not declared(ptls_import):
  proc ptls_import*(ctx: ptr ptls_context_t_536871373; tls: ptr ptr ptls_t_536871371;
                    params: ptls_iovec_t_536871381): cint {.cdecl,
      importc: "ptls_import".}
else:
  static :
    hint("Declaration of " & "ptls_import" & " already exists, not redeclaring")
when not declared(ptls_free):
  proc ptls_free*(tls: ptr ptls_t_536871371): void {.cdecl, importc: "ptls_free".}
else:
  static :
    hint("Declaration of " & "ptls_free" & " already exists, not redeclaring")
when not declared(ptls_get_context):
  proc ptls_get_context*(tls: ptr ptls_t_536871371): ptr ptls_context_t_536871373 {.
      cdecl, importc: "ptls_get_context".}
else:
  static :
    hint("Declaration of " & "ptls_get_context" &
        " already exists, not redeclaring")
when not declared(ptls_set_context):
  proc ptls_set_context*(tls: ptr ptls_t_536871371; ctx: ptr ptls_context_t_536871373): void {.
      cdecl, importc: "ptls_set_context".}
else:
  static :
    hint("Declaration of " & "ptls_set_context" &
        " already exists, not redeclaring")
when not declared(ptls_get_async_job):
  proc ptls_get_async_job*(tls: ptr ptls_t_536871371): ptr ptls_async_job_t_536871478 {.
      cdecl, importc: "ptls_get_async_job".}
else:
  static :
    hint("Declaration of " & "ptls_get_async_job" &
        " already exists, not redeclaring")
when not declared(ptls_get_client_random):
  proc ptls_get_client_random*(tls: ptr ptls_t_536871371): ptls_iovec_t_536871381 {.
      cdecl, importc: "ptls_get_client_random".}
else:
  static :
    hint("Declaration of " & "ptls_get_client_random" &
        " already exists, not redeclaring")
when not declared(ptls_get_cipher):
  proc ptls_get_cipher*(tls: ptr ptls_t_536871371): ptr ptls_cipher_suite_t_536871431 {.
      cdecl, importc: "ptls_get_cipher".}
else:
  static :
    hint("Declaration of " & "ptls_get_cipher" &
        " already exists, not redeclaring")
when not declared(ptls_find_cipher_suite):
  proc ptls_find_cipher_suite*(cipher_suites: ptr ptr ptls_cipher_suite_t_536871431;
                               id: uint16): ptr ptls_cipher_suite_t_536871431 {.
      cdecl, importc: "ptls_find_cipher_suite".}
else:
  static :
    hint("Declaration of " & "ptls_find_cipher_suite" &
        " already exists, not redeclaring")
when not declared(ptls_get_protocol_version):
  proc ptls_get_protocol_version*(tls: ptr ptls_t_536871371): uint16 {.cdecl,
      importc: "ptls_get_protocol_version".}
else:
  static :
    hint("Declaration of " & "ptls_get_protocol_version" &
        " already exists, not redeclaring")
when not declared(ptls_get_traffic_keys):
  proc ptls_get_traffic_keys*(tls: ptr ptls_t_536871371; is_enc: cint;
                              key: ptr uint8; iv: ptr uint8; seq: ptr uint64): cint {.
      cdecl, importc: "ptls_get_traffic_keys".}
else:
  static :
    hint("Declaration of " & "ptls_get_traffic_keys" &
        " already exists, not redeclaring")
when not declared(ptls_get_server_name):
  proc ptls_get_server_name*(tls: ptr ptls_t_536871371): cstring {.cdecl,
      importc: "ptls_get_server_name".}
else:
  static :
    hint("Declaration of " & "ptls_get_server_name" &
        " already exists, not redeclaring")
when not declared(ptls_set_server_name):
  proc ptls_set_server_name*(tls: ptr ptls_t_536871371; server_name: cstring;
                             server_name_len: csize_t): cint {.cdecl,
      importc: "ptls_set_server_name".}
else:
  static :
    hint("Declaration of " & "ptls_set_server_name" &
        " already exists, not redeclaring")
when not declared(ptls_get_negotiated_protocol):
  proc ptls_get_negotiated_protocol*(tls: ptr ptls_t_536871371): cstring {.
      cdecl, importc: "ptls_get_negotiated_protocol".}
else:
  static :
    hint("Declaration of " & "ptls_get_negotiated_protocol" &
        " already exists, not redeclaring")
when not declared(ptls_set_negotiated_protocol):
  proc ptls_set_negotiated_protocol*(tls: ptr ptls_t_536871371;
                                     protocol: cstring; protocol_len: csize_t): cint {.
      cdecl, importc: "ptls_set_negotiated_protocol".}
else:
  static :
    hint("Declaration of " & "ptls_set_negotiated_protocol" &
        " already exists, not redeclaring")
when not declared(ptls_handshake_is_complete):
  proc ptls_handshake_is_complete*(tls: ptr ptls_t_536871371): cint {.cdecl,
      importc: "ptls_handshake_is_complete".}
else:
  static :
    hint("Declaration of " & "ptls_handshake_is_complete" &
        " already exists, not redeclaring")
when not declared(ptls_is_psk_handshake):
  proc ptls_is_psk_handshake*(tls: ptr ptls_t_536871371): cint {.cdecl,
      importc: "ptls_is_psk_handshake".}
else:
  static :
    hint("Declaration of " & "ptls_is_psk_handshake" &
        " already exists, not redeclaring")
when not declared(ptls_is_ech_handshake):
  proc ptls_is_ech_handshake*(tls: ptr ptls_t_536871371; config_id: ptr uint8;
                              kem: ptr ptr ptls_hpke_kem_t_536871439;
                              cipher: ptr ptr ptls_hpke_cipher_suite_t_536871447): cint {.
      cdecl, importc: "ptls_is_ech_handshake".}
else:
  static :
    hint("Declaration of " & "ptls_is_ech_handshake" &
        " already exists, not redeclaring")
when not declared(ptls_get_data_ptr):
  proc ptls_get_data_ptr*(tls: ptr ptls_t_536871371): ptr pointer {.cdecl,
      importc: "ptls_get_data_ptr".}
else:
  static :
    hint("Declaration of " & "ptls_get_data_ptr" &
        " already exists, not redeclaring")
when not declared(ptls_get_log_state):
  proc ptls_get_log_state*(tls: ptr ptls_t_536871371): ptr ptls_log_conn_state_t_536871542 {.
      cdecl, importc: "ptls_get_log_state".}
else:
  static :
    hint("Declaration of " & "ptls_get_log_state" &
        " already exists, not redeclaring")
when not declared(ptls_handshake):
  proc ptls_handshake*(tls: ptr ptls_t_536871371; sendbuf: ptr ptls_buffer_t_536871385;
                       input: pointer; inlen: ptr csize_t;
                       args: ptr ptls_handshake_properties_t_536871532): cint {.
      cdecl, importc: "ptls_handshake".}
else:
  static :
    hint("Declaration of " & "ptls_handshake" &
        " already exists, not redeclaring")
when not declared(ptls_receive):
  proc ptls_receive*(tls: ptr ptls_t_536871371; plaintextbuf: ptr ptls_buffer_t_536871385;
                     input: pointer; len: ptr csize_t): cint {.cdecl,
      importc: "ptls_receive".}
else:
  static :
    hint("Declaration of " & "ptls_receive" & " already exists, not redeclaring")
when not declared(ptls_send):
  proc ptls_send*(tls: ptr ptls_t_536871371; sendbuf: ptr ptls_buffer_t_536871385;
                  input: pointer; inlen: csize_t): cint {.cdecl,
      importc: "ptls_send".}
else:
  static :
    hint("Declaration of " & "ptls_send" & " already exists, not redeclaring")
when not declared(ptls_update_key):
  proc ptls_update_key*(tls: ptr ptls_t_536871371; request_update: cint): cint {.
      cdecl, importc: "ptls_update_key".}
else:
  static :
    hint("Declaration of " & "ptls_update_key" &
        " already exists, not redeclaring")
when not declared(ptls_is_server):
  proc ptls_is_server*(tls: ptr ptls_t_536871371): cint {.cdecl,
      importc: "ptls_is_server".}
else:
  static :
    hint("Declaration of " & "ptls_is_server" &
        " already exists, not redeclaring")
when not declared(ptls_get_record_overhead):
  proc ptls_get_record_overhead*(tls: ptr ptls_t_536871371): csize_t {.cdecl,
      importc: "ptls_get_record_overhead".}
else:
  static :
    hint("Declaration of " & "ptls_get_record_overhead" &
        " already exists, not redeclaring")
when not declared(ptls_send_alert):
  proc ptls_send_alert*(tls: ptr ptls_t_536871371; sendbuf: ptr ptls_buffer_t_536871385;
                        level: uint8; description: uint8): cint {.cdecl,
      importc: "ptls_send_alert".}
else:
  static :
    hint("Declaration of " & "ptls_send_alert" &
        " already exists, not redeclaring")
when not declared(ptls_export_secret):
  proc ptls_export_secret*(tls: ptr ptls_t_536871371; output: pointer;
                           outlen: csize_t; label: cstring;
                           context_value: ptls_iovec_t_536871381; is_early: cint): cint {.
      cdecl, importc: "ptls_export_secret".}
else:
  static :
    hint("Declaration of " & "ptls_export_secret" &
        " already exists, not redeclaring")
when not declared(ptls_build_certificate_message):
  proc ptls_build_certificate_message*(buf: ptr ptls_buffer_t_536871385;
                                       request_context: ptls_iovec_t_536871381;
                                       certificates: ptr ptls_iovec_t_536871381;
                                       num_certificates: csize_t;
                                       ocsp_status: ptls_iovec_t_536871381): cint {.
      cdecl, importc: "ptls_build_certificate_message".}
else:
  static :
    hint("Declaration of " & "ptls_build_certificate_message" &
        " already exists, not redeclaring")
when not declared(ptls_calc_hash):
  proc ptls_calc_hash*(algo: ptr ptls_hash_algorithm_t_536871427;
                       output: pointer; src: pointer; len: csize_t): cint {.
      cdecl, importc: "ptls_calc_hash".}
else:
  static :
    hint("Declaration of " & "ptls_calc_hash" &
        " already exists, not redeclaring")
when not declared(ptls_hmac_create):
  proc ptls_hmac_create*(algo: ptr ptls_hash_algorithm_t_536871427;
                         key: pointer; key_size: csize_t): ptr ptls_hash_context_t_536871423 {.
      cdecl, importc: "ptls_hmac_create".}
else:
  static :
    hint("Declaration of " & "ptls_hmac_create" &
        " already exists, not redeclaring")
when not declared(ptls_hkdf_extract):
  proc ptls_hkdf_extract*(hash: ptr ptls_hash_algorithm_t_536871427;
                          output: pointer; salt: ptls_iovec_t_536871381;
                          ikm: ptls_iovec_t_536871381): cint {.cdecl,
      importc: "ptls_hkdf_extract".}
else:
  static :
    hint("Declaration of " & "ptls_hkdf_extract" &
        " already exists, not redeclaring")
when not declared(ptls_hkdf_expand):
  proc ptls_hkdf_expand*(hash: ptr ptls_hash_algorithm_t_536871427;
                         output: pointer; outlen: csize_t; prk: ptls_iovec_t_536871381;
                         info: ptls_iovec_t_536871381): cint {.cdecl,
      importc: "ptls_hkdf_expand".}
else:
  static :
    hint("Declaration of " & "ptls_hkdf_expand" &
        " already exists, not redeclaring")
when not declared(ptls_hkdf_expand_label):
  proc ptls_hkdf_expand_label*(algo: ptr ptls_hash_algorithm_t_536871427;
                               output: pointer; outlen: csize_t;
                               secret: ptls_iovec_t_536871381; label: cstring;
                               hash_value: ptls_iovec_t_536871381;
                               label_prefix: cstring): cint {.cdecl,
      importc: "ptls_hkdf_expand_label".}
else:
  static :
    hint("Declaration of " & "ptls_hkdf_expand_label" &
        " already exists, not redeclaring")
when not declared(ptls_tls12_phash):
  proc ptls_tls12_phash*(algo: ptr ptls_hash_algorithm_t_536871427;
                         output: pointer; outlen: csize_t; secret: ptls_iovec_t_536871381;
                         label: cstring; seed: ptls_iovec_t_536871381): cint {.
      cdecl, importc: "ptls_tls12_phash".}
else:
  static :
    hint("Declaration of " & "ptls_tls12_phash" &
        " already exists, not redeclaring")
when not declared(ptls_cipher_new):
  proc ptls_cipher_new*(algo: ptr ptls_cipher_algorithm_t_536871403;
                        is_enc: cint; key: pointer): ptr ptls_cipher_context_t_536871401 {.
      cdecl, importc: "ptls_cipher_new".}
else:
  static :
    hint("Declaration of " & "ptls_cipher_new" &
        " already exists, not redeclaring")
when not declared(ptls_cipher_free):
  proc ptls_cipher_free*(ctx: ptr ptls_cipher_context_t_536871401): void {.
      cdecl, importc: "ptls_cipher_free".}
else:
  static :
    hint("Declaration of " & "ptls_cipher_free" &
        " already exists, not redeclaring")
when not declared(ptls_aead_new):
  proc ptls_aead_new*(aead: ptr ptls_aead_algorithm_t_536871415;
                      hash: ptr ptls_hash_algorithm_t_536871427; is_enc: cint;
                      secret: pointer; label_prefix: cstring): ptr ptls_aead_context_t_536871413 {.
      cdecl, importc: "ptls_aead_new".}
else:
  static :
    hint("Declaration of " & "ptls_aead_new" &
        " already exists, not redeclaring")
when not declared(ptls_aead_new_direct):
  proc ptls_aead_new_direct*(aead: ptr ptls_aead_algorithm_t_536871415;
                             is_enc: cint; key: pointer; iv: pointer): ptr ptls_aead_context_t_536871413 {.
      cdecl, importc: "ptls_aead_new_direct".}
else:
  static :
    hint("Declaration of " & "ptls_aead_new_direct" &
        " already exists, not redeclaring")
when not declared(ptls_aead_free):
  proc ptls_aead_free*(ctx: ptr ptls_aead_context_t_536871413): void {.cdecl,
      importc: "ptls_aead_free".}
else:
  static :
    hint("Declaration of " & "ptls_aead_free" &
        " already exists, not redeclaring")
when not declared(ptls_aead_xor_iv):
  proc ptls_aead_xor_iv*(ctx: ptr ptls_aead_context_t_536871413; bytes: pointer;
                         len: csize_t): void {.cdecl,
      importc: "ptls_aead_xor_iv".}
else:
  static :
    hint("Declaration of " & "ptls_aead_xor_iv" &
        " already exists, not redeclaring")
when not declared(ptls_get_read_epoch):
  proc ptls_get_read_epoch*(tls: ptr ptls_t_536871371): csize_t {.cdecl,
      importc: "ptls_get_read_epoch".}
else:
  static :
    hint("Declaration of " & "ptls_get_read_epoch" &
        " already exists, not redeclaring")
when not declared(ptls_handle_message):
  proc ptls_handle_message*(tls: ptr ptls_t_536871371;
                            sendbuf: ptr ptls_buffer_t_536871385;
                            epoch_offsets: array[5'i64, csize_t];
                            in_epoch: csize_t; input: pointer; inlen: csize_t;
                            properties: ptr ptls_handshake_properties_t_536871532): cint {.
      cdecl, importc: "ptls_handle_message".}
else:
  static :
    hint("Declaration of " & "ptls_handle_message" &
        " already exists, not redeclaring")
when not declared(ptls_client_handle_message):
  proc ptls_client_handle_message*(tls: ptr ptls_t_536871371;
                                   sendbuf: ptr ptls_buffer_t_536871385;
                                   epoch_offsets: array[5'i64, csize_t];
                                   in_epoch: csize_t; input: pointer;
                                   inlen: csize_t;
                                   properties: ptr ptls_handshake_properties_t_536871532): cint {.
      cdecl, importc: "ptls_client_handle_message".}
else:
  static :
    hint("Declaration of " & "ptls_client_handle_message" &
        " already exists, not redeclaring")
when not declared(ptls_server_handle_message):
  proc ptls_server_handle_message*(tls: ptr ptls_t_536871371;
                                   sendbuf: ptr ptls_buffer_t_536871385;
                                   epoch_offsets: array[5'i64, csize_t];
                                   in_epoch: csize_t; input: pointer;
                                   inlen: csize_t;
                                   properties: ptr ptls_handshake_properties_t_536871532): cint {.
      cdecl, importc: "ptls_server_handle_message".}
else:
  static :
    hint("Declaration of " & "ptls_server_handle_message" &
        " already exists, not redeclaring")
when not declared(ptls_aead_build_iv):
  proc ptls_aead_build_iv*(algo: ptr ptls_aead_algorithm_t_536871415;
                           iv: ptr uint8; static_iv: ptr uint8; seq: uint64): void {.
      cdecl, importc: "ptls_aead__build_iv".}
else:
  static :
    hint("Declaration of " & "ptls_aead_build_iv" &
        " already exists, not redeclaring")
when not declared(ptls_key_schedule_update_hash):
  proc ptls_key_schedule_update_hash*(sched: ptr ptls_key_schedule_t_536871377;
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
  proc ptls_ech_encode_config*(buf: ptr ptls_buffer_t_536871385;
                               config_id: uint8; kem: ptr ptls_hpke_kem_t_536871439;
                               public_key: ptls_iovec_t_536871381;
                               ciphers: ptr ptr ptls_hpke_cipher_suite_t_536871447;
                               max_name_length: uint8; public_name: cstring): cint {.
      cdecl, importc: "ptls_ech_encode_config".}
else:
  static :
    hint("Declaration of " & "ptls_ech_encode_config" &
        " already exists, not redeclaring")
when not declared(ptls_load_certificates):
  proc ptls_load_certificates*(ctx: ptr ptls_context_t_536871373;
                               cert_pem_file: cstring): cint {.cdecl,
      importc: "ptls_load_certificates".}
else:
  static :
    hint("Declaration of " & "ptls_load_certificates" &
        " already exists, not redeclaring")
when not declared(ptls_hpke_setup_base_s):
  proc ptls_hpke_setup_base_s*(kem: ptr ptls_hpke_kem_t_536871439;
                               cipher: ptr ptls_hpke_cipher_suite_t_536871447;
                               pk_s: ptr ptls_iovec_t_536871381;
                               ctx: ptr ptr ptls_aead_context_t_536871413;
                               pk_r: ptls_iovec_t_536871381; info: ptls_iovec_t_536871381): cint {.
      cdecl, importc: "ptls_hpke_setup_base_s".}
else:
  static :
    hint("Declaration of " & "ptls_hpke_setup_base_s" &
        " already exists, not redeclaring")
when not declared(ptls_hpke_setup_base_r):
  proc ptls_hpke_setup_base_r*(kem: ptr ptls_hpke_kem_t_536871439;
                               cipher: ptr ptls_hpke_cipher_suite_t_536871447;
                               keyex: ptr ptls_key_exchange_context_t_536871391;
                               ctx: ptr ptr ptls_aead_context_t_536871413;
                               pk_s: ptls_iovec_t_536871381; info: ptls_iovec_t_536871381): cint {.
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
  proc ptls_build_v4_mapped_v6_address*(v6: ptr struct_in6_addr_536871540;
                                        v4: ptr struct_in_addr_536871546): void {.
      cdecl, importc: "ptls_build_v4_mapped_v6_address".}
else:
  static :
    hint("Declaration of " & "ptls_build_v4_mapped_v6_address" &
        " already exists, not redeclaring")
when not declared(ptls_get_time):
  var ptls_get_time* {.importc: "ptls_get_time".}: ptls_get_time_t_536871466
else:
  static :
    hint("Declaration of " & "ptls_get_time" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_secp256r1):
  var ptls_openssl_secp256r1* {.importc: "ptls_openssl_secp256r1".}: ptls_key_exchange_algorithm_t_536871395
else:
  static :
    hint("Declaration of " & "ptls_openssl_secp256r1" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_secp384r1):
  var ptls_openssl_secp384r1* {.importc: "ptls_openssl_secp384r1".}: ptls_key_exchange_algorithm_t_536871395
else:
  static :
    hint("Declaration of " & "ptls_openssl_secp384r1" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_secp521r1):
  var ptls_openssl_secp521r1* {.importc: "ptls_openssl_secp521r1".}: ptls_key_exchange_algorithm_t_536871395
else:
  static :
    hint("Declaration of " & "ptls_openssl_secp521r1" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_x25519):
  var ptls_openssl_x25519* {.importc: "ptls_openssl_x25519".}: ptls_key_exchange_algorithm_t_536871395
else:
  static :
    hint("Declaration of " & "ptls_openssl_x25519" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_key_exchanges):
  var ptls_openssl_key_exchanges* {.importc: "ptls_openssl_key_exchanges".}: ptr UncheckedArray[
      ptr ptls_key_exchange_algorithm_t_536871395]
else:
  static :
    hint("Declaration of " & "ptls_openssl_key_exchanges" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_key_exchanges_all):
  var ptls_openssl_key_exchanges_all* {.importc: "ptls_openssl_key_exchanges_all".}: ptr UncheckedArray[
      ptr ptls_key_exchange_algorithm_t_536871395]
else:
  static :
    hint("Declaration of " & "ptls_openssl_key_exchanges_all" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_aes128ecb):
  var ptls_openssl_aes128ecb* {.importc: "ptls_openssl_aes128ecb".}: ptls_cipher_algorithm_t_536871403
else:
  static :
    hint("Declaration of " & "ptls_openssl_aes128ecb" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_aes128ctr):
  var ptls_openssl_aes128ctr* {.importc: "ptls_openssl_aes128ctr".}: ptls_cipher_algorithm_t_536871403
else:
  static :
    hint("Declaration of " & "ptls_openssl_aes128ctr" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_aes128gcm):
  var ptls_openssl_aes128gcm* {.importc: "ptls_openssl_aes128gcm".}: ptls_aead_algorithm_t_536871415
else:
  static :
    hint("Declaration of " & "ptls_openssl_aes128gcm" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_aes256ecb):
  var ptls_openssl_aes256ecb* {.importc: "ptls_openssl_aes256ecb".}: ptls_cipher_algorithm_t_536871403
else:
  static :
    hint("Declaration of " & "ptls_openssl_aes256ecb" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_aes256ctr):
  var ptls_openssl_aes256ctr* {.importc: "ptls_openssl_aes256ctr".}: ptls_cipher_algorithm_t_536871403
else:
  static :
    hint("Declaration of " & "ptls_openssl_aes256ctr" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_aes256gcm):
  var ptls_openssl_aes256gcm* {.importc: "ptls_openssl_aes256gcm".}: ptls_aead_algorithm_t_536871415
else:
  static :
    hint("Declaration of " & "ptls_openssl_aes256gcm" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_sha256):
  var ptls_openssl_sha256* {.importc: "ptls_openssl_sha256".}: ptls_hash_algorithm_t_536871427
else:
  static :
    hint("Declaration of " & "ptls_openssl_sha256" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_sha384):
  var ptls_openssl_sha384* {.importc: "ptls_openssl_sha384".}: ptls_hash_algorithm_t_536871427
else:
  static :
    hint("Declaration of " & "ptls_openssl_sha384" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_sha512):
  var ptls_openssl_sha512* {.importc: "ptls_openssl_sha512".}: ptls_hash_algorithm_t_536871427
else:
  static :
    hint("Declaration of " & "ptls_openssl_sha512" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_aes128gcmsha256):
  var ptls_openssl_aes128gcmsha256* {.importc: "ptls_openssl_aes128gcmsha256".}: ptls_cipher_suite_t_536871431
else:
  static :
    hint("Declaration of " & "ptls_openssl_aes128gcmsha256" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_aes256gcmsha384):
  var ptls_openssl_aes256gcmsha384* {.importc: "ptls_openssl_aes256gcmsha384".}: ptls_cipher_suite_t_536871431
else:
  static :
    hint("Declaration of " & "ptls_openssl_aes256gcmsha384" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_cipher_suites):
  var ptls_openssl_cipher_suites* {.importc: "ptls_openssl_cipher_suites".}: ptr UncheckedArray[
      ptr ptls_cipher_suite_t_536871431]
else:
  static :
    hint("Declaration of " & "ptls_openssl_cipher_suites" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_cipher_suites_all):
  var ptls_openssl_cipher_suites_all* {.importc: "ptls_openssl_cipher_suites_all".}: ptr UncheckedArray[
      ptr ptls_cipher_suite_t_536871431]
else:
  static :
    hint("Declaration of " & "ptls_openssl_cipher_suites_all" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_tls12_cipher_suites):
  var ptls_openssl_tls12_cipher_suites* {.
      importc: "ptls_openssl_tls12_cipher_suites".}: ptr UncheckedArray[
      ptr ptls_cipher_suite_t_536871431]
else:
  static :
    hint("Declaration of " & "ptls_openssl_tls12_cipher_suites" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_chacha20):
  var ptls_openssl_chacha20* {.importc: "ptls_openssl_chacha20".}: ptls_cipher_algorithm_t_536871403
else:
  static :
    hint("Declaration of " & "ptls_openssl_chacha20" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_chacha20poly1305):
  var ptls_openssl_chacha20poly1305* {.importc: "ptls_openssl_chacha20poly1305".}: ptls_aead_algorithm_t_536871415
else:
  static :
    hint("Declaration of " & "ptls_openssl_chacha20poly1305" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_chacha20poly1305sha256):
  var ptls_openssl_chacha20poly1305sha256*
      {.importc: "ptls_openssl_chacha20poly1305sha256".}: ptls_cipher_suite_t_536871431
else:
  static :
    hint("Declaration of " & "ptls_openssl_chacha20poly1305sha256" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_tls12_ecdhe_rsa_aes128gcmsha256):
  var ptls_openssl_tls12_ecdhe_rsa_aes128gcmsha256*
      {.importc: "ptls_openssl_tls12_ecdhe_rsa_aes128gcmsha256".}: ptls_cipher_suite_t_536871431
else:
  static :
    hint("Declaration of " & "ptls_openssl_tls12_ecdhe_rsa_aes128gcmsha256" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_tls12_ecdhe_ecdsa_aes128gcmsha256):
  var ptls_openssl_tls12_ecdhe_ecdsa_aes128gcmsha256*
      {.importc: "ptls_openssl_tls12_ecdhe_ecdsa_aes128gcmsha256".}: ptls_cipher_suite_t_536871431
else:
  static :
    hint("Declaration of " & "ptls_openssl_tls12_ecdhe_ecdsa_aes128gcmsha256" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_tls12_ecdhe_rsa_aes256gcmsha384):
  var ptls_openssl_tls12_ecdhe_rsa_aes256gcmsha384*
      {.importc: "ptls_openssl_tls12_ecdhe_rsa_aes256gcmsha384".}: ptls_cipher_suite_t_536871431
else:
  static :
    hint("Declaration of " & "ptls_openssl_tls12_ecdhe_rsa_aes256gcmsha384" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_tls12_ecdhe_ecdsa_aes256gcmsha384):
  var ptls_openssl_tls12_ecdhe_ecdsa_aes256gcmsha384*
      {.importc: "ptls_openssl_tls12_ecdhe_ecdsa_aes256gcmsha384".}: ptls_cipher_suite_t_536871431
else:
  static :
    hint("Declaration of " & "ptls_openssl_tls12_ecdhe_ecdsa_aes256gcmsha384" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_tls12_ecdhe_rsa_chacha20poly1305sha256):
  var ptls_openssl_tls12_ecdhe_rsa_chacha20poly1305sha256*
      {.importc: "ptls_openssl_tls12_ecdhe_rsa_chacha20poly1305sha256".}: ptls_cipher_suite_t_536871431
else:
  static :
    hint("Declaration of " &
        "ptls_openssl_tls12_ecdhe_rsa_chacha20poly1305sha256" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_tls12_ecdhe_ecdsa_chacha20poly1305sha256):
  var ptls_openssl_tls12_ecdhe_ecdsa_chacha20poly1305sha256*
      {.importc: "ptls_openssl_tls12_ecdhe_ecdsa_chacha20poly1305sha256".}: ptls_cipher_suite_t_536871431
else:
  static :
    hint("Declaration of " &
        "ptls_openssl_tls12_ecdhe_ecdsa_chacha20poly1305sha256" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_bfecb):
  var ptls_openssl_bfecb* {.importc: "ptls_openssl_bfecb".}: ptls_cipher_algorithm_t_536871403
else:
  static :
    hint("Declaration of " & "ptls_openssl_bfecb" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_hpke_kem_p256sha256):
  var ptls_openssl_hpke_kem_p256sha256* {.
      importc: "ptls_openssl_hpke_kem_p256sha256".}: ptls_hpke_kem_t_536871439
else:
  static :
    hint("Declaration of " & "ptls_openssl_hpke_kem_p256sha256" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_hpke_kem_p384sha384):
  var ptls_openssl_hpke_kem_p384sha384* {.
      importc: "ptls_openssl_hpke_kem_p384sha384".}: ptls_hpke_kem_t_536871439
else:
  static :
    hint("Declaration of " & "ptls_openssl_hpke_kem_p384sha384" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_hpke_kem_x25519sha256):
  var ptls_openssl_hpke_kem_x25519sha256*
      {.importc: "ptls_openssl_hpke_kem_x25519sha256".}: ptls_hpke_kem_t_536871439
else:
  static :
    hint("Declaration of " & "ptls_openssl_hpke_kem_x25519sha256" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_hpke_kems):
  var ptls_openssl_hpke_kems* {.importc: "ptls_openssl_hpke_kems".}: ptr UncheckedArray[
      ptr ptls_hpke_kem_t_536871439]
else:
  static :
    hint("Declaration of " & "ptls_openssl_hpke_kems" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_hpke_aes128gcmsha256):
  var ptls_openssl_hpke_aes128gcmsha256* {.
      importc: "ptls_openssl_hpke_aes128gcmsha256".}: ptls_hpke_cipher_suite_t_536871447
else:
  static :
    hint("Declaration of " & "ptls_openssl_hpke_aes128gcmsha256" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_hpke_aes128gcmsha512):
  var ptls_openssl_hpke_aes128gcmsha512* {.
      importc: "ptls_openssl_hpke_aes128gcmsha512".}: ptls_hpke_cipher_suite_t_536871447
else:
  static :
    hint("Declaration of " & "ptls_openssl_hpke_aes128gcmsha512" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_hpke_aes256gcmsha384):
  var ptls_openssl_hpke_aes256gcmsha384* {.
      importc: "ptls_openssl_hpke_aes256gcmsha384".}: ptls_hpke_cipher_suite_t_536871447
else:
  static :
    hint("Declaration of " & "ptls_openssl_hpke_aes256gcmsha384" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_hpke_chacha20poly1305sha256):
  var ptls_openssl_hpke_chacha20poly1305sha256*
      {.importc: "ptls_openssl_hpke_chacha20poly1305sha256".}: ptls_hpke_cipher_suite_t_536871447
else:
  static :
    hint("Declaration of " & "ptls_openssl_hpke_chacha20poly1305sha256" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_hpke_cipher_suites):
  var ptls_openssl_hpke_cipher_suites* {.
      importc: "ptls_openssl_hpke_cipher_suites".}: ptr UncheckedArray[
      ptr ptls_hpke_cipher_suite_t_536871447]
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
      ctx: ptr ptr ptls_key_exchange_context_t_536871391; pkey: ptr EVP_PKEY_536871548): cint {.
      cdecl, importc: "ptls_openssl_create_key_exchange".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_create_key_exchange" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_lookup_signature_schemes):
  proc ptls_openssl_lookup_signature_schemes*(key: ptr EVP_PKEY_536871548): ptr ptls_openssl_signature_scheme_t_536871554 {.
      cdecl, importc: "ptls_openssl_lookup_signature_schemes".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_lookup_signature_schemes" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_select_signature_scheme):
  proc ptls_openssl_select_signature_scheme*(
      available: ptr ptls_openssl_signature_scheme_t_536871554;
      algorithms: ptr uint16; num_algorithms: csize_t): ptr ptls_openssl_signature_scheme_t_536871554 {.
      cdecl, importc: "ptls_openssl_select_signature_scheme".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_select_signature_scheme" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_init_sign_certificate):
  proc ptls_openssl_init_sign_certificate*(
      self: ptr ptls_openssl_sign_certificate_t_536871558; key: ptr EVP_PKEY_536871548): cint {.
      cdecl, importc: "ptls_openssl_init_sign_certificate".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_init_sign_certificate" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_dispose_sign_certificate):
  proc ptls_openssl_dispose_sign_certificate*(
      self: ptr ptls_openssl_sign_certificate_t_536871558): void {.cdecl,
      importc: "ptls_openssl_dispose_sign_certificate".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_dispose_sign_certificate" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_load_certificates):
  proc ptls_openssl_load_certificates*(ctx: ptr ptls_context_t_536871373;
                                       cert: ptr X509_536871560;
                                       chain: ptr struct_stack_st_X509): cint {.
      cdecl, importc: "ptls_openssl_load_certificates".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_load_certificates" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_init_verify_certificate):
  proc ptls_openssl_init_verify_certificate*(
      self: ptr ptls_openssl_verify_certificate_t_536871574;
      store: ptr X509_STORE_536871572): cint {.cdecl,
      importc: "ptls_openssl_init_verify_certificate".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_init_verify_certificate" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_dispose_verify_certificate):
  proc ptls_openssl_dispose_verify_certificate*(
      self: ptr ptls_openssl_verify_certificate_t_536871574): void {.cdecl,
      importc: "ptls_openssl_dispose_verify_certificate".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_dispose_verify_certificate" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_create_default_certificate_store):
  proc ptls_openssl_create_default_certificate_store*(): ptr X509_STORE_536871572 {.
      cdecl, importc: "ptls_openssl_create_default_certificate_store".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_create_default_certificate_store" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_raw_pubkey_init_verify_certificate):
  proc ptls_openssl_raw_pubkey_init_verify_certificate*(
      self: ptr ptls_openssl_raw_pubkey_verify_certificate_t_536871564;
      pubkey: ptr EVP_PKEY_536871548): cint {.cdecl,
      importc: "ptls_openssl_raw_pubkey_init_verify_certificate".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_raw_pubkey_init_verify_certificate" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_raw_pubkey_dispose_verify_certificate):
  proc ptls_openssl_raw_pubkey_dispose_verify_certificate*(
      self: ptr ptls_openssl_raw_pubkey_verify_certificate_t_536871564): void {.
      cdecl, importc: "ptls_openssl_raw_pubkey_dispose_verify_certificate".}
else:
  static :
    hint("Declaration of " &
        "ptls_openssl_raw_pubkey_dispose_verify_certificate" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_encrypt_ticket):
  proc ptls_openssl_encrypt_ticket*(dst: ptr ptls_buffer_t_536871385;
                                    src: ptls_iovec_t_536871381; cb: proc (
      a0: ptr uint8; a1: ptr uint8; a2: ptr EVP_CIPHER_CTX_536871576;
      a3: ptr HMAC_CTX_536871578; a4: cint): cint {.cdecl.}): cint {.cdecl,
      importc: "ptls_openssl_encrypt_ticket".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_encrypt_ticket" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_decrypt_ticket):
  proc ptls_openssl_decrypt_ticket*(dst: ptr ptls_buffer_t_536871385;
                                    src: ptls_iovec_t_536871381; cb: proc (
      a0: ptr uint8; a1: ptr uint8; a2: ptr EVP_CIPHER_CTX_536871576;
      a3: ptr HMAC_CTX_536871578; a4: cint): cint {.cdecl.}): cint {.cdecl,
      importc: "ptls_openssl_decrypt_ticket".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_decrypt_ticket" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_encrypt_ticket_evp):
  proc ptls_openssl_encrypt_ticket_evp*(dst: ptr ptls_buffer_t_536871385;
                                        src: ptls_iovec_t_536871381; cb: proc (
      a0: ptr uint8; a1: ptr uint8; a2: ptr EVP_CIPHER_CTX_536871576;
      a3: ptr EVP_MAC_CTX_536871580; a4: cint): cint {.cdecl.}): cint {.cdecl,
      importc: "ptls_openssl_encrypt_ticket_evp".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_encrypt_ticket_evp" &
        " already exists, not redeclaring")
when not declared(ptls_openssl_decrypt_ticket_evp):
  proc ptls_openssl_decrypt_ticket_evp*(dst: ptr ptls_buffer_t_536871385;
                                        src: ptls_iovec_t_536871381; cb: proc (
      a0: ptr uint8; a1: ptr uint8; a2: ptr EVP_CIPHER_CTX_536871576;
      a3: ptr EVP_MAC_CTX_536871580; a4: cint): cint {.cdecl.}): cint {.cdecl,
      importc: "ptls_openssl_decrypt_ticket_evp".}
else:
  static :
    hint("Declaration of " & "ptls_openssl_decrypt_ticket_evp" &
        " already exists, not redeclaring")