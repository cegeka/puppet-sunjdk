class sunjdk::jdk_releases::jdk_6u32_64b {

  file { 'C:/temp/jdk_6u32_64b':
    ensure => directory,
  }

  file { 'jdk_6u32_64b.msi':
    ensure  => file,
    mode    => '0777',
    path    => 'C:/temp/jdk_6u32_64b/jdk_6u32_64b.msi',
    source  => 'puppet:///modules/sunjdk/jdk_releases/jdk_6u32_64b/jdk_6u32_64b.msi',
  }

  file { 'sb160320.cab_64b':
    ensure  => file,
    mode    => '0777',
    path    => 'C:/temp/jdk_6u32_64b/sb160320.cab',
    source  => 'puppet:///modules/sunjdk/jdk_releases/jdk_6u32_64b/sb160320.cab',
  }

  file { 'sj160320.cab_64b':
    ensure  => file,
    mode    => '0777',
    path    => 'C:/temp/jdk_6u32_64b/sj160320.cab',
    source  => 'puppet:///modules/sunjdk/jdk_releases/jdk_6u32_64b/sj160320.cab',
  }

  file { 'sp160320.cab_64b':
    ensure  => file,
    mode    => '0777',
    path    => 'C:/temp/jdk_6u32_64b/sp160320.cab',
    source  => 'puppet:///modules/sunjdk/jdk_releases/jdk_6u32_64b/sp160320.cab',
  }

  file { 'sr160320.cab_64b':
    ensure  => file,
    mode    => '0777',
    path    => 'C:/temp/jdk_6u32_64b/sr160320.cab',
    source  => 'puppet:///modules/sunjdk/jdk_releases/jdk_6u32_64b/sr160320.cab',
  }

  file { 'ss160320.cab_64b':
    ensure  => file,
    mode    => '0777',
    path    => 'C:/temp/jdk_6u32_64b/ss160320.cab',
    source  => 'puppet:///modules/sunjdk/jdk_releases/jdk_6u32_64b/ss160320.cab',
  }

  file { 'st160320.cab_64b':
    ensure  => file,
    mode    => '0777',
    path    => 'C:/temp/jdk_6u32_64b/st160320.cab',
    source  => 'puppet:///modules/sunjdk/jdk_releases/jdk_6u32_64b/st160320.cab',
  }

  file { 'sz160320.cab_64b':
    ensure  => file,
    mode    => '0777',
    path    => 'C:/temp/jdk_6u32_64b/sz160320.cab',
    source  => 'puppet:///modules/sunjdk/jdk_releases/jdk_6u32_64b/sz160320.cab',
  }

}
