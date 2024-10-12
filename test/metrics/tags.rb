# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024, by Samuel Williams.

require "metrics/tags"

describe Metrics::Tags do
	it "can normalize an ipv6 address" do
		tags = subject.normalize({"ip" => "[::1]"})
		
		expect(tags).to be == ["ip:[::1]"]
	end
end
