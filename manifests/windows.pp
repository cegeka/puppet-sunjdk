class sunjdk::windows {
  include "sunjdk::jdk_releases::jdk_${sunjdk::real_jdk_version}"

  package { 'jdk':
    ensure          => $sunjdk::ensure,
    provider        => 'msi',
    source          => "C:\\temp\\jdk_${sunjdk::real_jdk_version}\\jdk_${sunjdk::real_jdk_version}.msi",
    install_options => {
      'INSTALLDIR'  => 'C:\Program Files\Java\JDK 1.6'
    },
    require         => File["jdk_${sunjdk::real_jdk_version}.msi"],
  }
}
