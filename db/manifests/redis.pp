class db::redis()
{
 package { [ 'redis-server' ]:
  ensure => 'installed',
 } ->
 file { '/etc/redis/redis.conf':
  ensure  => 'file',
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  notify  => Service['redis-server'],
  content => template("${module_name}/redis.conf"),
 } ->
 service { 'redis-server':
  ensure => 'running',
 }
}
