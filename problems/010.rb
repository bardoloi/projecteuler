# http://projecteuler.net/problem=10

require_relative "../project_euler.rb"

def sum_of_primes_less_than(n)
  $pe = ProjectEuler.new
  $pe.primes_less_than(n).reduce(0) { |sum, i| sum += i }
end