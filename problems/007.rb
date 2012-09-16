# http://projecteuler.net/problem=7

require_relative "../project_euler.rb"

def find_nth_prime(n)
  ProjectEuler.first_n_primes(n).last
end