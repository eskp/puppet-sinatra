class app::package {

  package { ['build-essential', 'ruby', 'rubygems', 'ruby-bundler', 'git']:
    ensure   => installed,
  }

  package { ['sinatra', 'unicorn']:
    ensure => 'installed',
    provider => 'gem',
    require => Package['rubygems'],
  }

}

