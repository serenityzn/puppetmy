class ipsec {
  file { '/tmp/openswan-2.6.32-16.el6.x86_64.rpm':
    ensure => 'file',
    source => 'puppet:///modules/ipsec/openswan-2.6.32-16.el6.x86_64.rpm',
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
  }
  
  file { '/tmp/ipsec.sh':
    ensure => 'file',
    source => 'puppet:///modules/ipsec/ipsec.sh',
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
  }

  file { '/etc/ppp':
    ensure  => 'directory',
    recurse => true,
    purge   => true,
    source  => 'puppet:///modules/ipsec/ppp',
  }

  file { '/etc/ipsec.d':
    ensure  => 'directory',
    recurse => true,
    purge   => true,
    source  => 'puppet:///modules/ipsec/ipsec.d',
  }

  file { '/etc/xl2tpd':
    ensure  => 'directory',
    recurse => true,
    purge   => true,
    source  => 'puppet:///modules/ipsec/xl2tpd',
  }

  file { '/etc/ipsec.conf':
    ensure  => 'file',
    content => template('ipsec/ipsec.conf.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }

  file { '/etc/ipsec.d/nefer.conf':
    ensure  => 'file',
    content => template('ipsec/nefer.conf.erb'),
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }

  file { '/etc/ipsec.d/nefer.secrets':
    ensure  => 'file',
    content => template('ipsec/nefer.secrets.erb'),
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

  package { 'xl2tpd': ensure => 'installed', }

  $pkgs = ['ipsec', 'xl2tpd' ]

  service { 'ipsec':
    ensure => 'running',
  }

  service { 'xl2tpd':
    ensure    => 'running',
    hasstatus => false,
    require   => Package['xl2tpd'],
  }
}
