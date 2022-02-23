require 'pry'
# given you have a sticker "ZENDESK". You want to create custom stickers using the "ZENDESK" stickers.
# How many "ZENDESK" stickers would you need to create a custom sticker
#
# spell("needs") = 1
# spell("deeds") = 2
# spell("zendeskneedsdeeds") = 4

STICKER = {
  "Z": 1,
  "E": 2,
  "N": 1,
  "D": 1,
  "S": 1,
  "K": 1,
}

def spell(word)
  group_chars =  word.chars.group_by { |k| k }

  group_chars.map do |k, v|
   sticker_needed(k,v)
   end.flatten.uniq.compact.max
end

def sticker_needed(k,v)
  STICKER.map { |sk,sv|
    ss = sk.to_s.downcase
   v.length / sv if ss == k
 }
end

puts "#{spell("needs") == 1}"
puts "#{spell("deeds") == 2 }"
puts "#{spell("zendeskneedsdeeds") == 4}"
