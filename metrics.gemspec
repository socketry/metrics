# frozen_string_literal: true

require_relative "lib/metrics/version"

Gem::Specification.new do |spec|
	spec.name = "metrics"
	spec.version = Metrics::VERSION
	
	spec.summary = "Application metrics and instrumentation."
	spec.authors = ["Samuel Williams"]
	spec.license = "MIT"
	
	spec.cert_chain  = ['release.cert']
	spec.signing_key = File.expand_path('~/.gem/release.pem')
	
	spec.homepage = "https://github.com/socketry/metrics"
	
	spec.files = Dir.glob(['{bake,lib}/**/*', '*.md'], File::FNM_DOTMATCH, base: __dir__)
	
	spec.add_development_dependency "bake-test", "~> 0.2"
	spec.add_development_dependency "bake-test-external", "~> 0.2"
	spec.add_development_dependency "covered", "~> 0.16"
	spec.add_development_dependency "sus", "~> 0.13"
end
