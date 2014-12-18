require 'ruby/rpc/defer_calls'
require 'ruby/rpc/remote_callable'
require 'ruby/rpc/version'
require 'redis'
require 'redis/connection/hiredis'
require 'singleton'
require 'redisrpc'
require 'ostruct'

module Ruby
  module RPC
    class << self
      def enable params={}
        Object.const_get('Ruby::RPC').const_set('SERVER',true) if params[:server]
        Object.const_get('Ruby::RPC').const_set('CLIENT',true) if params[:client]
        Object.const_get('Ruby::RPC').const_set('TIMEOUT',(params[:timeout]||5))
        Object.const_get('Ruby::RPC').const_set('URL',(params[:url]||'redis://127.0.0.1'))
        require 'ruby/rpc/remote'
        require 'ruby/rpc/patch' if Object.const_defined? 'Ruby::RPC::CLIENT'
      end
      def class_factory name
        Object.const_set(name,Class.new(OpenStruct) { include Ruby::RPC::DeferCalls; extend Ruby::RPC::DeferCalls })
      end
    end
  end
end
