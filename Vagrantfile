# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "hashicorp/precise64"
  
  config.vm.define "gitserver" do |gitserver|
    gitserver.vm.provision :shell, path: "gitserver/bootstrap.sh"
    gitserver.vm.network :forwarded_port, guest: 80, host: 12003, protocol: 'tcp'
  end
  
  config.vm.define "testcoordinator" do |testcoordinator|
    testcoordinator.vm.provision "shell", path: "testcoordinator/provision.sh"
  end

  config.vm.define "testserver" do |testserver|
    testserver.vm.provision "shell", path: "testserver/provision.sh"
  end

end
