class get_iplayer::install inherits get_iplayer {

  $instdir = "${get_iplayer::basedir}/get_iplayer-${get_iplayer::version}"

  $source_location = regsubst(
    $get_iplayer::source_location,
    '__VERSION__',
    $get_iplayer::version
  )

  each($get_iplayer::prereqs) | String $resource, Hash $attributes| {
    ensure_resource('package', $resource, $attributes)
  }

  staging::deploy { "get_iplayer-${get_iplayer::version}.tar.gz":
    source => $source_location,
    target => $get_iplayer::basedir,
  }
  ->
  file { 'get_iplayer.bin':
    name    => '/usr/bin/get_iplayer',
    ensure  => 'link',
    target  => "${instdir}/get_iplayer",
  }

  file { 'get_iplayer.conf_dir':
    ensure  => 'directory',
    path    => $get_iplayer::conf_dir,
  }

  file { 'get_iplayer.service':
    path    => $get_iplayer::service_path,
    content => template($get_iplayer::service_template),
  }

  file { 'get_iplayer.output_dir':
    ensure  => 'directory',
    path    => $get_iplayer::output_dir,
  }

}
