class get_iplayer::params {

  $conf_dir = '/etc/get_iplayer'

  $version  = '2.94'

  $source_location   = "ftp://ftp.infradead.org/pub/get_iplayer/get_iplayer-${get_iplayer::version}.tar.gz"

  $prereqs  = [
    "perl",
    "perl-Env",
    "perl-HTML-Parser",
    "perl-HTTP-Cookies",
    "perl-libwww-perl",
    "perl-XML-Simple",
  ]

  $options = {
    "nopurge"       => "true",
    "subdir-format" => "<nameshort>",
  }

  $basedir = '/usr/local'

}
