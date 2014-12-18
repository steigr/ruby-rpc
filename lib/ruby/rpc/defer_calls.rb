module Ruby
  module RPC
    module DeferCalls
      class << self
        def method_missing method, *args, &block
          puts "Class Method #{name} missing"
          super unless Ruby::RPC::CLIENT
          @client ||= RedisRPC::Client.new Redis.new(url:Ruby::RPC::URL,driver: :hiredis), self.to_s, timeout: Ruby::RPC::TIMEOUT
          @client.send method, *args, &block
        end
      end
      def initialize *args, &block
        @channel = Ruby::RPC::Remote.build_remote self.class
        super *args, &block
      end
      def method_missing method, *args, &block
        super unless Ruby::RPC::CLIENT
        @client ||= RedisRPC::Client.new Redis.new(url:Ruby::RPC::URL,driver: :hiredis), (@channel || self.to_s), timeout: Ruby::RPC::TIMEOUT
        @client.send method, *args, &block
      end
    end
  end
end