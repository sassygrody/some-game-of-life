# frozen_string_literal: true

class Game
  def initialize(seed_cells)
    @seed_cells = seed_cells
    grid_size = 5
    @board = Array.new(grid_size) { Array.new(grid_size, "-") }
  end

  attr_reader :seed_cells

  def run
    puts "............................"
    puts "......GAME OF LIFE.....kinda"
    puts "............................"
    puts
    @board.map do |cell|
      puts cell.join(" ")
    end
  end

  # define the rules first so I don't have to think about them anymore
  # no nevermind, not ready for that.
  # A cell be birthed or stay alive
  def be_alive!; end

  # A cell can die or stay dead
  def die!; end
end
