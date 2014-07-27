# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box     = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  config.vm.provision :shell, path: 'lib/provision.sh'

  # reporting
  config.vm.network "forwarded_port", guest: 3000, host: 3001

  # update guest additions automaticlly without downloading the iso
  config.vbguest.auto_update = true
  config.vbguest.no_remote = false

  config.vm.provider "virtualbox" do |vb|
    # get host OS from the ruby config
    host_os = RbConfig::CONFIG['host_os']

    if host_os =~ /darwin/
      cpus = `sysctl -n hw.ncpu`.to_i
      # eliminate hyperthreaded cores from the count
      cpus = cpus/2
    else
      cpus = 2
    end

    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", cpus]
  end

  config.vm.synced_folder ".", "/vagrant", nfs: true

  config.vm.network "private_network", ip: "192.168.50.4"
end
