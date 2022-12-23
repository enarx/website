# Introduction

[WebAssembly](https://webassembly.org/) (abbreviated Wasm) is a binary instruction format for a stack-based virtual machine. Wasm is designed as a portable target for compilation of various programming languages.

Enarx provides a WebAssembly runtime, based on [wasmtime](https://wasmtime.dev/), offering developers a wide range of language choices for implementation.

[WASI](https://wasi.dev/) (WebAssembly System Interface) is an API that provides access to several operating-system-like features, including I/O, filesystem, sockets, threads, and crypto.

Support for WebAssembly and WASI (WebAssembly System Interface) varies from language to language.

The following table shows Enarx support and tier information for each language, as well as links to a dedicated Wasm Guide and to the Codex repository with code examples.

| Wasm Guide  | Codex Repo  | Enarx Support | Enarx Tier |
|---|---|---|---|
| [Rust](Rust) | [Repo](https://github.com/enarx/codex/tree/main/examples/rust) | Excellent | Tier 1 |
| [C++](C++) | [Repo](https://github.com/enarx/codex/tree/main/examples/c%2B%2B) | Excellent | Tier 1 |
| [C](C) | [Repo](https://github.com/enarx/codex/tree/main/examples/c) | Excellent | Tier 1 |
| [Golang](Golang) | [Repo](https://github.com/enarx/codex/tree/main/examples/go) | Excellent | Tier 1 |
| [JavaScript](JavaScript) | [Repo](https://github.com/enarx/codex/tree/main/examples/javaScript) | Experimental | Tier 2 |
| [TypeScript](TypeScript) | [Repo](https://github.com/enarx/codex/tree/main/examples/typeScript) | Experimental | Tier 2 |
| [Python](Python) | [Repo](https://github.com/enarx/codex/tree/main/examples/python) | Experimental | Tier 2 |
| [.NET](dotnet) | [Repo](https://github.com/enarx/codex/tree/main/examples/c%23) | Experimental | Tier 2 |
| [Java](Java) | [Repo](https://github.com/enarx/codex/tree/main/examples/java) | Experimental | Tier 2 |
| [Zig](Zig) | [Repo](https://github.com/enarx/codex/tree/main/examples/zig) | Experimental | Tier 3 |
| [Ruby](Ruby) | [Repo](https://github.com/enarx/codex/tree/main/examples/ruby) | Experimental | Tier 3 |
| [Swift](Swift) | [Repo](https://github.com/enarx/codex/tree/main/examples/swift) | Experimental | Tier 3 |
| [AssemblyScript](AssemblyScript) | [Repo](https://github.com/enarx/codex/tree/main/examples/assemblyScript) | Experimental | Tier 3 |
| [Grain](Grain) | [Repo](https://github.com/enarx/codex/tree/main/examples/grain) | Experimental | Tier 3 |

More information about Wasm/WASI language support are available here:
- [Wasm/WASI popularity/desirability](https://blog.enarx.dev/language-support-for-wasi/)
- [Wasm/WASI features](https://blog.enarx.dev/language-support-for-wasi-2/)