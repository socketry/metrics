# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024, by Samuel Williams.

require 'metrics/provider'

class MyApplication
	def work
		# ...
	end
	
	Metrics::Provider(self) do
		WORK_METRIC = Metrics.metric('my_application.work.count', :counter, description: 'Work counter')
		
		def work
			WORK_METRIC.emit(1)
			super
		end
	end
end
