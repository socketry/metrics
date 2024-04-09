#!/usr/bin/env sus

ENV['METRICS_BACKEND'] ||= 'metrics/backend/test'

require_relative 'app'

describe MyApplication do
	it 'should emit metrics' do
		expect(MyApplication::WORK_METRIC).to receive(:emit).with(1)
		MyApplication.new.work
	end
end
