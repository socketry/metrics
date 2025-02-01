# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024, by Samuel Williams.

require "metrics/config"
require "json"

describe Metrics::Config do
	let(:config) {subject.default}
	
	with ".require_backend" do
		it "logs a warning if backend cannot be loaded" do
			expect(config).to receive(:warn).and_return(nil)
			
			expect(
				config.require_backend({"METRICS_BACKEND" => "metrics/backend/missing"})
			).to be == false
		end
	end
end
