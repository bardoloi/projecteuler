# http://projecteuler.net/problem=16

# note: it feels like cheating to rely only on Ruby's ability
# to handle large powers of 2 (similar to BigNum in other languages) 
def cheat_find_sum_of_digits_in_pow_of_2(n)
  (2**n).to_s.split(//).reduce(0) { |sum, digit| sum += digit.to_i  }
end

# A better way: use the "string addition" we performed in problem 13
# 2**15 = 2**14 + 2**14
#       = (2**13 + 2**13) + (2**13 + 2**13)
#       = (2**12 + 2**12) + (2**12 + 2**12) + (2**12 + 2**12) + (2**12 + 2**12)
# ... and so on
# So we just need to recursively call the problem 13 method

require_relative "013.rb"

def find_digits_in_pow_of_2(n)
  return "1" if n == 0  
  digits_in_lower_power = find_digits_in_pow_of_2(n - 1)  
  get_sum_of_numbers_as_string([digits_in_lower_power, digits_in_lower_power])  
end

def find_sum_of_digits_in_pow_of_2(n)
  find_digits_in_pow_of_2(n).split(//).reduce(0){ |sum, digit| sum += digit.to_i }
end


# Let x = 2**1000
# Then 
# log10(x) = 1000*log10(2) 
#          = 1000*ln(2)/ln(10) 
#          = 301.03
# Thus 301 < log10(x) < 302
# Thus 10**301 < x < 10**302
# Thus x has 301 digits

# Let a be the first digit of 2**1000
# Thus a*(10**301) <= 2**1000 < (a+1)*(10**301)
# Thus a <= (2**1000)/(10**301) < a+1
# Using logarithms, (2**1000)/(10**301) = 1.072
# Thus a <= 1.072 < a+1
# Thus a = 1
