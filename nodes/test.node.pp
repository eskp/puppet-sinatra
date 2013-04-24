node 'ip-10-240-10-140.ap-southeast-2.compute.internal' {
  include iptables, nginx, ssh, utils

  app::deploy { '/var/www':
    address => 'https://github.com/tnh/simple-sinatra-app.git',
  }
    
}
