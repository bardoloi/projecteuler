require "test/unit"
require "../problems/009.rb"

class TestProjectEuler < Test::Unit::TestCase
  def test_find_pythagorean_triplets
    abc = find_pythagorean_triplets()    
    assert_equal(31875000, abc)
  end
end
