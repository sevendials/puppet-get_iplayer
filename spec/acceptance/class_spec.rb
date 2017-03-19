require 'spec_helper_acceptance'

describe 'get_iplayer class:', :unless => UNSUPPORTED_PLATFORMS.include?(fact('osfamily')) do
  it 'should run successfully' do
    pp = "package{['curl','unzip']: ensure => present} -> class { 'get_iplayer': }"

    # Apply twice to ensure no errors the second time.
    apply_manifest(pp, :catch_failures => true) do |r|
      expect(r.stderr).not_to match(/error/i)
    end
    apply_manifest(pp, :catch_failures => true) do |r|
      expect(r.stderr).not_to eq(/error/i)

      expect(r.exit_code).to be_zero
    end
  end

  context 'service_ensure => stopped:' do
    it 'runs successfully' do
      pp = "package{['curl','unzip']: ensure => present} -> class { 'get_iplayer': service_ensure => stopped }"

      apply_manifest(pp, :catch_failures => true) do |r|
        expect(r.stderr).not_to match(/error/i)
      end
    end
  end

  context 'service_ensure => running:' do
    it 'runs successfully' do
      pp = "package{['curl','unzip']: ensure => present} -> class { 'get_iplayer': service_ensure => running }"

      apply_manifest(pp, :catch_failures => true) do |r|
        expect(r.stderr).not_to match(/error/i)
      end
    end
  end
end
