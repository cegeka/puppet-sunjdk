require 'spec_helper'

describe 'sunjdk::instance' do

  context 'installing sunjdk instance' do
    let (:title) { 'installing sunjdk' }

    context 'on RedHat' do
      let (:facts) { { :operatingsystem => 'redhat' } }
      let(:params) { { :ensure => 'present', :jdk_version => '1.6.0_32-fcs.i586' } }

      it { should contain_package("glibc.i686").with(
        :ensure => 'present'
        )
      }

      it { should contain_package("jdk").with(
          :ensure => '1.6.0_32-fcs.i586',
          :require => 'Package[glibc.i686]'
        )
      }

      it { should contain_file('keytool').with(
          :ensure => 'link',
          :target => '/usr/java/default/bin/keytool',
          :path => '/usr/bin/keytool',
          :require => 'Package[jdk]'
        )
      }

      it { should contain_file('jps').with(
          :ensure => 'link',
          :target => '/usr/java/default/bin/jps',
          :path => '/usr/bin/jps',
          :require => 'Package[jdk]'
        )
      }

      it { should contain_file('/etc/ld.so.conf.d/jdk.conf').with(
          :ensure => 'file',
          :content => '/usr/java/default/jre/lib/amd64/server'
        )
      }

      it { should contain_exec('ldconfig -f /etc/ld.so.conf').with(
          :refreshonly => true,
          :subscribe => 'File[/etc/ld.so.conf.d/jdk.conf]'
        )
      }

      context 'with pkg_name => jdk1.8.0_31' do
        let(:params) { { :ensure => 'present', :pkg_name => 'jdk1.8.0_31', :jdk_version => '1.8.0_31-fcs' } }

        it { should contain_package("jdk1.8.0_31").with(
            :ensure => '1.8.0_31-fcs'
          )
        }

        context 'with versionlock => true' do
          let(:params) { { :ensure => 'present', :pkg_name => 'jdk1.8.0_31', :jdk_version => '1.8.0_31-fcs', :versionlock => true } }
          it { should contain_package("jdk1.8.0_31").with(
              :ensure => '1.8.0_31-fcs'
            )
          }

          it { should contain_yum__versionlock("0:jdk1.8.0_31-1.8.0_31-fcs.*") }
        end
      end
    end
  end
end
