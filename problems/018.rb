# http://projecteuler.net/problem=18

require_relative "../project_euler.rb"

#given a triangle of numbers (i.e. where row n has n numbers), gets the sum of the largest chain
def calculate_cumulative_sum_of_triangle(input)
  cumulative_sums_array = []

  (0..input.count-1).each do |line|
    p "Now doing line #{line}"
    
    if line==0
      cumulative_sums_array << input[0]
      next
    end

    previous_line = cumulative_sums_array[line-1]

    current_line = []
    (0..line).each do |col|
      possible_values = []
      possible_values << input[line][col] + previous_line[col]    unless col == line
      possible_values << input[line][col] + previous_line[col-1]  unless col == 0
      current_line << possible_values.max
    end
    cumulative_sums_array << current_line
  end

  cumulative_sums_array.last.max
end
  
