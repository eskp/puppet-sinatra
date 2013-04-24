node default {
  include iptables, nginx, ssh

  app::deploy { 'simple-sinatra-app':
    address => 'https://github.com/tnh/simple-sinatra-app.git',
  }
    
}
