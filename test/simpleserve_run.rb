#!/usr/bin/ruby
require_relative('../lib/rawjsonrpc.rb')
require 'logger'
#dummy functions for testing

def no_arg
  "no arg"
end

def one_arg(a)
  a
end

def two_arg(a, b)
  b
end

def three_arg(a, b, c)
  c
end

def no
  "no"
end

def damaged
  puts "damaged"
  raise ("error")
end

if __FILE__ == $0
  server = SimpleServerJSONRPC.new(9001)#, log_level=Logger::INFO, log_type=STDOUT)
  server.add_method("no", method(:no_arg))
  server.add_method("one", method(:one_arg))
  server.add_method("two", method(:two_arg))
  server.add_method("three", method(:three_arg))
  server.add_method("not", method(:no))
  server.add_method("damaged", method(:damaged))
  server.serve
end
