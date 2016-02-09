class app::apache()
{
	package { [ 'apache2', 'apache2-bin', 'apache2-data', 'libapache2-mod-php5' ]:
		ensure => 'installed',
	} ->
	file { [ '/var/log/httpd', '/var/www/', '/var/www/html', '/var/www/html/api', '/var/www/html/api/web', '/var/www/html/website' ]:
		ensure => directory,
		owner  => 'www-data',
		group  => 'www-data',
		mode   => '0755',
	} ->
	file { [ '/etc/pki/', '/etc/pki/tls', '/etc/pki/tls/certs/', '/etc/pki/tls/private' ]:
		ensure => directory,
		owner  => 'root',
		group  => 'root',
		mode   => '0755',
	} ->
	file { '/etc/pki/tls/certs/haftahave.crt':
		ensure => 'file',
		mode   => '0644',
		owner  => 'root',
		group  => 'root',
		notify => Service['apache2'],
		source => "puppet:///modules/${module_name}/haftahave.crt",
	} ->
	file { '/etc/pki/tls/private/haftahave.key':
		ensure => 'file',
		mode   => '0644',
		owner  => 'root',
		group  => 'root',
		notify => Service['apache2'],
		source => "puppet:///modules/${module_name}/haftahave.key",
	} ->
	file { '/etc/pki/tls/certs/haftahave_bundle-g2-g1.crt':
		ensure => 'file',
		mode   => '0644',
		owner  => 'root',
		group  => 'root',
		notify => Service['apache2'],
		source => "puppet:///modules/${module_name}/haftahave_bundle-g2-g1.crt",
	} ->
	file { '/etc/apache2/conf-enabled/app.conf':
		ensure => 'file',
		mode   => '0644',
		owner  => 'root',
		group  => 'root',
		notify => Service['apache2'],
		source => "puppet:///modules/${module_name}/app.conf",
	} ->
	file { '/etc/apache2/conf-enabled/app-ssl.conf':
		ensure => 'file',
		mode   => '0644',
		owner  => 'root',
		group  => 'root',
		notify => Service['apache2'],
		source => "puppet:///modules/${module_name}/app-ssl.conf",
	} ->
	file { '/etc/apache2/conf-enabled/website.conf':
		ensure => 'file',
		mode   => '0644',
		owner  => 'root',
		group  => 'root',
		notify => Service['apache2'],
		source => "puppet:///modules/${module_name}/website.conf",
	} ->
	file { '/etc/apache2/conf-enabled/website-ssl.conf':
		ensure => 'file',
		mode   => '0644',
		owner  => 'root',
		group  => 'root',
		notify => Service['apache2'],
		source => "puppet:///modules/${module_name}/website-ssl.conf",
	} ->
	file { '/etc/apache2/conf-enabled/ssl.conf':
		ensure => 'file',
		mode   => '0644',
		owner  => 'root',
		group  => 'root',
		notify => Service['apache2'],
		source => "puppet:///modules/${module_name}/ssl.conf",
	}
	
	service { 'apache2':
		ensure => 'running',
	}
}
