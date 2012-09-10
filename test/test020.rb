require "test/unit"
require_relative "../problems/020.rb"

class TestProjectEuler < Test::Unit::TestCase
  
  def test_find_digits_in_factorial
    assert_equal("362880", find_digits_in_factorial(9))
    assert_equal("3628800", find_digits_in_factorial(10))
  end
  
  
  def test_find_sum_of_digits_in_factorial
    assert_equal(27, find_sum_of_digits_in_factorial(10))
    assert_equal(648, find_sum_of_digits_in_factorial(100))
  end
  
end