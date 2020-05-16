def repeated_string_match(a, b)
    word_array =[]
    dup_word = 0
    b.chars.each do |char|
      word_array << char
        if word_array.join() == a
          dup_word += 1
          word_array = []
        end
      end
    dup_word
end

[1,3,2,4,7,8,6,9]
[5,1,2,3,4]
[1,1,4,2,1,3]

def flip_and_invert_image(a)
  a.map { |row| row.reverse.map { |pixel| pixel ^ 1 }}
end


def convert_time(seconds)
  Time.at(seconds).utc.strftime("%l:%M:%S")
end

def di_string_match(s)
  min = 0
  max = s.length

  result = []
  s.chars.each do |c|
    if (c == 'I')
      result << min
      min += 1
    else
      result << max
      max -= 1
    end
  end
  result << min

  result
end
