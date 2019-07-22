# @summary
#   Installs and configures oauth2_proxy.
#
# @example Install oauth2_proxy.
#   class { 'oauth2_proxy':
#     config  => {
#       http_address            => ':80',
#     }
#   }
#
# @param user
#   User for oauth2_proxy. Defaults to 'root'.
# @param group
#   User for oauth2_proxy. Defaults to 'root'.
# @param package_name
#   Package containing oauth2_proxy. Defaults to 'oauth2_proxy'.
# @param version
#   Version of oauth2_proxy. Defaults to 'latest'.
# @param manage_service
#   Specifies whether oauth2_proxy service should be managed. Defaults to 'true'.
# @param package_install_options
#   Array of install options for managed package resources. Appropriate options are passed to package manager.
# @param config
#   Hash of configuration options for oauth2_proxy
#   
class oauth2_proxy(
  String $user                           = $oauth2_proxy::params::user,
  String $group                          = $oauth2_proxy::params::group,
  String $package_name                   = $oauth2_proxy::params::package_name,
  String $version                        = $oauth2_proxy::params::version,
  Boolean $manage_service                = $oauth2_proxy::params::manage_service,
  Array[String] $package_install_options = $oauth2_proxy::params::package_install_options,
  Hash $config                           = {}

) inherits oauth2_proxy::params {

  if $user != 'root' { # let's assume that 'root' will exist and not touch that...
    group { $group:
      ensure => 'present',
    }

    user { $user:
      ensure => 'present',
      groups => $group,
    }
  }

  anchor { 'oauth2_proxy::begin': }
  -> class { 'oauth2_proxy::install': }
  -> class { 'oauth2_proxy::config': }
  -> class { 'oauth2_proxy::service': }
  -> anchor { 'oauth2_proxy::end': }
}
