# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |admin2|

    admin2.vm.box = "centos-5.8-x86_64"
    admin2.vm.box_url = "https://dl.dropboxusercontent.com/s/sij0m2qmn02a298/centos-5.8-x86_64.box"

    #admin2.vm.box = "centos-6.4-x86_64"
    #admin2.vm.box_url = "https://dl.dropboxusercontent.com/s/yg9ceak6zd86wk7/centos-6.4-x86_64.box"


    admin2.vm.hostname = "admin2.example.com"
    admin2.vm.network :forwarded_port, guest: 80, host: 8888 ,auto_correct: true
    admin2.vm.network :forwarded_port, guest: 7001, host: 7001, auto_correct: true
  
    admin2.vm.synced_folder ".", "/vagrant", :mount_options => ["dmode=777","fmode=777"]

  
    # admin2.vm.network :public_network
    # admin2.ssh.forward_agent = true
    # admin2.vm.synced_folder "../data", "/vagrant_data"
  
    admin2.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "2048"]
      vb.customize ["modifyvm", :id, "--name", "admin2"]
    end
  
    admin2.vm.provision :shell, :inline => "ln -sf /vagrant/puppet/hiera.yaml /etc/puppet/hiera.yaml"
    
    admin2.vm.provision :puppet do |puppet|
      puppet.manifests_path    = "puppet/manifests"
      puppet.module_path       = "puppet/modules"
      puppet.manifest_file     = "site.pp"
      puppet.options           = "--verbose --parser future --hiera_config /vagrant/puppet/hiera.yaml"
  
      puppet.facter = {
        "environment" => "development",
        "vm_type"     => "vagrant",
        "env_app1"    => "application_aaa",
        "env_app2"    => "application_bbb",
        "env_app3"    => "application_none",
        "env_app4"    => "application_none",
      }
      
    end

end
