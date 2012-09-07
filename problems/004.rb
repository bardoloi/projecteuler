# Works for any n > 0 where n is no. of digits
# Optimizations exist if you want to solve this for 3-digit numbers only, 
# but I didn't find optimizations for any n > 0

require "project_euler.rb"

def find_largest_product_palindrome(no_of_digits)
  
  $pe = ProjectEuler.new

  largest_palindrome = 0  
  max_n_digit_num = (10**no_of_digits) - 1  
  min_n_digit_num = 10**(no_of_digits - 1)  

  max_n_digit_num.downto(smallest_n_digit_num) do |x|
    x.downto(min_n_digit_num) do |y|
        prod = x*y
        if $pe.palindrome?(prod)
          largest_palindrome = prod if prod > largest_palindrome
          break # won't find a bigger palindrome for this value of x
        end
    end
  end
  
  largest_palindrome
end