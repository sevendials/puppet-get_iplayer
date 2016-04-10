class profile::oracle::listener {
  db_listener{ 'startlistener':
      ensure          => 'running',  # running|start|abort|stop
      oracle_base_dir => '/oracle',
      oracle_home_dir => '/oracle/product/11.2/db',
      os_user         => 'oracle',
      listener_name   => 'listener' # which is the default and optional
  }
}
