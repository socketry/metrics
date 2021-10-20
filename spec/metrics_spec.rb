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

require 'metrics'

class MyClass
	def my_method(argument)
	end
end

if Metrics.enabled?
	# define constants?
end

Metrics::Provider(MyClass) do
	MYCLASS_CALL_COUNT = metric('my_class.call', :counter, description: 'Call counter.')
	
	def my_method(argument)
		MYCLASS_CALL_COUNT.emit(1, tags: ["foo", "bar"])
		
		super
	end
	
	# metric_call_counter :my_method
end

RSpec.describe Metrics do
	it "has a version number" do
		expect(Metrics::VERSION).not_to be nil
	end
	
	it "can invoke metric wrapper" do
		instance = MyClass.new
		
		# expect(instance).to receive(:metric_adjust).and_call_original
		
		instance.my_method(10)
	end
end
