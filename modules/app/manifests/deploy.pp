define app::deploy( $address ) {

  include app

  file { ${title}:
    ensure   => directory,
  }

  vcsrepo { ${title}:
    ensure   => latest,
    owner    => 'root',
    group    => 'root',
    provider => 'git',
    source   => ${address},
    revision => 'master',
    require  => Package['git'],
  }
}

