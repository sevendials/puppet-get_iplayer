class get_iplayer::params {

  $conf_dir = '/etc/get_iplayer'

  $version  = '2.95'

  $source_location = 'https://github.com/get-iplayer/get_iplayer/archive/v__VERSION__.tar.gz'

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
          $prereqs  = [
            'perl',
            'perl-CGI',
            'perl-Env',
            'perl-HTML-Parser',
            'perl-HTTP-Cookies',
            'perl-libwww-perl',
            'perl-XML-Simple',
            'ffmpeg',
            'rtmpdump',
          ]
        }
        '6': {
          $service_template = 'get_iplayer/init.erb'
          $service_path     = '/etc/init/get_iplayer.conf'
          $service_provider = 'upstart'

          $prereqs  = [
            'perl',
            'perl-CGI',
            'perl-HTML-Parser',
            'perl-libwww-perl',
            'perl-XML-Simple',
            'ffmpeg',
            'rtmpdump',
          ]
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

          $prereqs  = [
            'libxml-simple-perl',
            'rtmpdump',
            'libhtml-parser-perl',
            'libwww-perl',
            $ffmpeg_real,
          ]

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
