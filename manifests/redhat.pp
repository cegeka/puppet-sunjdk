class sunjdk::redhat {
  package { 'glibc.i686':
    ensure => present,
  }

  package { 'jdk':
    ensure   => $sunjdk::jdk_version,
    require  => Package['glibc.i686'],
  }
}
