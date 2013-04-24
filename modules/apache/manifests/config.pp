class apache::config {

  file { '/etc/apache2/sites-enabled/000-default':
    ensure => absent,
    notify => Class['apache::service'],
  }

  firewall { '080 accept http requests':
    port   => '80',
    proto  => 'tcp',
    action => 'accept',
  }
}
