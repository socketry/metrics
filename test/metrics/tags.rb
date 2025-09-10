# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024, by Samuel Williams.

require "metrics/tags"

describe Metrics::Tags do
	with "#normalize" do
		it "can normalize an ipv6 address" do
			tags = subject.normalize({"ip" => "[::1]"})
			
			expect(tags).to be == ["ip:[::1]"]
		end
		
		it "returns nil when tags is nil" do
			result = subject.normalize(nil)
			expect(result).to be_nil
		end
		
		it "returns the 'into' parameter when tags is nil" do
			into = ["existing:tag"]
			result = subject.normalize(nil, into)
			expect(result).to be == into
		end
		
		it "returns nil when tags is empty array" do
			result = subject.normalize([])
			expect(result).to be_nil
		end
		
		it "returns the 'into' parameter when tags is empty array" do
			into = ["existing:tag"]
			result = subject.normalize([], into)
			expect(result).to be == into
		end
		
		it "returns nil when tags is empty hash" do
			result = subject.normalize({})
			expect(result).to be_nil
		end
		
		it "returns the 'into' parameter when tags is empty hash" do
			into = ["existing:tag"]
			result = subject.normalize({}, into)
			expect(result).to be == into
		end
		
		it "normalizes a hash with single key-value pair" do
			result = subject.normalize({"environment" => "production"})
			expect(result).to be == ["environment:production"]
		end
		
		it "normalizes a hash with multiple key-value pairs" do
			result = subject.normalize({
				"environment" => "production",
				"service" => "web",
				"version" => "1.2.3"
			})
			expect(result.sort).to be == [
				"environment:production",
				"service:web", 
				"version:1.2.3"
			].sort
		end
		
		it "handles numeric values in hash" do
			result = subject.normalize({
				"port" => 8080,
				"timeout" => 30.5,
				"retries" => 0
			})
			expect(result.sort).to be == [
				"port:8080",
				"timeout:30.5",
				"retries:0"
			].sort
		end
		
		it "handles special characters in hash keys and values" do
			result = subject.normalize({
				"user-id" => "john@example.com",
				"path" => "/api/v1/users",
				"query" => "filter=active&sort=name"
			})
			expect(result.sort).to be == [
				"user-id:john@example.com",
				"path:/api/v1/users",
				"query:filter=active&sort=name"
			].sort
		end
		
		it "concatenates array tags" do
			result = subject.normalize(["env:production", "service:web"])
			expect(result).to be == ["env:production", "service:web"]
		end
		
		it "handles array with mixed content" do
			result = subject.normalize(["env:production", "port:8080", "active"])
			expect(result).to be == ["env:production", "port:8080", "active"]
		end
		
		it "appends hash tags to existing 'into' array" do
			into = ["existing:tag"]
			result = subject.normalize({"new" => "value"}, into)
			expect(result).to be == ["existing:tag", "new:value"]
			expect(result).to be_equal(into) # Same object reference
		end
		
		it "appends array tags to existing 'into' array" do
			into = ["existing:tag"]
			result = subject.normalize(["new:value", "another:tag"], into)
			expect(result).to be == ["existing:tag", "new:value", "another:tag"]
			expect(result).to be_equal(into) # Same object reference
		end
		
		it "handles complex mixed scenario" do
			into = ["initial:tag"]
			hash_tags = {
				"environment" => "staging",
				"version" => "2.1.0"
			}
			result = subject.normalize(hash_tags, into)
			expect(result.sort).to be == [
				"initial:tag",
				"environment:staging", 
				"version:2.1.0"
			].sort
		end
		
		it "handles boolean values in hash - true values are included" do
			result = subject.normalize({
				"enabled" => true,
				"debug" => false
			})
			# Only truthy values should be included, false is falsy so skipped
			expect(result).to be == ["enabled:true"]
		end
		
		it "handles nil values in hash - they are skipped" do
			result = subject.normalize({
				"optional" => nil,
				"required" => "value"
			})
			# nil is falsy, so only truthy values included
			expect(result).to be == ["required:value"]
		end
		
		it "preserves order when using array input" do
			input = ["first", "second", "third"]
			result = subject.normalize(input)
			expect(result).to be == ["first", "second", "third"]
		end
		
		it "handles empty strings in hash - they are truthy so included" do
			result = subject.normalize({
				"empty" => "",
				"whitespace" => "   "
			})
			# Empty strings are truthy in Ruby, so both should be included
			expect(result).to be == [
				"empty:",
				"whitespace:   "
			]
		end
		
		it "handles zero values in hash - they are truthy so included" do
			result = subject.normalize({
				"count" => 0,
				"percentage" => 0.0
			})
			# Zero is truthy in Ruby, so both should be included
			expect(result).to be == [
				"count:0",
				"percentage:0.0"
			]
		end
		
		it "handles mixed falsy and truthy values" do
			result = subject.normalize({
				"nil_value" => nil,
				"false_value" => false,
				"zero_value" => 0,
				"empty_string" => "",
				"true_value" => true,
				"string_value" => "text"
			})
			
			# Only truthy values should be included (zero, empty string, true, and string)
			expect(result).to be == [
				"zero_value:0",
				"empty_string:",
				"true_value:true",
				"string_value:text"
			]
		end
	end
end
