class db::gearman()
{
 package { [ 'gearman-job-server', 'libgearman7', 'libgearman-dev' ]:
  ensure => 'installed',
 } ->
 file { '/etc/init/gearman-job-server.conf':
	ensure => 'file',
	mode   => '0644',
	owner  => 'root',
	group  => 'root',
	source => "puppet:///modules/${module_name}/gearman-job-server.conf",
 }
}
