# frozen_string_literal: true

require 'pry-byebug'

require 'simplecov'
SimpleCov.start

if ENV['CODECOV_TOKEN']
	require 'codecov'
	SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require_relative '../lib/module_methods'

require 'active_support/concern'
