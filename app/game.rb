# frozen_string_literal: true

require_relative "board"
class Game
  def initialize(seed_cells = [])
    @seed_cells = seed_cells
    @board = Board.new(grid_size).board
  end

  attr_reader :seed_cells, :board

  def run
    puts "............................"
    puts "......GAME OF LIFE.....kinda"
    puts "............................"
    puts
    put_seed_cells_in_board(seed_cells)
    display_board
  end

  def update_board!
    # sleep 2
    size = next_live_cell_list.map(&:values).flatten.max || 0
    board = Board.new(size).board
    put_seed_cells_in_board(next_live_cell_list)
    display_board
  end

  private

  def grid_size
    minimum_grid_size = 3
    highest_row_or_column = seed_cells.map(&:values).flatten.max || 0
    grid_size_for_seed = highest_row_or_column # plus too to handle index and give an extra row/column for new spawns?
    grid_size_for_seed >= minimum_grid_size ? grid_size_for_seed : minimum_grid_size
  end

  def display_board
    puts # space between new board output
    add_board_buffer
    @board.map do |cell|
      puts cell.join(" ")
    end
  end

  def add_board_buffer
    return unless live_cell_is_near_edge

    top_row_padding = Array.new(board.length, "-")
    bottom_row_padding = Array.new(board.length, "-")
    @board.unshift(top_row_padding)
    @board.push(bottom_row_padding)
    @board.each do |row|
      row.unshift("-")
      row.push("-")
    end
  end

  def put_seed_cells_in_board(live_cell_list)
    return if live_cell_list.empty?

    live_cell_list.each do |cell|
      board[cell[:row]][cell[:col]] = "+"
    end
  end

  def next_live_cell_list
    new_live_cells = []
    board.each_with_index do |row, row_index|
      # do not run on the border buffers
      next if row_index == board.length - 1

      row.each_with_index do |_cell, col_index|
        cell_is_live = find_new_live_cells(row_index, col_index)
        new_live_cells << { row: row_index, col: col_index } if cell_is_live
      end
    end

    new_live_cells
  end

  def find_new_live_cells(row_index, col_index)
    return if col_index + 1 > board.length || row_index + 1 > board.length

    current_cell = board[row_index][col_index]
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
    left_top = board[row_index - 1][col_index - 1]
    center_top = board[row_index - 1][col_index]
    right_top = board[row_index - 1][col_index + 1]

    left_bottom = board[row_index + 1][col_index - 1]
    center_bottom = board[row_index + 1][col_index]
    right_bottom = board[row_index + 1][col_index + 1]

    left_size = board[row_index][col_index - 1]
    right_size = board[row_index][col_index + 1]

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

  def live_cell_is_near_edge
    # prevent buffer from adding if new live cell isn't within on edge
    top_row_needs_buffer = @board.first.any? { |cell| cell == "+" }
    bottom_row_needs_buffer = @board.last.any? { |cell| cell == "+" }
    left_side_needs_button = @board.any? { |row| row[0] == "+" }
    right_side_needs_button = @board.any? { |row| row[-1] == "+" }

    top_row_needs_buffer ||
      bottom_row_needs_buffer ||
      left_side_needs_button ||
      right_side_needs_button
  end
end
