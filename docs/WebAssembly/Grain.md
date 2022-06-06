# WebAssembly with Grain

## Install Grain

To install Grain, follow the instructions here:

https://grain-lang.org/docs/getting_grain

## Grain Code

The Fibonacci code in Grain is:

```
let rec fibonacci = (n) => {
  if (n == 0 || n == 1) {
n
  } else {
fibonacci(n - 1) + fibonacci(n - 2)
  }
}

print(fibonacci(7))
```

:::note
The function is recursive with the keyword `rec` in Grain.
:::

## Compile Grain to Wasm

To compile your Grain code, simply run :

```
grain fibonacci.gr
```

This will print `13` and generate a `fibonacci.gr.wasm` file.


## Run with Enarx


```
enarx run fibonacci.gr.wasm
```