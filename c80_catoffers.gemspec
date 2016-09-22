# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'c80_catoffers/version'

Gem::Specification.new do |spec|
  spec.name          = "c80_catoffers"
  spec.version       = C80Catoffers::VERSION
  spec.authors       = ["C80609A"]
  spec.email         = ["c080609a@gmail.com"]

  spec.summary       = "Offers gem"
  spec.description   = "Gem adds categories and offers"
  spec.homepage      = "https://github.com/c080609a/c80_catoffers"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency 'activesupport', ['>= 3.0.0']

end
