import unittest
import ngtcp2

test "default settings":
  var settings: ngtcp2_settings
  ngtcp2_settings_default_versioned(NGTCP2_SETTINGS_V2, addr settings)
  check settings.max_tx_udp_payload_size > 0

  var transport_params: ngtcp2_transport_params
  ngtcp2_transport_params_default_versioned(
    NGTCP2_TRANSPORT_PARAMS_V1, addr transport_params
  )
  check transport_params.active_connection_id_limit > 0

test "BoringSSL bindings":
  let
    clientMethod = TLS_client_method()
    ssl_ctx = SSL_CTX_new(clientMethod)
    ssl = SSL_new(ssl_ctx)

  check ssl != nil

when defined(ngtcp2_enable_quictls):
  test "QuicTLS bindings":
    # Test error constants
    check NGTCP2_CRYPTO_QUICTLS_ERR_TLS_WANT_X509_LOOKUP == -10001
    check NGTCP2_CRYPTO_QUICTLS_ERR_TLS_WANT_CLIENT_HELLO_CB == -10002

    # Test OSSL_ENCRYPTION_LEVEL enum values
    check ord(OSSL_ENCRYPTION_LEVEL_INITIAL) == 0
    check ord(OSSL_ENCRYPTION_LEVEL_EARLY_DATA) == 1
    check ord(OSSL_ENCRYPTION_LEVEL_HANDSHAKE) == 2
    check ord(OSSL_ENCRYPTION_LEVEL_APPLICATION) == 3

    # Test that SSL_CTX type is properly defined as pointer
    check sizeof(SSL_CTX) == sizeof(pointer)
