require "monkeypatches.rb"
require "project_euler.rb"
require "test/unit"

class TestProjectEuler < Test::Unit::TestCase
  def test_pandigital?(n, a, b)
    assert_equal(true, ProjectEuler.new.pandigital?(12345, 1, 5))
    assert_equal(true, ProjectEuler.new.pandigital?(10234567, 0, 7))
    assert_equal(false, ProjectEuler.new.pandigital?(123456, 2, 5))
  end
  
  def test_get_sum_of_numbers_as_string
    numbers = ["8"]
    numbers << "8"
    assert_equal("16", get_sum_of_numbers_as_string(numbers))

    numbers = ["32"]
    numbers << "16"
    assert_equal("48", get_sum_of_numbers_as_string(numbers))

    numbers = ["38"]
    numbers << "16"
    assert_equal("54", get_sum_of_numbers_as_string(numbers))
  end  
end

class TestMonkeyPatches < Test::Unit::TestCase
  def test_monkeypatches
    #test factorial
    assert_equal(120, 5.factorial)
    assert_equal(false, 6.factorial == 200)
    #test palindrome?
    assert_equal(true, 12321.palindrome?)
    assert_equal(false, 12345.palindrome?)
    #test get_all_factors
    assert_equal([1,3,37,111], 111.get_all_factors)
    #test get_proper_divisors
    assert_equal([1, 11], 121.get_proper_divisors)
  end
end