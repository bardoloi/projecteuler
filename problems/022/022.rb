# http://projecteuler.net/problem=22

class NameScore

  attr_accessor :names

  def initialize
    @names = []
  end

  def read_names_file(fname)
    File.open(fname, 'r') do |file|
      file.gets.split(',').each do |name|
        @names << name.gsub('"', '')
      end
    end
    @names.sort!
  end

  def get_name_sorted_rank(name)
    @names.index(name) + 1    # adding 1 since index starts at 0
  end

  def get_name_value(name)
    base = "A".ord - 1
    name.upcase.split(//).reduce(0){ |sum, s| sum += s.ord - base }
  end

  def get_name_score(name)  
    get_name_sorted_rank(name) * get_name_value(name)
  end

  def get_sum_of_all_name_scores  
    @names.reduce(0){ |sum, name| sum += get_name_sorted_rank(name) * get_name_value(name) }
  end

end