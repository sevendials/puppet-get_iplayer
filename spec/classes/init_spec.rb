require 'spec_helper'
describe 'get_iplayer' do
  context 'with defaults for all parameters' do
    let(:facts) do
      {
        operatingsystem: 'Ubuntu',
        ipaddress: '192.168.0.1',
        osfamily: 'Debian',
        operatingsystemrelease: '14.04',
        os: { 'family' => 'Debian', 'name' => 'Ubuntu', 'release' => { 'major' => '14.04' } },
        staging_http_get: 'curl',
        path: '/opt',
        service_provider: 'upstart'
      }
    end
    let(:params) do
      {
        version: '2.94'
      }
    end
    it { should contain_class('get_iplayer') }
    it { should contain_class('get_iplayer::install') }
    it { should contain_class('get_iplayer::config') }
    it { should contain_class('get_iplayer::service') }
    it { should contain_file('get_iplayer.bin') }
    it { should contain_file('get_iplayer.conf_dir') }
    it { should contain_file('get_iplayer.options') }
    it { should contain_file('get_iplayer.output_dir') }
    it { should contain_file('get_iplayer.service') }
    it { should contain_file('get_iplayer.service_env') }
    it { should contain_service('get_iplayer') }
    it { should contain_staging__deploy('v2.94.zip') }
    it { should contain_package('libav-tools') }
    it { should contain_package('libhtml-parser-perl') }
    it { should contain_package('libcgi-pm-perl') }
    it { should contain_package('libwww-perl') }
    it { should contain_package('libxml-simple-perl') }
    it { should contain_package('rtmpdump') }
  end

  at_exit { RSpec::Puppet::Coverage.report! }
end
