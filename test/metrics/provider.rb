# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2021-2022, by Samuel Williams.

unless ENV['METRICS_BACKEND']
	abort "No backend specified, tests will fail!"
end

require 'metrics/provider'

describe Metrics::Provider do
	let(:my_class) {Class.new}
	
	it "works without a block" do
		provider = Metrics::Provider(my_class)
		expect(provider).to be_equal(my_class.metrics_provider)
	end
end
