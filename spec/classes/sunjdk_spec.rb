#!/usr/bin/env rspec

require 'spec_helper'

describe 'sunjdk' do
  let (:params) { { :ensure => 'present' , :jdk_version => '6u32_32b' }}
  it { should contain_class('sunjdk') }
end
