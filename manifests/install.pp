# @summary 
#   Private class for installing oauth2_proxy.
#
# @api private
#
class oauth2_proxy::install {
  
  package { $oauth2_proxy::package_name:
    ensure          => $oauth2_proxy::version,
    install_options => $oauth2_proxy::package_install_options,
  }

}
