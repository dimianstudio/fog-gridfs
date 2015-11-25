# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fog/gridfs/version'

Gem::Specification.new do |spec|
  spec.name          = "fog-gridfs"
  spec.version       = Fog::Gridfs::VERSION
  spec.authors       = ["Dmytro Myrhorodskyi"]
  spec.email         = ["dimianstudio@gmail.com"]

  spec.summary       = %q{Module for the 'fog' gem to support gridfs storage.}
  spec.description   = %q{This library can be used as a module for `fog` or as standalone provider
                          to use gridfs storage.}
  spec.homepage      = "https://github.com/dimianstudio/fog-gridfs"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency 'fog-core'
  spec.add_dependency 'mongo'
end
