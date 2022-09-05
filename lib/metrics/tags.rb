# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2021, by Samuel Williams.

require_relative 'backend'

module Metrics
	module Tags
		def self.normalize(tags)
			return nil unless tags&.any?
			
			if tags.is_a?(Hash)
				tags = tags.map{|key, value| "#{key}:#{value}"}
			end
			
			return Array(tags)
		end
	end
end
