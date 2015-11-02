class test {
	file { '/tmp/1.txt':
		ensure => 'file',
		source => 'puppet:///modules/test/1.txt',
		mode   => '0644',
		owner  => 'root',
		group  => 'root',
	}
}
