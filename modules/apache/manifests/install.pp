class apache::install {
  package { [ "apache2", "libapache2-mod-passenger" ]:
    ensure => present,
    require => Exec['update-repos']
  }
}
