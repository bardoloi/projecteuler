# http://projecteuler.net/problem=6

def sum_of_squares_minus_square_of_sums(n)
  (sum_of_squares_upto(n) - sum_of_ints_upto(n)**2).abs
end

def sum_of_squares_upto(n)
  n * (n + 1) * (2*n + 1) / 6
end

def sum_of_ints_upto(n)
  n * (n + 1) / 2
end