# get_iplayer

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with get_iplayer](#setup)
    * [What get_iplayer affects](#what-get_iplayer-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with get_iplayer](#beginning-with-get_iplayer)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
6. [Limitations - OS compatibility, etc.](#limitations)
7. [Development - Guide for contributing to the module](#development)

## Overview

The get_iplayer module lets you access content from the BBC iPlayer service.

## Module Description

This module installs get_iplayer from its source location on the web. This
provides a command line client and a web-based PVR service. The module also
installs a service for PVR functionality. The software can only access video
content from a UK-based IP address.

## Setup

### What get_iplayer affects

* Creates /etc/get_iplayer directory
* Installs software into /usr/local
* Creates get_iplayer service in native service provider
* Runs service on port 1935

### Beginning with get_iplayer

```puppet
 include 'get_iplayer'
```

The above gets the client software installed. The command line client can
be accessed by running:

 /usr/bin/get_iplayer

The PVR service can be accessed from:

 http://localhost:1935

## Usage
### Change the PVR service listen address

The PVR service runs on localhost (127.0.0.1) by default so to access it
remotely, set the listen_address parameter:

```puppet
 class { 'get_iplayer':
   listen_address => '0.0.0.0'
 }
```

### Change the PVR service listen port

```puppet
 class { 'get_iplayer':
   listen_port => '1935'
 }
```

### Change the PVR service download directory location

```puppet
 class { 'get_iplayer':
   output_dir => '/home/joebloggs/Downloads'
 }
```

### Set software version
By default, the latest version of the software is installed from the ftp site.
See http://www.infradead.org/get_iplayer/CHANGELOG-get_iplayer for available
versions and set the version manually:

```puppet
 class { 'get_iplayer':
   version => '2.94'
 }
```

### Dealing with software prerequisites

This software has the following prerequisites:

 perl
 perl::CGI
 perl::Env
 perl::HTML::Parser
 perl::HTTP::Cookies
 perl::libwww::perl
 perl::XML::Simple
 rtmpdump or flvstreamer
 ffmpeg or libav-tools

The module attempts to install these using the ensure_package function. On
RHEL-based systems, the last two packages require installing a third-part
YUM repository. If this causes a problem, prerequisite installation can be
skipped:

```puppet
 class { 'get_iplayer':
   manage_prereqs => false
 }
```

### Additional get_iplayer options for PVR service

To set additional options the options_extra takes a hash:

```puppet
 class { 'get_iplayer':
   options_extra => { 'subdir' => true, subdirformat => '<nameshort>' }
 }
```

The above option causes the PVR service to create a subdirectory for the
download. For a complete list of options, run:

 get_iplayer --dump-options

## Reference

### Classes

#### Public Classes

* get_iplayer: Main class, includes all other classes

#### Private Classes


* get_iplayer::install: Handles the software source.
* get_iplayer::config: Handles the PVR service configuration.
* get_iplayer::service: Handles the PVR service.

### Parameters

The below parameters are available in the get_iplayer class:

####`base_dir`

Target directory for tarball. Defaults to '/usr/local'.

####`conf_dir`

PVR service config directory. The options file and the generated cache are
stored here. Defaults to '/etc/get_iplayer'.

####`listen_address`

PVR service listen address. Defaults to '127.0.0.1'.

####`listen_port`

PVR service listen address. Defaults to '1935'.

####`manage_prereqs`

Installs perl dependencies and external commands (see full description in
Setup section). Defaults to true.

####`options_extra`

Extra options for PVR service (see full description in Setup section). Defaults
to an empty hash: {}

####`output_dir`

Download directory for PVR service. Defaults to '/var/get_iplayer'.

####`prereqs`

Prerequisite packages. Defaults to a hash in get_iplayer::params.

####`service_env_path`

Path to service environment file.

####`service_env_template`

Template for service environment file.

####`service_path`

Path to service file.

####`service_template`

Templace for service file.

####`source_location`

FTP location of software source file. __VERSION__ is replaced by the version
parameter. Defaults to:

 ftp://ftp.infradead.org/pub/get_iplayer/get_iplayer-__VERSION__.tar.gz

####`version`

Set version.

## Limitations

This module has been tested with Puppet 4.

The module has been tested on:

* CentOS 6/7
* Ubuntu 12.04/14.04/14.10/15.04

## Development

Please send pull requests.
