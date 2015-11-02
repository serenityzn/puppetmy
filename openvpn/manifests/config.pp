class openvpn::config {
  notify { 'openvpn_service': message => 'Configuration created.' }

  file { '/etc/openvpn':
    ensure  => 'directory',
    recurse => true,
    purge   => true,
    source  => 'puppet:///modules/openvpn/openvpn',
  }
  
}
