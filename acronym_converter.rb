require 'pry'

# The problem is to implement a function that converts a given phrase to its
# acronym. The function should accept the phrase as input and print or return
# the acronym as its output. Your code should be compilable/runnable.

# Examples:
#  - Portable Network Graphics => PNG
#  - First In, First Out => FIFO
#  - Asynchronous Javascript and XML => AJAX
#  - GNU Image Manipulation Program => GIMP
#  - Complementary metal-oxide semiconductor => CMOS
#  - Something - I made up from thin air => SIMUFTA

examples = [
  "Portable Network Graphics",
  "First In, First Out",
  "Asynchronous Javascript and XML",
  "GNU Image Manipulation Program",
  "Complementary metal-oxide semiconductor",
  "Something - I made up from thin air",
  "This is a Test",
  "   This is a test 2",
  "3 . This & is % a test !"
]

def acronym(string)
  clean_string = special_char_cleaner(string)
  abbrev = clean_string.split.map(&:chr).join.upcase
  return { string => abbrev }
end

def special_char_cleaner(string)
  string.gsub!(/[^0-9A-Za-z]/, ' ')
end

def converter(examples)
  examples.each do |string|
    puts "#{acronym(string)}"
  end
end

converter(examples)
