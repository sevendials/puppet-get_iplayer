# configure get_iplayer
class get_iplayer::config inherits get_iplayer {

  $options_default = {
    'output'      => $get_iplayer::output_dir,
    'profiledir'  => $get_iplayer::conf_dir,
  }

  $all_opts = merge($options_default, $get_iplayer::options_extra)

  $opts_array = map ($all_opts) |$key,$value| {
    "${key} ${value}\n"
  }

  $opts_content = join(sort($opts_array), '')

  file { 'get_iplayer.options':
    path    => '/etc/get_iplayer/options',
    content => $opts_content,
  }

  file { 'get_iplayer.service_env':
    path    => $get_iplayer::service_env_path,
    content => "GETIPLAYERUSERPREFS=${get_iplayer::conf_dir}\n",
  }

}
