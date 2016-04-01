define sunjdk::redhat(
  $jdk_version=undef,
  $pkg_name=undef,
  $versionlock=false,
  $ensure='present',
) {

  case $ensure {
    'present': {
      if ! defined(Package['glibc.i686']) {
        package { 'glibc.i686':
          ensure => present,
        }
      }

      package { $pkg_name :
        ensure   => $jdk_version,
        require  => Package['glibc.i686']
      }
      if ! defined(Package['libaio']) {
        package { 'libaio':
          ensure => present
        }
      }

      if ! defined(File['keytool']) {
        file { 'keytool':
          ensure  => link,
          target  => '/usr/java/default/bin/keytool',
          path    => '/usr/bin/keytool',
          require => Package[$pkg_name]
        }
      }

      if ! defined(File['jps']) {
        file { 'jps':
          ensure  => link,
          target  => '/usr/java/default/bin/jps',
          path    => '/usr/bin/jps',
          require => Package[$pkg_name]
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
          subscribe   => File['/etc/ld.so.conf.d/jdk.conf'],
          require     => Package[$pkg_name]
        }
      }

      case $versionlock {
        true: {
          packagelock { $pkg_name : }
        }
        false: {
          packagelock { $pkg_name : ensure => absent }
        }
        default: { fail('Class[Sunjdk::Redhat]: parameter versionlock must be true or false')}
      }
    }
    'absent': {
      packagelock { $pkg_name : ensure => absent }
      ->
      package { $pkg_name :
        ensure => absent
      }

      file { [ '/usr/bin/keytool', '/usr/bin/jps', '/etc/ld.so.conf.d/jdk.conf' ]:
        ensure  => absent
      }

      exec { 'ldconfig -f /etc/ld.so.conf':
        path        => ['/usr/bin', '/usr/sbin', '/sbin'],
        refreshonly => true,
        subscribe   => File['/etc/ld.so.conf.d/jdk.conf']
      }
    }
    default: { fail('Class[Sunjdk::Redhat]: parameter ensure must be present or absent') }
  }

}
