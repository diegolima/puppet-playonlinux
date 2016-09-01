require 'spec_helper'
describe 'playonlinux' do

  context 'with defaults for all parameters' do
    it { should contain_class('playonlinux') }
  end
end
