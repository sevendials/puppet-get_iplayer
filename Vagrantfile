# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "puppetlabs/centos-7.2-64-puppet"
  config.vm.provision 'puppet', :environment_path => 'vagrant/environments', :environment => 'setup'
  config.vm.provision 'puppet', :environment_path => 'vagrant/environments', :environment => 'install'
end
