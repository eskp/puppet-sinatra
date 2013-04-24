class apache::config {

  file { '/etc/apache2/sites-enabled/000-default':
    ensure => absent,
  }

  firewall { '080 accept http requests':
    port   => '80',
    proto  => 'tcp',
    action => 'accept',
  }
}
