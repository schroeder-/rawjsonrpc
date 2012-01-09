#!/usr/bin/ruby

require_relative '../lib/rawjsonrpc.rb'
puts "Start up"
client = ClientJSONRPC.new('localhost',9001)
puts "send methode"
puts client.request("no")
client.close()
