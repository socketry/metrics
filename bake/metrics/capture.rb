# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2023, by Samuel Williams.

def capture
	ENV['METRICS_BACKEND'] = 'metrics/backend/capture'
	require 'metrics'
end

# Generate a list of metrics using the document backend.
def list
	Metrics::Backend::Capture.metrics.sort_by!{|metric| metric.name}
end
