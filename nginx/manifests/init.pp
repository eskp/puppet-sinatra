class nginx() inherits nginx::params {
  include nginx::install
  include nginx::config
  include nginx::service

  class { 'nginx::install':
    notify => Class['nginx::service'],
  }

  class { 'nginx::config':
    require => Class['nginx::install'],
    notify  => Class['nginx::service'],
  }

  class { 'nginx::service':
    require => Class['nginx::install'],
  }

}
