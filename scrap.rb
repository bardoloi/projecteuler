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

a1 = ARGV[0]

0,0,r
0,r,0
r,0,0
# 0,r,r
# r,0,r
# r,r,0
# r,r,r
0,0,-r
0,-r,0
-r,0,0
# 0,-r,-r
# -r,0,-r
# -r,-r,0
# -r,-r,-r


# 200p: 1
# 100p: 2
# 50p: 4
# 20p: 10
# 10p: 20
# 5p: 40
# 2p: 100
# 1p: 200

# arrive_at_89 = [89, 145, 24, 2, 4, 16, 37, 58]
# i = number_of_89s = 0
# a1.to_i.times do
#   i+= 1  
#   sums = digits = i.to_s.gsub('0', '').split(//).sort.to_s.to_i
# 
#   if arrive_at_89.include?(digits)
#     number_of_89s += 1
#   else
#     until arrive_at_89.include?(sums) || sums == 1
#       sums = $pe.component_digits(sums).reduce(0) { |prod, n| prod+= n*n }
#     end  
#     if arrive_at_89.include?(sums)
#       number_of_89s += 1
#       arrive_at_89 << digits
#     end
#   end
#   # puts "For #{i}: #{sums}" 
# end
# puts number_of_89s

# circular_primes = []
# (1..999999).to_a.each do |i|
#   next if i > 2 && i.even?
#   unless circular_primes.include?(i.to_s)
#     if $pe.is_circular_prime(i)
#       cp = i.to_s.split(//)
#       i.to_s.length.times do
#         circular_primes << cp.unshift(cp.pop).to_s 
#       end
#       puts i
#     end
#   end
# end
# puts circular_primes.uniq.count

# def is_concat_of_products(n)
#   (1...n.length).each do |i|
#     basenum = n[0, i].to_i
#     concatnum = ""
#     (1..9).to_a.each do |j|
#       concatnum << (basenum*j).to_s
#       break if concatnum.length >= n.length
#     end
#     return basenum if concatnum == n
#   end
#   -1
# end
# 
# (1..9).to_a.permutation.sort.reverse.each do |num|
#   basenum = is_concat_of_products(num.to_s)
#   if basenum > -1
#     puts basenum
#     break
#   end 
# end

# while a >= mins
#   a-= 1
#   if $pe.pandigital?(a, 1, 9)
#     basenum = is_concat_of_products(a.to_s)  
#     break unless basenum == -1  
#   end
# end
# p a


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
