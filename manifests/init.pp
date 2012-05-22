#
# Class: sunjdk
#
# Manages sunjdk.
# Include it to install the Sun Java6 JDK package.
#
# Usage:
# include sunjdk
#
class sunjdk($jdk_version) {
  if ! $jdk_version {
    $jdk_version = 'latest'
  }

  case $::operatingsystem {
    redhat, centos: { include sunjdk::redhat }
    ubuntu: { include sunjdk::ubuntu }
    default: {}
  }
}
