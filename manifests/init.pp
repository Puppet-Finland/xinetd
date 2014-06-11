#
# == Class: xinetd
#
# A class for managing xinetd
#
class xinetd
(
    $monitor_email = $::servermonitor
)
{
    include xinetd::install
    include xinetd::service

    if tagged('monit') {
        class { 'xinetd::monit':
            monitor_email => $monitor_email,
        }
    }
}
