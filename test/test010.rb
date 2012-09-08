require "test/unit"
require_relative "../problems/010.rb"

class TestProjectEuler < Test::Unit::TestCase
  def test_sum_of_primes_less_than
    assert_equal(17, sum_of_primes_less_than(10))
    assert_equal(142913828922, sum_of_primes_less_than(2000000))
  end
end
