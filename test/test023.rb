require "test/unit"
require_relative "../problems/023.rb"

class TestProjectEuler < Test::Unit::TestCase
  
  $f = FindAbundantNumbers.new

  def test_is_abundant
    assert_equal(true, $f.is_abundant?(12))
    assert_equal(false, $f.is_abundant?(11))    
  end

  
  def test_sum_of_unflagged_numbers
    $f.initialize_all_flags_as_false    
    $f.find_all_abundant_numbers_upto_limit    
    $f.flag_all_sums_of_abundant_nums

    # assert_equal(true, $f.is_sum_of_2_abundant_nums[24])
    # assert_equal(false, $f.is_sum_of_2_abundant_nums[23])
    
    assert_equal(4179871, $f.sum_of_unflagged_numbers)
  end

end