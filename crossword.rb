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
  end

  def create_grid
    height = Array.new(@grid_height)
    @grid =  height.map { |x| Array.new(@grid_width) }
  end

  def find_intersection
    @common_chars = @word1.chars & @word2.chars #['d', 'a']

    # w2_lowest_char = nil
    w2_intersection_index = @common_chars.map do |c|
      @word2.index(c)
    end.min

    w2_intersection_letter = @word2.chars[w2_intersection_index]
    w1_intersection_index = @word1.index(w2_intersection_letter)

    intersection_coord = [w1_intersection_index, w2_intersection_index]

    # puts "w1_intersection_index: #{w1_intersection_index} :: #{@word1}"
    # puts "w2_intersection_letter: #{w2_intersection_letter}:: #{@word2}"
    # puts "intersection_coord: #{intersection_coord}"
    # [1,2]

    #   0 1 2
    # 0   r
    # 1   o
    # 2 d a d
    # 3   d
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
  end

end


grid = Cw.new()
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
