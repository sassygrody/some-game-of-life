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
    put_seed_cells_in_board!
    display_board
    sleep 2
    update_live_cells_in_board!
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
    puts # space between new board output
    @board.map do |cell|
      puts cell.join(" ")
    end
  end

  def put_seed_cells_in_board!
    return if seed_cells.empty?

    seed_cells.each do |cell|
      board[cell[:row]][cell[:col]] = "+"
    end
  end

  def update_live_cells_in_board!
    return if seed_cells.empty?

    seed_cells.each do |cell|
      left_top = board[cell[:row] - 1][cell[:col] - 1]
      center_top = board[cell[:row] - 1][cell[:col]]
      right_top = board[cell[:row] - 1][cell[:col] + 1]
      left_bottom = board[cell[:row] + 1][cell[:col] - 1]
      center_bottom = board[cell[:row] + 1][cell[:col]]
      right_bottom = board[cell[:row] + 1][cell[:col] + 1]
      left_size = board[cell[:row]][cell[:col] - 1]
      right_size = board[cell[:row]][cell[:col] + 1]
      current_cell = board[cell[:row][cell[:col]]]
      neighbors = [left_top,
                   center_top,
                   right_top,
                   left_bottom,
                   center_bottom,
                   right_bottom,
                   left_size,
                   right_size]
      live_neighbors = neighbors - %w[-]

      if current_cell == "+"
        # apply live rules

        if live_neighbors.count == 2 || live_neighbors.count == 3
          # keep cell coords in cell list
        else
          # kill cell because it's lonely or overpopulated
        end
      else
        # apply dead rules
        live_neighbors.count == 3 # &&  activate cell
        end
      end
    end
  end

  # define the rules first so I don't have to think about them anymore
  # no nevermind, not ready for that.
  # A cell be birthed or stay alive
  def be_alive!; end

  # A cell can die or stay dead
  def die!; end
end
