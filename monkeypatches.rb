class Integer
  
  # calculate factorial of any number
  def factorial
    return 1 if self<=0
    (1..self).reduce(:*)
  end
  
  # check if the input number is a palindrome
  def palindrome?
    self.to_s == self.to_s.reverse
  end
  
  # get all the factors of the number, including itself
  def get_all_factors
    factors = [1,self]
    2.upto(Math.sqrt(self).floor).each do |i|
      factors.concat([i,self/i]) if self%i == 0
    end
    factors.uniq.sort!
  end

  # get the proper divisors of a number (i.e. all factors smaller than itself)
  def get_proper_divisors
    self.get_all_factors.reject{ |i| i==self }
  end
    
end
