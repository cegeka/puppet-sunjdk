class sunjdk::jdk_releases::jdk_6u32_32b {
  file { 'C:/temp/jdk_6u32_32b':
    ensure => directory,
  }
  file { 'jdk_6u32_32b.msi':
    ensure  => file,
    mode    => '0777',
    path    => 'C:/temp/jdk_6u32_32b/jdk_6u32_32b.msi',
    source  => 'puppet:///modules/sunjdk/jdk_releases/jdk_6u32_32b/jdk_6u32_32b.msi',
  }
  file { 'sb160320.cab':
    ensure  => file,
    mode    => '0777',
    path    => 'C:/temp/jdk_6u32_32b/sb160320.cab',
    source  => 'puppet:///modules/sunjdk/jdk_releases/jdk_6u32_32b/sb160320.cab',
  }
  file { 'sj160320.cab':
    ensure  => file,
    mode    => '0777',
    path    => 'C:/temp/jdk_6u32_32b/sj160320.cab',
    source  => 'puppet:///modules/sunjdk/jdk_releases/jdk_6u32_32b/sj160320.cab',
  }
  file { 'sp160320.cab':
    ensure  => file,
    mode    => '0777',
    path    => 'C:/temp/jdk_6u32_32b/sp160320.cab',
    source  => 'puppet:///modules/sunjdk/jdk_releases/jdk_6u32_32b/sp160320.cab',
  }
  file { 'sr160320.cab':
    ensure  => file,
    mode    => '0777',
    path    => 'C:/temp/jdk_6u32_32b/sr160320.cab',
    source  => 'puppet:///modules/sunjdk/jdk_releases/jdk_6u32_32b/sr160320.cab',
  }
  file { 'ss160320.cab':
    ensure  => file,
    mode    => '0777',
    path    => 'C:/temp/jdk_6u32_32b/ss160320.cab',
    source  => 'puppet:///modules/sunjdk/jdk_releases/jdk_6u32_32b/ss160320.cab',
  }
  file { 'st160320.cab':
    ensure  => file,
    mode    => '0777',
    path    => 'C:/temp/jdk_6u32_32b/st160320.cab',
    source  => 'puppet:///modules/sunjdk/jdk_releases/jdk_6u32_32b/st160320.cab',
  }
  file { 'sz160320.cab':
    ensure  => file,
    mode    => '0777',
    path    => 'C:/temp/jdk_6u32_32b/sz160320.cab',
    source  => 'puppet:///modules/sunjdk/jdk_releases/jdk_6u32_32b/sz160320.cab',
  }
}
