# http://projecteuler.net/problem=8

def find_greatest_product(str)
  return 0 if str.length < 5
  
  max_prod = 0
    
  0.upto(str.length - 5) do |i|
    prod = str[i,5].each_char.reduce(1) { |p, j| p *= j.to_i }    
    max_prod = prod if prod > max_prod
  end  
    
  max_prod
end