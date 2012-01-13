# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rawjsonrpc"
  s.version = "0.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Alexander Schrode"]
  s.date = "2012-01-13"
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
    "doc/rdoc/README_rdoc.html",
    "doc/rdoc/RawJsonRpc.html",
    "doc/rdoc/RawJsonRpc/ClientSock.html",
    "doc/rdoc/RawJsonRpc/RawClientJsonRpc.html",
    "doc/rdoc/RawJsonRpc/RawServerJsonRpc.html",
    "doc/rdoc/RawJsonRpc/ServerSocket.html",
    "doc/rdoc/RawJsonRpc/TCPServer.html",
    "doc/rdoc/RpcError.html",
    "doc/rdoc/created.rid",
    "doc/rdoc/images/brick.png",
    "doc/rdoc/images/brick_link.png",
    "doc/rdoc/images/bug.png",
    "doc/rdoc/images/bullet_black.png",
    "doc/rdoc/images/bullet_toggle_minus.png",
    "doc/rdoc/images/bullet_toggle_plus.png",
    "doc/rdoc/images/date.png",
    "doc/rdoc/images/find.png",
    "doc/rdoc/images/loadingAnimation.gif",
    "doc/rdoc/images/macFFBgHack.png",
    "doc/rdoc/images/package.png",
    "doc/rdoc/images/page_green.png",
    "doc/rdoc/images/page_white_text.png",
    "doc/rdoc/images/page_white_width.png",
    "doc/rdoc/images/plugin.png",
    "doc/rdoc/images/ruby.png",
    "doc/rdoc/images/tag_green.png",
    "doc/rdoc/images/wrench.png",
    "doc/rdoc/images/wrench_orange.png",
    "doc/rdoc/images/zoom.png",
    "doc/rdoc/index.html",
    "doc/rdoc/js/darkfish.js",
    "doc/rdoc/js/jquery.js",
    "doc/rdoc/js/quicksearch.js",
    "doc/rdoc/js/thickbox-compressed.js",
    "doc/rdoc/lib/rawjsonrpc/client_rb.html",
    "doc/rdoc/lib/rawjsonrpc/error_rb.html",
    "doc/rdoc/lib/rawjsonrpc/server_rb.html",
    "doc/rdoc/lib/rawjsonrpc_rb.html",
    "doc/rdoc/rdoc.css",
    "lib/rawjsonrpc.rb",
    "lib/rawjsonrpc/client.rb",
    "lib/rawjsonrpc/error.rb",
    "lib/rawjsonrpc/server.rb",
    "rawjsonrpc.gemspec",
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

