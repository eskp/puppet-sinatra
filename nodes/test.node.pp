node default {
  include iptables, apache, ssh

  app::deploy { 'simple-sinatra-app':
    address => 'https://github.com/tnh/simple-sinatra-app.git',
  }

  apache::vhost { 'simple-sinatra-app.local':
    docroot => '/var/www/simple-sinatra-app',
  }
    
}
