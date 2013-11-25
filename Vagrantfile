# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "centos-6.3-i386"
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/boxes/opscode-centos-6.3-i386.box"
  config.vm.customize ["modifyvm", :id, "--memory", 2048]
  config.vm.customize ["modifyvm", :id, "--cpus", 4]
  config.vm.forward_port 80, 4008
  config.vm.host_name = "deal.local"

  config.vm.provision :chef_solo do |chef|
	chef.cookbooks_path = "vagrant/cookbooks"
	chef.add_recipe("fapi::nameservers")
	chef.add_recipe("yum::epel")
    chef.add_recipe("yum::remi")
    chef.add_recipe("fapi::epel")
    chef.add_recipe("yum::ius")
	chef.add_recipe("fapi::scm")
	chef.add_recipe("fapi::mongo")
	chef.add_recipe("fapi::php")
	chef.add_recipe("fapi::composer")
	chef.add_recipe("fapi::apache")
	chef.add_recipe("fapi::fapi")
  end

end
