# http://projecteuler.net/problem=5

require_relative "../project_euler.rb"

def find_smallest_evenly_divisible(n)
  all_factors = {}
  
  (1..n).each do |i|
    ProjectEuler.as_powers_of_prime_factors(i).each do |factor, power|      
      all_factors.merge!({ factor => power }) do |key, oldval, newval| 
        (newval > oldval) ? newval : oldval 
      end
    end    
  end
  
  prod = 1
  all_factors.each do |factor, power|
    prod *= factor**power
  end
  
  prod
end