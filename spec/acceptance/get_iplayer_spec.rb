require 'spec_helper_acceptance'

context 'File' do
  describe file('/usr/bin/get_iplayer'), if: os[:family] == 'redhat' do
    it { should be_file }
  end
end
