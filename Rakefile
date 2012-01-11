# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "rawjsonrpc"
  gem.homepage = "http://github.com/schroeder-/rawjsonrpc"
  gem.license = "MIT"
  gem.summary = %Q{A basic libary for json rpc that allow to create for your stream type. It includes a TCPIp Server and Client.}
  gem.description = %Q{A basic libary for json rpc that allow you to easly create one for your streamtype. It includes tcp json rpc on socket connections. Version for single clients server, one for multiple clients server based on gserver are served and a TCP client.}
  gem.email = "midix01@googlemail.com"
  gem.authors = ["Alexander Schrode"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'doc/rdoc'
  rdoc.title = "rawjsonrpc #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
