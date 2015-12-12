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
  $conf_dir               = $get_iplayer::params::conf_dir,
  $version                = $get_iplayer::params::version,
  $listen_port            = $get_iplayer::params::listen_port,
  $listen_address         = $get_iplayer::params::listen_address,
  $prereqs                = $get_iplayer::params::prereqs,
  $options                = $get_iplayer::params::options,
  $options_extra          = {},
  $source_location        = $get_iplayer::params::source_location,
  $basedir                = $get_iplayer::params::basedir,
  $service_template       = $get_iplayer::params::service_template,
  $service_path           = $get_iplayer::params::service_path,
  $service_env_template   = $get_iplayer::params::service_template,
  $service_env_path       = $get_iplayer::params::service_path,
) inherits get_iplayer::params {

  anchor { 'get_iplayer::begin': } ->
  class { '::get_iplayer::install': } ->
  class { '::get_iplayer::config': } ~>
  class { '::get_iplayer::service': } ->
  anchor { 'get_iplayer::end': }
  
}
