require "test/unit"
require_relative "../problems/004.rb"

class TestProjectEuler < Test::Unit::TestCase
  def test_find_largest_product_palindrome
    assert_equal(9, find_largest_product_palindrome(1))
    assert_equal(9009, find_largest_product_palindrome(2))
    assert_equal(906609, find_largest_product_palindrome(3))
  end
end
