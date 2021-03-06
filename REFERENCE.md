# Reference
<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

**Classes**

_Public Classes_

* [`oauth2_proxy`](#oauth2_proxy): Installs and configures oauth2_proxy.

_Private Classes_

* `oauth2_proxy::config`: Private class for managing oauth2_proxy config.
* `oauth2_proxy::install`: Private class for installing oauth2_proxy.
* `oauth2_proxy::params`: Private class for setting default oauth2_proxy parameters.
* `oauth2_proxy::service`: Private class for managing oauth2_proxy service.

## Classes

### oauth2_proxy

Installs and configures oauth2_proxy.

#### Examples

##### Install oauth2_proxy.

```puppet
class { 'oauth2_proxy':
  config  => {
    http_address            => ':80',
  }
}
```

#### Parameters

The following parameters are available in the `oauth2_proxy` class.

##### `user`

Data type: `String`

User for oauth2_proxy. Defaults to 'root'.

Default value: $oauth2_proxy::params::user

##### `group`

Data type: `String`

User for oauth2_proxy. Defaults to 'root'.

Default value: $oauth2_proxy::params::group

##### `package_name`

Data type: `String`

Package containing oauth2_proxy. Defaults to 'oauth2_proxy'.

Default value: $oauth2_proxy::params::package_name

##### `version`

Data type: `String`

Version of oauth2_proxy. Defaults to 'latest'.

Default value: $oauth2_proxy::params::version

##### `manage_service`

Data type: `Boolean`

Specifies whether oauth2_proxy service should be managed. Defaults to 'true'.

Default value: $oauth2_proxy::params::manage_service

##### `package_install_options`

Data type: `Array[String]`

Array of install options for managed package resources. Appropriate options are passed to package manager.

Default value: $oauth2_proxy::params::package_install_options

##### `config`

Data type: `Hash`

Hash of configuration options for oauth2_proxy

Default value: {}

