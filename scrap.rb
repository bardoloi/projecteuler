require "project_euler.rb"
$pe = ProjectEuler.new

puts "*"*20 + "Start" + "*"*20  

#-------------------------------
unless  ARGV.empty?
  puts "Arguments:"
  ARGV.each do |arg|
    puts arg
  end
  puts "*"*10
end
#-------------------------------

#a1 = ARGV[0].to_i

#a = [7, 2, 3, 4, 5, 2, 1, 3, 4, 8, 7, 4]
a = [5, 4, 3, 2, 1]
p a
p $pe.stack_o_pancakes(a)




# # find the median
# f = $pe.median(a1)
# puts f


# i = 1
# found = false
# while !found
#   i += 2
#   factors = $pe.as_powers_of_prime_factors(i)
#   found = true if factors.count == a1
#   puts "Factors: #{factors.inspect}" if found
# end
# 
# puts "#{i}"

# n = 987654323
# found = false
# while !found and n >= 918273645
#   n -= 1
#   puts "Checking if #{n} is pandigital"
#   next unless $pe.pandigital?(n, 9)
# 
#   #check if this is a concat of the first i numbers
#   (1..8).each do |i|
#     num = n.to_s[0,i].to_i
#     
#     concatnum = ""
#     j = 1
#     while concatnum.length < 9
#       concatnum << (num*j).to_s
#       j += 1
#     end
#     found = true if concatnum == n.to_s
#     break if found
#   end  
#   break if found
# end
# 
# puts n if found
# puts "Not found!" unless found


# def is_abundant?(n)
#   $pe.get_proper_divisors(n).reduce(:+).to_i > n
# end 
# 
# all_numbers = (1..a1).to_a
# abundants = []
# 
# (1..a1).each do |i|
#   puts i
#   if is_abundant?(i)
#     abundants << i
#     abundants.each do |j|
#       all_numbers.reject!{ |k| k == (i + j) }
#     end
#   end
# end
# 
# puts all_numbers.reduce(:+)



# def dec_n(n)
#   sum = 0
#   no_of_digits = 0
#   while sum < n
#     sum += 9*(no_of_digits+1)*(10**(no_of_digits))
#     no_of_digits += 1
#   end
#   sum -= 9*no_of_digits*(10**(no_of_digits-1))
#     
#   digit_no, place_no = (n-sum).divmod(no_of_digits)
#   if place_no == 0
#     place_no = no_of_digits
#     digit_no -= 1
#   end 
#   
#   number = 10**(no_of_digits-1) + digit_no
#   digit_of_interest = number.to_s[place_no-1,1].to_i
# end
# 
# puts (0..6).reduce(1){ |prod,i| prod*dec_n(10**i) }


#-------------------------------
puts "*"*20 + "Finish" + "*"*20

