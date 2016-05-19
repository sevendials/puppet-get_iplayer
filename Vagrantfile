# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_plugin('vagrant-serverspec')

Vagrant.configure(2) do |config|
  config.vm.box = "puppetlabs/centos-7.2-64-puppet"
  config.vm.provision 'shell', :inline => 'rpm -q git > /dev/null || yum -y install git'
  config.vm.provision 'shell', :inline => 'rpm -q ruby-devel > /dev/null || yum -y install ruby-devel'
  config.vm.provision 'shell', :inline => 'rpm -q rubygem-bundler > /dev/null || yum -y install rubygem-bundler'
  config.vm.provision 'shell', :inline => 'cd /vagrant; bundle install; bundle exec rake spec_clean; bundle exec rake spec_prep; /usr/local/bin/puppet apply examples/init.pp --modulepath=spec/fixtures/modules'
end
