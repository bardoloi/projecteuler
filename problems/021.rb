# http://projecteuler.net/problem=21

require_relative "../project_euler.rb"

def find_sum_of_proper_divisors(n)
  ProjectEuler.proper_divisors(n).reduce(0, :+)  
end


def find_amicable_numbers_below(n)
  amicable_numbers = []
  2.upto(n) do |i|
    next if amicable_numbers.include?(i)
    
    d_i = find_sum_of_proper_divisors(i)
    next if i == d_i || d_i > n
    
    amicable_numbers.push(i, d_i) if i == find_sum_of_proper_divisors(d_i)    
  end
  amicable_numbers
end


def find_sum_of_amicable_numbers_below(n)  
  find_amicable_numbers_below(n).reduce(0, :+)
end