#
# == Class: xinetd::service
#
# service xinetd
#
class xinetd::service
(
    $ensure
)
{

    include xinetd::params

    $enable_service = $ensure ? {
        'present' => true,
        'absent' => false,
    }

    service { 'xinetd':
        name => "${::xinetd::params::service_name}",
        enable => $enable_service,
        hasstatus => "${::xinetd::params::service_hasstatus}", 
        require => Class['xinetd::install'],
    }
}
