# http://projecteuler.net/problem=2

require_relative "../project_euler.rb"

def sum_of_even_fibonacci_numbers_below_n(n)  
  sum = 0

  first = ProjectEuler.fibonacci(1)
  second = ProjectEuler.fibonacci(2)

  return sum if first > n  
  sum += first if first.even?
  
  while second < n
    sum += second if second.even?

    second += first 
    first = second - first
  end
  
  sum
end

sum_of_even_fibonacci_numbers_below_n(100)

