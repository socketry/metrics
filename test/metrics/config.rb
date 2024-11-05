# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024, by Samuel Williams.

require "metrics/config"
require "json"

require "sus/fixtures/console"

describe Metrics::Config do
	let(:config) {subject.default}
	
	with ".require_backend" do
		include_context Sus::Fixtures::Console::CapturedLogger
		
		it "logs a warning if backend cannot be loaded" do
			expect(
				config.require_backend({"METRICS_BACKEND" => "metrics/backend/missing"})
			).to be == false
			
			expect_console.to have_logged(
				severity: be == :warn,
			)
		end
	end
end
