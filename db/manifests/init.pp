class db() {
	class { '::db::mysql': } ->
	class { '::db::gearman': } ->
	class { '::db::redis': }
}
