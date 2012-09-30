# http://projecteuler.net/problem=1

def sum_of_multiples_of_3or5_below_n(n)
  (1...n).select{ |i| i%3 == 0 || i%5 == 0 }.reduce(:+)
end
