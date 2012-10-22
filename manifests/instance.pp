#
# Class: sunjdk
#
# Manages sunjdk.
# Include it to install the Sun Java6 JDK package.
#
# Usage:
# class { sunjdk:
#   jdk_version => '',
#   ensure      => 'present',
# }
#
define sunjdk::instance($jdk_version, $ensure='present', $install_options=undef) {
  if ! $jdk_version {
    $jdk_version = 'latest'
  } else {
    $real_jdk_version = $jdk_version
  }

  case $::operatingsystem {
    redhat, centos: { 
      sunjdk::redhat { $name:
        jdk_version      => $jdk_version,
        ensure           => $ensure
      }
    }
    ubuntu: {
      #include sunjdk::ubuntu 
    }
    windows: { 
      sunjdk::windows { $name:
        jdk_version      => $jdk_version,
        ensure           => $ensure,
        install_options => $install_options
      }
    }
    default: {}
  }
}

