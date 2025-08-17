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

test "ptls_instantiation":
  var ctx: ptls_context_t
  ctx.random_bytes = ptls_openssl_random_bytes
  ctx.get_time = addr ptls_get_time
  ctx.key_exchanges =
    cast[ptr ptr ptls_key_exchange_algorithm_t](addr ptls_openssl_key_exchanges[0])
  ctx.cipher_suites = cast[ptr ptr ptls_cipher_suite_t](ptls_openssl_cipher_suites[0])

  var tls: ptr ptls_t = ptls_client_new(addr ctx)
  check tls != nil

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
