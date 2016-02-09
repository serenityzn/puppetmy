class app::php()
{
 package { [ 'php5', 'php5-mysql', 'php5-tidy', 'php5-gd', 'php-apc', 'php-pear', 'php5-apcu', 'php5-curl', 'php5-dev', 'php5-json', 'php5-mcrypt', 'php5-readline', 'php5-redis', 'php5-xdebug', 'pkg-php-tools', 'phpunit', 'php5-gearman' ]:
  ensure => 'installed',
 } ->
 file { [ '/etc/php5/apache2/php.ini', '/etc/php5/cli/php.ini' ]:
    ensure => 'file',
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    source => "puppet:///modules/${module_name}/php.ini",
 } ->
 file { '/etc/php5/mods-available/xdebug.ini':
   ensure => 'file',
   mode   => '0644',
   owner  => 'root',
   group  => 'root',
   source => "puppet:///modules/${module_name}/xdebug.ini",
} ->
 file { '/tmp/v8_4.2.77.21-1.el6_amd64.deb':
    ensure => 'file',
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    source => "puppet:///modules/${module_name}/v8_4.2.77.21-1.el6_amd64.deb",
 } ->
 file { '/tmp/v8-devel_4.2.77.21-1.el6_amd64.deb':
    ensure => 'file',
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
    source => "puppet:///modules/${module_name}/v8-devel_4.2.77.21-1.el6_amd64.deb",
 } ->
 package { 'v8':
  ensure   => 'installed',
  provider => 'dpkg',
  source   => '/tmp/v8_4.2.77.21-1.el6_amd64.deb';
 'v8-devel':
  ensure   => 'installed',
  provider => 'dpkg',
  source   => '/tmp/v8-devel_4.2.77.21-1.el6_amd64.deb',
 } ->
 file {'/usr/lib/libv8_libplatform.a':
  ensure => 'link',
  target => '/usr/lib64/libv8_libplatform.a';
 '/usr/lib/libv8.so':
  ensure => 'link',
  target => '/usr/lib64/libv8.so';
 '/usr/lib/libv8.so.4':
  ensure => 'link',
  target => '/usr/lib64/libv8.so.4';
 '/usr/lib/libv8.so.4.2':
  ensure => 'link',
  target => '/usr/lib64/libv8.so.4.2';
 '/usr/lib/libicui18n.so':
  ensure => 'link',
  target => '/usr/lib64/libicui18n.so';
 '/usr/lib/libicuuc.so':
  ensure => 'link',
  target => '/usr/lib64/libicuuc.so',
 } 
}



