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

# Given a string S that only contains "I" (increase) or "D" (decrease), let N = S.length.
# Return any permutation A of [0, 1, ..., N] such that for all i = 0, ..., N-1:
#   If S[i] == "I", then A[i] < A[i+1]
#   If S[i] == "D", then A[i] > A[i+1]
#
# Example 1:
# Input: "IDID"
# Output: [0,4,1,3,2]

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

# 420 find all repeating characters in a string that repeat more then 3 times,
# Example 1:
# Input: "aaa,b,c,a,d"
# Output "aaa"
#
# example 2:
# Input: "bb, ccc, dd, dddd, ff, f"
# Input: "bbcccddeddddffi"
# Output: "ccc, dddd"


def strong_password_checker(s)
    count = 0
    #must be at least 6 characters but less then 20
    count += 1 if s.length >= 6 || s.length <= 20

    #must have at least 1 upcase
    count += 1 if s.chars.each {|a| a.upcase == a }.uniq.include?(false)
    #must have at least 1 downcase
    count += 1 if s.chars.each {|a| a.downcase == a }.uniq.include?(false)

    #must not repeat 3 times.
    count += repeating_chars(s)

end

def repeating_chars(s)
  repeats = []
  sets_of_3 = []
  counter = 0
  s.chars.each do | char|

    if !sets_of_3.empty?
      sets_of_3.last.join().include?(char)
    end

    if repeats.size >= 3
      if repeating(repeats, char).all?(true)
          sets_of_3 << repeats.join()
          counter +=1
          puts "repeats #{repeats}"
          repeats = []
      else
          repeats.shift
      end

    else
      repeats << char
    end
    puts "COUNTER: #{counter}"
    sets_of_3
  end
end

def repeating(repeats, char)
  repeats.map do |a|
    a == char
  end.uniq
end
