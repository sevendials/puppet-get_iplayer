class get_iplayer (
  String $base_dir,
  String $conf_dir,
  String $listen_address,
  Integer $listen_port,
  Boolean $manage_prereqs,
  Hash $options_extra,
  String $output_dir,
  Array $prereqs,
  String $service_env_path,
  String $service_path,
  String $service_template,
  String $source_location,
  String $version,
) {

  anchor { 'get_iplayer::begin': } ->
  class { '::get_iplayer::install': } ->
  class { '::get_iplayer::config': } ~>
  class { '::get_iplayer::service': } ->
  anchor { 'get_iplayer::end': }

}
