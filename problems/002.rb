# http://projecteuler.net/problem=2

# require_relative "../project_euler.rb"

def sum_of_even_fibonacci_numbers_below_n(n)
  prev_fib_num = ProjectEuler.fibonacci(1)
  return 0 if n < prev_fib_num

  current_fib_num = ProjectEuler.fibonacci(2)
  
  sum = 0  
  while current_fib_num < n
    sum += current_fib_num if current_fib_num.even?
    
    # increment current_fib_num and prev_fib_num to the next respective fibonacci numbers    
    current_fib_num += prev_fib_num 
    prev_fib_num = current_fib_num - prev_fib_num
  end
  
  sum
end

sum_of_even_fibonacci_numbers_below_n(100)

