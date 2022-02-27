# frozen_string_literal: true

require_relative "board"
class Game
  def initialize(seed_cells = [])
    @seed_cells = seed_cells
    @board = Board.new(grid_size)
  end

  attr_accessor :seed_cells, :board

  def run
    put_seed_cells_in_board(seed_cells)
    board.display_board
    update_board!
  end

  def update_board!
    sleep 1
    game = Game.new(new_seed_list)
    game.run
  end

  private

  def grid_size
    minimum_grid_size = 3
    highest_row_or_column = seed_cells.map(&:values).flatten.max || 0
    grid_size_for_seed = highest_row_or_column # plus too to handle index and give an extra row/column for new spawns?
    grid_size_for_seed >= minimum_grid_size ? grid_size_for_seed : minimum_grid_size
  end

  def put_seed_cells_in_board(live_cell_list)
    return if live_cell_list.empty?

    live_cell_list.each do |cell|
      @board.grid[cell[:row]][cell[:col]] = "+"
    end
  end

  def new_seed_list
    new_live_cells = []
    @board.grid.each_with_index do |row, row_index|
      # do not run on the border buffers
      next if row_index == @board.grid.length - 1

      row.each_with_index do |_cell, col_index|
        cell_is_live = find_new_live_cells(row_index, col_index)
        new_live_cells << { row: row_index, col: col_index } if cell_is_live
      end
    end

    new_live_cells
  end

  def find_new_live_cells(row_index, col_index)
    return if col_index + 1 > @board.grid.length || row_index + 1 > @board.grid.length

    current_cell = @board.grid[row_index][col_index]
    live_neighbors = live_neighbors(row_index, col_index)

    live = false

    if current_cell == "+"
      live = live_neighbors.count == 2 || live_neighbors.count == 3
    elsif live_neighbors.count == 3
      live = true
    end

    live
  end

  def live_neighbors(row_index, col_index)
    left_top = @board.grid[row_index - 1][col_index - 1]
    center_top = @board.grid[row_index - 1][col_index]
    right_top = @board.grid[row_index - 1][col_index + 1]

    left_bottom = @board.grid[row_index + 1][col_index - 1]
    center_bottom = @board.grid[row_index + 1][col_index]
    right_bottom = @board.grid[row_index + 1][col_index + 1]

    left_size = @board.grid[row_index][col_index - 1]
    right_size = @board.grid[row_index][col_index + 1]

    neighbors = [left_top,
                 center_top,
                 right_top,
                 left_bottom,
                 center_bottom,
                 right_bottom,
                 left_size,
                 right_size]

    neighbors.compact - %w[-]
  end
end
