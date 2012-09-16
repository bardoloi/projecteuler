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

require_relative "../project_euler.rb"

def find_digits_in_pow_of_2(n)
  return "1" if n == 0
  digits_in_lower_power = find_digits_in_pow_of_2(n - 1)  
  $pe = ProjectEuler.new
  $pe.get_sum_of_numbers_as_string([digits_in_lower_power, digits_in_lower_power])  
end

def find_sum_of_digits_in_pow_of_2(n)
  find_digits_in_pow_of_2(n).split(//).reduce(0){ |sum, digit| sum += digit.to_i }
end
