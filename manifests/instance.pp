define sunjdk::instance(
  $jdk_version,
  $version_lock=false,
  $package_code='',
  $ensure='present',
  $install_options=undef
) {

  if ! $jdk_version {
    $jdk_version = 'latest'
  } else {
    $real_jdk_version = $jdk_version
  }

  case $::operatingsystem {
    redhat, centos: {
      sunjdk::redhat { $name:
        ensure       => $ensure,
        jdk_version  => $jdk_version,
        version_lock => $version_lock
      }
    }
    ubuntu: {
      sunjdk::ubuntu { $name:
        jdk_version => $jdk_version
      }
    }
    windows: {
      sunjdk::windows { $name:
        ensure          => $ensure,
        jdk_version     => $jdk_version,
        package_code    => $package_code,
        install_options => $install_options
      }
    }
    default: {}
  }

}
