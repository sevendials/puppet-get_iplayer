package { ['git', 'ruby-devel', 'rubygem-bundler']: }
->
exec {
  default:
    cwd      => '/vagrant',
    provider => 'shell',
  ;
  'bundle install':
  ;
  'bundle exec rake spec_clean; bundle exec rake spec_prep':
    require => Exec['bundle install'],
  ;
}
