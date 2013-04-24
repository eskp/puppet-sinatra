class app::package {

  package { ['build-essential', 'ruby', 'rubygems', 'git']:
    ensure   => installed,
  }

  # `gem install sinatra` will most likely throw an error due rdoc https://github.com/sinatra/sinatra/issues/565
  # but sinatra will install successfully
  package { ['sinatra', 'unicorn']:
    ensure => 'installed',
    provider => 'gem',
    require => Package['rubygems'],
  }

}

