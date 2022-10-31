# WebAssembly with Rust

:::note
* WebAssembly support for Rust is excellent.
* Rust is the most popular and desirable language to work with WebAssembly.
* Both Enarx and wasmtime (Enarx's runtime) are written in Rust.
* The Enarx team has contributed upstream to WASI sockets, threads, and crypto.
:::

## Install Rust

To install Rust, go to [rust-lang.org](https://www.rust-lang.org/tools/install) and follow the instructions using rustup.

## Install WebAssembly Rust toolchain

```
 rustup target install wasm32-wasi
```

## Rust code

The code below caculates a Fibonacci sequence. Let's create a new project using the command:

```bash
cargo new fibonacci
```

You can use any IDE of your choice and open up this project folder. Replace the `main.rs` file under the `src` folder with:
  
```rust
use std::env::args;
use std::io::stdin;

fn fib(n: u32) -> u32 {
    match n {
        0 => 0,
        1 => 1,
        n => fib(n - 1) + fib(n - 2),
    }
}

fn main() {
    println!("Rust - Fibonacci sequence example");

    let mut args: Vec<_> = args().skip(1).collect();

    if args.is_empty() {
        println!("Enter a non-negative number:");
        let mut idx = String::new();
        stdin().read_line(&mut idx).expect("Failed to read line");
        args.push(idx);
    }

    for arg in args {
        let idx = arg.trim().parse().expect("Failed to parse number");
        println!("Fibonacci sequence number at index {} is {}", idx, fib(idx));
    }
}
  
```
:::tip
Access the [Rust codex repository](https://github.com/enarx/codex/tree/main/examples/rust) for code samples, including the [fibonacci example](https://github.com/enarx/codex/tree/main/demos/fibonacci/rust).
:::

## Compile Rust

Compile using cargo:

``` bash
cargo build
cargo run
```

## Compile to Wasm

```bash
cargo build --release --target=wasm32-wasi
```

## Run with Enarx

Run the fibonacci example using Enarx:

```bash
enarx run target/wasm32-wasi/release/fibonacci.wasm
```

	
