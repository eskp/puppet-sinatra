class app::package {

  package { ['build-essential', 'ruby', 'libsinatra-ruby', 'git']:
    ensure   => installed,
  }
}

