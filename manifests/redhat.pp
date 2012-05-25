class sunjdk::redhat {
  package { 'glibc.i686':
    ensure => present,
  }

  package { "jdk-${sunjdk::jdk_version}":
    ensure   => present,
    require  => Package['glibc.i686'],
  }
}
