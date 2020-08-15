# Given a string s and an integer array indices of the same length.
# The string s will be shuffled such that the character at the ith position
# moves to indices[i] in the shuffled string.

def restore_string(s, indices)
  sorted_string = s.dup
  indices.each_with_index { |i, index|
    sorted_string[i] = s[index]
  }
  sorted_string
end

# Input:
s1 = "codeleet"; indices1 = [4,5,6,7,0,2,1,3]
# Output: "leetcode"

# Input:
s2 = "abc"; indices2 = [0,1,2]
# Output: "abc"

# Input:
s3 = "aiohn"; indices3 = [3,1,4,2,0]
# Output: "nihao"

# Input:
s4 = "aaiougrt"; indices4 = [4,0,2,6,7,3,1,5]
# Output: "arigatou"

# Input:
s5 = "art"; indices5 = [1,0,2]
# Output: "rat"

ss = [[s1,indices1], [s2,indices2], [s3,indices3], [s4,indices4], [s5,indices5]]

def process(ss)
  ss.each { |n| puts "#{restore_string(n[0],n[1])}" }.flatten!
end

process(ss)
