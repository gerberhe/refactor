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
		assert_equal '20.0%',@m.year_percent_in_seconds?(6307200)
	end

	def test_convert_to_military_time
		assert_equal "12:45",@m.convert_to_military_time("12:45 pm")
		assert_equal "16:24",@m.convert_to_military_time("4:24 pm")
		assert_equal "4:56",@m.convert_to_military_time("4:56 am")
		assert_equal "6:19",@m.convert_to_military_time("6:19 am")
	end

	def test_convert_to_standard_time
		assert_equal "12:45",@m.convert_to_standard_time("12:45")
		assert_equal "4:24",@m.convert_to_standard_time("16:24")
		assert_equal "4:56",@m.convert_to_standard_time("4:56")
		assert_equal "6:19",@m.convert_to_standard_time("6:19")
	end
end
