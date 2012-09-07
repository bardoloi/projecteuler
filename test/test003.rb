require "test/unit"
require "problems/003.rb"

class TestProjectEuler < Test::Unit::TestCase
  def test_largest_prime_factor_of
    assert_equal(29, largest_prime_factor_of(13195))
    assert_equal(6857, largest_prime_factor_of(600851475143))
  end
end
