class get_iplayer::config inherits get_iplayer {

  file { 'get_iplayer.profile_sh':
    path    => '/etc/profile.d/get_iplayer.sh',
    content => "export GETIPLAYERUSERPREFS=${get_iplayer::conf_dir}\n",
  }

  file { 'get_iplayer.profile_csh':
    path    => '/etc/profile.d/get_iplayer.csh',
    content => "setenv GETIPLAYERUSERPREFS ${get_iplayer::conf_dir}\n",
  }

}
