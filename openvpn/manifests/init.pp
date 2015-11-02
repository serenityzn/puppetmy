class openvpn {

  if ! defined( Class['openvpn::service'] ) {
      class { 'openvpn::service': }
  }

  if ! defined( Class['openvpn::config'] ) {
      class { 'openvpn::config': }
  }
 
  Class['openvpn::service'] -> Class['openvpn::config'] -> Class['openvpn']

  service { 'openvpn':
    ensure    => 'running',
    hasstatus => false,
    require   => Package['openvpn'],
  }
}
