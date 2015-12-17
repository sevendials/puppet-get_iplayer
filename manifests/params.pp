class get_iplayer::params {

  $conf_dir = '/etc/get_iplayer'

  $version  = '2.94'

  $source_location = 'ftp://ftp.infradead.org/pub/get_iplayer/get_iplayer-__VERSION__.tar.gz'

  $output_dir = '/var/get_iplayer'

  $base_dir = '/usr/local'

  $fail_msg = "OS ${::operatingsystem} ${::operatingsystemrelease} is not supported"

  $manage_prereqs = true

  $listen_port    = '1935'

  $listen_address = '127.0.0.1'

  case $::osfamily {
    'RedHat': {

      $service_env_template = 'get_iplayer/service_env.erb'
      $service_env_path     = '/etc/sysconfig/get_iplayer'

      case $::os['release']['major'] {
        '7': {
          $service_template = 'get_iplayer/systemd.erb'
          $service_path     = '/lib/systemd/system/get_iplayer.service'
          $prereqs  = {
            'perl' => {},
            'perl-CGI' => {},
            'perl-Env' => {},
            'perl-HTML-Parser' => {},
            'perl-HTTP-Cookies' => {},
            'perl-libwww-perl' => {},
            'perl-XML-Simple' => {},
            'ffmpeg' => { require => 'Package[nux-dextop-release]' },
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
            'perl' => {},
            'perl-CGI' => {},
            'perl-HTML-Parser' => {},
            'perl-libwww-perl' => {},
            'perl-XML-Simple' => {},
            'ffmpeg' => { require => 'Package[nux-dextop-release]' },
            'rtmpdump' => { require => 'Package[nux-dextop-release]' },
            'nux-dextop-release' => {
              'source'    => 'http://li.nux.ro/download/nux/dextop/el6/x86_64/nux-dextop-release-0-2.el6.nux.noarch.rpm',
              'provider'  => 'rpm',
              'require'   => 'Package[epel-release]',
            },
          }
        }
        default: {
          fail($fail_msg)
        }
      }

    }
    'Debian': {
      case $::operatingsystem {
        'Ubuntu': {
          $service_env_template = 'get_iplayer/service_env.erb'
          $service_env_path     = '/etc/default/get_iplayer'

          $ffmpeg_real = versioncmp($::os['release']['major'], '15.04') ? {
              1       => 'ffmpeg',
              default => 'libav-tools',
          }

          $prereqs  = {
            'libxml-simple-perl' => {},
            'rtmpdump' => {},
            'libhtml-parser-perl' => {},
            'libwww-perl' => {},
            $ffmpeg_real => {},
          }

          if versioncmp($::os['release']['major'], '15.04') < 0 {
            $service_template = 'get_iplayer/init.erb'
            $service_path     = '/etc/init/get_iplayer.conf'
            $service_provider = 'upstart'
          }
          else {
            $service_template = 'get_iplayer/systemd.erb'
            $service_path     = '/lib/systemd/system/get_iplayer.service'
          }

        }
        default: {
          fail($fail_msg)
        }
      }
    }
    default: {
      fail($fail_msg)
    }
  }

}
