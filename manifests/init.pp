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
) inherits get_iplayer::params {

  anchor { 'get_iplayer::begin': } ->
  class { '::get_iplayer::install': } ->
  anchor { 'get_iplayer::end': }
  
}
