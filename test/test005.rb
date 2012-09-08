require "test/unit"
require_relative "../problems/005.rb"

class TestProjectEuler < Test::Unit::TestCase
  def test_find_smallest_evenly_divisible
    assert_equal(2520, find_smallest_evenly_divisible(10))
    assert_equal(232792560, find_smallest_evenly_divisible(20))
  end
end
