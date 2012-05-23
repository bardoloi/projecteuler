require "monkeypatches.rb"

class ProjectEuler
  
  # find the nth number in the fibonacci sequence
  def fibonacci(n)
    return 1 if [1,2].include?(n)
    fibonacci(n-1) + fibonacci(n-2)
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
      n-=1
      next if (n+1)%2 == 0 && n > 1
      primes << n+1 if is_prime?(n+1) 
    end
    primes.sort
  end

  
  # find the first n primes
  def first_n_primes(n)
    primes = []
    case n
    when 1 then primes = [1]
    else  
      primes = [1,2]
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


  #given a triangle of numbers (i.e. where row n has n numbers), gets the sum of the largest chain
  def cumulative_sum_triangle(input_triangle)
    cumulative_sums_array = []

    (0..input.count-1).each do |line|
      if line==0
        cumulative_sums_array << input[0]
        next
      end

      last_line = cumulative_sums_array[line-1]

      current_line = []
      (0..line).each do |col|
        possible_values = []
        possible_values << input[line][col] + last_line[col]    unless col == line
        possible_values << input[line][col] + last_line[col-1]  unless col == 0
        current_line << possible_values.max
      end
      cumulative_sums_array << current_line
    end

    cumulative_sums_array.last.max
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
