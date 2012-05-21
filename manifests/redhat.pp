class sunjdk::redhat {

    package { "glibc.i686" :
        ensure => installed,
    }

    file { "sun-java6-jdk" :
        ensure => file,
        path   => $sunjdk::params::version ? {
            "1.6.0_25" => "/tmp/jdk-6u25-linux-i586.rpm"
        },
        source => $sunjdk::params::version ? {
            "1.6.0_25" => "puppet:///modules/sunjdk/jdk-6u25-linux-i586.rpm"
        },
    }

    package { "sun-java6-jdk" :
        ensure   => installed,
        provider => "rpm",
        name     => $sunjdk::params::version ? {
            "1.6.0_25" => "jdk-1.6.0_25-fcs.i586"
        },
        source   => $sunjdk::params::version ? {
            "1.6.0_25" => "/tmp/jdk-6u25-linux-i586.rpm",
        },
        require  => [Package["glibc.i686"], File["sun-java6-jdk"]],
    }
}