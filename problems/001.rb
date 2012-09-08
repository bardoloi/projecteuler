# http://projecteuler.net/problem=1

def sum_of_multiples_of_3or5_below_n(n)
  m = (1...n).to_a.reduce(0) do |sum, i|
    sum += i if i%3 == 0 || i%5 == 0
    sum += 0
  end
end
