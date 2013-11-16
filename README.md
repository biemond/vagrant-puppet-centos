vagrant-puppet-centos
=======================

Vagrant Virtualbox for testing masterless Puppet 3.3 with hiera  

2 configuration
* single node
* multinode

### single node  ( Vagrantfile_singlenode )

    vagrant destroy
    vagrant up
    vagrant provision


### multi node  ( Vagrantfile_multinode )

admin2 server

    vagrant destroy admin2
    vagrant up admin2
    vagrant provision admin2

node10

    vagrant destroy admin2
    vagrant up admin2
    vagrant provision admin2

node20

    vagrant destroy admin2
    vagrant up admin2
    vagrant provision admin2

