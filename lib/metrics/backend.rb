# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2021-2023, by Samuel Williams.

module Metrics
	# Require a specific trace backend.
	def self.require_backend(env = ENV)
		if path = env['METRICS_BACKEND']
			require(path)
			
			Metrics.extend(Backend::Interface)
		end
	end
end

Metrics.require_backend
