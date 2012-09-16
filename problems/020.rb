# http://projecteuler.net/problem=20

require_relative "../project_euler.rb"


# The logic: instead of calculating large factorials directly, we can 
# use addition to compute the large numbers via string manipulation, like in problem 13.
# n! = n * (n-1)! = Add (n-1)! to itself n times

# We also use recursion to add the numbers:
# To calculate 10!, we can add 9! to itself 10 times, 
# to calculate 9!, we can add 8! to itself 9 times, 
# ... and so on

def find_digits_in_factorial(n)
  return "1" if n <= 1  # as 0! = 1! = 1
  
  # add (n-1)! to itself n times
  prev_factorial = find_digits_in_factorial(n-1)
      
  numbers = []
  n.times { numbers << prev_factorial }

  ProjectEuler.get_sum_of_numbers_as_string(numbers)  
end


def find_sum_of_digits_in_factorial(n)
  find_digits_in_factorial(n).split(//).reduce(0) { |sum, i| sum += i.to_i }
end