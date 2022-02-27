# frozen_string_literal: true

class Game
  def initialize(seed_cells = [])
    @seed_cells = seed_cells
    @board = Array.new(grid_size) { Array.new(grid_size, "-") }
  end

  attr_reader :seed_cells, :board

  def run
    puts "............................"
    puts "......GAME OF LIFE.....kinda"
    puts "............................"
    puts
    set_seed_cells_on_board
    display_board
  end

  private

  def grid_size
    minimum_grid_size = 3
    highest_row_or_column = seed_cells.map(&:values).flatten.max || 0
    grid_size_for_seed = highest_row_or_column + 1
    grid_size_for_seed >= minimum_grid_size ? grid_size_for_seed : minimum_grid_size
  end

  def display_board
    @board.map do |cell|
      puts cell.join(" ")
    end
  end

  def set_seed_cells_on_board
    return if seed_cells.empty?

    @seed_cells.each do |cell|
      @board[cell[:row]][cell[:col]] = "+"
    end
  end

  # define the rules first so I don't have to think about them anymore
  # no nevermind, not ready for that.
  # A cell be birthed or stay alive
  def be_alive!; end

  # A cell can die or stay dead
  def die!; end
end
