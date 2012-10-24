define sunjdk::redhat($jdk_version, $ensure='present') {

  if ! defined(Package['glibc.i686']) {
    package { 'glibc.i686':
      ensure => present,
    }
  }

  package { "jdk-${jdk_version}":
    ensure   => $ensure,
    require  => Package['glibc.i686'],
  }

  if ! defined(File['keytool']) {
    file { 'keytool':
      ensure  => link,
      target  => '/usr/java/default/bin/keytool',
      path    => '/usr/bin/keytool',
      require => Package["jdk-${jdk_version}"],
    }
  }

}
