
sunjdk::instance { 'installing jdk 32bit':
  ensure          => 'present',
  jdk_version     => '6u32_32b',
  install_options => {
    'INSTALLDIR'  => 'C:\Program Files (x86)\Java\JDK 1.6'
  },
}

sunjdk::instance { 'installing jdk 64bit':
  ensure          => 'present',
  jdk_version     => '6u32_64b',
  install_options => {
    'INSTALLDIR'  => 'C:\Program Files\Java\JDK 1.6'
  },
}

