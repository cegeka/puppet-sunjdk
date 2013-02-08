define sunjdk::windows($jdk_version, $package_code='', $ensure='present', $install_options=undef) {

  include "sunjdk::jdk_releases::jdk_${jdk_version}"

  case $ensure {

    'present': {
      package { "jdk_${jdk_version}":
        ensure          => $ensure,
        name            => $packagecode,
        provider        => 'windows',
        source          => "C:\\temp\\jdk_${jdk_version}\\jdk_${jdk_version}.msi",
        install_options => $install_options,
        require         => File["jdk_${jdk_version}.msi"],
      }
    }

    'absent': {
      exec { "remove jdk_${jdk_version}.msi":
        command => "C:\\Windows\\system32\\msiexec.exe /qn /norestart /x C:\\temp\\jdk_${jdk_version}\\jdk_${jdk_version}.msi",
      }
    }

    default: { notice("ensure parameter ${ensure} is not supported") }
  }

}
