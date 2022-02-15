# Dash Insert II
# Have the function DashInsertII(str) insert dashes ('-') between each two odd numbers and
# insert asterisks ('*') between each two even numbers in str. For example: if str is 4546793
# the output should be 454*67-9-3. Don't count zero as an odd or even number.
# Examples
# Input: 99946
# Output: 9-9-94*6
# Input: 56647304
# Output: 56*6*47-304


def dash_insert_II(num)

  s_num = num.to_s.split('')
  s_num.each_index { |i| s_num[i].concat('-') if s_num[i].to_i.odd? && s_num[i+1].to_i.odd? }
  s_num.each_index { |i| s_num[i].concat('*') if s_num[i].to_i.even? && s_num[i+1].to_i.even? }
  s_num.select { |el| el.chop! if el.include?('0') }

  s_num.join.chop! if s_num == '*' || '-'


end
