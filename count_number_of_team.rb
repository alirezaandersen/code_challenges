require 'pry'

# There are n soldiers standing in a line. Each soldier is assigned a unique rating value.
# You have to form a team of 3 soldiers amongst them under the following rules:
# Choose 3 soldiers with index (i, j, k) with rating (rating[i], rating[j], rating[k]).
# A team is valid if:  (rating[i] < rating[j] < rating[k]) or (rating[i] > rating[j] > rating[k])
# where (0 <= i < j < k < n).
#
# Return the number of teams you can form given the conditions. (soldiers can be part of multiple teams).
def num_teams(rating)
  team = rating.dup
  rating.each do |i, j, k|
  end

end

# Input:
rating1 = [2,5,3,4,1]
# Output: 3

# Input:
rating2 = [2,1,3]
# Output: 0

# Input:
rating3 = [1,2,3,4]
# Output: 4

ratings = [rating1, rating2, rating3]

def process(ratings)
  ratings.each { |r| puts "#{num_teams(r)}" }
end

process(ratings)
