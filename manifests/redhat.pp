class sunjdk::redhat {
  package { 'glibc.i686' :
    ensure => $ensure,
  }

  package { 'jdk' :
    ensure   => $sunjdk::jdk_version, 
    require  => Package["glibc.i686"],
  }
}
