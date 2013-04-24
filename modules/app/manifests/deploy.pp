define app::deploy( $address ) {

  include app

  file { "/var/www":
    ensure   => directory,
  }

  # Apache Passenger requires these two directories
  file { ["/var/www/${title}/public", "/var/www/${title}/tmp"]:
    ensure   => directory,
    require  => Vcsrepo["/var/www/${title}"],
  }

  # Use vcsrepo module from Puppet Labs to clone the repository. Exec "git clone" command could also have been used.
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

