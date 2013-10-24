define sunjdk::redhat(
  $jdk_version,
  $version_lock=false,
  $ensure='present',
) {

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

  if ! defined(File['jps']) {
    file { 'jps':
      ensure  => link,
      target  => '/usr/java/default/bin/jps',
      path    => '/usr/bin/jps',
      require => Package["jdk-${jdk_version}"],
    }
  }

  if ! defined(File['/etc/ld.so.conf.d/jdk.conf']) {
    file { '/etc/ld.so.conf.d/jdk.conf':
      ensure  => file,
      content => '/usr/java/default/jre/lib/amd64/server'
    }

    exec { 'ldconfig -f /etc/ld.so.conf':
      path        => ['/usr/bin', '/usr/sbin', '/sbin'],
      refreshonly => true,
      subscribe   => File['/etc/ld.so.conf.d/jdk.conf']
    }
  }

  case $version_lock {
    true: {
      packagelock { "jdk-${jdk_version}": }
    }
    false: {
      packagelock { "jdk-${jdk_version}": ensure => absent }
    }
    default: { fail('Class[Sunjdk::Redhat]: parameter version_lock must be true or false')}
  }

}
