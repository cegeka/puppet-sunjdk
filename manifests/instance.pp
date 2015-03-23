define sunjdk::instance(
  $jdk_version=undef,
  $pkg_name=undef,
  $versionlock=false,
  $package_code='',
  $ensure='present',
  $install_options=undef
) {

  if ! $jdk_version {
    $real_jdk_version = 'latest'
  } else {
    $real_jdk_version = $jdk_version
  }

  if ! $pkg_name {
    $real_pkg_name = 'jdk'
  } else {
    $real_pkg_name = $pkg_name
  }

  case $::operatingsystem {
    redhat, centos: {
      sunjdk::redhat { $name:
        ensure      => $ensure,
        jdk_version => $real_jdk_version,
        pkg_name    => $real_pkg_name,
        versionlock => $versionlock
      }
    }
    ubuntu: {
      sunjdk::ubuntu { $name:
        pkg_name    => $real_pkg_name,
        jdk_version => $real_jdk_version
      }
    }
    windows: {
      sunjdk::windows { $name:
        ensure          => $ensure,
        pkg_name        => $real_pkg_name,
        jdk_version     => $real_jdk_version,
        package_code    => $package_code,
        install_options => $install_options
      }
    }
    default: {}
  }

}
