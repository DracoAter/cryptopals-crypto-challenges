require 'rake/testtask'

task :default => 'test'

Rake::TestTask.new :test do |t|
	t.verbose = true
	t.warning = true
	t.test_files = FileList['test/*_test.rb']
end
