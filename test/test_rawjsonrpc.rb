require 'helper'
require 'logger'

class Rawjsonrpc < Test::Unit::TestCase
  def setup
    @pid = fork{
      exec "ruby", Dir.getwd + "/test/simpleserve_run.rb"
    }
  end
  #test the simple server request
  def test_simple_request
    client = ClientJSONRPC.new('localhost',9001)
    assert_equal("no arg", client.request("no"))
    assert_equal("one arg", client.request("one", "one arg"))
    assert_equal(2, client.request("two", 1, 2))
    assert_equal(3.0, client.request("three", 1.0, 2.0, 3.0))
    client.close()
  end

  def test_simple_notification
    sleep(0.2)
    client = ClientJSONRPC.new('localhost',9001)
    client.notification("not")
    client.close()
  end

  def test_simple_name_request
    sleep(0.2)
    client = ClientJSONRPC.new('localhost',9001)
    assert_equal({"a" => "abc", "b" => [1,2,3]},
           client.request("one", {:a => "abc", :b => [1,2,3]}))
    assert_equal("no arg", client.no)
    assert_equal("a", client.one(:a))
    assert_equal(3.0, client.two(1.0, 3.0))
    assert_equal(3, client.three(1, 2, 3))
    client.close()
  end

  def test_simple_exception
    sleep(0.3)
    client = ClientJSONRPC.new('localhost',9001)
    assert_raise(NoMethodError){
      #no function
      @client.alpha
    }
    assert_raise(NoMethodError){
      #wrong arguments
      @client.request("two", "alpha")
    }
    assert_raise(NoMethodError){
      #call damaged function
      @client.damaged
    }
    client.close()
  end
  def teardown
    sleep(0.4)
    Process.kill('TERM',@pid)
  end
end
