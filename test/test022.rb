require "test/unit"
require_relative "../problems/022/022.rb"

class TestProjectEuler < Test::Unit::TestCase
  
  $n = NameScore.new

  def test_get_name_value
    assert_equal(1, $n.get_name_value("A"))
    assert_equal(6, $n.get_name_value("ABC"))
    assert_equal(53, $n.get_name_value("COLIN"))
  end

  $n.read_names_file "problems/022/names.txt"

  def test_get_name_sorted_rank
    assert_equal(938, $n.get_name_sorted_rank("COLIN"))
  end
  
  def test_get_name_score
    assert_equal(49714, $n.get_name_score("COLIN"))
  end

  def test_get_sum_of_name_scores
    assert_equal(871198282, $n.get_sum_of_all_name_scores)
  end

  
end