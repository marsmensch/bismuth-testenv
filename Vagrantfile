# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  # The vbguest plugin automatically installs the proper guest utils
  # vagrant plugin install vagrant-vbguest
  # https://github.com/dotless-de/vagrant-vbguest
  if Vagrant.has_plugin?("vbguest")
    config.vbguest.auto_update = true
    config.vbguest.iso_path = "http://download.virtualbox.org/virtualbox/%{version}/VBoxGuestAdditions_%{version}.iso"
  end

  # caching to speed-up box provisioning
  # vagrant plugin install vagrant-cachier
  # https://github.com/fgrehm/vagrant-cachier
  if Vagrant.has_plugin?("vagrant-cachier")
    # Configure cached packages to be shared between instances of the same base box.
    # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
    config.cache.scope = :box
  end

  # server or desktop
  #config.vm.box = "ubuntu/xenial64"
  config.vm.box = "boxcutter/ubuntu1604-desktop"
	
  # set default ip
  config.vm.network "private_network", ip: "10.10.15.10"

  # set hostname
  config.vm.hostname = "altcoinbox"	
	
  # tweak virtualbox
  config.vm.provider :virtualbox do |vb|
    vb.gui = true
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--cpus", 2]
  end	

  # adapt the script or add multiple calls
  config.vm.provision :shell, :path => "vagrant_provision.sh", privileged: true
  # provisioning
	
end
