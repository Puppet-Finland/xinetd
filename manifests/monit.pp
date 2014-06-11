#
# == Class: xinetd::monit
#
# Setups monit rules for xinetd
#
class xinetd::monit
(
    $monitor_email
)
{
    include xinetd::params

    monit::fragment { 'xinetd-xinetd.monit':
        modulename => 'xinetd',
    }
}
