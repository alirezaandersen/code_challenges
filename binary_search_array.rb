def solution(arr)

	return "" if arr.size <= 1 || arr.include?(0)
	left = []
	right = []

	arr.each_with_index do | num, i|
		num = [] if num < 0
		if i.even?
			right << num
		else
			left << num
		end
	end

	left.flatten!
	right.flatten!

	if left.max > right.max
		return "Left"
	else
		return "Right"
	end

end

arr1 = [1,4,100, 5]
response1 = "Right"
ar1 = solution(arr1)
puts "ARR1:#{ar1}:::#{ar1 == response1}"

arr2 = [1, 10, 5, 1, 0, 6]
response2 = ""
ar2 = solution(arr2)
puts "ARR2:#{ar2}:::#{ar2 == response2}"

arr3 = []
response3 = ""
ar3 = solution(arr3)
puts "ARR3:#{ar3}:::#{ar3 == response3}"

arr4 = [1]
response4 = ""
ar4 = solution(arr4)
puts "ARR4:#{arr4}:::#{ar4 == response4}"

arr5 = [3, 6, 2, 9, -1, 10]
response5 = "Left"
ar5 = solution(arr5)
puts "ARR5:#{ar5}:::#{ar5 == response5}"

# Write a fucntion that determines whether the left or right branch of the tree is larger.
# The size of each branch is the sum of the node values. The function should return The
# string "Right" if the right side is larger and "Left" if the left side is larger. If the
# tree has 0 nodes or if the size of the branches are equal, return an empty string.
