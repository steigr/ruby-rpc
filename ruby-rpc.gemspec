# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby/rpc/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby-rpc"
  spec.version       = Ruby::RPC::VERSION
  spec.authors       = ["steigr"]
  spec.email         = ["me@stei.gr"]
  spec.summary       = %q{Wrapper for RedisRPC to remote function calls transparently.}
  spec.description   = %q{ruby-rpc monkey-patches Object.const_missing for clients to dynamically check rpc servers if they could serve the request.}
  spec.homepage      = "https://github.com/steigr/ruby-rpc"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency 'redisrpc', '~> 0.3', '>= 0.3.6rc'
  spec.add_runtime_dependency "hiredis", "~> 0.5"
end
