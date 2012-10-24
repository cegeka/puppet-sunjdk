sunjdk::instance { 'removing jdk':
  ensure      => 'absent',
  jdk_version => '1.6.0_32-fcs.i586',
}
