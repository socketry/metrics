#!/usr/bin/env sus
# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024, by Samuel Williams.

ENV['METRICS_BACKEND'] ||= 'metrics/backend/test'

require_relative 'app'

describe MyApplication do
	it 'should emit metrics' do
		expect(MyApplication::WORK_METRIC).to receive(:emit).with(1)
		MyApplication.new.work
	end
end
