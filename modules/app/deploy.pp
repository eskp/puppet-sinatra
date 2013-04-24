define app::deploy( $address ) {

  include app

  file { ${name}:
    ensure   => directory,
  }

  package { 'git':
    ensure   => installed,
  }

  vcsrepo { ${name}:
    ensure   => latest,
    owner    => 'root',
    group    => 'root',
    provider => 'git',
    source   => ${address},
    revision => 'master',
    require  => Package['git'],
  }
}

