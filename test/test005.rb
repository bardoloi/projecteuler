require "test/unit"
require "problems/005.rb"

class TestProjectEuler < Test::Unit::TestCase
  def test_find_smallest_evenly_divisible
    assert_equal(2520, find_smallest_evenly_divisible(10)))
    assert_equal(9009, find_largest_product_palindrome(2))
    assert_equal(906609, find_largest_product_palindrome(3))
  end
end
