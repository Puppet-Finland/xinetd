#
# == Class: xinetd
#
# A class for managing xinetd
#
# == Parameters
#
# [*ensure*]
#   The status of xinetd configurations. Valid values are 'present' (default) 
#   and 'absent'.
# [*monitor_email*]
#   The email address where monitoring notifications (e.g. from Monit) are sent. 
#   Defaults to a top-scope variable $::servermonitor.
#
# == Authors
#
# Samuli Seppänen <samuli@openvpn.net>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
class xinetd
(
    $ensure = 'present',
    $monitor_email = $::servermonitor
)
{
    class { 'xinetd::install':
        ensure => $ensure,
    }

    class { 'xinetd::service':
        ensure => $ensure,
    }

    if tagged('monit') {
        class { 'xinetd::monit':
            ensure => $ensure,
            monitor_email => $monitor_email,
        }
    }
}
