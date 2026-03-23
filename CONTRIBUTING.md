# Contributing

Thanks for contributing to `llm-implementation`.

This repository is a learning-first engineering project for building a small decoder-only language model in plain `C`. Contributions are welcome, but the bar is correctness, clarity, and maintainability, not feature volume.

## Principles

- Prefer simple and explicit implementations over clever shortcuts
- Keep modules small and easy to test
- Optimize for correctness before optimization for speed
- Separate low-level math, model logic, and CLI or I/O concerns
- Document non-obvious design choices

## Before You Start

- Open an issue first for large changes, architectural changes, or new subsystems
- Keep pull requests scoped to one clear concern
- Avoid mixing refactors with behavior changes unless they are inseparable
- If the repository roadmap has not reached a feature yet, discuss it before implementing it

## Development Workflow

1. Create a branch from `main`
2. Make focused changes
3. Add or update tests where appropriate
4. Update documentation when behavior or structure changes
5. Open a pull request with a clear description of what changed and why

## Code Expectations

- Use plain, readable `C`
- Prefer explicit data ownership and memory lifetimes
- Avoid hidden global state
- Keep public APIs narrow
- Add comments only where intent is not obvious from the code itself

## Testing

The project is still in early setup, but contributions should follow these rules:

- Add tests for low-level math and utility code
- Verify numerical code with small deterministic examples
- Include edge cases where shapes, masking, or stability matter
- Do not merge untested math-heavy changes

As the build and test tooling is added, this document should be updated with exact commands.

## Pull Requests

A good pull request should:

- explain the problem being solved
- describe the approach taken
- note any tradeoffs or limitations
- mention tests performed
- stay small enough to review without guesswork

If a change is intentionally incomplete, say so explicitly.

## Commit Guidance

- Keep commits focused and readable
- Use commit messages that describe the change, not just the file touched
- Avoid large "misc cleanup" commits

## Documentation

Please update documentation when you:

- add a new module
- change public interfaces
- change the planned architecture
- add a new development dependency

## Licensing

By contributing to this repository, you agree that your contributions will be licensed under the terms of the `MIT` license in [LICENSE](/home/rdvn-ylmz/Work/llm-implementation/LICENSE).
