require "test/unit"
require_relative "../problems/012.rb"

class TestProjectEuler < Test::Unit::TestCase
  def test_find_triangle_number
    assert_equal(3, find_triangle_number(2))
    assert_equal(28, find_triangle_number(5))
    assert_equal(76576500, find_triangle_number(500))
  end
end
