require "project_euler.rb"

def largest_prime_factor_of(n)
  $pe = ProjectEuler.new
  $pe.all_prime_factors(n).max
end