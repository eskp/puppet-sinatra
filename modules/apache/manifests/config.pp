class apache::config {

  $port = '80'

  firewall { '080 accept http requests':
    port   => $port,
    proto  => 'tcp',
    action => 'accept',
  }
}
