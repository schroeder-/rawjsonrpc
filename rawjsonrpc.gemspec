# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rawjsonrpc"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alexander Schrode"]
  s.date = "2012-01-11"
  s.description = "A basic libary for json rpc that allow you to easly create one for your streamtype. It includes tcp json rpc on socket connections. Version for single clients server, one for multiple clients server based on gserver are served and a TCP client."
  s.email = "midix01@googlemail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/rawjsonrpc.rb",
    "lib/rawjsonrpc/client.rb",
    "lib/rawjsonrpc/error.rb",
    "lib/rawjsonrpc/server.rb",
    "test/helper.rb",
    "test/test_rawjsonrpc.rb"
  ]
  s.homepage = "http://github.com/schroeder-/rawjsonrpc"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.11"
  s.summary = "A basic libary for json rpc that allow to create for your stream type. It includes a TCPIp Server and Client."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
  end
end

