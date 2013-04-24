node 'ip-10-240-10-140.ap-southeast-2.compute.internal' {
  include iptables, nginx, ssh

  app::deploy { 'simple-sinatra-app':
    address => 'https://github.com/tnh/simple-sinatra-app.git',
  }
    
}
