require "test/unit"
require_relative "../problems/006.rb"

class TestProjectEuler < Test::Unit::TestCase
  def test_find_squares_diff
    assert_equal(2640, find_squares_diff(10))
    assert_equal(25164150, find_squares_diff(100))
  end
end
