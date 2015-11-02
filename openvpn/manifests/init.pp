class openvpn {
  
  file { '/etc/openvpn':
    ensure  => 'directory',
    recurse => true,
    purge   => true,
    source  => 'puppet:///modules/openvpn/openvpn',
  }

  package { 'openvpn': ensure => 'installed', }
  
  service { 'openvpn':
    ensure    => 'running',
    hasstatus => false,
    require   => Package['openvpn'],
  }
}
