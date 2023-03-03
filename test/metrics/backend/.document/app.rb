
require 'metrics/provider'

class App
	def call
	end
end

Metrics::Provider(App) do
	MY_METRIC = metric(:my_metric, :gauge, description: "My metric", unit: "seconds")
	
	def call
		MY_METRIC.emit(1, tags: ['environment:test'])
		
		super
	end
end
