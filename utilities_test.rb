require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative 'utilities'

class Methods2Test < MiniTest::Test
	def setup
		@m = Class.new do
     include Utilities
   	end.new
	end

	# Tests go here
	def test_leap_year
		assert_equal true,@m.leap_year?(400)
		assert_equal false,@m.leap_year?(100)
		assert_equal false,@m.leap_year?(50)
		assert_equal false,@m.leap_year?(99)
		assert_equal true,@m.leap_year?(16)
	end

	def test_year_percent_in_seconds
		assert_equal '1.0%',@m.year_percent_in_seconds?(315360)
		assert_equal '10.0%',@m.year_percent_in_seconds?(3153600)
	end
end
