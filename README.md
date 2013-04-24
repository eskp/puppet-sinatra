Deploy Sinatra applications with Puppet
==============

To setup the server run:

    fab host:<host fqdn> setup puppet_init puppet_run
    
That will (Fabric)[http://docs.fabfile.org] command, go and update server repositories, set hostname and timezone, clone this repo to /opt, update it's submodules
and do a Puppet run with no Puppet server required. Scaling Puppet with git has it's own benefits beyond this repo.

Then for all consequent runs:

    fab host:<host fqdn> puppet_run

The code was tested on Ubuntu and Debian AMIs.

http://wiki.debian.org/Cloud/AmazonEC2Image
