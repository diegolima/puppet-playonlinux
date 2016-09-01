# == Class: playonlinux
#
# Full description of class playonlinux here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'playonlinux':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2016 Your name here, unless otherwise noted.
#
class playonlinux(
  $ensure           = 'present',
  $needs_repository = $playonlinux::params::needs_repository,
  $repository_uri   = $playonlinux::params::repository_uri,
  $repository_key   = $playonlinux::params::repository_key,
) inherits playonlinux::params {
  include apt

  if $needs_repository {
    apt::source { 'playonlinux':
      location => $repository_uri,
      release  => $::lsbdistcodename,
      repos    => 'main',
      key      => {
        source => $repository_key,
      },
    }
  }

  package { $package:
    ensure => $ensure,
  }
}
