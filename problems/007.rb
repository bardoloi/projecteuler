# http://projecteuler.net/problem=7

require_relative "../project_euler.rb"

def find_nth_prime(n)
  $pe = ProjectEuler.new
  $pe.first_n_primes(n).last
end