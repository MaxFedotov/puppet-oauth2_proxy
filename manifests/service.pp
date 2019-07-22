# @summary 
#   Private class for managing oauth2_proxy service.
#
# @api private
#
class oauth2_proxy::service {

  systemd::unit_file { 'oauth2_proxy.service':
    content => template("${module_name}/oauth2_proxy.service.erb"),
  }

  if $oauth2_proxy::manage_service {
    service { "oauth2_proxy":
      ensure    => 'running',
      enable    => true,
      subscribe => File["/etc/oauth2_proxy/oauth2_proxy.cfg"],
      require   => Systemd::Unit_file["oauth2_proxy.service"],
    }
  }
}
