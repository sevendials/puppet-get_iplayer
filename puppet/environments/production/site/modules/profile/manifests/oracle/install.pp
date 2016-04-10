# runs dbinstall from oradb
class profile::oracle::install {
  oradb::installdb{ 'foo':
    version                   => '11.2.0.1',
    file                      => 'linux.x64_11gR2_database',
    database_type             => 'EE',
    oracle_base               => '/oracle',
    oracle_home               => '/oracle/product/11.2/db',
    user                      => 'oracle',
    group                     => 'dba',
    group_install             => 'oinstall',
    group_oper                => 'oper',
    download_dir              => '/var/tmp',
    zip_extract               => true,
    remote_file               => false,
    puppet_download_mnt_point => '/vagrant/zips',
  }

}
