# frozen_string_literal: true

require_relative "lib/metrics/version"

Gem::Specification.new do |spec|
	spec.name = "metrics"
	spec.version = Metrics::VERSION
	
	spec.summary = "Application metrics and instrumentation."
	spec.authors = ["Samuel Williams"]
	spec.license = "MIT"
	
	spec.cert_chain  = ["release.cert"]
	spec.signing_key = File.expand_path("~/.gem/release.pem")
	
	spec.homepage = "https://github.com/socketry/metrics"
	
	spec.metadata = {
		"documentation_uri" => "https://socketry.github.io/metrics/",
		"source_code_uri" => "https://github.com/socketry/metrics.git",
	}
	
	spec.files = Dir.glob(["{bake,lib}/**/*", "*.md"], File::FNM_DOTMATCH, base: __dir__)
	
	spec.required_ruby_version = ">= 3.2"
end
