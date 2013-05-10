# -*- encoding: utf-8 -*-
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "whosup/version"

Gem::Specification.new do |gem|
  gem.name          = "whosup"
  gem.version       = Whosup::VERSION
  gem.author        = "Andrew Hare"
  gem.description   = "A baby monitor."
  gem.summary       = "A baby monitor."
  gem.license       = "MIT"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.require_paths = ["lib"]

  gem.add_dependency "thor"
  gem.add_dependency "coreaudio"
end
