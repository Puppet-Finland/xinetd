#
# == Class: xinetd::monit
#
# Setups monit rules for xinetd
#
class xinetd::monit
(
    $ensure,
    $monitor_email

) inherits xinetd::params
{
    monit::fragment { 'xinetd-xinetd.monit':
        ensure     => $ensure,
        modulename => 'xinetd',
    }
}
