# frozen_string_literal: true

# Copyright, 2021, by Samuel G. D. Williams. <http://www.codeotaku.com>
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

require 'console'
require_relative '../metric'

module Metrics
	module Backend
		module Test
			VALID_METRIC_NAME = /\A[a-z0-9\-_\.]{1,128}\Z/
			VALID_TAG = /\A[a-z][a-z0-9\-_\.:\\]{0,127}\Z/
			
			class Metric < Metrics::Metric
				def emit(value, tags: nil, sample_rate: 1.0)
					unless value.is_a?(Numeric)
						raise ArgumentError, "Value must be numeric!"
					end
					
					tags&.each do |tag|
						raise ArgumentError, "Invalid tag (must be String): #{tag.inspect}!" unless tag.is_a?(String)
						
						unless tag =~ VALID_TAG
							raise ArgumentError, "Invalid tag (must match #{VALID_TAG}): #{tag.inspect}!"
						end
					end
				end
			end
			
			module Interface
				def metric(name, type, description: nil, unit: nil, &block)
					unless name.is_a?(String)
						raise ArgumentError, "Invalid name (must be String): #{name.inspect}!"
					end
					
					unless name =~ VALID_METRIC_NAME
						raise ArgumentError, "Invalid name (must match #{VALID_METRIC_NAME}): #{name.inspect}!"
					end
					
					unless type.is_a?(Symbol)
						raise ArgumentError, "Invalid type (must be Symbol): #{type.inspect}!"
					end
					
					# Description is optional but must be string if given:
					if description
						unless description.is_a?(String)
							raise ArgumentError, "Invalid description (must be String): #{description.inspect}!"
						end
					end
					
					# Unit is optional but must be string if given:
					if unit
						unless unit.is_a?(String)
							raise ArgumentError, "Invalid unit (must be String): #{unit.inspect}!"
						end
					end
					
					return Metric.new(name, type, description, unit)
				end
			end
		end
		
		Interface = Test::Interface
	end
end