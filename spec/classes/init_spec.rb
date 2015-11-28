require 'spec_helper'
describe 'get_iplayer' do

  context 'with defaults for all parameters' do
    it { should contain_class('get_iplayer') }
  end
end
