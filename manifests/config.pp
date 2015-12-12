class get_iplayer::config inherits get_iplayer {

  file { 'get_iplayer.profile_sh':
    path    => '/etc/profile.d/get_iplayer.sh',
    content => "export GETIPLAYERUSERPREFS=${get_iplayer::conf_dir}\n",
  }

  file { 'get_iplayer.profile_csh':
    path    => '/etc/profile.d/get_iplayer.csh',
    content => "setenv GETIPLAYERUSERPREFS ${get_iplayer::conf_dir}\n",
  }

  $all_opts = merge($get_iplayer::options, $get_iplayer::options_extra)

  $opts_array = map ($all_opts) |$key,$value| { 
    "${key} ${value}\n"
  }

  $opts_content = join(sort($opts_array), '')

  file { 'get_iplayer.options':
    path    => '/etc/get_iplayer/options',
    content => $opts_content,
  }

}
