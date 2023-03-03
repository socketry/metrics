# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2022, by Samuel Williams.

require 'metrics/provider'

describe Metrics::Provider do
	let(:my_class) {Class.new}
	
	it "works without a block" do
		provider = Metrics::Provider(my_class)
		expect(provider).to be_equal(my_class.metrics_provider)
	end
end
