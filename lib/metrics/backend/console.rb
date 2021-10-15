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

module Metrics
	module Backend
		module Register
			def metric_register(name, type, **options)
				Console.logger.debug(self) {"Registering metric #{name} (#{type}): #{options}."}
			end
		end
		
		def self.prepended(provider)
			provider.extend(Register)
		end
		
		private
		
		# Relative metric adjustment.
		def metric_adjust(name, amount = 1, attributes: nil)
			Console.logger.info(self, name, "+= #{amount}", attributes)
		end
		
		# Absolute metric assignment.
		def metric_count(name, value, attributes: nil)
			Console.logger.info(self, name, "= #{amount}", attributes)
		end
		
		# Relative metric measurement.
		def metric_measure(name, value, attributes: nil)
			Console.logger.info(self, name, "<< #{amount}", attributes)
		end
	end
end
