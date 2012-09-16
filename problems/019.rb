# http://projecteuler.net/problem=19

require 'date'

# find no of ways to get from the top left to bottom right corner of a grid
# day_of_week = 0 for Sundays, 1 for Monday,... 6 for Saturday.
def count_wdays_on_first_of_months(start_date, end_date, day_of_week)
  days_count = 0
  
  if start_date.mday > 1
    start_date = (start_date >> 1) - start_date.mday + 1  # move to the 1st day of next month
  end
    
  while start_date < end_date
    days_count += 1 if start_date.wday == day_of_week
    start_date = start_date >> 1
  end
  
  days_count    
end


