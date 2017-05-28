require 'spec_helper'
describe 'get_iplayer' do
  context 'with defaults for all parameters' do
    # Read supported OSes from metadata.json
    metadata_path = File.dirname(__FILE__) + '/../../metadata.json'
    metadata = JSON.parse(File.read(metadata_path))
    supported_os = metadata['operatingsystem_support']

    test_on = {
      hardwaremodels: %w[x86_64],
      supported_os: supported_os
    }

    on_supported_os(test_on).each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end
        let(:params) do
          {
            version: '2.94'
          }
        end
        it { is_expected.to compile.with_all_deps }
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
        # Ubuntu's brief flirt with libav
        if facts[:operatingsystem].eql?('Ubuntu') && ['14.04', '14.10', '15.04', '15.10'].include?(facts[:operatingsystemmajrelease])
          it { should contain_package('libav-tools') }
        else
          it { should contain_package('ffmpeg') }
        end
        case facts[:osfamily]
        when 'RedHat'
          it { should contain_package('perl-CGI') }
          it { should contain_package('perl-HTML-Parser') }
          it { should contain_package('perl-libwww-perl') }
          it { should contain_package('perl-XML-Simple') }
          if facts[:operatingsystemmajrelease].eql? '7'
            it { should contain_package('perl-Env') }
            it { should contain_package('perl-HTTP-Cookies') }
          end
        when 'Debian'
          it { should contain_package('libcgi-pm-perl') }
          it { should contain_package('libhtml-parser-perl') }
          it { should contain_package('libwww-perl') }
          it { should contain_package('libxml-simple-perl') }
        end
      end
    end
  end

  at_exit { RSpec::Puppet::Coverage.report! }
end
