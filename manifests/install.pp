#
# == Class: xinetd::install
#
# Install xinetd
#
class xinetd::install {

    include xinetd::params

    package { 'xinetd-xinetd':
        name => "${::xinetd::params::package_name}",
        ensure => installed,
    }
}
