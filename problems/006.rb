# http://projecteuler.net/problem=6

def find_squares_diff(n)
  sum_of_squares = 1.upto(n).reduce(0){ |sum, i| sum += i**2 }
  square_of_sum = (1.upto(n).reduce(0){ |sum, i| sum += i })**2
    
  (sum_of_squares - square_of_sum).abs
end