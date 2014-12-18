require 'ruby/rpc'
Ruby::RPC.enable server: true

puts "Defined Foobar"

class Foobar
  include Ruby::RPC::RemoteCallable
  def self.bar
    :foo
  end
  def foo
    :bar
  end
end

puts "Waiting"

loop do
  sleep 1
end