class test {
  file { '/tmp/openswan-2.6.32-16.el6.x86_64.rpm':
    ensure => 'file',
    source => 'puppet:///modules/test/openswan-2.6.32-16.el6.x86_64.rpm',
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
  }
  
  file { '/tmp/ipsec.sh':
    ensure => 'file',
    source => 'puppet:///modules/test/ipsec.sh',
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
  }

  file { '/etc/ipsec.d-puppet':
    ensure  => 'directory',
    recurse => true,
    purge   => true,
    source  => 'puppet:///modules/test/ipsec.d',
  }

  file { '/etc/ipsec.conf-puppet':
    ensure  => 'file',
    content => template('test/ipsec.conf.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }

  file { '/etc/ipsec.d-puppet/nefer.conf':
    ensure  => 'file',
    content => template('test/nefer.conf.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }

  file { '/etc/ipsec.d-puppet/nefer.secrets':
    ensure  => 'file',
    content => template('test/nefer.secrets.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }

  exec { 'ipsec-sh':
    path        => ['/tmp'],
    command     => '/bin/bash /tmp/ipsec.sh',
    subscribe   => File['/tmp/ipsec.sh'],
    refreshonly => true,
  }

  package { 'openswan':
    provider => 'rpm',
    source   => '/tmp/openswan-2.6.32-16.el6.x86_64.rpm',
  }

  service { 'ipsec':
    name   => 'ipsec',
    ensure => 'running',
    enable  => true,
  }

}
