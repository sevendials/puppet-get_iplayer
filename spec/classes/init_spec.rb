require 'spec_helper'
describe 'get_iplayer' do

  context 'with defaults for all parameters' do
    let(:facts) { {
      :operatingsystem        => 'Ubuntu',
      :ipaddress              => '192.168.0.1',
      :osfamily               => 'Debian',
      :operatingsystemrelease => '14.04',
      :os                     => {'release' => { 'major' => '14.04'}},
      :staging_http_get       => 'curl',
      :path                   => '/opt',
    } }
    it { should contain_class('get_iplayer') }
  end
end
