
# Elevation Jsonnet Utility Library

A collection of useful utilities written in jsonnet.

> WARNING
> - Currently, this library has no clear organization to it. However, as
>   it grows it will likely evolve into having some order.

## Installation

### Install [jsonnet-bundler](https://github.com/jsonnet-bundler/jsonnet-bundler)

Setup jsonnet bundler in your project.  Perhaps something like this...
```shell
$ mkdir jsonnet_packages
$ cd jsonnet_packages
$ jsonnet-bundler init
$ echo 'export JSONNET_PATH="$PWD/vendor:$JSONNET_PATH"' >> project_activation_script
```

### Install the elevation jsonnet utils library.
```shell
$ jsonnet-bundler install https://github.com/elevationtools/jsonnet_utils/elevation@v0.0.1
```

## Usage

```
local cidrSubnet = import 'elevation/cidrSubnet.libsonnet'

cidrSubnet(...)
```

