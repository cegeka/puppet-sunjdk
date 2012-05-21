#
# Class: sunjdk::absent
#
# Removes Sun JDK Installation
#
# Usage:
# include sunjdk::absent
#
class sunjdk::absent {

    include sunjdk::params

    case $operatingsystem {
        redhat, centos: {
            package { "sun-java6-jdk" :
                name   => $sunjdk::params::version ? {
                            "1.6.0_25" => "jdk-1.6.0_25-fcs.i586"
                          },
                ensure => absent,
            }
        }
        ubuntu: {
            package { "sun-java6-jdk" :
                ensure  => absent,
            }

            file { "/var/cache/debconf/java6.seeds" :
                ensure  => absent,
            }
        }
        default: {}
    }

}