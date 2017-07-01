# manage get_iplayer service
class get_iplayer::service inherits get_iplayer {

  service { 'get_iplayer':
    ensure   => $get_iplayer::service_enable,
    enable   => true,
    provider => $get_iplayer::service_provider,
  }

}
