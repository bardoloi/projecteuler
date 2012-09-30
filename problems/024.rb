# http://projecteuler.net/problem=24

# Method:
# The 1st lexicographical permutation is the 0th mathematical permutation (i.e. the default sort order)
# The 2nd lexicographical permutation is the 1st mathematical permutation
# ...
# The 1,000,000th lexicographical permutation is the 999,999th mathematical permutation

# 999,999 = 2*(9!) + 274,239
#         = 2*(9!) + 6*(8!) + 32,319
#         = ....
#         = ....
#         = 2*(9!) + 6*(8!) + 6*(7!) + 2*(6!) + 5*(5!) + 1*(4!) + 2*(3!) + 1*(2!) + 1*(1!)
#         = 2*(9!) + 6*(8!) + 6*(7!) + 2*(6!) + 5*(5!) + 1*(4!) + 2*(3!) + 1*(2!) + 1*(1!) + 0*(0!)

# Thus, the 1_000_000th lexicographical permutation is found recursively like this:
#   the digit at index 2 in [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]  => 2
# + the digit at index 6 in [0, 1, 3, 4, 5, 6, 7, 8, 9]     => 7
# + the digit at index 6 in [0, 1, 3, 4, 5, 6, 8, 9]        => 8
# + the digit at index 2 in [0, 1, 3, 4, 5, 6, 9]           => 3
# + the digit at index 5 in [0, 1, 4, 5, 6, 9]              => 9
# + the digit at index 1 in [0, 1, 4, 5, 6]                 => 1
# + the digit at index 2 in [0, 4, 5, 6]                    => 5
# + the digit at index 1 in [0, 4, 6]                       => 4
# + the digit at index 1 in [0, 6]                          => 6
# + the remaining digits in [0]                             => 0
# ==> 2783915460


require_relative "../project_euler.rb"


def nth_lexicographical_permutation_of(digits_array, n)
  return nil if digits_array.length == 0 

  # end if n is outside the range of total number of possible combinations
  return nil if n > digits_array.length.factorial or n < 1

  # the nth lexicographical permutation is the (n-1)th mathematical permutation 
  nth_permutation_of(digits_array.sort, n-1)
end  

  
def nth_permutation_of(digits_array, n)

  # recursion ends if array size reaches 1 or less
  return "" if digits_array.length < 1
  return digits_array.join if digits_array.length == 1

  # recursion also ends if n is less than 1 (i.e. an exact divisor was found on the previous iteration)
  return digits_array.join if n < 1

  k = (digits_array.length - 1).factorial

  index, n_mod = n.divmod(k)
  
  left_digit = digits_array[index]
  remaining_digits = digits_array.reject{ |i| i == left_digit }
  
  return left_digit.to_s + nth_permutation_of(remaining_digits, n_mod)  
end