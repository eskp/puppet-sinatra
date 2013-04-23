class nginx::params {

  $conf_dir   = '/etc/nginx'
  $user       = 'www-data'
  $pid        = '/var/run/nginx.pid'
  $error_log  = '/var/log/nginx/error.log'
  $access_log = '/var/log/nginx/access.log'

}
