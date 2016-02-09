class app::cron()
{
 file { '/var/spool/cron/crontabs/www-data':
    ensure => 'file',
    mode   => '0600',
    owner  => 'www-data',
    group  => 'crontab',
    source => "puppet:///modules/${module_name}/www-data",
 }
}
