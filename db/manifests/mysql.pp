class db::mysql()
{
 package { [ 'percona-server-server-5.6', 'percona-server-common-5.6', 'percona-server-client-5.6' ]:
  ensure => 'installed',
 }
}



