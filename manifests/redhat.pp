class sunjdk::redhat {
  package { 'glibc.i686' :
    ensure => installed,
  }

  package { 'jdk' :
    ensure   => $sunjdk::jdk_version, 
    require  => Package["glibc.i686"],
  }
}
