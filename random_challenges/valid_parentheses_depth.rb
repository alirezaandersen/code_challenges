require 'pry'
#return valid parenthese max in depth

def valid_parentheses(str)
  stack = []
  stack_size = 0
  symbols = { '(' => ')' }

  str.each_char do |c|
    stack << c if symbols.key?(c)
    return false if symbols.key(c) && (symbols.key(c) != stack.pop)
    stack.size > stack_size ? stack_size += 1 : nil # want to keep track of only largest parentheses set
  end

  stack_size

end

=begin
str = "((())) (())"
#returns 3 -> 3, 2
puts valid_parentheses(str)

str = "((())) (((((())))))"
#returns 6 -> 3, 6
puts valid_parentheses(str)
=end
str = "() (("
#returns 1 -> 1, 0 -invalid parentheses
puts valid_parentheses(str)
