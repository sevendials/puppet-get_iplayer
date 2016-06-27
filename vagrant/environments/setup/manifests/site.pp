package { ['git', 'ruby-devel', 'rubygem-bundler']: }
->
exec {
  default:
    cwd      => '/vagrant',
    provider => 'shell',
  ;
  'bundle install':
    unless => 'bundle check',
  ;
  'bundle exec rake spec_clean; bundle exec rake spec_prep':
    require => Exec['bundle install'],
    unless  => 'test -d spec/fixtures/modules/get_iplayer',
  ;
}
