# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2022, by Samuel Williams.

require 'metrics/provider'

describe Metrics::Provider do
	let(:document_root) {File.expand_path(".document", __dir__)}
	
	ENVIRONMENT = {'METRICS_BACKEND' => 'metrics/backend/document'}
	
	it "can list all metrics" do
		input, output = IO.pipe
		
		pid = Process.spawn(ENVIRONMENT, "bundle", "exec", "bake", "metrics:document", "output", "--format", "json", chdir: document_root, out: output)
		output.close
		Process.wait(pid)
		
		metrics = JSON.parse(input.read)
		
		expect(metrics).to be_a(Array)
		metric = metrics[0]
		
		expect(metric).to have_keys(
			"name" => be == "my_metric",
			"type" => be == "gauge",
			"description" => be == "My metric",
			"unit" => be == "seconds",
			"values" => be == [],
			"tags" => be == [],
			"sample_rates" => be == []
		)
	end
end
