# == Class: get_iplayer
#
# Full description of class get_iplayer here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'get_iplayer': }
#
# === Authors
#
# Christopher Jenkins <christj@gmail.com>
#
# === Copyright
#
# Copyright 2015 Christopher Jenkins, unless otherwise noted.
#
class get_iplayer (
  $base_dir               = $get_iplayer::params::base_dir,
  $conf_dir               = $get_iplayer::params::conf_dir,
  $listen_address         = $get_iplayer::params::listen_address,
  $listen_port            = $get_iplayer::params::listen_port,
  $manage_prereqs         = $get_iplayer::params::manage_prereqs,
  $options_extra          = {},
  $output_dir             = $get_iplayer::params::output_dir,
  $prereqs                = $get_iplayer::params::prereqs,
  $service_env_path       = $get_iplayer::params::service_env_path,
  $service_env_template   = $get_iplayer::params::service_env_template,
  $service_path           = $get_iplayer::params::service_path,
  $service_template       = $get_iplayer::params::service_template,
  $source_location        = $get_iplayer::params::source_location,
  $version                = $get_iplayer::params::version,
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
  validate_string($service_env_template)
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
