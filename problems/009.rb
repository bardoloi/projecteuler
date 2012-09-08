# http://projecteuler.net/problem=9

# The math: 
# ----------
# a + b + c = 1000
# => (a + b + c)**2 = 1000000
# => a**2 + b**2 + c**2 + 2ab + 2bc + 2ca = 1000000
# Replace c**2 with (a**2 + b**2) as they are Pyth. triplets
# => 2*(a**2 + b**2) + 2ab + 2c(a + b) = 1000000
# Replace c with (1000 - a - b)
# => 2*(a**2 + b**2) + 2ab + 2(a+b)(1000 - a - b) = 1000000
# Reduce the left hand side of this equation, we get:
# 2000(a+b) - 2ab = 1000000

# As a < b < c and a + b + c = 1000, b cannot exceed 499, and so a cannot exceed 498

def find_pythagorean_triplets
  1.upto(498) do |a|
    (a+1).upto(499) do |b|
      if (1000*(a + b) - (a * b)) == 500000
        c = Math.sqrt((a**2) + (b**2)).to_i
        p "A: #{a}, B: #{b}, C: #{c}"
        return a * b * c
      end
    end
  end
  return -1
end