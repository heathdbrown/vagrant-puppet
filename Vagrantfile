# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"

  config.vm.define :puppetmaster do |puppetmaster|
      puppetmaster.vm.box = "precise64"
      puppetmaster.vm.network :private_network, ip: "192.168.50.4"
      puppetmaster.vm.provision :shell, :path => "install_puppetmaster.sh"
  end

  config.vm.define :puppet do |puppet|
      puppet.vm.box = "precise64"
      puppet.vm.network :private_network, ip: "192.168.50.5"
      puppet.vm.provision :shell, :path => "install_puppet.sh"
  end
end
