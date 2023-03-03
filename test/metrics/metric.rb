# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023, by Samuel Williams.

require 'metrics/metric'

describe Metrics::Metric do
	let(:metric) {subject.new("my_metric", "gauge", "My metric", "seconds")}
	
	it "can emit a metric" do
		expect do
			metric.emit(1, tags: ['environment:test'])
		end.to raise_exception(NotImplementedError)
	end
end
