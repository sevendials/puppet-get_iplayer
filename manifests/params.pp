class get_iplayer::params {

  $fail_msg = "OS ${::operatingsystem} ${::operatingsystemrelease} is not supported"

  case $::osfamily {
    'RedHat': {

      case $::os['release']['major'] {
        '7': {
        }
        '6': {
          $service_provider = 'upstart'

        }
        default: {
          fail($fail_msg)
        }
      }

    }
    'Debian': {
      case $::operatingsystem {
        'Ubuntu': {

          if versioncmp($::os['release']['major'], '15.04') < 0 {
            $service_provider = 'upstart'
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
