# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2021, by Samuel Williams.

source 'https://rubygems.org'

gemspec

group :test do
	gem "console"
	gem "ddtrace"
end

group :maintenance, optional: true do
	gem "bake-modernize"
	gem "bake-gem"
	
	gem "utopia-project"
end

group :test do
	gem "console"
	gem "ddtrace"
end
