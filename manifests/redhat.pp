class sunjdk::redhat {
  package { 'glibc.i686':
    ensure => present,
  }

  package { "jdk-${sunjdk::jdk_version}":
    ensure   => $subjdk::ensure,
    require  => Package['glibc.i686'],
  }

  file { 'keytool':
    ensure => link,
    target => '/usr/java/default/bin/keytool',
    path   => '/usr/bin/keytool',
    require => Package["jdk-${sunjdk::jdk_version}"],
  }
}
