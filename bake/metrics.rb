
def document(child)
	ENV['METRICS_BACKEND'] = 'metrics/backend/document'
	require 'metrics'
	
	self.context.lookup(child).call
	
	backend = Metrics::Backend::Document
	backend.metrics.each do |metric|
		pp metric.as_json
	end
end
