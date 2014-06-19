# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mathf/version'

Gem::Specification.new do |spec|
  spec.name          = 'mathf'
  spec.version       = Mathf::VERSION
  spec.authors       = ['Matt Cassidy']
  spec.email         = ['matt@someserver.ca']
  spec.description   = %q{Just when you thought you could ruin someones day by requiring mathn. Try mathf and put the surprise back into math}
  spec.summary       = %q{When requiring 'mathn' is not enough for you needs of ruining other projects}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
end
