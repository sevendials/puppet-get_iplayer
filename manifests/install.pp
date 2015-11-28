class get_iplayer::install inherits get_iplayer {

  staging::deploy { 'get_iplayer-2.94.tar.gz':
    source => 'ftp://ftp.infradead.org/pub/get_iplayer/get_iplayer-2.94.tar.gz',
    target => '/usr/local',
  }

}
