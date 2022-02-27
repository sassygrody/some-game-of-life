# Sasha's Game of Life

Implement an MVP of Conway's Game of Life

## Acceptance Criteria

[] The result doesn't need to be a full, working implementation, but it should be at least enough to reason about the software design and extend it with a pairing partner.
[] View does not need to be pretty, but there should be a UI of sorts

## Rubric

[] (ultimate litmus test) A collaborator can jump into your codebase and feel comfortable understanding and extending it (edit: and be happy about it?)
[] Implements a good solution covering many edge cases
[] Naturally clarifies scope, can discuss trade-offs of different approaches, addresses most edge cases
[] Writes idiomatically in the chosen language
[] Able to separate concerns with good interfaces
[] Has an intuitive understanding of SOLID principles (or otherwise the appropriate best practices of the relevant paradigm)
[] Creates elegant components that are well separated and reusable
[] Abstractions are clear and provide the possibility of extension in the future without significant refactoring
[] Details like idempotency and invariants are considered if relevant to the problem

## Rules

(Condensced from wikipedia)

1. Any dead cell with three live neighbours becomes a live cell.
1. Any live cell with two or three live neighbours survives.
1. All other live cells die in the next generation. Similarly, all other dead cells stay dead.

## Dependencies

- Ruby (bundled and built with 2.7.0, but any 2.x should you need to lower the version)
- RSpec
- Rubocop (optional, I just know this will make development better for me)

## Running specs

- If you want to run the specs, in a terminal execute

```rb
bundle install
bundle exec rspec
```

## Playing the game

- in a terminal execute `ruby app.rb`

## Thoughts on how to solve

1. oh no, this is impossible.
2. ok, maybe it's kinda possible.
3. where the heck do I start?
4. Having some major Devbootcamp flash backs to making grids and working with nested arrays and hating that....

## My Scope

I know there is no way I can rebuild the game as Conway did. So what can I do?

- [x] Output a grid board with an initial pattern of live cells (seeds)
- [] Update the starting seeds given the game rules up to 10 evolutions
- [] See how that looks and hope my pair knows how to make it infiinte?
