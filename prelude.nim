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

type
  st_ptls_t = object
  st_ptls_cipher_algorithm_t = object
  st_ptls_key_exchange_algorithm_t = object
  st_ptls_cipher_suite_t = object
  st_ptls_key_schedule_t = object
  st_ptls_hash_algorithm_t = object
  st_ptls_hpke_kem_t = object
  st_ptls_hpke_cipher_suite_t = object
  st_ptls_aead_algorithm_t = object
  in6_addr = object
  st_ptls_log_t = object
  in_addr = object
