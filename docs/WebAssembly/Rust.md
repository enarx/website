# WebAssembly with Rust

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
use std::io;

fn fib (n: u32) -> u32 {
    if n <= 0 {
        return 0;
    } else if n == 1 {
        return 1;
    }   fib(n - 1) + fib(n - 2)
 }

 fn main() {
    let mut nth = String::new();

    println!("Enter input: ");

    io::stdin()
        .read_line(&mut nth)
        .expect("Failed to read line");

    let nth: u32 = nth.trim().parse().expect("Please type a number!");

    println!("Fibonacci: {}", fib(nth));
    
}
  
```

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

	
