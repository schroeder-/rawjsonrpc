require 'rawjsonrpc'


def test1(a)
  a
end

def test2(b,c)
  b
end

def test3
  nil
end

class Tester
  def b
    5
  end
end


#create exampel class
test_class = Tester.new

#launch a Server based on Gserver see infos at stdlib doc

serve1 = RawJsonRpc::JSONTCPServer.new(port=8080, maxConnections=2)
serve1.add_method("test1", method(:test1))
serve1.add_method("func2", method(:test2))
serve1.add_method("tes", method(:test3))
serve1.add_method("clas-t2", test_class.method(:b))
serve1.add_block("func4"){
  return 100
}
serve1.start
serve1.join
puts "Ended"
