# Solving Every Sudoku Puzzle

Your challenge is to write a program that can solve every Sudoku puzzle. Sudoku Notation and Preliminary Notions
First we have to agree on some notation. A Sudoku puzzle is a grid of 81 squares; the majority of enthusiasts label the columns 1-9, the rows A-I, and call a collection of nine squares (column, row, or box) a unit and the squares that share a unit the peers. A puzzle leaves some squares blank and fills others with digits, and the whole idea is: `A puzzle is solved if the squares in each unit are filled with a permutation of the digits 1 to 9.`

That is, no digit can appear twice in a unit, and every digit must appear once. This implies that each square must have a different value from any of its peers. Here are the names of the squares, a typical puzzle, and the solution to the puzzle:
