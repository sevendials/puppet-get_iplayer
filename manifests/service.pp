# manage get_iplayer service
class get_iplayer::service inherits get_iplayer {

  $provider = '$get_iplayer::service_provider'.defined? {
    false      => undef,
    true => $get_iplayer::service_provider,
  }

  service { 'get_iplayer':
    ensure   => $get_iplayer::service_enable,
    enable   => true,
    provider => $provider,
  }

}
