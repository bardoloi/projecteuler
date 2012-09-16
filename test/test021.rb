require "test/unit"
require_relative "../problems/021.rb"

class TestProjectEuler < Test::Unit::TestCase
  
  def test_find_sum_of_proper_divisors
    assert_equal(220, find_sum_of_proper_divisors(284))
    assert_equal(284, find_sum_of_proper_divisors(220))
  end
  
  
  def test_find_amicable_numbers_below
    assert_equal([], find_amicable_numbers_below(100))
    assert_equal([220, 284], find_amicable_numbers_below(300).sort)
    #assert_equal([220, 284, 1184, 1210, 2620, 2924, 5020, 5564, 6232, 6368], find_amicable_numbers_below(10000))
  end
  
  def test_find_sum_of_amicable_numbers_below
    assert_equal(0, find_sum_of_amicable_numbers_below(100))
    assert_equal(504, find_sum_of_amicable_numbers_below(300))
    assert_equal(31626, find_sum_of_amicable_numbers_below(10000))
  end
    
end