# -*- mode: ruby -*-
# vi: set ft=ruby :

project = "DevelopmentEnvironment"

host = RbConfig::CONFIG['host_os']
if host =~ /darwin/
  cpus = `sysctl -n hw.ncpu`.to_i
elsif host =~ /linux/
  cpus = `nproc`.to_i
else
  cpus = 2
end

Vagrant.configure("2") do |config|
  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = true
  end

  config.vm.define "#{project}-Provision", primary: true do |machine|
    machine.vm.box = "ubuntu/bionic64"
    machine.vm.synced_folder ".", "/vagrant", disabled: true
    machine.vm.hostname = "#{project}-Provision"

    #Assigning a provider
    machine.vm.provider :virtualbox do |virtualbox|
      virtualbox.name = "#{project} Provision"
      virtualbox.cpus = cpus
      virtualbox.memory = 2048
    end

    # Asinging a provisioner
    machine.vm.provision "shell", path: "ubuntu.sh"
  end
end
