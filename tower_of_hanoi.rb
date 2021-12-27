a = [1,2,3]
b = []
c = []

def solve(number_of_disks,from,to,via)
  if number_of_disks == 1
    to.push(from.pop)
  else
    solve(number_of_disks - 1, from, via, to)
    to.push(from.pop)
    solve(number_of_disks - 1, via, to, from)
  end
  to
end

solve(3, a, c, b)

puts "A: #{a}, B: #{b}, C: #{c}"
