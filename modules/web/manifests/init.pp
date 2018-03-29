# Class: web
# ===========================
#
# Full description of class web here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'web':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class web (
  $index_content = "DEFAULT_VALUE",

) {
    package { 'apache2':
      ensure => installed,
    }
    service { 'apache2':
      ensure => running,
      enable => true,
    }
    file { '/var/www/html':
      ensure => directory,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }
    file { '/var/www/html/index.html':
      ensure    => file,
      content   => template('web/index.html.erb'),
      require   => Package['apache2'],
      subscribe => Service['apache2'],
  }
  file_line { 'index.html':
    path  => '/var/www/html/index.html',
    line  => $index_content,
    match => 'WEBSITE',
  }
}  
