require "test/unit"
require "problems/002.rb"

class TestProjectEuler < Test::Unit::TestCase
  def test_sum_of_even_fibonacci_numbers_below_n
    assert_equal(0, sum_of_even_fibonacci_numbers_below_n(2))
    assert_equal(2, sum_of_even_fibonacci_numbers_below_n(3))
    assert_equal(44, sum_of_even_fibonacci_numbers_below_n(90))
    assert_equal(4613732, sum_of_even_fibonacci_numbers_below_n(4000001))
  end
end
