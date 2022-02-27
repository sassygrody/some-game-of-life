# frozen_string_literal: true

require_relative "app/game"

# an array of coords might be more common/performant but
# for now I want to avoid the double `indexing[0][1]` thing.
# seed_cells = [
#   { row: 1, col: 1 },
#   { row: 1, col: 2 },
#   { row: 2, col: 2 }
# ]

seed_cells = [
  { row: 0, col: 0 },
  { row: 0, col: 1 },
  { row: 0, col: 2 },
  { row: 1, col: 1 },
  { row: 1, col: 2 }
]

# seed_cells = [
#   { row: 0, col: 1 },
#   { row: 1, col: 2 },
#   { row: 2, col: 0 },
#   { row: 2, col: 1 },
#   { row: 2, col: 2 }
# ]

# TODO: make this an iterative flow
game = Game.new(seed_cells)
game.run
loop do
  game.update_board!
end
