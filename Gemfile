source :rubygems

gem 'rake'
gem 'puppet-lint', '>=0.2.0'
gem 'rspec', '>2'
gem 'rspec-puppet', '>=0.1.3'

puppetversion = ENV.key?('PUPPET_VERSION') ? "~> #{ENV['PUPPET_VERSION']}" : ['>= 2.7']
gem 'puppet', puppetversion
gem 'puppetlabs_spec_helper', '>=0.2.0'
