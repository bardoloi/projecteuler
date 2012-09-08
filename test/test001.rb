require "test/unit"
require_relative "../problems/001.rb"

class TestProjectEuler < Test::Unit::TestCase
  def test_sum_of_multiples_of_3or5_below_n
    assert_equal(23, sum_of_multiples_of_3or5_below_n(10))
    assert_equal(233168, sum_of_multiples_of_3or5_below_n(1000))
  end
end
