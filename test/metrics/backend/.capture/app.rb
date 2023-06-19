# Released under the MIT License.
# Copyright, 2023, by Samuel Williams.

require 'metrics/provider'

class App
	def call
	end
end

Metrics::Provider(App) do
	MY_METRIC = Metrics.metric(:my_metric, :gauge, description: "My metric", unit: "seconds")
	
	def call
		MY_METRIC.emit(1, tags: ['environment:test'])
		
		super
	end
end
