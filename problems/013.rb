# http://projecteuler.net/problem=13

require_relative "../project_euler.rb"

def get_first_ten_digits_of_sum(numbers)
  
  sums_by_position = []

  # Step 1: Split each number into its component digits,  
  # then separately add up the digits in 1's place, the digits in 10's place, and so on.
  # Store the sum of digits in 1's place at sums_by_position[0], sum of 10's place at sums_by_position [1], and so on
  numbers.each do |num|
    num.reverse!.split(//).each_index do |i|
      sums_by_position[i] = 0 if sums_by_position[i].nil?      
      sums_by_position[i] += num[i,1].to_i
    end
  end
  
  # Step 2: Carry over from the 1's sum into the 10's, then from the 10's into the 100's, and so on
  0.upto(sums_by_position.count - 1) do |i|
    carry_over, sums_by_position[i] = sums_by_position[i].divmod(10)
    
    if carry_over > 0
      sums_by_position[i+1] = 0 if sums_by_position[i+1].nil?
      sums_by_position[i+1] += carry_over
    end    
  end
  
  # Get the first 10 digits by combining the sums back together 
  first_10_digits = ""
  (sums_by_position.count - 1).downto(0) do |i|
    first_10_digits << sums_by_position[i].to_s
    break unless first_10_digits.length < 10
  end
  
  first_10_digits[0, 10]
end