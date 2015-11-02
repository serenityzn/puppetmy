class test {
	file { '/tmp/openswan-2.6.32-16.el6.x86_64.rpm':
		ensure => 'file',
		source => 'puppet:///modules/test/openswan-2.6.32-16.el6.x86_64.rpm',
		mode   => '0644',
		owner  => 'root',
		group  => 'root',
	}
}
