require_relative "monkeypatches.rb"

class ProjectEuler
  
  class << self
  
    # find the nth number in the fibonacci sequence
    def fibonacci(n)
      return 1 if [1,2].include?(n)
      fibonacci(n-1) + fibonacci(n-2)
    end
  
  
    # return TRUE if a number is a palindrome
    def palindrome?(n)
      n.to_s == n.to_s.reverse
    end
  
  
    # calculate nPr - permutations  without repetition
    def num_of_permutations(n, r)
      (n.factorial)/((n-r).factorial)
    end
  
  
    # calculate nCr - combinations without repetition 
    def num_of_combinations(n, r)
      num_of_permutations(n, r)/(r.factorial)
    end
  
  
    # return all permutations of a string (characters may repeat)
    def all_permutations(str)
      # note: Ruby arrays have a built-in permutation method; we will write out own
      case str.length
      when 0..1 then [str]
      else
        all_perms = []
        str.split(//).uniq.each do |char| 
          subpermutations = all_permutations(str.sub(char, "")) # recursively call this method on the substring (excluding current character)
          subpermutations.each { |perm| all_perms.push( char + perm) } # add each permutation to the list
        end
        all_perms
      end #end case
    end


    # find the median of an array of numbers
    def median(arr)
      len = arr.length
      return nil if len == 0 
      return arr.sort[(len/2).floor] if len.odd?
      arr.sort.slice((len/2)-1, 2).min        
    end

  
    # find all primes less than the input number
    def primes_less_than(n)
      primes = []
      while n > 0
        n -= 1
        next if (n + 1)%2 == 0 && n > 1
        primes << (n + 1) if is_prime?(n + 1)
      end
      primes.sort
    end

  
    # find the first n primes
    def first_n_primes(n)
      primes = []
      case n
      when 1 then primes = []
      else  
        primes = [2]
        i = 3
        while primes.count < n
          primes << i if is_prime?(i)
          i+= 2
        end
      end
      primes
    end


    # checks if the number n is a-to-b pandigital 
    # e.g. 1112334445567888 is 1-to-8 pandigital, 13578 and 123456789 are not
    def pandigital?(n, a, b)    
      needed_digits = (a..b).to_a.to_s
      present_digits = n.to_s.split(//).uniq.sort.to_s
      needed_digits == present_digits
    end  

    
    def add_digit_factorials(num)
      sum = 0
      while (len = num.to_s.length) and num > 0
        digit,num = num.divmod(10**(len-1))
        sum+= digit.factorial
      end
      sum
    end
  
  
    # return the equivalent of input num (base 10) in base n
    def base_n(num, n)
      highest_pow = 0
      while num >= n**(highest_pow+1)
        highest_pow += 1
      end
    
      result = ""
      while highest_pow >= 0
        digit,num = num.divmod(n**highest_pow)
        result << digit.to_s
        highest_pow -= 1
      end
    
      result    
    end


    def get_all_factors_in_pairs(num)
      factors = [[1,num]]
      2.upto(Math.sqrt(num).floor).each do |i|
        factors << [i,num/i].sort if num%i == 0
      end
      factors.uniq
    end


    def proper_divisors(num)          
      a = all_factors(num)
      a.delete(num)
      a
    end

  
    def triangle_number(num)
      num < 0 ? 0 : num*(num + 1)/2
    end

  
    def all_factors(num)          
      factors = []
      powers = []
      as_powers_of_prime_factors(num).each do |k,v|
        factors << k
        powers << v
      end
              
      current_iteration = []    
      0.upto(factors.count - 1).each do |i|
        next_iteration = []    
        if i==0
          0.upto(powers[i]).each do |j|
            next_iteration << [j]
          end
        else
          current_iteration.each do |arr|
            0.upto(powers[i]).each do |j|
              next_iteration << arr.clone.concat([j])
            end
          end
        end
        current_iteration = next_iteration
      end
      eigenvectors = current_iteration
    
      eigenvalues = []
      0.upto(eigenvectors.count-1) do |i|
        eigenvalues[i] = 1        
        0.upto(eigenvectors[i].count-1) do |j|
          eigenvalues[i] *= factors[j]**eigenvectors[i][j]
        end
      end
      eigenvalues.sort!
    end
  
  
    def is_prime?(num)
      return false if num <= 1   
      return true if num == 2
    
      factor_found = false    
      2.upto(Math.sqrt(num).floor).each do |i|
        if num%i == 0
          factor_found = true
          break
        end
      end
      !factor_found
    end

  
    def all_prime_factors(num)
      factors = []
      as_powers_of_prime_factors(num).each do |k,v|
        factors << k
      end    
      factors
    end

    # returns a hash with key as the prime factor and val as the power of that factor
    def as_powers_of_prime_factors(num)
      factors = Hash.new
      factors[1] = 1
  
      i = 2    
      while num > 1
        factors[i] = 0
        while num%i == 0
          num/=i
          factors[i] += 1
        end
        i += 1
      end
      factors.select{ |k,v|  v > 0 && k > 1}
    end  

  
    # array of the digits that make up the input number
    def component_digits(n, unique = false)
      digits = n.to_s.split(//).map { |i| i.to_i }
      unique ? digits.uniq.sort : digits.sort 
    end
  
  
    # An alternative to adding large numbers (e.g. 100+ digit numbers):
    # represent the numbers as strings and add them up one from right to left
    # PERFORMANCE NOTE: Since Ruby strings are mutable, these operations are not as resource-intensive 
    # as they would be in other languages
    def get_sum_of_numbers_as_string(numbers_as_str)  
      sums_by_position = []

      # Step 1: Split each number (as str) into its component digits,  
      # then separately add up the digits in 1's place, the digits in 10's place, and so on.
      # Store the sum of digits in 1's place at sums_by_position[0], sum of 10's place at sums_by_position [1], and so on
      numbers_as_str.each do |num|
        num.reverse.split(//).each_index do |i|
          sums_by_position[i] = 0 if sums_by_position[i].nil?      
          sums_by_position[i] += num.reverse[i,1].to_i
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

      # Get the digits by combining the sums back together 
      digits = ""
      (sums_by_position.count - 1).downto(0) do |i|
        digits << sums_by_position[i].to_s
      end  

      digits  
    end
  
  
    # returns TRUE if the input number is a circular prime
    # 197 is a circular prime because 197, 971, 719 are all primes
    def is_circular_prime(n)
      if n < 10
        return true if [2,3,5,7].include?(n)
        return false
      end

      digits = component_digits(n)
      return false if digits.include?(0) || digits.include?(2) || digits.include?(4) || digits.include?(5) || digits.include?(6) || digits.include?(8)
    
      is_circ_prime = true  # initialize as true
      digits.length.times {
        is_circ_prime = is_prime?(digits.unshift(digits.pop).to_s.to_i)
        break if !is_circ_prime
      }    
      is_circ_prime
    end
  
  
    # ---------- sorting questions -----------------------------------------------
  
    # Problem 1: sorting a stack of pancakes
    # Given: a vertical stack of pancakes, all of different diameters, sorted randomly
    # Task: provide the steps required to flip them into ascending order (largest pancake at the bottom)
    # e.g. Unsorted: [5 3 2 6 1 4] -> Sorted: [1 2 3 4 5 6] (the topmost pancake is at index 0)
    # Criteria: you can only re-sort pancakes by flipping a substack, e.g. [3 2 1 4 5] -> flip(3) -> [1 2 3 4 5]  
    # flip(i) puts your ladle below the ith pancake from the top, and flips all the pancakes above it (including the ith)
    # flip(n) flips the entire stack - i.e. reverses its order
    def sort_stack_of_pancakes(pancakes)
      # Approach:
      # 1. Find the largest pancake in the stack and move it to the bottom
      # 2. Recursively call the method on the smaller substacks

      stack_size = pancakes.length
      return [] if stack_size <= 1
    
      flips = []
      # move the largest pancake to the bottom
      pos_of_largest_pancake = pancakes.index(pancakes.max) + 1
      if pos_of_largest_pancake == 1  # largest one is at the top
        pancakes = pancakes.reverse # flip all the pancakes
        flips << stack_size
      elsif pos_of_largest_pancake < stack_size # largest one is somewhere in the middle
        pancakes[0, pos_of_largest_pancake] = pancakes[0, pos_of_largest_pancake].reverse #flip the substack
        pancakes = pancakes.reverse # flip all the pancakes
        flips << pos_of_largest_pancake << stack_size
      end

      # now recurse on the remaining substacks
      flips+= sort_stack_of_pancakes(pancakes[0, stack_size - 1])  
    end  
    
    # -------------------- In progress -------------------------------------------------------
  end
end
