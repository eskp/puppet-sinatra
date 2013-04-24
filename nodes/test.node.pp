node 'ip-10-240-66-194.ap-southeast-2.compute.internal' {
  include iptables, nginx, ssh

  app::deploy { 'simple-sinatra-app':
    address => 'https://github.com/tnh/simple-sinatra-app.git',
  }
    
}
