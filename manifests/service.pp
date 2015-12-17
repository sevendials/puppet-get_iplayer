class get_iplayer::service inherits get_iplayer {

  service { 'get_iplayer':
    ensure    => 'running',
    enable    => true,
    provider  => $get_iplayer::service_provider ? {
      ''      => undef,
      default => $get_iplayer::service_provider,
    },
  }

}
