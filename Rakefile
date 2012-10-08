#!/usr/bin/env rake
require 'bundler/gem_tasks'

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs.push('lib/nfse', 'lib/nfse/enviar_lote')
  t.test_files = FileList['test/lib/nfse/*_test.rb', 'test/lib/nfse/enviar_lote/*_test.rb']
  t.verbose = false
end

task :default => :test
