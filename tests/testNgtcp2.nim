import unittest
import ngtcp2

test "default settings":
  var settings: ngtcp2_settings
  ngtcp2_settings_default(addr settings)
  check settings.transport_params.max_udp_payload_size > 0
  check settings.transport_params.active_connection_id_limit > 0

test "BSD socket addresses":
  check sizeof(in_addr) == 4
  check sizeof(in6_addr) == 16
  check sizeof(sockaddr) < sizeof(sockaddr_storage)
  check sizeof(sockaddr_in) < sizeof(sockaddr_storage)
  check sizeof(sockaddr_in6) < sizeof(sockaddr_storage)
  check sizeof(sockaddr_in.sin_family) == 2
  check sizeof(sockaddr_in.sin_port) == 2
  check cast[uint16](AF_INET) == 2

test "SocketAddress union":
  var address: SocketAddress
  check sizeof(address) == sizeof(sockaddr_storage)
  address.address.sa_family = AF_INET
  check address.ipv4.sin_family == AF_INET
  check address.ipv6.sin6_family == AF_INET
