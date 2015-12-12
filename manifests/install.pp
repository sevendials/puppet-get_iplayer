class get_iplayer::install inherits get_iplayer {

  ensure_packages($get_iplayer::prereqs)

  staging::deploy { "get_iplayer-${get_iplayer::version}.tar.gz":
    source => "ftp://ftp.infradead.org/pub/get_iplayer/get_iplayer-${get_iplayer::version}.tar.gz",
    target => '/usr/local',
  }
  ->
  file { 'get_iplayer.bin':
    name    => '/usr/bin/get_iplayer'
    ensure  => 'link',
    target  => "/usr/local/get_iplayer-${get_iplayer::version}/get_iplayer",
  }

  file { 'get_iplayer.conf_dir':
    ensure  => 'directory',
    path    => $get_iplayer::conf_dir,
  }

}
