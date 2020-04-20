=begin
We are building a word processor and we would like to implement a "word-wrap" functionality.
Given a maximum number of characters in a line followed by a list of words, return a collection of strings where each string element represents a line that contains as many words as possible, with the words in each line being concatenated with a single '-' (representing a space, but easier to see for testing). The length of each string must not exceed the maximum character length per line.
Your function should take in the maximum characters per line and return a data structure representing all lines in the indicated max length.
Note: built-in functions like Python textwrap module should not be used as solutions to this problem.

Examples:

words1 = [ "The", "day", "began", "as", "still", "as", "the",
          "night", "abruptly", "lighted", "with", "brilliant",
          "flame" ]

wrapLines(words1, 13) ... "wrap words1 to line length 13" =>

  [ "The-day-began",
    "as-still-as",
    "the-night",
    "abruptly",
    "lighted-with",
    "brilliant",
    "flame" ]

wrapLines(words1, 20) ... "wrap words1 to line length 20" =>

  [ "The-day-began-as",
    "still-as-the-night",
    "abruptly-lighted",
    "with-brilliant-flame" ]

words2 = [ "Hello" ]

wrapLines(words2, 5) ... "wrap words2 to line length 5" =>

  [ "Hello" ]

words3 = [ "Hello", "world" ]

wrapLines(words3, 5) ... "wrap words3 to line length 5" =>

  [ "Hello",
  "world" ]

n = number of words OR total characters
=end

def word_length(words, limit)
  limited_array = []
  arr = []
  overflow = []
  count = 0

  words.each do |w|
    puts "WORD: #{w} "
    if w.length < limit
      if overflow.empty?
        arr << w
        count += w.length
      else
        new_set = overflow.push("-", w)
        arr.concat(new_set)
        count += new_set.join("").length
        overflow = []
        puts "Here: #{w}" if w =="flame"
      end
    end

    if count < limit
      arr << "-"
      count += 1
    end

    char_count = arr.join("").chars.length
    if char_count > limit
      puts "ARR1: #{arr}"
      extra_word = arr.pop
      overflow << extra_word
      arr.pop if arr.last.include?("-")
    end

    if count >= limit
      arr.pop if arr.last.include?("-")
      limited_array << arr.join('')
      puts "ARR2: #{arr}"
      arr = []
      count = 0
    end
  end

  new_array = limited_array.join('-').split('-')

  difference = words - new_array
  if difference.empty?
    return limited_array
  else
    return limited_array + difference
  end
end

words1 = [ "The", "day", "began", "as", "still", "as", "the",
          "night", "abruptly", "lighted", "with", "brilliant",
          "flame" ]


          ziba = word_length(words1, 20)

ziba = word_length(words1, 13)

puts "#{ziba}"
