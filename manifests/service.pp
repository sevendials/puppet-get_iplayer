class get_iplayer::service inherits get_iplayer {

  service { 'get_iplayer':
    ensure  => 'running',
    enable  => true,
  }

}
