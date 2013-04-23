class ssh::service() {
  service { "sshd":
    ensure => running,
    enable => true,
    require => Class["ssh::config"],
  }
}
