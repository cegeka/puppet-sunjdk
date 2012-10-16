class { 'sunjdk':
  ensure          => 'present',
  jdk_version     => '6u32_64b',
  install_options => {
    'INSTALLDIR'  => 'C:\Program Files (x86)\Java\JDK 1.6'
  },
}
