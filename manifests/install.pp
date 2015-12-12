class get_iplayer::install inherits get_iplayer {

  staging::deploy { "get_iplayer":
    source => "ftp://ftp.infradead.org/pub/get_iplayer/get_iplayer-${get_iplayer::version}.tar.gz",
    target => '/usr/local',
  }

  file { 'get_iplayer.conf_dir':
    ensure  => 'directory',
    path    => $get_iplayer::conf_dir,
  }

  file { 'get_iplayer.bin':
    name    => '/usr/bin/get_iplayer'
    ensure  => 'link',
    target  => "/usr/local/get_iplayer-${get_iplayer::version}/get_iplayer",
    require => Staging::Deploy["get_iplayer"],
  }

}
