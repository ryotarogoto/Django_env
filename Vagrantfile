# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos64box"
  config.vm.network :private_network, ip: "192.168.33.50"
  config.vm.provider :virtualbox do |vb|
    vb.name = "djangoenv"
  end
  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
      "mysql::client",
      "mysql::server",
    ]

    chef.json = {
      mysql: {
        server_root_password: "password",
        server_repl_password: "password",
        server_debian_password: "password",
        bind_address: "127.0.0.1"
      }
    }
  end
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest
  config.vm.provision :shell, path:"bootstrap.sh"
end
