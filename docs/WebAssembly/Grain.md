# WebAssembly with Grain

## Install Grain

To install Grain, follow the instructions here:

https://grain-lang.org/docs/getting_grain

## Grain Code

The Fibonacci code in Grain is:

```
import {toList} from "array"
import {drop, forEach, length, map} from "list"
import {parseInt} from "number"
import {trim} from "string"
import {fdRead, stdin} from "sys/file"
import {argv} from "sys/process"
import {expect} from "result"

print("Grain - Fibonacci sequence example")

let rec fibonacci = (i) => {
  if (i <= 1) {
    i
  } else {
    fibonacci(i - 1) + fibonacci(i - 2)
  }
}

let args = expect("failed to parse arguments", argv())
let indexes = drop(1, toList(args))
let indexes = if (length(indexes) == 0) {
    print("Enter a non-negative number:")
    let (s, _) = expect("failed to read stdin", fdRead(stdin, 19))
    let i = expect("failed to parse stdin as integer number", parseInt(trim(s), 10))
    [i]
} else {
    map((arg) => { expect("failed to parse argument " ++ toString(arg) ++ " as integer number", parseInt(arg, 10)) }, indexes)
}
forEach((i) => { print("Fibonacci sequence number at index " ++ toString(i) ++ " is " ++ toString(fibonacci(i))) }, indexes)
```
:::tip
Access the [Grain codex repository](https://github.com/enarx/codex/tree/main/Grain) for code samples, including the [fibonacci example](https://github.com/enarx/codex/tree/main/Grain/fibonacci).
:::

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