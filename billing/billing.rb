require 'date'

def bill_for(month, active_subscription, users)
  # your code here!
  return puts "Cat" if users.nil?
  fee = active_subscription[:monthly_price_in_dollars]
  daily_cost = fee / 31.to_f#(days in month)

  puts "daily_cost: #{daily_cost}"

  monthly_fee  = (valid_users(users) * daily_cost).round(2)
  puts "monthly_fee: #{monthly_fee}"


end

def valid_users(users)
   users.map do |user|
     return user unless user[:deactivated_on] == nil
   end.count
end

####################
# Helper functions #
####################


# Takes a Date object and returns a Date which is the first day
# of that month. For example:
#
# first_day_of_month(Date.new(2019, 2, 7)) # => Date.new(2019, 2, 1)
#
# Input type: Date
# Output type: Date
def first_day_of_month(date)
  Date.new(date.year, date.month)
end

# Takes a Date object and returns a Date which is the last day
# of that month. For example: 
#
# last_day_of_month(Date.new(2019, 2, 7)) # => Date.new(2019, 2, 28)
#
# Input type: Date
# Output type: Date
def last_day_of_month(date)
  Date.new(date.year, date.month, -1)
end

# Takes a Date object and returns a Date which is the next day.
# For example:
#
# next_day(Date.new(2019, 2, 7))  # => Date.new(2019, 2, 8)
# next_day(Date.new(2019, 2, 28)) # => Date.new(2019, 3, 1)
#
# Input type: Date
# Output type: Date
def next_day(date)
  date.next_day
end
