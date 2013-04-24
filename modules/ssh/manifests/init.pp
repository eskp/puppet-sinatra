class ssh (
  $rootlogin = "yes",
  $pwd_auth = "no",
  $port = "22"
  
  ) {
    include ssh::install, ssh::config, ssh::service
}
