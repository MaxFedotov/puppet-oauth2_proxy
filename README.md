# oauth2_proxy

#### Table of Contents

- [oauth2_proxy](#oauth2proxy)
      - [Table of Contents](#Table-of-Contents)
  - [Overview](#Overview)
  - [Description](#Description)
  - [Usage](#Usage)
  - [Reference](#Reference)
  - [Classes](#Classes)
    - [oauth2_proxy](#oauth2proxy-1)
      - [Examples](#Examples)
        - [Install oauth2_proxy.](#Install-oauth2proxy)
      - [Parameters](#Parameters)
        - [`user`](#user)
        - [`group`](#group)
        - [`package_name`](#packagename)
        - [`version`](#version)
        - [`manage_service`](#manageservice)
        - [`package_install_options`](#packageinstalloptions)
        - [`config`](#config)
  - [Limitations](#Limitations)
  - [Development](#Development)
  - [See Also](#See-Also)


## Overview

manages the oauth2_proxy reverse proxy with oauth authentication


## Description

This module installs and configures the
[oauth2_proxy](https://github.com/pusher/oauth2_proxy) package and provides a minimal systemd service unit.

## Usage

```puppet
class { 'oauth2_proxy':
    config => {
    http_address      => '127.0.0.1:4180',
    client_id         => '1234',
    client_secret     => 'abcd',
    github_org        => 'foo',
    upstreams         => [ 'http://127.0.0.1:3000' ],
    cookie_secret     => '1234',
    pass_access_token => false,
    pass_host_header  => true,
    provider          => 'github',
    redirect_url      => 'https://foo.example.org/oauth2/callback',
    email_domains     => [ '*' ],
  }
}
```

## Reference

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


## Limitations

For a list of supported operating systems, see [metadata.json](https://github.com/MaxFedotov/oauth2_proxy/blob/master/metadata.json)

## Development

Please feel free to fork, modify, create issues, bug reports and pull requests.



See Also
--------

* [oauth2_proxy](https://github.com/pusher/oauth2_proxy)
