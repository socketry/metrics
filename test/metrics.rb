# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2021-2022, by Samuel Williams.

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

describe Metrics do
	it "has a version number" do
		expect(Metrics::VERSION).to be =~ /\d+\.\d+\.\d+/
	end
	
	it "can invoke metric wrapper" do
		instance = MyClass.new
		
		instance.my_method(10)
	end
end
