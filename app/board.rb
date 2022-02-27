class Board
  def initialize(grid_size)
    @grid = Array.new(grid_size) { Array.new(grid_size, "-") }
  end

  attr_accessor :grid

  def display_board
    # system "clear"
    puts # space between new board output
    add_board_buffer
    @grid.map do |cell|
      puts cell.join(" ")
    end
  end

  def add_board_buffer
    # return unless live_cell_is_near_edge

    top_row_needs_buffer? && grid.unshift(Array.new(grid.length, "-"))
    bottom_row_needs_buffer? && grid.push(Array.new(grid.length, "-"))
    left_side_needs_buffer? && grid.each { |row| row.unshift("-") }
    right_side_needs_buffer? && grid.each { |row| row.push("-") }
  end

  # def live_cell_is_near_edge
  #   # prevent buffer from adding if new live cell isn't within on edge
  #   return if grid.empty?

  #   top_row_needs_buffer ||
  #     bottom_row_needs_buffer ||
  #     left_side_needs_buffer ||
  #     right_side_needs_buffer
  # end

  def top_row_needs_buffer?
    grid.first.any? { |cell| cell == "+" }
  end

  def bottom_row_needs_buffer?
    grid.last.any? { |cell| cell == "+" }
  end

  def left_side_needs_buffer?
    grid.any? { |row| row[0] == "+" }
  end

  def right_side_needs_buffer?
    grid.any? { |row| row[-1] == "+" }
  end
end
