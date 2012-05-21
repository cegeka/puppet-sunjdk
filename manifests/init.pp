#
# Class: sunjdk
#
# Manages sunjdk.
# Include it to install the Sun Java6 JDK package.
#
# Usage:
# include sunjdk
#
class sunjdk {

    include params

    case $operatingsystem {
        redhat, centos: { include sunjdk::redhat }
        ubuntu: { include sunjdk::ubuntu }
        default: {}
    }
    
}