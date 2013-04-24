import 'nodes/*.pp'

Exec { path => '/usr/bin:/usr/sbin/:/bin:/sbin' }

exec { 'update-repos':
  command => 'apt-get update',
  }
