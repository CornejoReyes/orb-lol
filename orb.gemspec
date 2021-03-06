# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'orb/version'

Gem::Specification.new do |spec|
  spec.name          = "orb"
  spec.version       = Orb::VERSION
  spec.authors       = ["Fernando Cornejo"]
  spec.email         = ["cornejoreyes@hotmail.com"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = "A wrapper for Riot API"
  spec.description   = "Make easy requires from the game"
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_runtime_dependency 'httparty'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'vcr'
  spec.add_development_dependency 'webmock'
end
