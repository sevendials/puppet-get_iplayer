source 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? "= #{ENV['PUPPET_VERSION']}" : ['>= 3.3']
gem 'puppet', puppetversion
gem 'puppetlabs_spec_helper', '>= 0.1.0'
gem 'puppet-lint', '>= 0.3.2'
gem 'facter', '>= 1.7.0'
gem 'metadata-json-lint', '>= 0.0.11'
gem 'rubocop', '0.41.2' if RUBY_VERSION < '2.0.0'
gem 'rubocop' if RUBY_VERSION >= '2.0.0'
