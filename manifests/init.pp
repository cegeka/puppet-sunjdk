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
class sunjdk($jdk_version,$ensure) {
  if ! $jdk_version {
    $jdk_version = 'latest'
  } else {
    $real_jdk_version = $jdk_version
  }

  case $::operatingsystem {
    redhat, centos: { include sunjdk::redhat }
    ubuntu: { include sunjdk::ubuntu }
    windows: { include sunjdk::windows }
    default: {}
  }
}

