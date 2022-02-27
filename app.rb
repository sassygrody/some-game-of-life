require_relative "app/game"

# an array of coords might be more common/performant but
# for now I want to avoid the double `indexing[0][1]` thing.
seed_cells = [
  { row: 0, col: 1 },
  { row: 0, col: 2 },
  { row: 1, col: 2 },
  { row: 20, col: 10 }
]

Game.new(seed_cells).run
