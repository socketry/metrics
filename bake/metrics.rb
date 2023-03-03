
def document(environment: 'environment')
	ENV['METRICS_BACKEND'] = 'metrics/backend/document'
	require 'metrics'
	
	call(environment)
	
	backend = Metrics::Backend::Document
	
	return backend.metrics
end
