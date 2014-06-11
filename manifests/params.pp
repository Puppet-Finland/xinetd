#
# == Class: xinetd::params
#
# Defines some variables based on the operating system
#
class xinetd::params {

    case $::osfamily {
        'RedHat': {
            $package_name = 'xinetd'
            $service_dir = '/etc/xinetd.d'
            $service_name = 'xinetd'
            $service_hasstatus = true
            $pidfile = '/var/run/xinetd.pid'
 
            if $::operatingsystem == 'Fedora' {
                $service_start = "/usr/bin/systemctl start ${service_name}.service"
                $service_stop = "/usr/bin/systemctl stop ${service_name}.service"
            } else {
                $service_start = "/sbin/service $service_name start"
                $service_stop = "/sbin/service $service_name stop"
            }
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
            $service_start = "/usr/sbin/service $service_name start"
            $service_stop = "/usr/sbin/service $service_name stop"
        }
        default: {
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
            $service_start = "/usr/sbin/service $service_name start"
            $service_stop = "/usr/sbin/service $service_name stop"
        }
    }
}
