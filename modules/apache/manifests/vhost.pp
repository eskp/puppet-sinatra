define apache::vhost (
  $port='80',
  $servername='',
  $docroot,
  $template='apache/vhost.conf.erb'
) {

  include apache

  file { "/etc/apache2/sites-enabled/${title}":
    content => template($template),
    owner   => 'root',
    group   => 'root',
    mode    => '644',
    require => Class["apache::install"],
    notify  => Class["apache::service"],
  }
}
