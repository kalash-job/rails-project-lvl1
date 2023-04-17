# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rspec/core/rake_task'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.test_files = FileList['test/**/test_*.rb']
end

RSpec::Core::RakeTask.new(:spec) do |t|
  t.verbose = false
  t.pattern = 'spec/**/*_spec.rb'
  t.rspec_opts = %w[--format documentation]
end

require 'rubocop/rake_task'

RuboCop::RakeTask.new

task default: %i[test rubocop]
