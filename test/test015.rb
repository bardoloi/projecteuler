require "test/unit"
require_relative "../problems/015.rb"

class TestProjectEuler < Test::Unit::TestCase
  def test_find_number_of_routes_across_grid
    assert_equal(6, find_number_of_routes_across_grid(2, 2))
    assert_equal(137846528820, find_number_of_routes_across_grid(20, 20))
  end
end
