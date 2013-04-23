class app::sinatra( $docroot, $git_repo ) {

  file { ${docroot}:
    ensure  => directory,
    mode    => '0755',
    require => Class['nginx::config'],
    notify  => Exec['git_pull'],
  }

  exec { 'git_pull':
    cwd         => ${docroot},
    command     => "git clone ${git_repo}",
    notify      => Class['nginx::service'],
    refreshonly => true,
  }
}

