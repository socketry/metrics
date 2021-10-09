
require_relative "lib/metrics/version"

Gem::Specification.new do |spec|
	spec.name = "metrics"
	spec.version = Metrics::VERSION
	
	spec.summary = "Application metrics and instrumentation."
	spec.authors = ["Samuel Williams"]
	spec.license = "MIT"
	
	spec.homepage = "https://github.com/socketry/metrics"
	
	spec.files = Dir.glob('{lib}/**/*', File::FNM_DOTMATCH, base: __dir__)
	
	spec.add_development_dependency "rspec", "~> 3.0"
end
