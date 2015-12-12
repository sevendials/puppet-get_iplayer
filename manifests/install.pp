class get_iplayer::install inherits get_iplayer {

  ensure_packages($get_iplayer::prereqs)

  staging::deploy { "get_iplayer-${get_iplayer::version}.tar.gz":
    source => $get_iplayer::source_location,
    target => $get_iplayer::basedir,
  }
  ->
  file { 'get_iplayer.bin':
    name    => '/usr/bin/get_iplayer',
    ensure  => 'link',
    target  => "${get_iplayer::basedir}/local/get_iplayer-${get_iplayer::version}/get_iplayer",
  }

  file { 'get_iplayer.conf_dir':
    ensure  => 'directory',
    path    => $get_iplayer::conf_dir,
  }

}
