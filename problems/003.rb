# http://projecteuler.net/problem=3

require_relative "../project_euler.rb"

def largest_prime_factor_of(n)
  $pe = ProjectEuler.new
  $pe.all_prime_factors(n).max
end