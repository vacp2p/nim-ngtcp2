proc ngtcp2_crypto_client_initial_cb*(conn: ptr ngtcp2_conn; user_data: pointer): cint {.importc, cdecl.}

proc ngtcp2_crypto_recv_crypto_data_cb*(conn: ptr ngtcp2_conn; encryption_level: ngtcp2_encryption_level, 
                                        offset: uint64; data: ptr uint8; datalen: uint;
                                        user_data: pointer): cint {.importc, cdecl.}

proc ngtcp2_crypto_recv_retry_cb*(conn: ptr ngtcp2_conn; hd: ptr ngtcp2_pkt_hd; user_data: pointer): cint {.importc, cdecl.}


proc ngtcp2_crypto_delete_crypto_aead_ctx_cb*(conn: ptr ngtcp2_conn; aead_ctx: ptr ngtcp2_crypto_aead_ctx;
                                              user_data: pointer) {.importc, cdecl.}

proc ngtcp2_crypto_delete_crypto_cipher_ctx_cb*(conn: ptr ngtcp2_conn; cipher_ctx: ptr ngtcp2_crypto_cipher_ctx;
                                                user_data: pointer) {.importc, cdecl.}

proc ngtcp2_crypto_get_path_challenge_data_cb*(conn: ptr ngtcp2_conn; data: ptr uint8; user_data: pointer): cint {.importc, cdecl.}

proc ngtcp2_crypto_version_negotiation_cb*(conn: ptr ngtcp2_conn; version: uint32; client_dcid: ptr ngtcp2_cid; 
                                           user_data: pointer): cint {.importc, cdecl.}
