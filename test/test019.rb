require "test/unit"
require 'date'
require_relative "../problems/019.rb"

class TestProjectEuler < Test::Unit::TestCase
  
  def test_count_wdays_on_first_of_months    
    start_date = Date.parse('1900-01-01')
    end_date = Date.parse('1900-02-01')
    wday = 1 # look for mondays    
    assert_equal(1, count_wdays_on_first_of_months(start_date, end_date, wday))

    start_date = Date.parse('1901-01-01')
    end_date = Date.parse('2000-12-31')
    wday = 0 # look for sundays    
    assert_equal(1, count_wdays_on_first_of_months(start_date, end_date, wday))
  end
  
end