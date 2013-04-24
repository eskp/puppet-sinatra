Deploy Sinatra applications with Puppet
==============

To setup the server run:

    fab host:<host fqdn> setup puppet_init puppet_run
    
That will run [Fabric](http://docs.fabfile.org) command, go and update server repositories, set hostname and timezone, clone this repo to /opt, update it's submodules
and do a Puppet run with no Puppet server required. Puppet will then take over in installing all required packages needed to install
the application(apache, app) and secure the server(iptables, ssh).

For all consequent runs:

    fab host:<host fqdn> puppet_run

Sample node definition is available in nodes/test.node.pp

The code was tested on Ubuntu and Debian AMIs.

http://wiki.debian.org/Cloud/AmazonEC2Image

This can be combined with [salt-cloud](http://salt-cloud.readthedocs.org/en/latest/) to automate the provisioning of the servers at EC2, Rackspace or Linode.

This command could be part of Fabric script with local() call to provision Debian machine at Linode:

    sudo salt-cloud -p rea puppet-sinatra.test

`/etc/salt/cloud.providers`

    linode:
      provider: linode
      apikey:
      # Defalut root password
      password:
      # Location ID, '3' is Fremont, CA, USA. List with `sudo salt-cloud --list-locations linode_insights`
      location: 3
  
`/etc/salt/cloud.profiles`

    rea:
      provider: linode_insights
      image: 77 # Debian 6
      size: Linode 1024
      deploy: False # Don't install Salt on the host
