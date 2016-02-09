class app::php()
{
 package { [ 'php5', 'php5-mysql', 'php5-tidy', 'php5-gd', 'php-apc', 'php-pear', 'php5-apcu', 'php5-curl', 'php5-dev', 'php5-json', 'php5-mcrypt', 'php5-readline', 'php5-redis', 'php5-xdebug', 'pkg-php-tools', 'phpunit' ]:
  ensure => 'installed',
 } ->
 file { [ '/etc/php5/apache2/php.ini', '/etc/php5/cli/php.ini' ]:
    ensure => 'file',
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    source => "puppet:///modules/${module_name}/php.ini",
 }
}



