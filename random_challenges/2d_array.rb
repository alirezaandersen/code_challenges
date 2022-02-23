# Imagine we have an image. We'll represent this image as a simple 2D array where every pixel is a 1 or a 0. The image you get is known to have a single rectangle of 0s on a background of 1s.

# Write a function that takes in the image and returns one of the following representations of the rectangle of 0's: top-left coordinate and bottom-right coordinate OR top-left coordinate, width, and height.

# image1 = [
#   [1, 1, 1, 1, 1, 1, 1],
#   [1, 1, 1, 1, 1, 1, 1],
#   [1, 1, 1, 0, 0, 0, 1],
#   [1, 1, 1, 0, 0, 0, 1],
#   [1, 1, 1, 1, 1, 1, 1],
# ]

# Sample output variations (only one is necessary):

# find_rectangle(image1) =>
#   x: 3, y: 2, width: 3, height: 2
#   2,3 3,5 -- row,column of the top-left and bottom-right corners

# Other test cases:

# image2 = [
#   [1, 1, 1, 1, 1, 1, 1],
#   [1, 1, 1, 1, 1, 1, 1],
#   [1, 1, 1, 1, 1, 1, 1],
#   [1, 1, 1, 1, 1, 1, 1],
#   [1, 1, 1, 1, 1, 1, 0],
# ]

# find_rectangle(image2) =>
#   x: 6, y: 4, width: 1, height: 1
#   4,6 4,6

# image3 = [
#   [1, 1, 1, 1, 1, 1, 1],
#   [1, 1, 1, 1, 1, 1, 1],
#   [1, 1, 1, 1, 1, 1, 1],
#   [1, 1, 1, 1, 1, 0, 0],
#   [1, 1, 1, 1, 1, 0, 0],
# ]

# find_rectangle(image3) =>
#   x: 5, y: 3, width: 2, height: 2
#   3,5 4,6

# image4 = [
#   [0, 1, 1, 1, 1, 1, 1],
#   [1, 1, 1, 1, 1, 1, 1],
#   [1, 1, 1, 1, 1, 1, 1],
#   [1, 1, 1, 1, 1, 1, 1],
#   [1, 1, 1, 1, 1, 1, 1],
# ]

# find_rectangle(image4) =>
#   x: 0, y: 0, width: 1, height: 1
#   0,0 0,0

# image5 = [
#   [0],
# ]

# find_rectangle(image5) =>
#   x: 0, y: 0, width: 1, height: 1
#   0,0 0,0

# n: number of rows in the input image
# m: number of columns in the input image

image1 = [
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 0, 0, 0, 1],
  [1, 1, 1, 0, 0, 0, 1],
  [1, 1, 1, 1, 1, 1, 1]
]

image2 = [
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 0]
]

image3 = [
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 0, 0],
  [1, 1, 1, 1, 1, 0, 0]
]

image4 = [
  [0, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1],
  [1, 1, 1, 1, 1, 1, 1]
]

image5 = [
  [0]
]

def find_rectangle(image)
  location = []
  array_has_zero = 0
  number_of_zero = 0

  image.each_with_index do |arr, in_arr|
    array_has_zero += 1 if arr.include?(0)
    arr.each_with_index do |num, index|
      next unless num.zero?

      number_of_zero += 1
      location << [index, in_arr]
    end
  end

  location.each do |arr|
    x = arr.first
    y = arr.last
    w = (number_of_zero / array_has_zero)
    h = array_has_zero
    return "x:#{x} y:#{y}, width: #{w}, height: #{h}"
  end
end

ziba1 = find_rectangle(image1) == "x:3 y:2, width: 3, height: 2"
puts "Ziba 1 #{ziba1}"

ziba2 = find_rectangle(image2) == "x:6 y:4, width: 1, height: 1"
puts "Ziba 2 #{ziba2}"

ziba3 = find_rectangle(image3) == "x:5 y:3, width: 2, height: 2"
puts "Ziba 3 #{ziba3}"

ziba4 = find_rectangle(image4) == "x:0 y:0, width: 1, height: 1"
puts "Ziba 4 #{ziba4}"

ziba5 = find_rectangle(image5) == "x:0 y:0, width: 1, height: 1"
puts "Ziba 5 #{ziba5}"
