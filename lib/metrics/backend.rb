# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2021-2024, by Samuel Williams.

require "console/event/failure"

module Metrics
	module Backend
		# Require a specific trace backend.
		def self.require_backend(env = ENV)
			if backend = env["METRICS_BACKEND"]
				begin
					require(backend)
				rescue LoadError => error
					::Console::Event::Failure.for(error).emit(self, "Unable to load metrics backend!", backend: backend, severity: :warn)
					
					return false
				end
				
				Metrics.extend(Backend::Interface)
				
				return true
			end
		end
	end
end

Metrics::Backend.require_backend
