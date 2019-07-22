# @summary
#   Private class for setting default oauth2_proxy parameters.
#
# @api private
#
class oauth2_proxy::params {
  $user                    = 'root'
  $group                   = $user
  $package_name            = 'oauth2_proxy'
  $version                 = 'latest'
  $manage_service          = true
  $package_install_options = []
}
