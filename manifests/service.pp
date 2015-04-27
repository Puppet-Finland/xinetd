#
# == Class: xinetd::service
#
# service xinetd
#
class xinetd::service
(
    $ensure

) inherits xinetd::params
{

    if $ensure == 'present' {
        service { 'xinetd':
            name      => $::xinetd::params::service_name,
            enable    => true,
            hasstatus => $::xinetd::params::service_hasstatus,
            require   => Class['xinetd::install'],
        }
    } elsif $ensure == 'absent' {
        # Do nothing
    } else {
        fail("Invalid value ${ensure} for parameter ensure")
    }

}
