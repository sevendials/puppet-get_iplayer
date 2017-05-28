require 'rspec-puppet-facts'
include RspecPuppetFacts
add_custom_fact :staging_http_get, 'curl'
add_custom_fact :path, '/opt'
upstart_os = ['ubuntu-14.04-x86_64', 'ubuntu-14.10-x86_64', 'redhat-6-x86_64', 'scientificlinux-6-x86_64', 'centos-6-x86_64']
add_custom_fact :service_provider, ->(os, _facts) { upstart_os.include?(os) ? 'upstart' : 'systemd' }
RSpec.configure do |c|
  c.filter_gems_from_backtrace 'puppet', 'rspec-puppet'
end
