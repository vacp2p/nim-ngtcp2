import unittest
import ngtcp2

test "default settings":
  var settings: ngtcp2_settings
  ngtcp2_settings_default_versioned(NGTCP2_SETTINGS_V2, addr settings)
  check settings.max_tx_udp_payload_size > 0

  var transport_params: ngtcp2_transport_params
  ngtcp2_transport_params_default_versioned(NGTCP2_TRANSPORT_PARAMS_V1, addr transport_params)
  check transport_params.active_connection_id_limit > 0
