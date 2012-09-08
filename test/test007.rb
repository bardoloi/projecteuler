require "test/unit"
require_relative "../problems/007.rb"

class TestProjectEuler < Test::Unit::TestCase
  def test_find_nth_prime
    assert_equal(13, find_nth_prime(6))
    assert_equal(104743, find_nth_prime(10001))
  end
end
