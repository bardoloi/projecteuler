require "test/unit"
require_relative "../problems/024.rb"

class TestProjectEuler < Test::Unit::TestCase
  
  def test_nth_lexical_permutation_of
    assert_equal(  nil, nth_lexicographical_permutation_of([0, 1, 2], 0))
    assert_equal("012", nth_lexicographical_permutation_of([0, 1, 2], 1))
    assert_equal("021", nth_lexicographical_permutation_of([0, 1, 2], 2))
    assert_equal("102", nth_lexicographical_permutation_of([0, 1, 2], 3))
    assert_equal("120", nth_lexicographical_permutation_of([0, 1, 2], 4))
    assert_equal("201", nth_lexicographical_permutation_of([0, 1, 2], 5))
    assert_equal("210", nth_lexicographical_permutation_of([0, 1, 2], 6))
    assert_equal(  nil, nth_lexicographical_permutation_of([0, 1, 2], 7))    
    
    assert_equal("2783915460", nth_lexicographical_permutation_of([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 1_000_000))
  end

end