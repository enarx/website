# WebAssembly with Zig

## Install Zig

To install Zig, follow the instructions here:

https://ziglang.org/download/

## Zig Code

Create a simple Zig program that calculates the fibonacci sequence of an integer input:

```zig
const std = @import("std");

fn fibonacci(index: u32) u32 {
    if (index < 2) return index;
    return fibonacci(index - 1) + fibonacci(index - 2);
}

pub fn main() !void {
    const stdout = std.io.getStdOut().writer();
    var x: u32 = 7;
    
    try stdout.print("fibonacci of {d} ", .{x});
    try stdout.print("is: {d} \n ", .{fibonacci(x)}  );
}
```
## Compile the Zig code

```bash
zig run main.zig
```

## Compile Zig to Wasm

```
zig build-exe main.zig -target wasm32-wasi
```

## Run with Enarx
```bash
enarx run main.wasm
```