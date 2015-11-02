class openvpn::config {
  notify { 'openvpn_configuration': message => 'Configurationing OpenVPN server.' }

  file { '/etc/openvpn':
    ensure  => 'directory',
    recurse => true,
    purge   => true,
    source  => 'puppet:///modules/openvpn/openvpn',
  }
  
}
