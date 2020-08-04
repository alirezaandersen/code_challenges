# Given the array nums consisting of 2n elements in the form [x1,x2,...,xn,y1,y2,...,yn].
# Return the array in the form [x1,y1,x2,y2,...,xn,yn]

def shuffle(nums, n)
    n.times.flat_map {|i| [nums[i], nums[i+n]] }
end

# Input:
num1 = [2,5,1,3,4,7]; n1 = 3
# Output: [2,3,5,4,1,7]
#
# Input:
num2 = [1,2,3,4,4,3,2,1]; n2 = 4
# Output: [1,4,2,3,3,2,4,1]
#
# Input:
num3 = [1,1,2,2]; n3 = 2
# Output: [1,2,1,2]

nums = [[num1, n1], [num2, n2], [num3, n3]]

def process(nums)
  nums.each { |n| puts "#{shuffle(n[0],n[1])}" }.flatten!
end

process(nums)
