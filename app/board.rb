class Board
  def initialize(grid_size)
    @board = Array.new(grid_size) { Array.new(grid_size, "-") }
  end

  attr_reader :board
end
