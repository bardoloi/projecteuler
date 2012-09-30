# http://projecteuler.net/problem=4

# Works for any n > 0 where n is no. of digits
# Optimizations exist if you want to solve this for 3-digit numbers only, 
# but I didn't find optimizations for any n > 0

require_relative "../project_euler.rb"

def find_largest_product_palindrome(no_of_digits)
  
  largest_palindrome = 0  
  n_max = (10**no_of_digits) - 1        # largest n-digit number
  n_min = 10**(no_of_digits - 1) + 1    # smallest n-digit number not ending in 0

  n_max.downto(n_min) do |x|
    next if x.modulo(10) == 0           # palindrome cannot end in 0
    x.downto(n_min) do |y|
      next if y.modulo(10) == 0
      prod = x*y
      if prod.palindrome?               # monkeypatch
        largest_palindrome = prod if prod > largest_palindrome
        break                           # no bigger palindrome for this value of x
      end
    end
  end
  
  largest_palindrome
end