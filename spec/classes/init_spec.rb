require 'spec_helper'
describe 's3sync' do

  context 'with defaults for all parameters' do
    it { should contain_class('s3sync') }
  end
end
