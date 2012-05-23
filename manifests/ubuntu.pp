class sunjdk::ubuntu {
    file { '/var/cache/debconf/java6.seeds' :
        ensure  => present,
        source  => 'puppet:///modules/sunjdk/java6.seeds',
    }
    package { 'sun-java6-jdk' :
        ensure        => $sunjdk::jdk_version,
        require       => File['/var/cache/debconf/java6.seeds'],
        responsefile  => '/var/cache/debconf/java6.seeds',
    }
}
