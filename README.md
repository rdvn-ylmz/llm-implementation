# llm-implementation

`llm-implementation` is a from-scratch language model project written in `C`.

The goal is not to wrap an existing framework or reproduce a large production model quickly. The goal is to understand and implement the core mechanics of a decoder-only transformer end to end:

- tensor and matrix operations
- embeddings
- masked self-attention
- feed-forward blocks
- layer normalization
- training loop
- sampling and inference
- checkpointing

This repository is being built as a learning-first engineering project, with an emphasis on clean architecture, testability, and reproducible development workflows.

## Project Note

This is primarily a learning project.

The repository exists so I can study how large language models work by implementing the core pieces myself, not because this project is trying to compete with mature frameworks or production systems.

That means:

- some parts of the codebase may stay intentionally simple
- some implementation choices may favor clarity over performance
- APIs and internal structure may change as understanding improves
- experimental or incomplete work may appear on the main development path

## Goals

- Implement a small decoder-only transformer in plain `C`
- Understand every major component instead of treating the model as a black box
- Build the project with solid software engineering practices from the start
- Keep the code modular enough to inspect, test, and extend
- Document the implementation decisions and tradeoffs clearly

## Non-Goals

- Matching the performance of modern large-scale LLMs
- Depending on high-level ML libraries
- Optimizing for GPU training in the first phase
- Adding distributed systems complexity before the core model is correct

## Project Scope

The project will start with the smallest useful version of a language model and grow in controlled steps:

1. Core tensor and math utilities
2. Basic language modeling on character-level data
3. Single-head masked self-attention
4. Full decoder block
5. Multi-block mini GPT
6. Training loop and optimizer
7. Checkpoint save/load
8. Sampling and inference CLI
9. Optional tokenizer improvements such as BPE

## Planned Architecture

The repository will be organized around small, explicit modules.

```text
.
├── apps/                # CLI entry points such as train and infer
├── docs/                # Notes, design docs, and implementation writeups
├── include/             # Public headers
├── scripts/             # Helper scripts for development and automation
├── src/
│   ├── tensor/          # Tensor representation, memory layout, indexing
│   ├── ops/             # Matmul, softmax, activations, loss functions
│   ├── nn/              # Linear, embeddings, layer norm, feed-forward
│   ├── attention/       # Single-head and multi-head causal self-attention
│   ├── model/           # Decoder blocks and top-level GPT model
│   ├── optim/           # Optimizers such as SGD and AdamW
│   ├── data/            # Tokenization, batching, dataset utilities
│   └── io/              # Checkpoints, config loading, logging
├── tests/               # Unit and integration tests
└── .github/workflows/   # CI pipelines
```

## Development Principles

- Prefer correctness over speed in early iterations
- Keep data structures simple and explicit
- Separate math code from I/O and CLI code
- Test low-level operations independently
- Avoid hidden global state
- Make debugging easy with deterministic seeds and clear logging

## Engineering Plan

This project is intended to be shared publicly, so the engineering setup matters as much as the model code.

Planned baseline:

- `CMake` for builds
- `CTest` for automated tests
- `clang-format` for formatting
- strict compiler warnings
- sanitizer-enabled debug builds
- `GitHub Actions` for CI
- `Docker` for reproducible local environments

## Roadmap

### Phase 1: Foundations

- tensor container and memory management
- matrix multiplication and core numerical ops
- softmax, cross-entropy, and numerical stability checks
- deterministic random initialization

### Phase 2: Minimal Language Modeling

- character vocabulary
- encode/decode pipeline
- simple bigram or baseline language model
- text sampling utilities

### Phase 3: Transformer Components

- token embeddings
- positional embeddings
- single-head masked self-attention
- multi-head attention
- feed-forward network
- residual connections
- layer normalization

### Phase 4: Full Mini GPT

- decoder-only transformer stack
- next-token training objective
- loss tracking
- greedy and temperature sampling

### Phase 5: Training and Tooling

- optimizer implementation
- batching and sequence handling
- checkpoint serialization
- reproducible experiments
- CI, test coverage, and release workflow

## Current Status

This repository is currently in the initial setup and planning phase.

The first milestones are:

- define the repository structure
- add the build system
- implement the math core
- add tests before model complexity grows

## Why C?

Implementing the model in `C` forces explicit decisions about:

- memory layout
- numerical stability
- data movement
- module boundaries
- performance tradeoffs

That makes it a good environment for learning how language models work at a systems level, not just at an API level.

## References

The implementation plan is informed by a mix of educational and primary sources, including:

- `3Blue1Brown` for linear algebra and transformer intuition
- `StatQuest` for neural network and attention explanations
- `Andrej Karpathy` for language modeling and from-scratch implementation thinking
- `The Illustrated Transformer`
- `Attention Is All You Need`
- decoder-only transformer resources such as `GPT-2`, `llama2.c`, and `llm.c`

Specific links and notes will be added under `docs/` as the project evolves.

## License

This project is licensed under the `MIT` license. See [LICENSE](/home/rdvn-ylmz/Work/llm-implementation/LICENSE).
