# http://projecteuler.net/problem=13

require_relative "../project_euler.rb"

def get_first_n_digits_of_sum(numbers, n)
  ProjectEuler.get_sum_of_numbers_as_string(numbers)[0, n]
end
