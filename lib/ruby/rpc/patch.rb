def Object.const_missing name
  begin
    if Ruby::RPC::Remote.remote_const_get name
      return Ruby::RPC::class_factory name
    end
  rescue Exception => e
    super name
  end          
end
