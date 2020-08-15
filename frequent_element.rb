require 'pry'
# Given a non-empty array of integers, return the k most frequent elements.

def top_k_frequent(nums, k)
  top_k = Hash.new(0)
  nums.each{ |x| top_k[x] += 1 }
  top_k.keys.sort_by! { |e| [-top_k[e]] }[0...k]
  # return nums if nums.size == k
  # grouped = nums.sort.group_by{ |x| x }.values
  # top_k = grouped.select { |x| x.size > 1 }.compact.flatten
  # top_k.select { |x| top_k.count(x) > 1}.uniq[0,k]
end

# Input1:
nums1 = [1,1,1,2,2,3]; k1 = 2
output1 = [1,2]

# Input2:
nums2 = [4,1,-1,2,-1,2,3]; k2 = 2
output2 = [-1,2]

# Input3:
nums3 = [1]; k3 = 1
output3 = [1]

# Input4:
nums4 = [1,2]; k4 = 2
output4 = [1,2]

# Input5:
nums5 = [3,0,1,0]; k5 = 1
output5 = [0,0]

# Input6:
nums6 = [5,3,1,1,1,3,73,1]; k6 = 1
output6 = [1]

# Input7:
nums7 = [5,3,1,1,1,3,5,73,1] ; k7 = 3
output7 = [1,3,5]

# Input8:
nums8 = [3,2,3,1,2,4,5,5,6,7,7,8,2,3,1,1,1,10,11,5,6,2,4,7,8,5,6] ; k8 = 10
output8 = [5, 2, 1, 3, 6, 7, 8, 4, 11, 10]

# Input9:
nums9 = [5,2,5,3,5,3,1,1,3] ; k9 = 2
output9 = [3,5]



nums = [[nums1, k1], [nums2, k2], [nums3, k3], [nums4, k4], [nums5, k5],
        [nums6, k6], [nums7, k7], [nums8, k8], [nums9, k9]]
outputs = [output1, output2, output3, output4, output5, output6, output7,
          output8, output9]
# nums = [[nums9, k9]]


def process(nums, outputs)
  nums.each_with_index{ |n, index|
    puts "Input: #{index}"
    puts "#{(top_k_frequent(n[0],n[1]) - outputs[index]).empty?}" ;
    puts "#{top_k_frequent(n[0],n[1])}" }.flatten!
end

process(nums, outputs)
