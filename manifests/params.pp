class get_iplayer::params {

  $conf_dir = '/etc/get_iplayer'

  $version  = '2.94'

  $source_location   = "ftp://ftp.infradead.org/pub/get_iplayer/get_iplayer-2.94.tar.gz"

  $output_dir = '/var/get_iplayer'

  $basedir = '/usr/local'

  case $::osfamily {
    "RedHat": {
      case $::os['release']['major'] {
        "7": {
          $service_template = 'get_iplayer/systemd.erb'
          $service_path     = '/lib/systemd/system/get_iplayer.service'
          $prereqs  = {
            "perl" => {},
            "perl-CGI" => {},
            "perl-Env" => {},
            "perl-HTML-Parser" => {},
            "perl-HTTP-Cookies" => {},
            "perl-libwww-perl" => {},
            "perl-XML-Simple" => {},
            "ffmpeg" => { require => 'Package[nux-dextop-release]' },
            'rtmpdump' => { require => 'Package[nux-dextop-release]' },
            'nux-dextop-release' => {
              'source'    => 'http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm',
              'provider'  => 'rpm',
              'require'   => 'Package[epel-release]',
            },
          }
        }
        '6': {
          $service_template = 'get_iplayer/init.erb'
          $service_path     = '/etc/init/get_iplayer.conf'
          $service_provider = 'upstart'

          $prereqs  = {
            "perl" => {},
            "perl-CGI" => {},
            "perl-HTML-Parser" => {},
            "perl-libwww-perl" => {},
            "perl-XML-Simple" => {},
            "ffmpeg" => { require => 'Package[nux-dextop-release]' },
            'rtmpdump' => { require => 'Package[nux-dextop-release]' },
            'nux-dextop-release' => {
              'source'    => 'http://li.nux.ro/download/nux/dextop/el6/x86_64/nux-dextop-release-0-2.el6.nux.noarch.rpm',
              'provider'  => 'rpm',
              'require'   => 'Package[epel-release]',
            },
          }
        }
        default: {
          fail("OS ${::operatingsystem} ${::operatingsystemrelease} is not supported")
        }
      }

      $service_env_template = 'get_iplayer/service_env.erb'
      $service_env_path     = '/etc/sysconfig/get_iplayer'

    }
    default: {
      fail("OS ${::operatingsystem} ${::operatingsystemrelease} is not supported")
    }
  } 

  $listen_port    = "1935"
  $listen_address = "0.0.0.0"

}
