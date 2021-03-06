# encoding: utf-8

# client.rb : Implements the Clientside
#
# Copyright January 2012, Alexander Schrode.  All Rights Reserved.
#
# This is free software. Please see the LICENSE and COPYING files for details.

require 'json'
require 'socket'
require_relative 'error'

module RawJsonRpc
  # Implements the base class for all Clients.
  # The class get all methode calls generate the json data from it
  #
  # <b>Every client must implement get_response and send_request</b>.
  #
  # =Examples
  # ==send request
  #
  ## client.request("run", [1,2,3])                  # calls: run params: 1 2 3
  ## ret = client.request("attack", "alpha", 1, 3.0) # calls: attack
  ##                                                 # params "alpha", 1, 3.0
  ##                                                 # returns data into ret
  # ==send request shortcut
  #
  ## client.run([1,2,3])
  ## ret = client.attack("alpha", 1, 3.0)
  #
  # ==send notification (no return value)
  ## client.notification("beat", [:alpha, 123], "fast")
  #
  class RawClientJsonRpc

    # redirect calls
    def method_missing(name, *args)
      if args.empty?
        request(name)
      else
        request(name, *args)
      end
    end

    private
    def id
      @id_count ||= 0
      @id_count += 1
    end

    public
    # returns the server response must be implmented
    def get_response
      raise NotImplementedError.new("method not overriden")
    end

    # Send the request to server must be implmented.
    # takes json string.
    def send_request para
      raise NotImplementedError.new("method not overriden")
    end

    public
    # Sends a notification to server.
    # A Notifications don't return any value
    def notification(function_name, *para)
      para = {'method' => function_name, 'params' => para, 'id' => nil}
        .to_json
      send_request para
      nil
    end
    # Sends a request to server
    # return a value or raise an RpcException if server sends an error.
    def request(function_name, *para)
      id_count = id
      para = {'method' => function_name, 'params' =>  para, 'id' => id_count}
        .to_json
      send_request(para)
      result = get_response
      if result.empty? or result == nil
        raise(RpcError.new("empty respons"))
      end
      response = JSON.load(result)
      if response["error"] != nil
        raise(RpcError.new(response["error"]))
      elsif response["id"] != id_count
        raise(RpcError.new("server send wrong data."))
      end
      response["result"]
    end
  end
  # Implements the raw json rpc client over a tcp socket.
  # Includes the RawClientJsonRpcBase Module
  class ClientSock < RawClientJsonRpc
    # Init the socket with host.
    def initialize(ip, port)
      @socket = TCPSocket.new(ip, port)
    end
    # closes the socket connection
    def close
      @socket.close
    end
    private
    def get_response
      @socket.gets
    end

    def send_request str
      @socket.puts str
    end
  end
end
