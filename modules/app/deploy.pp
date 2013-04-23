class app::deploy( $docroot, $git_repo ) {

  file { ${docroot}:
    ensure   => directory,
    mode     => '0755',
    require  => Class['nginx::config'],
    notify   => Exec['git_pull'],
  }

  package { 'git':
    ensure   => installed,
  }

  vcsrepo { ${docroot}:
    ensure   => latest,
    owner    => 'root',
    group    => 'root',
    provider => 'git',
    source   => ${git_repo},
    revision => 'master',
    require  => Package['git'],
  }
}

