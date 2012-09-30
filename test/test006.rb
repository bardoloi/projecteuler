require "test/unit"
require_relative "../problems/006.rb"

class TestProjectEuler < Test::Unit::TestCase
  def test_sum_of_squares_minus_square_of_sums
    assert_equal(2640, sum_of_squares_minus_square_of_sums(10))
    assert_equal(25164150, sum_of_squares_minus_square_of_sums(100))
  end

  def test_sum_of_squares_upto
    assert_equal(385, sum_of_squares_upto(10))
  end

  def test_sum_of_ints_upto
    assert_equal(55, sum_of_ints_upto(10))
  end

end
