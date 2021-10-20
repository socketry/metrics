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
		module Console
			class Metric < Metrics::Metric
				def emit(value, tags: nil, sample_rate: 1.0)
					::Console.logger.info(self, @name, value, tags)
				end
			end
			
			module Interface
				def metric(name, type, description: nil, unit: nil, &block)
					return Metric.new(name, type, description, unit)
				end
				
				# def metric_call_counter(name, description: nil, tags: nil)
				# 	metric = self.metric(...)
				# 
				# 	self.define_method(name) do
				# 		metric.emit(1)
				#			super
				# 	end
				# end
			end
		end
		
		Interface = Console::Interface
	end
end

