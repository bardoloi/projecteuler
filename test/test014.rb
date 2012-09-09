require "test/unit"
require_relative "../problems/014.rb"

class TestProjectEuler < Test::Unit::TestCase
  
  $c = Collatz.new
  
  def test_get_collatz_next_step
    assert_equal(40, $c.get_collatz_next_step(13))
    assert_equal(20, $c.get_collatz_next_step(40))
    assert_equal(10, $c.get_collatz_next_step(20))
    assert_equal(5, $c.get_collatz_next_step(10))
    assert_equal(16, $c.get_collatz_next_step(5))
    
    assert_equal(1, $c.get_collatz_next_step(1))
    assert_equal(1, $c.get_collatz_next_step(0))
    assert_equal(1, $c.get_collatz_next_step(-1))
  end
    
  def test_get_chain_length
    assert_equal(10, $c.get_chain_length(13))
    assert_equal(9, $c.get_chain_length(40))
  end
  
  def test_get_chain
    assert_equal([1, 2, 4, 8].sort, $c.get_chain(8))
    assert_equal([1, 2, 4, 8, 16, 5, 10, 20, 40, 13], $c.get_chain(13))
  end

  def test_find_seed_of_longest_chain
    assert_equal(1, $c.find_seed_of_longest_chain(1))
    assert_equal(9, $c.find_seed_of_longest_chain(13))    
    assert_equal(837799, $c.find_seed_of_longest_chain(1000000))    
  end
  
end
