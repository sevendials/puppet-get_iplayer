# install get_iplayer
class get_iplayer::install inherits get_iplayer {

  $instdir = "${get_iplayer::base_dir}/get_iplayer-${get_iplayer::version}"

  $source_location = regsubst(
    $get_iplayer::source_location,
    '__VERSION__',
    $get_iplayer::version
  )

  if $get_iplayer::manage_prereqs {
    each($get_iplayer::prereqs) | String $resource | {
      ensure_resource('package', $resource)
    }
  }

  staging::deploy { "v${get_iplayer::version}.zip":
    creates => $instdir,
    source  => $source_location,
    target  => $get_iplayer::base_dir,
  }
  -> file { 'get_iplayer.bin':
    ensure => 'link',
    name   => '/usr/bin/get_iplayer',
    target => "${instdir}/get_iplayer",
  }

  file { 'get_iplayer.conf_dir':
    ensure => 'directory',
    path   => $get_iplayer::conf_dir,
  }

  file { 'get_iplayer.service':
    path    => $get_iplayer::service_path,
    content => template($get_iplayer::service_template),
  }

  file { 'get_iplayer.output_dir':
    ensure => 'directory',
    path   => $get_iplayer::output_dir,
  }

}
