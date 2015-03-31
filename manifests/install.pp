#
# == Class: xinetd::install
#
# Install xinetd
#
class xinetd::install
(
    $ensure
)
{

    include xinetd::params

    package { 'xinetd-xinetd':
        name => "${::xinetd::params::package_name}",
        ensure => $ensure,
    }
}
