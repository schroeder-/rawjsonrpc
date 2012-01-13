# encoding: utf-8
#
# server.rb : Implements the base server and some basic servers
#
# Copyright January 2012, Alexander Schrode.  All Rights Reserved.
#
# This is free software. Please see the LICENSE and COPYING files for details.

require 'socket'
require 'logger'
require 'json'
require 'gserver'
require_relative 'error'

module RawJsonRpc
  # Implements the basic server functions
  # When implementing a new server type you must only give a jsonstring to the
  # execute function.
  # =Example
  #
  # Add Functions
  #
  ## server.add_method("run", methode(:test)) #adds methode test as "run"
  ## server.add_block("attack"){ |target, dir, times|
  ##    #stuff
  ## }
  module RawServerJsonRpc
    # Adds methode to be executed
    def add_method(name, func)
      @rawjsonrpc_funcs ||= {}
      @rawjsonrpc_blocks ||= {}
      @rawjsonrpc_funcs[name] = func
    end
    # Adds blocks that get executed
    # Arguments can not checkt because they are procs no lambdas if you can
    # provied a hack plz contribute.
    def add_block(name, &block)
      @rawjsonrpc_blocks ||= {}
      @rawjsonrpc_funcs ||= {}
      @rawjsonrpc_blocks[name] = block
    end
    protected
    # Handels json string input and calls the methode and returns a return
    # string or nil if its a notification.
    def execute(input)
      begin
        request_data = JSON.load(input)
        @rawjsonrpc_noti = if request_data["id"] == nil then true
                else false
                end
        @rawjsonrpc_id = request_data["id"]
        if @rawjsonrpc_funcs.has_key?(request_data["method"])
          ret = @rawjsonrpc_funcs[request_data["method"]].call(*request_data["params"])
        elsif @rawjsonrpc_blocks.has_key?(request_data["method"])
          ret = @rawjsonrpc_blocks[request_data["method"]].call(*request_data["params"])
        else
          @rawjsonrpc_back = request_data
          raise("No Methode")
        end
        if request_data["id"] != nil
          {"result" => ret, "error" => nil, "id" => request_data["id"]}
            .to_json
        else nil
        end
      rescue => ex
        unless @rawjsonrpc_noti
          {"result" => nil, "error" => ex.message,
            "id" => @rawjsonrpc_id}.to_json
        end
      end
    end
  end
  # Implements RawServerJsonRpcBase for a TCPServer, that can only handle
  # one client at once.
  class ServerSocket
    include RawServerJsonRpc
    # sets the port for serving. Optimal you can add a logger object to log
    # server activities.
    def initialize(port, logger=nil)
      @port = port
      @log = logger
    end
    private
    #checks logger
    def check(logger, para)
      if @log != nil
        logger.call(para)
      end
    end
    public
    # Starts the servering the methods for clients
    def serve
      check @log, "start serving data at " + @port.to_s
      server = TCPServer.new(@port)
      client = server.accept
      loop do
        begin
          data = client.gets
          if data == nil or data == "END\n"
            check @log.info, "client closed connection"
            client.close
            client = server.accept
            next
          end
          check @log.info, "recived from client " + data
          data = execute(data)
          if data != nil
            check @log.info, "send to client " + data
            client.puts(data)
          end
        rescue SocketError
          check @log.info, "client closed connection"
          client.close
          client = server.accept
        #  Exception from get killed
        rescue Errno::EPIPE
          check @log.info, "server get killed"
          exit
        rescue => ex
          check @log.fatal, "server get killed from: " + ex.message
          client.close
          raise ex
        end
      end
    end
  end
  # Implements the RawServerJsonRpcBase as GServer the stdlib SocketServer. For
  # more information go one to the stdlib.
  class TCPServer < GServer
    include RawServerJsonRpc
  end
end
