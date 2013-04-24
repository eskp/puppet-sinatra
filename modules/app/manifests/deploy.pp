define app::deploy( $address ) {

  include app

  file { ["/var/www", "/var/www/${title}/public", "/var/www/${title}/tmp":
    ensure   => directory,
  }

  vcsrepo { "/var/www/${title}":
    ensure   => latest,
    owner    => 'root',
    group    => 'root',
    provider => 'git',
    source   => $address,
    revision => 'master',
    require  => Package['git'],
  }
}

