class get_iplayer (
  $base_dir,
  $conf_dir,
  $listen_address,
  $listen_port,
  $manage_prereqs,
  $options_extra          = {},
  $output_dir,
  $prereqs,
  $service_env_path,
  $service_path,
  $service_template,
  $source_location,
  $version,
) inherits get_iplayer::params {

  validate_absolute_path($base_dir)
  validate_absolute_path($conf_dir)
  validate_ipv4_address($listen_address)
  validate_integer($listen_port)
  validate_bool($manage_prereqs)
  validate_hash($options_extra)
  validate_absolute_path($output_dir)
  validate_hash($prereqs)
  validate_absolute_path($service_env_path)
  validate_absolute_path($service_path)
  validate_string($service_template)
  validate_string($source_location)
  validate_numeric($version)

  anchor { 'get_iplayer::begin': } ->
  class { '::get_iplayer::install': } ->
  class { '::get_iplayer::config': } ~>
  class { '::get_iplayer::service': } ->
  anchor { 'get_iplayer::end': }
 
}
