class sunjdk::params {

    $version = $operatingsystem ? {
        redhat => "1.6.0_25",
        centos => "1.6.0_25",
        default => "",
    }
}