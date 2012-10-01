require 'rubygems'
require 'puppetlabs_spec_helper/rake_tasks'
require 'rspec/core/rake_task'

desc "Run all specs"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.pattern = 'spec/**/*_spec.rb'
  t.rspec_opts = File.read("spec/spec.opts").chomp || ""
end

#task :default => [:spec]
