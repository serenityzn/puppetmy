class openvpn::service {
  notify { 'openvpn_service': message => 'Installing OpenVPN server.' }
  package { 'openvpn': ensure => 'installed', }
}
