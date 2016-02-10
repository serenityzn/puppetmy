class worker() {
 class { '::worker::php': } ->
 class { '::worker::supervisor':}
}
