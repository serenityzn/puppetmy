class openvpn {

  if ! defined( Class['openvpn::service'] ) {
      class { 'openvpn::service': }
  }
 
  Class['openvpn::service'] -> Class['openvpn']

  file { '/etc/openvpn':
    ensure  => 'directory',
    recurse => true,
    purge   => true,
    source  => 'puppet:///modules/openvpn/openvpn',
  }
  
  service { 'openvpn':
    ensure    => 'running',
    hasstatus => false,
    require   => Package['openvpn'],
  }
}
