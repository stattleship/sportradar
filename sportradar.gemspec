# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sportradar/version'

Gem::Specification.new do |spec|
  spec.name          = 'sportradar'
  spec.version       = Sportradar::VERSION
  spec.authors       = ['Stattleship', 'David Thyresson']
  spec.email         = ["david@stattleship.com"]

  spec.summary       = %q{Ruby client for the Sportradar.US API.}
  spec.description   = %q{Fetch sports data from the Sportradar.US API.}
  spec.homepage      = "https://github.com/stattleship/sportradar"
  spec.license       = "None"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_runtime_dependency 'activesupport', '4.2.6'
  spec.add_runtime_dependency 'addressable', '~> 2.4'
  spec.add_runtime_dependency 'dotenv', '~> 2.0', '>= 2.0.2'
  spec.add_runtime_dependency 'multi_json', '~> 1.11', '>= 1.11.2'
  spec.add_runtime_dependency 'oj', '~> 2.14', '>= 2.14.2'
  spec.add_runtime_dependency 'oj_mimic_json', '~> 1.0', '>= 1.0.1'
end
