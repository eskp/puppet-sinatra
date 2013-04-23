class ssh (
  $rootlogin = "no",
  $pwd_auth = "no",
  $port = "22"
  
  ) {
    include ssh::install, ssh::config, ssh::service
}
