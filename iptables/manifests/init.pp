class iptables {

  Firewall {
    notify => Exec['persist-firewall']
  }

  firewall { '000 accept input from local':
    iniface => 'lo',
    proto   => 'all',
    action  => 'accept',
  }
  firewall { '001 accept output from local':
    outiface => 'lo',
    chain    => 'OUTPUT',
    proto    => 'all',
    action   => 'accept',
  }
  firewall { '002 accept established connection':
    state  => ['RELATED','ESTABLISHED'],
    proto  => 'all',
    action => 'accept',
  }
  firewall { '003 accept established connection':
    state  => ['NEW', 'RELATED','ESTABLISHED'],
    chain  => 'OUTPUT',
    proto  => 'all',
    action => 'accept',
  }
  firewall { '005 accept pings':
    state       => ['NEW', 'RELATED', 'ESTABLISHED'],
    proto       => 'icmp',
    action      => 'accept',
  }

  ########
  #
  # All the other firewall rules defined in respective modules or nodes
  #
  ########

  firewall { '997 drop all else':
    chain  => 'INPUT',
    proto  => 'all',
    action => 'drop',
  }
  firewall { '998 drop all else':
    chain  => 'FORWARD',
    proto  => 'all',
    action => 'drop',
  }
  firewall { '999 drop all else':
    chain  => 'OUTPUT',
    proto  => 'all',
    action => 'drop',
  }

  exec { 'persist-firewall':
    command => '/sbin/iptables-save > /etc/firewall.conf',
    refreshonly => true,
  }
}
