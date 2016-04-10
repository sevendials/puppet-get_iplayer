# -*- mode: ruby -*-
# vi: set ft=ruby :
#

Vagrant.configure(2) do |config|
  config.r10k.puppet_dir = "puppet/environments/production"
  config.r10k.module_path = 'puppet/environments/production/modules'
  config.r10k.puppetfile_path = "puppet/environments/production/Puppetfile"
  config.vm.box = "puppetlabs-VAGRANTSLASH-centos-6.6-64-puppet"
  config.vm.provision "puppet", :environment_path => 'puppet/environments'
end
