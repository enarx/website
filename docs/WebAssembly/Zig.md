# WebAssembly with Zig

:::note
* WebAssembly support for Zig is excellent.
* Zig uses LLVM, thus it provides wasm32 target architecture.
:::

## Install Zig

To install Zig, follow the instructions here:

https://ziglang.org/download/

## Zig Code

Create a simple Zig program that calculates the fibonacci sequence of an integer input:

```zig
const std = @import("std");

fn fibonacci(i: u64) u64 {
    if (i <= 1) return i;
    return fibonacci(i - 1) + fibonacci(i - 2);
}

fn print_fibonacci(w: anytype, s: []const u8) !void {
    const i = try std.fmt.parseUnsigned(u64, s, 10);
    try w.print("Fibonacci sequence number at index {d} is {d}\n", .{i, fibonacci(i)});
}

pub fn main() !void {
    const alloc: std.mem.Allocator = std.heap.page_allocator;

    var args = try std.process.argsAlloc(alloc);
    defer alloc.free(args);

    const stdout = std.io.getStdOut();
    defer stdout.close();

    const out = stdout.writer();

    try out.print("Zig - Fibonacci sequence example\n", .{});

    const indexes = args[1..];
    if (indexes.len > 0) {
        for (indexes) |arg| {
            try print_fibonacci(out, arg);
        }
    } else {
        const stdin = std.io.getStdIn();
        defer stdin.close();

        try out.print("Enter a non-negative number:\n", .{});
        var buf: [19]u8 = undefined;
        if (try stdin.reader().readUntilDelimiterOrEof(&buf, '\n')) |arg| {
            try print_fibonacci(out, arg);
        } else {
            std.debug.print("failed to read from stdin", .{});
            std.process.exit(1);
        }
    }
}
```
:::tip
Access the [Zig codex repository](https://github.com/enarx/codex/tree/main/Zig) for code samples, including the [fibonacci example](https://github.com/enarx/codex/tree/main/Zig/fibonacci).
:::

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