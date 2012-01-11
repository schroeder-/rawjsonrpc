require 'helper'
require 'logger'

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
  raise ("error")
end

class Rawjsonrpc < Test::Unit::TestCase
  class TestClientOK < RawJsonRpc::RawClientJsonRpc
    include RawJsonRpc::RawServerJsonRpc
    def initialize()
      add_method("no", method(:no_arg))
      add_method("one", method(:one_arg))
      add_method("two", method(:two_arg))
      add_method("three", method(:three_arg))
      add_method("not", method(:no))
      add_method("damaged", method(:damaged))
      add_block("block_add"){ |a, b|
        a + b
      }
      add_block("block_raise"){ |a, b|
      }
    end
    def get_response
     @data
    end
    def send_request(patern)
     @data = execute(patern)
    end
    def close()
      nil
    end
  end
  #test the simple server request
  def test_simple_request
    client = TestClientOK.new()
    assert_equal("no arg", client.request("no"))
    assert_equal("one arg", client.request("one", "one arg"))
    assert_equal(2, client.request("two", 1, 2))
    assert_equal(3.0, client.request("three", 1.0, 2.0, 3.0))
    client.close()
  end

  def test_simple_notification
    sleep(0.2)
    client = TestClientOK.new()
    client.notification("not")
    client.close()
  end

  def test_simple_name_request
    client = TestClientOK.new()
    assert_equal({"a" => "abc", "b" => [1,2,3]},
           client.request("one", {:a => "abc", :b => [1,2,3]}))
    assert_equal("no arg", client.no)
    assert_equal("a", client.one(:a))
    assert_equal(3.0, client.two(1.0, 3.0))
    assert_equal(3, client.three(1, 2, 3))
    client.close()
  end

  def test_block
    client = TestClientOK.new()
    assert_equal(4, client.block_add(2,2))
    client.close()
  end

  def test_simple_exception
    client = TestClientOK.new()
    assert_raise(RpcError){
      #no function
      client.alpha
    }
    assert_raise(RpcError){
      #wrong arguments
      client.request("two", "alpha")
    }
    assert_raise(RpcError){
      #call damaged function
      client.damaged
    }
=begin doesnt work because blocks can't check arguments errors!!
    assert_raise(RpcError){
      client.block_raise
    }
=end
    client.close()
  end

end
