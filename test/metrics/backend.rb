# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2022-2023, by Samuel Williams.

require "metrics/backend"
require "json"

require "sus/fixtures/console"

describe Metrics do
	with ".require_backend" do
		include_context Sus::Fixtures::Console::CapturedLogger
		
		it "logs a warning if backend cannot be loaded" do
			subject.require_backend({"METRICS_BACKEND" => "metrics/backend/missing"})
			
			expect_console.to have_logged(
				severity: be == :warn,
			)
		end
	end
end
