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

## Dependencies

- Ruby (bundled and built with 3.0.3, but any 2.x should you need to lower the version)
- RSpec (optional for specs)

## Running specs

- If you want to run the specs, in a terminal execute

```rb
bundle install
bundle exec rspec
```

## Playing the game

- in a terminal execute `ruby app.rb`
