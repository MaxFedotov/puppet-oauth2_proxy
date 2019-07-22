# @summary 
#   Private class for managing oauth2_proxy config.
#
# @api private
#
class oauth2_proxy::config {
  $config = $oauth2_proxy::config

  file { '/etc/oauth2_proxy':
    ensure => directory,
    owner  => $oauth2_proxy::user,
    group  => $oauth2_proxy::group,
    mode   => '0644',
  }

  file { '/var/log/oauth2_proxy':
    ensure => directory,
    owner  => $oauth2_proxy::user,
    group  => $oauth2_proxy::group,
    mode   => '0644'
  }

  file { "/etc/oauth2_proxy/oauth2_proxy.cfg":
    ensure  => file,
    owner   => $oauth2_proxy::user,
    group   => $oauth2_proxy::group,
    mode    => '0440',
    content => template('oauth2_proxy/oauth2_proxy.cfg.erb'),
    require => File['/etc/oauth2_proxy'],
  }


}
