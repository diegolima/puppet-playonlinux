# == Class: playonlinux
#
# This class installs playonlinux
#
# === Parameters
#
# Document parameters here.
# [*ensure*]
#   Value to be passed to ensure in the package resource. Defaults to present.
#
# [*package_name*]
#   Name of the playonlinux package to be installed. Defaults to playonlinux
#   on specific distributions or null as a fallback.
#
# [*needs_repository*]
#   Whether or not an additional repository is needed to install the latest
#   packages.
#
#   Defaults to true on specific distributions (see params.pp) or false as
#   a fallback.
#
# [*repository_uri*]
#   URI of the custom repository that contains the latest packages.
#   Default to null.
#
# [*repository_key*]
#   URI of the custom repository's GPG key used to sign its packages.
#   Default to null.
#
# [*repository_key_id*]
#   Fingerprint of the custom repository's GPG key. Defaults to null.
#
# === Examples
#
#  class { 'playonlinux': }
#
# === Authors
#
# Diego Lima <diegolima.br@gmail.com>
#
# === Copyright
#
# Copyright 2016 Diego Lima, unless otherwise noted.
#
class playonlinux(
  $ensure           = 'present',
  $package_name     = $playonlinux::params::package_name,
  $needs_repository = $playonlinux::params::needs_repository,
  $repository_uri   = $playonlinux::params::repository_uri,
  $repository_key   = $playonlinux::params::repository_key,
  $repository_key_id= $playonlinux::params::repository_key_id,
) inherits playonlinux::params {
  include apt

  if $needs_repository {
    apt::source { 'playonlinux':
      location => $repository_uri,
      release  => $::lsbdistcodename,
      repos    => 'main',
      key      => {
        id     => $repository_key_id,
        source => $repository_key,
      },
    }
  }

  package { $package_name:
    ensure => $ensure,
  }
}
