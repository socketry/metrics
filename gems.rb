# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2021-2024, by Samuel Williams.

source 'https://rubygems.org'

gemspec

group :test do
	gem "sus", "~> 0.13"
	gem "covered", "~> 0.16"
	
	gem "bake-test", "~> 0.2"
	gem "bake-test-external", "~> 0.2"
	
	gem "console"
end

group :maintenance, optional: true do
	gem "bake-modernize"
	gem "bake-gem"
	
	gem "utopia-project"
end
