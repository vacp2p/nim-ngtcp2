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

when defined(ngtcp2_enable_quictls):
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
      cdecl, importc: "ngtcp2_crypto_quictls_init"
    .}

  else:
    static:
      hint(
        "Declaration of " & "ngtcp2_crypto_quictls_init" &
          " already exists, not redeclaring"
      )

  when not declared(ngtcp2_crypto_quictls_from_ossl_encryption_level):
    proc ngtcp2_crypto_quictls_from_ossl_encryption_level*(
      ossl_level: OSSL_ENCRYPTION_LEVEL
    ): ngtcp2_encryption_level_553648745 {.
      cdecl, importc: "ngtcp2_crypto_quictls_from_ossl_encryption_level"
    .}

  else:
    static:
      hint(
        "Declaration of " & "ngtcp2_crypto_quictls_from_ossl_encryption_level" &
          " already exists, not redeclaring"
      )

  when not declared(ngtcp2_crypto_quictls_from_ngtcp2_encryption_level):
    proc ngtcp2_crypto_quictls_from_ngtcp2_encryption_level*(
      encryption_level: ngtcp2_encryption_level_553648745
    ): OSSL_ENCRYPTION_LEVEL {.
      cdecl, importc: "ngtcp2_crypto_quictls_from_ngtcp2_encryption_level"
    .}

  else:
    static:
      hint(
        "Declaration of " & "ngtcp2_crypto_quictls_from_ngtcp2_encryption_level" &
          " already exists, not redeclaring"
      )

  when not declared(ngtcp2_crypto_quictls_configure_server_context):
    proc ngtcp2_crypto_quictls_configure_server_context*(
      ssl_ctx: SSL_CTX
    ): cint {.cdecl, importc: "ngtcp2_crypto_quictls_configure_server_context".}

  else:
    static:
      hint(
        "Declaration of " & "ngtcp2_crypto_quictls_configure_server_context" &
          " already exists, not redeclaring"
      )

  when not declared(ngtcp2_crypto_quictls_configure_client_context):
    proc ngtcp2_crypto_quictls_configure_client_context*(
      ssl_ctx: SSL_CTX
    ): cint {.cdecl, importc: "ngtcp2_crypto_quictls_configure_client_context".}

  else:
    static:
      hint(
        "Declaration of " & "ngtcp2_crypto_quictls_configure_client_context" &
          " already exists, not redeclaring"
      )
