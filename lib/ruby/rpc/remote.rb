module Ruby
  module RPC
    class Remote
      extend  Ruby::RPC::DeferCalls     if Object.const_defined? 'Ruby::RPC::CLIENT'
      include Ruby::RPC::RemoteCallable if Object.const_defined? 'Ruby::RPC::SERVER'
      class << self
        if Object.const_defined? 'Ruby::RPC::SERVER'
          def remote_const_get name
            const = Object.const_get name
            const if const.included_modules.include? Ruby::RPC::RemoteCallable
          end
          def build_remote name, *args
            Object.const_get(name).new *args 
          end
        end
      end
    end
  end
end