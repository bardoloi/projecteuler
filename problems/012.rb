# http://projecteuler.net/problem=12

require_relative "../project_euler.rb"

def find_triangle_number(min_no_of_divisors)
  n = 0
  no_of_divisors = 0
  $pe = ProjectEuler.new

  while no_of_divisors < min_no_of_divisors  
    n += 1
    nth_triangle_number = n * (n + 1) / 2
    no_of_divisors  =  $pe.all_factors(nth_triangle_number).count
  end
    
  n * (n + 1) / 2
end