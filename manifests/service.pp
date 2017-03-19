# web service
class get_iplayer::service inherits get_iplayer {

  $provider = $get_iplayer::service_provider ? {
    ''      => undef,
    default => $get_iplayer::service_provider,
  }

  service { 'get_iplayer':
    ensure   => $get_iplayer::service_enable,
    enable   => true,
    provider => $provider,
  }

}
