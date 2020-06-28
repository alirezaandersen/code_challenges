require 'pry'

class Cw

  def initialize()
    @word1 = nil
    @word2 = nil

    @grid = nil
  end

  def crossword(word1, word2)
    @word1 = word1
    @word2 = word2
    @grid_width = word1.length
    @grid_height = word2.length

    create_grid
    build_grid
    print_crossword
    # find_intersection
  end

  def create_grid
    height = Array.new(@grid_height)
    @grid =  height.map { |x| Array.new(@grid_width) }
  end

  def find_intersection
    @common_chars = @word1.chars & @word2.chars #['d', 'a']

    @intersections_w1 = {}
    @common_chars.map { |c| @intersections_w1[c] = @word1.index(c) }

    #finds word 2
    @intersections_w2 = {}
    @common_chars.map { |c| @intersections_w2[c] = @word2.index(c) }

    fw1,fw2 = @intersections_w1.values.first,@intersections_w2.values.first
    lw1,lw2 = @intersections_w1.values.last,@intersections_w2.values.last
    @d1 = Math.sqrt(fw1**2 + fw2**2)
    @d2 = Math.sqrt(lw1**2 + lw2**2)
    @w1_intersection_index, @w2_intersection_index = @d1 < @d2 ? [fw1, fw2] : [lw1, lw2]

    intersection_coord = [@w1_intersection_index, @w2_intersection_index]

    return intersection_coord
  end

  def build_grid

    @grid.each_with_index do |row, i|
      row.each_with_index do |column, j|
        # if this is the row for the first word, fill in all the letters
        if i == find_intersection[1]
          @grid[i][j] = @word1.chars[j]
          # fill in the letter for the position vertically from the second word
        elsif j == find_intersection[0]
          @grid[i][j] = @word2.chars[i]
        else
          @grid[i][j] = " "
        end
      end
    end
  end

  def print_crossword
    print_lines = ""

    @grid.each_with_index do |row, i|
      row.each_with_index do |column, j|
        print_lines << "#{@grid[i][j] }"
        if j == @word1.length - 1
          print_lines << " \n"
        end
      end
    end
    puts print_lines
    puts "intersection: #{find_intersection}"
    puts "@common_chars: #{@common_chars}"

    puts "@intersections_w1: #{@intersections_w1}"
    puts "@intersections_w2: #{@intersections_w2}"

    puts "Word1: #{@word1}"
    puts "@w1_intersection_index: #{@w1_intersection_index}"
    puts "@w1_intersection_letter: #{@w1_intersection_letter}"

    puts "FW1, FW2: #{[@intersections_w1.values.first, @intersections_w2.values.first]}"
    puts "LW1, LW2: #{[@intersections_w1.values.last,@intersections_w2.values.last]}"
    puts "D1: #{@d1}"
    puts "D2: #{@d2}"

    puts "Word2: #{@word2}"
    puts "@w2_intersection_index: #{@w2_intersection_index}"
    puts "@w2_intersection_letter: #{@w2_intersection_letter}"
  end

end


grid = Cw.new()
puts ""
grid.crossword("road", "zad")

puts ""
grid.crossword("road", "dad")

puts ""
grid.crossword("dad", "road")

puts ""
grid.crossword("cat", "hat")

puts ""
grid.crossword("balloon", "bat")

puts ""
grid.crossword("faint", "test")

# @grid2 = [["A", "B", "C"], ["D", "E", "F"], ["G", "H", "I"], ["J", "K", "L"]]
