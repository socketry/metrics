# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023, by Samuel Williams.

require 'metrics/provider'

describe Metrics::Provider do
	let(:document_root) {File.expand_path(".capture", __dir__)}
	let(:environment) {{'METRICS_BACKEND' => nil}}
	
	it "runs without metrics" do
		pid = Process.spawn(environment, "bundle", "exec", "bake", "run", chdir: document_root)
		pid, status = Process.wait2(pid)
		
		expect(status).to be(:success?)
	end
	
	it "can list all metrics" do
		input, output = IO.pipe
		
		pid = Process.spawn(environment, "bundle", "exec", "bake", "metrics:capture", "environment", "metrics:capture:list", "output", "--format", "json", chdir: document_root, out: output)
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
	
	it "can collect metrics" do
		input, output = IO.pipe
		
		pid = Process.spawn(environment, "bundle", "exec", "bake",  "metrics:capture", "run", "metrics:capture:list", "output", "--format", "json", chdir: document_root, out: output)
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
			"values" => be == [1],
			"tags" => be == ['environment:test'],
			"sample_rates" => be == [1.0]
		)
	end
end
