# WebAssembly with Swift

## Install Swift

To install Docker on your local system, refer the [official guide](https://docs.docker.com/get-docker/).

First, we need to pull the docker image and run it in an interactive mode; we would be accessing the container from its bash. To do the same, run the following command.

```docker
docker run -v `pwd`:/swift --rm -it ghcr.io/swiftwasm/swift:latest /bin/bash
```

## Swift code

The fibonacci code in Swift is as follows :

```swift
func fibonacci(n: Int) -> Int {
var a = 0
var b = 1
for _ in 0..<n {
let temp = a
a = b
b = temp + b
}
return a
}

print(fibonacci(n:7))
```
:::tip
Access the [Swift codex repository](https://github.com/enarx/codex/tree/main/Swift) for code samples, including the [fibonacci example](https://github.com/enarx/codex/tree/main/Swift/fibonacci).
:::

## Compile Swift to Wasm

To compile your Swift code to Wasm, simply run:

```
swiftc -target wasm32-unknown-wasi /swift/fibonacci.swift -o /swift/fibonacci.wasm
```

## Run with Enarx

```
enarx run fibonacci.wasm
```


