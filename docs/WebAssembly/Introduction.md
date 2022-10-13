# Introduction

[WebAssembly](https://webassembly.org/) (abbreviated Wasm) is a binary instruction format for a stack-based virtual machine. Wasm is designed as a portable target for compilation of various programming languages.

Enarx provides a WebAssembly runtime, based on [wasmtime](https://wasmtime.dev/), offering developers a wide range of language choices for implementation.

[WASI](https://wasi.dev/) (WebAssembly System Interface) is an API that provides access to several operating-system-like features, including I/O, filesystem, sockets, threads, and crypto.

Support for WebAssembly and WASI (WebAssembly System Interface) varies from language to language.

## Enarx Tier, Wasm Guide, and Codex Repository

The following table shows Enarx support and tier information for each language, as well as links to a dedicated Wasm Guide and to the Codex repository with code examples.

| Wasm Guide  | Codex Repo  | Enarx Support | Enarx Tier |
|---|---|---|---|
| [Rust](Rust) | [Repo](https://github.com/enarx/codex/tree/main/Rust) | Excellent | Tier 1 |
| [C++](C++) | [Repo](https://github.com/enarx/codex/tree/main/C%2B%2B) | Excellent | Tier 1 |
| [C](C) | [Repo](https://github.com/enarx/codex/tree/main/C) | Excellent | Tier 1 |
| [Golang](Golang) | [Repo](https://github.com/enarx/codex/tree/main/Go) | Excellent | Tier 1 |
| [JavaScript](JavaScript) | [Repo](https://github.com/enarx/codex/tree/main/JavaScript) | Experimental | Tier 2 |
| [TypeScript](TypeScript) | [Repo](https://github.com/enarx/codex/tree/main/TypeScript) | Experimental | Tier 2 |
| [Python](Python) | [Repo](https://github.com/enarx/codex/tree/main/Python) | Experimental | Tier 2 |
| [.NET](dotnet) | [Repo](https://github.com/enarx/codex/tree/main/C%23) | Experimental | Tier 2 |
| [Java](Java) | [Repo](https://github.com/enarx/codex/tree/main/Java) | Experimental | Tier 2 |
| [Ruby](Ruby) | [Repo](https://github.com/enarx/codex/tree/main/Ruby) | Experimental | Tier 3 |
| [Swift](Swift) | [Repo](https://github.com/enarx/codex/tree/main/Swift) | Experimental | Tier 3 |
| [AssemblyScript](AssemblyScript) | [Repo](https://github.com/enarx/codex/tree/main/AssemblyScript) | Experimental | Tier 3 |
| [Grain](Grain) | [Repo](https://github.com/enarx/codex/tree/main/Grain) | Experimental | Tier 3 |
| [Zig](Zig) | [Repo](https://github.com/enarx/codex/tree/main/Zig) | Experimental | Tier 3 |

Enarx support for Rust, C, C++, and Go are excellent (Tier 1). Other languages are experimental and are ranked either Tier 2 or Tier 3 based on their Wasm/WASI support, overall popularity, as well as their Wasm/WASI popularity and desirability. Please select each language to view the dedicated Wasm Guide, or read the next sections to compare the different languages.


## Wasm/WASI Popularity and Desirability

[The State of WebAssembly](https://blog.scottlogic.com/2022/06/20/state-of-wasm-2022.html) is an annual survey that provides an overview of the Wasm landscape, including language popularity (current usage) and desirability (future).

The Enarx team has explored the [data](https://wasmweekly.news/assets/state-of-webassembly-2022.csv) and created a [report](https://docs.google.com/spreadsheets/d/11uWt7C8MBp9sgSbXEVntbf1VRJ_-yHkChw0TeXoppEY/edit#gid=693866223) specifically for respondents who are using wasmtime (the runtime used by Enarx). The table with the results are presented below:

| Language | Popularity (wasmtime) | Desirability (wasmtime) | Overall Popularity |
|---|---|---|------|
| [Rust](Rust) |44% use frequently|68% are a lot interested|#19 in RedMonk|
| [C++](C++) |10%|17%|#7|
| [C](C) |10%|17%|#10|
| [Golang](Golang) |7%|32%|#16|
| [JavaScript](JavaScript) |13%|25%|#1|
| [TypeScript](TypeScript) |13%|25%|#7|
| [Python](Python) |3%|22%|#2|
| [.NET](dotnet) |2%|13%|#5|
| [Java](Java) |2%|9%|#3|
| [Ruby](Ruby) |1%|9%|#9|
| [Swift](Swift) |2%|9%|#11|
| [AssemblyScript](AssemblyScript) |7%|19%|-|
| [Grain](Grain) |1%|9%|-|
| [Zig](Zig) |2%|12%|-|

Additionally, the Enarx team has combined the Wasm/WASI popularity/desirability presented above with the overall popularity of each language according to the [RedMonk Programming Language Rankings](https://redmonk.com/sogrady/2022/03/28/language-rankings-1-22/). In the RedMonk rankings, the most popular languages are, in order: JavaScript, Python, Java, PHP, C#, C++, TypeScript, Ruby, C, Swift, C, Swift, R, Objective-C, Shell, Scala, Go, PowerShell, Kotlin, Rust, and Dart. 

## WASI Support

:::note
This section is a work in progress. 
:::

The Enarx team is developing a table to show WASI support for various programming languages:

| Language  | I/O | Filesystem | Sockets | Threads | Crypto |
|---|---|---|---|---|---|
| [Rust](Rust) |✅|✅|✅|⏳|⏳|
| [C++](C++) |✅|✅|✅|⏳|⏳|
| [C](C) |✅|✅|✅|⏳|⏳|
| [Golang](Golang) |✅|✅|⏳|⏳|⏳|
| [JavaScript](JavaScript) |---|---|---|---|---|
| [TypeScript](TypeScript) |---|---|---|---|---|
| [Python](Python) |---|---|---|---|---|
| [.NET](dotnet) |---|---|---|---|---|
| [Java](Java) |---|---|---|---|---|
| [Ruby](Ruby) |---|---|---|---|---|
| [Swift](Swift) |---|---|---|---|---|
| [AssemblyScript](AssemblyScript) |---|---|---|---|---|
| [Grain](Grain) |---|---|---|---|---|
| [Zig](Zig) |---|---|---|---|---|

## Benchmarking

:::note
This section is a work in progress. 
:::

The Enarx team is creating a testing framework that will automatically generate a table showing information such as Wasm file size, compilation time, and execution time for each language. This framework will run code samples from the [Codex repository](https://github.com/enarx/codex/).

| Language  | Wasm File Size | Compilation Time | Execution Time |
|---|---|---|---|
| [Rust](Rust) |---|---|---|
| [C++](C++) |---|---|---|
| [C](C) |---|---|---|
| [Golang](Golang) |---|---|---|
| [Ruby](Ruby) |---|---|---|
| [.NET](dotnet) |---|---|---|
| [Python](Python) |---|---|---|
| [JavaScript](JavaScript) |---|---|---|
| [TypeScript](TypeScript) |---|---|---|
| [AssemblyScript](AssemblyScript) |---|---|---|
| [Swift](Swift) |---|---|---|
| [Grain](Grain) |---|---|---|
| [Zig](Zig) |---|---|---|