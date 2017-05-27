# main get_iplayer class
class get_iplayer (
  String $base_dir,
  String $conf_dir,
  String $listen_address,
  Integer $listen_port,
  Boolean $manage_prereqs,
  Hash $options_extra,
  String $output_dir,
  Array $prereqs,
  Boolean $service_enable,
  Enum['stopped','running'] $service_ensure,
  String $service_env_path,
  String $service_path,
  String $service_template,
  String $source_location,
  String $version,
) {

  contain get_iplayer::install
  contain get_iplayer::config
  contain get_iplayer::service

  Class['::get_iplayer::install'] ->
  Class['::get_iplayer::config'] ~>
  Class['::get_iplayer::service']

}
