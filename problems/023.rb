# http://projecteuler.net/problem=23

require_relative "../project_euler.rb"

class FindAbundantNumbers
  
  AbundantNumLimit = 28123
  
  attr_accessor :is_sum_of_2_abundant_nums, :abundant_nums
  
  def initialize_all_flags_as_false
    1.upto(AbundantNumLimit) { |i| @is_sum_of_2_abundant_nums[i] = false }
  end
  
  def initialize
    @abundant_nums = []
    @is_sum_of_2_abundant_nums = []
  end
  
  def find_all_abundant_numbers_upto_limit
    1.upto(AbundantNumLimit) { |i| @abundant_nums << i if is_abundant?(i) }
  end
  
  def is_abundant?(n)
    n < ProjectEuler.proper_divisors(n).reduce(0){ |sum, i| sum += i }
  end
  
  def flag_all_sums_of_abundant_nums
    cnt = @abundant_nums.count
    
    0.upto(cnt-1) do |i|
      break if i > AbundantNumLimit
      
      i.upto(cnt-1) do |j|
        sum = @abundant_nums[i] + @abundant_nums[j]        
        break if sum > AbundantNumLimit
        @is_sum_of_2_abundant_nums[sum] = true
      end
    end
  end
  
  def sum_of_unflagged_numbers
    sum = 0
    1.upto(AbundantNumLimit) do |i| 
      sum += i if @is_sum_of_2_abundant_nums[i] == false
    end
    sum
  end
  
end

# $f = FindAbundantNumbers.new
# $f.find_all_abundant_numbers_upto_limit
# $f.flag_all_sums_of_abundant_nums
# p $f.sum_of_unflagged_numbers



