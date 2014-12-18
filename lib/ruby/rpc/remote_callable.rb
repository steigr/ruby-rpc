module Ruby
  module RPC
    module RemoteCallable
      def initialize *args, &block
        Thread.new do
          RedisRPC::Server.new(Redis.new(url:ENV['redis_url'],driver: :hiredis), self, self).run
        end
        super *args, &block
      end
      def self.included base
        Thread.new do
          RedisRPC::Server.new(Redis.new(url:ENV['redis_url'],driver: :hiredis), base, base).run
        end
      end
    end
  end
end