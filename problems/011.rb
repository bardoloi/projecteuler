# http://projecteuler.net/problem=11

require 'matrix'

def find_biggest_product_in_matrix(m)  
  rows = m.row_size
  cols = m.column_size  
  return -1 if rows < 4 and cols < 4

  max_prod = 0

  (0...rows).to_a.each do |r|
    (0...cols).to_a.each do |c|
      
      # row (left/right)
      unless c > cols - 4
        prod = 0.upto(3).reduce(1) { |prod, i| prod *= m[r, c + i] }
        max_prod = prod if prod > max_prod
      end
      
      # column (up/down)
      unless r > rows - 4
        prod = 0.upto(3).reduce(1) { |prod, i| prod *= m[r + i, c] }
        max_prod = prod if prod > max_prod
      end
      
      # diagonal (top left to bottom right)
      unless r > rows - 4 || c > cols - 4
        prod = 0.upto(3).reduce(1) { |prod, i| prod *= m[r + i, c + i] }
        max_prod = prod if prod > max_prod
      end      

      # cross-diagonal (bottom left to top right)
      unless r < 3 || c > cols - 4
        prod = 0.upto(3).reduce(1) { |prod, i| prod *= m[r - i, c + i] }
        max_prod = prod if prod > max_prod
      end            
    end
  end
  
  max_prod
end