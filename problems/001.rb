def sum_of_multiples_of_3or5_below_n(n)
  sum = 0
  1.upto(n-1) do |i|
    sum += i if i%3 == 0 || i%5 == 0      
  end  
  sum
end