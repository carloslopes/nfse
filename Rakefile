#!/usr/bin/env rake
require 'bundler/gem_tasks'

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs.push('lib/nfse', 'lib/nfse/envio')
  t.test_files = FileList['test/lib/nfse/*_test.rb', 'test/lib/nfse/envio/*_test.rb']
  t.verbose = false
end

task :default => :test
