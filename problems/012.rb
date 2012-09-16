# http://projecteuler.net/problem=12

require_relative "../project_euler.rb"

def find_triangle_number(min_no_of_divisors)
  n = 0
  no_of_divisors = 0

  while no_of_divisors < min_no_of_divisors  
    n += 1
    no_of_divisors = ProjectEuler.triangle_number(n).get_all_factors.count # get_all_factors is a monkeypatch (see monkeypatches.rb in the home folder)
  end
    
  $pe.triangle_number(n)
end