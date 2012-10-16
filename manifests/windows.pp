class sunjdk::windows {

  include "sunjdk::jdk_releases::jdk_${sunjdk::real_jdk_version}"

  case $sunjdk::ensure {

    'present': {
      package { 'jdk':
        ensure          => $sunjdk::ensure,
        provider        => 'msi',
        source          => "C:\\temp\\jdk_${sunjdk::real_jdk_version}\\jdk_${sunjdk::real_jdk_version}.msi",
        install_options => $sunjdk::install_options,
        require         => File["jdk_${sunjdk::real_jdk_version}.msi"],
      }
    }

    'absent': {
      exec { "remove jdk_${sunjdk::real_jdk_version}.msi":
        command => "C:\\Windows\\system32\\msiexec.exe /qn /norestart /x C:\\temp\\jdk_${sunjdk::real_jdk_version}\\jdk_${sunjdk::real_jdk_version}.msi",
      }
    }

    default: { notice("ensure parameter ${sunjdk::ensure} is not supported") }
  }

}
