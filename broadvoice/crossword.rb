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

  def common_chars
    @word1.chars & @word2.chars
  end

  def find_intersection
    # compare first common_chars location of word1 and word2
    fw1 = common_intersection(@word1).first.to_i
    fw2 = common_intersection(@word2).first.to_i

    # compare last common chars location of word1 and word2
    lw1 = common_intersection(@word1).last.to_i
    lw2 = common_intersection(@word2).last.to_i

    # calculate the shortest distance of first and last common_chars of each word
    distance1 = Math.sqrt(fw1**2 + fw2**2)
    distance2 = Math.sqrt(lw1**2 + lw2**2)

    distance1 < distance2 ? [fw1, fw2] : [lw1, lw2]
  end

  def common_intersection(word)
    # finds index of common chars ie {"a"=>1, "d"=>0}
    ci = {}
    common_chars.map { |c| ci[c] = word.index(c) }
    ci.values
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
        print_lines << "#{@grid[i][j]}"
        if j == @word1.length - 1
          print_lines << " \n"
        end
      end
    end
    puts print_lines
  end

end

samples = [
    {word1: 'cat', word2: 'hat'},
    {word1: 'balloon', word2: 'bat'},
    {word1: 'faint', word2: 'test'},
    {word1: 'road', word2: 'dad'},
    {word1: 'dad', word2: 'road'},
    {word1: 'road', word2: 'zad'},
    {word1: 'zara', word2: 'ziba'},
    {word1: 'ali', word2: 'ara'},
]

def print_sample(samples)
  grid = Cw.new()
  samples.each do |sample|
    word1, word2 = sample.values
    puts "word1: #{word1}  word2: #{word2}"
    grid.crossword(word1, word2)
    puts "\n"
  end
end

print_sample(samples)
