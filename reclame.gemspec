# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reclame/version'

Gem::Specification.new do |spec|
  spec.name          = "reclame"
  spec.version       = Reclame::VERSION
  spec.authors       = ["Jean-Philippe Lecaille"]
  spec.email         = ["jplecaille@gmail.com"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'minitest', '~> 2.11'
  spec.add_dependency "activesupport", "~> 3.0"
  spec.add_dependency "journey", "~> 1.0"

end
