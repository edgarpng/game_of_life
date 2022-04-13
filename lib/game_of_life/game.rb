require 'matrix'

class GameOfLife::Game

  attr_reader :board

  def initialize(matrix)
    @board = matrix
  end

  def self.random(width:, height:)
    random_board = Matrix.build(height, width) { [true, false].sample }
    GameOfLife::Game.new(random_board)
  end

  def tick
    new_board = board.clone

    board.each_with_index do |previous_cell_state, row, column|
      alive_neighbors = neighbors(row, column).count(true)
      new_board[row, column] = next_alive_state(previous_cell_state, alive_neighbors)
    end

    self.board = new_board
  end

  private

  attr_writer :board

  def next_alive_state(previously_alive, alive_neighbors)
    if previously_alive
      alive_neighbors.between?(2, 3)
    else
      alive_neighbors == 3
    end
  end

  def neighbors(row, column)
    [
      board[row - 1, column - 1],
      board[row - 1, column],
      board[row - 1, column + 1],
      board[row, column - 1],
      board[row, column + 1],
      board[row + 1, column - 1],
      board[row + 1, column],
      board[row + 1, column + 1]
    ]
  end
end
