#
# == Class: xinetd::install
#
# Install xinetd
#
class xinetd::install
(
    $ensure

) inherits xinetd::params
{

    package { 'xinetd-xinetd':
        ensure => $ensure,
        name   => $::xinetd::params::package_name,
    }
}
