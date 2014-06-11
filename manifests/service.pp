#
# == Class: xinetd::service
#
# service xinetd
#
class xinetd::service {

    include xinetd::params

    service { 'xinetd':
        name => "${::xinetd::params::service_name}",
        enable => true,
        hasstatus => "${::xinetd::params::service_hasstatus}", 
        require => Class['xinetd::install'],
    }
}
