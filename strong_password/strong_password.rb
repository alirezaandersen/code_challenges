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
  s.chars.each do |char| #testing

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
