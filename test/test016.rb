require "test/unit"
require_relative "../problems/016.rb"

class TestProjectEuler < Test::Unit::TestCase

  def test_cheat_find_sum_of_digits_in_pow_of_2
    assert_equal(26, cheat_find_sum_of_digits_in_pow_of_2(15))
    assert_equal(1366, cheat_find_sum_of_digits_in_pow_of_2(1000))
  end
  
  def test_find_digits_in_pow_of_2
    assert_equal("1", find_digits_in_pow_of_2(0))
    assert_equal("2", find_digits_in_pow_of_2(1))
    assert_equal("8", find_digits_in_pow_of_2(3))
    assert_equal("16", find_digits_in_pow_of_2(4))
    assert_equal("1024", find_digits_in_pow_of_2(10))
    assert_equal("32768", find_digits_in_pow_of_2(15))
  end

  def test_find_sum_of_digits_in_pow_of_2
    assert_equal(1, find_sum_of_digits_in_pow_of_2(0))
    assert_equal(2, find_sum_of_digits_in_pow_of_2(1))
    assert_equal(7, find_sum_of_digits_in_pow_of_2(4))
    assert_equal(11, find_sum_of_digits_in_pow_of_2(7))
    assert_equal(26, find_sum_of_digits_in_pow_of_2(15))
    assert_equal(1366, find_sum_of_digits_in_pow_of_2(1000))
  end

end