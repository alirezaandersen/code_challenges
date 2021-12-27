# You will be given a list of integers, `arr` , and a single integer `k`
# You must create an `arr`ay of length `k` from elements of `arr` such that its unfairness is minimized.
# Call that array `arr`. Unfairness of an `arr`ay is calculated as
#
# Where:
# - max denotes the largest integer in `arr`
# - min denotes the smallest integer in `arr`
#
#
# Example:
arr = [1,4,7,2]
k = 2

arr.each_cons(k).map { |a| a.max - a.min }.uniq.min
