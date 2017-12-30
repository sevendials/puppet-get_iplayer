require 'rubygems'
require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'
require 'puppet_blacksmith/rake_tasks'
PuppetLint.configuration.send('disable_80chars')
PuppetLint.configuration.ignore_paths = ['spec/**/*.pp', 'pkg/**/*.pp']

desc 'Validate manifests, templates, and ruby files'
task :validate do
  Dir['manifests/**/*.pp'].each do |manifest|
    sh "puppet parser validate --noop #{manifest}"
  end
  Dir['spec/**/*.rb', 'lib/**/*.rb'].each do |ruby_file|
    sh "ruby -c #{ruby_file}" unless ruby_file =~ %r{spec/fixtures}
  end
  Dir['templates/**/*.erb'].each do |template|
    sh "erb -P -x -T '-' #{template} | ruby -c"
  end
end

desc 'Generate nodesets'
task :gen_nodeset do
  require 'beaker-hostgenerator'
  require 'securerandom'
  require 'fileutils'
  require 'json'

  supported_oses = JSON::parse(File.read('metadata.json'))['operatingsystem_support']

  suts = supported_oses.map do |o|
    operatingsystem = o['operatingsystem'].sub('OracleLinux','Oracle').downcase
    o['operatingsystemrelease'].map do |r|
      operatingsystemrelease = r.sub('.','')
      operatingsystem + operatingsystemrelease + '-64a{hypervisor=docker}'
    end
  end.flatten

  suts.each do |sut|
    cli = BeakerHostGenerator::CLI.new(['--global-config','{type=oss}',sut])
    nodeset_dir = "tmp/mynodesets"
    nodeset = "#{nodeset_dir}/#{sut}-#{SecureRandom.uuid}.yaml"
    FileUtils.mkdir_p(nodeset_dir)
    File.open(nodeset, 'w') do |fh|
      fh.print(cli.execute)
    end
    puts nodeset
  end
end
