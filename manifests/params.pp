class get_iplayer::params {

  $conf_dir = '/etc/get_iplayer'

  $version  = '2.94'

  $source_location   = "ftp://ftp.infradead.org/pub/get_iplayer/get_iplayer-${get_iplayer::version}.tar.gz"

  $options = {
    "nopurge"       => "true",
    "subdir-format" => "<nameshort>",
  }

  $basedir = '/usr/local'

  case $::osfamily {
    "RedHat": {
      if versioncmp($::operatingsystemrelease, '7') >= 0 {
        $service_template = 'get_iplayer/systemd.erb'
        $service_path     = '/lib/systemd/system/get_iplayer.service'
      }
      else {
        $service_template = 'get_iplayer/init.erb'
        $service_path     = '/etc/init.d/get_iplayer'
      }

      $service_env_template = 'get_iplayer/service_env.erb'
      $service_env_path     = '/etc/sysconfig/get_iplayer'

      $prereqs  = [
        "perl",
        "perl-Env",
        "perl-HTML-Parser",
        "perl-HTTP-Cookies",
        "perl-libwww-perl",
        "perl-XML-Simple",
      ]

    },
    default: {
      err("OS ${::operatingsystem} ${::operatingsystemrelease} is not supported")
    }
  } 

  $listen_port    = "1935"
  $listen_address = "0.0.0.0"

}
