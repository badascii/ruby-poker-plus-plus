require 'rubygems'
require 'rake'

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.libs.push "lib"
  test.verbose = true
  test.warning = true
  test.test_files = FileList['test/test_*.rb']
  test.test_files = FileList['test/spec_*.rb']

end

task :default => :test