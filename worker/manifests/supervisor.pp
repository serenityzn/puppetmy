class worker::supervisor()
{
 package { 'supervisor':
  ensure => 'installed',
 } ->
 file { '/etc/supervisor/conf.d/haftahave.conf':
  ensure  => 'file',
  owner   => 'root',
  group   => 'root',
  mode    => '0644',
  notify  => Service['supervisor'],
  content => template("${module_name}/haftahave.conf"),
 } ->
 service {'supervisor':
  ensure => 'running',
 }
}
