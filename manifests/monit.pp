#
# == Class: xinetd::monit
#
# Setups monit rules for xinetd
#
class xinetd::monit
(
    $ensure,
    $monitor_email
)
{
    include xinetd::params

    monit::fragment { 'xinetd-xinetd.monit':
        status => $ensure,
        modulename => 'xinetd',
    }
}
