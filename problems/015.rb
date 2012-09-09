# http://projecteuler.net/problem=15

require_relative "../project_euler.rb"

# find no of ways to get from the top left to bottom right corner of a grid
def find_number_of_routes_across_grid(rows, cols)
  
  # The logic: 
  # Since backtracking is not allowed (i.e. only downward and rightward moves are allowed),
  # the total number of moves is always the same (#rows + #cols), and
  # total number of possible routes = nCr (where n = rows + cols)
  $pe = ProjectEuler.new
  $pe.num_of_combinations(rows + cols, rows)
end
