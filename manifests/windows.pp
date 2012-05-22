class sunjdk::windows {
  file { "jdk_${sunjdk::real_jdk_version}.msi":
        path    => "C:/temp/jdk_${sunjdk::real_jdk_version}.msi",
        ensure  => file,
        source => "puppet:///modules/sunjdk/jdk_${sunjdk::real_jdk_version}.msi",
  }
  package { 'jdk':
    ensure          => $ensure,
    provider        => 'msi',
    source          => "C:\\temp\\jdk_${sunjdk::real_jdk_version}.msi",
    install_options => {
      'INSTALLDIR'  => 'C:\Program Files\Java\JDK 1.6'
    },
    require => File["jdk_${sunjdk::real_jdk_version}.msi"],
  }
}
