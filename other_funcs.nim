# Shared callbacks

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

# Client callbacks

proc ngtcp2_crypto_client_initial_cb*(conn: ptr ngtcp2_conn; user_data: pointer): cint {.importc, cdecl.}

# Server callbacks

proc ngtcp2_crypto_recv_client_initial_cb*(conn: ptr ngtcp2_conn; dcid: ptr ngtcp2_cid; user_data: pointer): cint {.importc, cdecl.}

# Crypto callbacks

proc ngtcp2_crypto_encrypt_cb*(dest: ptr uint8; aead: ptr ngtcp2_crypto_aead; aead_ctx: ptr ngtcp2_crypto_aead_ctx;
                               plaintext: ptr uint8; plaintextlen: uint; nonce: ptr uint8; noncelen: uint; aad: ptr uint8;
                               aadlen: uint): cint {.importc, cdecl.}

proc ngtcp2_crypto_decrypt_cb*(dest: ptr uint8; aead: ptr ngtcp2_crypto_aead; aead_ctx: ptr ngtcp2_crypto_aead_ctx;
                               ciphertext: ptr uint8; ciphertextlen: uint; nonce: ptr uint8; noncelen: uint; aad: ptr uint8;
                               aadlen: uint): cint {.importc, cdecl.}

proc ngtcp2_crypto_hp_mask_cb*(dest: ptr uint8; hp: ptr ngtcp2_crypto_cipher; hp_ctx: ptr ngtcp2_crypto_cipher_ctx;
                               sample: ptr uint8): cint {.importc, cdecl.}

proc ngtcp2_crypto_update_key_cb*(conn: ptr ngtcp2_conn; rx_secret: ptr uint8;
                                  tx_secret: ptr uint8;
                                  rx_aead_ctx: ptr ngtcp2_crypto_aead_ctx;
                                  rx_iv: ptr uint8;
                                  tx_aead_ctx: ptr ngtcp2_crypto_aead_ctx;
                                  tx_iv: ptr uint8; current_rx_secret: ptr uint8;
                                  current_tx_secret: ptr uint8; secretlen: uint;
                                  user_data: pointer): cint {.importc, cdecl.}
