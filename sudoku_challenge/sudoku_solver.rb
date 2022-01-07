require 'pry'

class BoardBuilder

  def read_txt
    boards = Dir["**/*.txt"].map do |txt_file|
      file_read = File.readlines(txt_file)
      row = file_read.map { |ch| ch.split('|') }
      build_board(row)
    end
    boards
  end

  def build_board(row)
    cb = filter_board(row)
    cb.map do |fb|
      convert_board(fb)
    end
  end

  def filter_board(row)
    row.map { |arr|
      filter_arr(arr)
    }.select {|a| a.length >= 3 }
  end

  def convert_board(fb)
    fb.map do |str|
      str.split(' ').map { |i|
        i.to_i.zero? ? nil : i.to_i}
    end.flatten
  end

  def filter_arr(arr)
    arr.select { |i|
      i.delete!('-,+')
      i.gsub('.', '0').strip
    }
  end
end

class Hash
  def sudoku_row(i)
    self.select { |key, value| key[1].to_i == i }.values
  end

  def sudoku_column(i)
    self.select { |key, value| key[0].to_i == i }.values
  end

  def sudoku_box(i)
    self.select { |key, value| key[2].to_i == i }.values
  end
end

class Array
  def missing_mutliples?(item)
    self.select { |e| (e - item).empty? }.size == item.size
  end
end

module Sudoku
  class Solver
    def initialize(sudoku)
      @sudoku = {}
      j = 0

      # This code creates a hash table with key indexes for each value.
      # The key is made up of three digits and shows the exact location
      # of the number.
      sudoku.each do |sudoku_row|
        9.times do |i|
          if i <= 2 && j <= 2
            b = 0
          elsif i <= 5 && j <= 2
            b = 1
          elsif i > 5 && j <= 2
            b = 2
          elsif i <= 2 && j <= 5
            b = 3
          elsif i <= 5 && j <= 5
            b = 4
          elsif i > 5 && j <= 5
            b = 5
          elsif i <= 2 && j > 5
            b = 6
          elsif i <= 5 && j > 5
            b = 7
          else
            b = 8
          end
          @sudoku[i.to_s + j.to_s + b.to_s] = sudoku_row[i]
        end
        j += 1
      end
    end

    def to_s
      @sudoku.values.each_slice(9).to_a.to_s
    end

    def solve
      unsolved = {}
      @keysizes = []
      @sudoku.each do |key, value|
        if value.nil?
          unsolved[key] = [1,2,3,4,5,6,7,8,9]
        end
      end

      until solved
        # Simple elimination method
        unsolved.each do |key, value|
          value.reject! do |number|
            (@sudoku.sudoku_row(key[1].to_i) + @sudoku.sudoku_column(key[0].to_i) + @sudoku.sudoku_box(key[2].to_i)).include?(number)
          end
          @sudoku[key] = value[0] if value.size == 1
          unsolved.delete_if { |key, value| value.empty? }
        end

        # missing_mutliples method
        unsolved.each do |key, value|
          if unsolved.sudoku_row(key[1].to_i).missing_mutliples?(value)
            unsolved.each do |nkey, nvalue|
              nvalue.reject! { |n| value.include?(n) } if (!(nvalue-value).empty? && key[1] == nkey[1])
            end
          end
          if unsolved.sudoku_column(key[0].to_i).missing_mutliples?(value)
            unsolved.each do |nkey, nvalue|
              nvalue.reject! { |n| value.include?(n) } if (!(nvalue-value).empty? && key[0] == nkey[0])
            end
          end
          if unsolved.sudoku_box(key[2].to_i).missing_mutliples?(value)
            unsolved.each do |nkey, nvalue|
              nvalue.reject! { |n| value.include?(n) } if (!(nvalue-value).empty? && key[2] == nkey[2])
            end
          end

          @sudoku[key] = value[0] if value.size == 1
          unsolved.delete_if { |key, value| value.empty? }
        end

        if unsolvable
          puts "Impossible to solve. Best solution (n if no solution):"
          @sudoku.to_s
          break
        end
      end

      return @sudoku.values.each_slice(9).to_a

    end

    private

      # Array#compact removes all nils. A solved puzzle has no nils to remove.
      def solved
        @sudoku.values.compact.size == 81
      end

      # This evaluates the number of solved keys in the puzzle. If no new blanks have been
      # filled in over multiple passes through the solving methods, then the puzzle cannot
      # be solved.

      def unsolvable
        @keysizes << @sudoku.values.compact.size
        @keysizes[-1] == @keysizes[-3]
      end

  end
end
board = BoardBuilder.new.read_txt
solution = board.map { |b| Sudoku::Solver.new(b).solve }
puts "#{solution}"
