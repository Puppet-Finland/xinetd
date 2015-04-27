#
# == Class: xinetd::params
#
# Defines some variables based on the operating system
#
class xinetd::params {

    include ::os::params

    case $::osfamily {
        'RedHat': {
            $package_name = 'xinetd'
            $service_dir = '/etc/xinetd.d'
            $service_name = 'xinetd'
            $service_hasstatus = true
            $pidfile = '/var/run/xinetd.pid'
        }
        'Debian': {
            $package_name = 'xinetd'
            $service_dir = '/etc/xinetd.d'
            $service_name = 'xinetd'

            # These have been verified on Debian 7 and Ubuntu 12.04
            case $::operatingsystem {
                'Debian':   { $service_hasstatus = false }
                'Ubuntu':   { $service_hasstatus = true  }
                default:    { $service_hasstatus = true  }
            }

            $pidfile = '/var/run/xinetd.pid'
        }
        'FreeBSD': {
            $package_name = 'xinetd'
            $service_name = 'xinetd'
            $service_hasstatus = true
            $pidfile = '/var/run/xinetd.pid'
        }
        default: {
            fail("Unsupported operatingsystem: ${::osfamily}")
        }
    }

    $service_start = "${::os::params::service_cmd} ${service_name} start"
    $service_stop = "${::os::params::service_cmd} ${service_name} stop"


}
