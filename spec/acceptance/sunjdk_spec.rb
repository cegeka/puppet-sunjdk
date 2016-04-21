require 'spec_helper_acceptance'

describe 'sunjdk::init' do

  describe 'running puppet code' do
    it 'should work with no errors' do
      pp = <<-EOS
        include 'yum'
        include 'cegekarepos'
        include 'profile::package_management'

        Yum::Repo <| title == 'cegeka-unsigned' |>

        sunjdk::instance { 'jdk-1.7.0_06-fcs':
          ensure      => 'present',
          jdk_version => '1.7.0_06-fcs'
        }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      apply_manifest(pp, :catch_changes => true)
    end

    describe package('jdk-1.7.0_06-fcs') do
      it { should be_installed }
    end
  end
end
