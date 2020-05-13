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
  new_arr = a.map do |arr|
    arr.map do |int|
      if int < 1
      return 0
      else
      return 1
      end
    end
  end
  new_arr
end


def convert_time(seconds)
  Time.at(seconds).utc.strftime("%l:%M:%S")
end
