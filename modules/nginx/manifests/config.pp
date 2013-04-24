class nginx::config() inherits nginx::params {

  File {
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  file {
    "${nginx::params::conf_dir}":
      ensure => directory;

    "${nginx::params::conf_dir}/nginx.conf":
      ensure  => file,
      content => template('nginx/nginx.conf.erb');

    "${nginx::params::conf_dir}/sites-enabled/default":
      ensure  => absent;
  }
}
