# WebAssembly with Swift

:::note
* WebAssembly support for Swift is good thanks to [SwiftWasm](https://swiftwasm.org/).
* SwiftWasm compiles Swift code to WebAssembly.
:::

## Install Swift

To install Docker on your local system, refer the [official guide](https://docs.docker.com/get-docker/).

First, we need to pull the docker image and run it in an interactive mode; we would be accessing the container from its bash. To do the same, run the following command.

```docker
docker run -v `pwd`:/swift --rm -it ghcr.io/swiftwasm/swift:latest /bin/bash
```

## Swift code

The fibonacci code in Swift is as follows :

```swift
func fib(n: UInt) -> UInt {
	if n <= 1 {
		return n
	}

	return fib(n: n-1) + fib(n: n-2)
}

print("Swift - Fibonacci sequence example\n")

let arguments = CommandLine.arguments

var n:UInt
if (arguments.count > 1) {
	for i in 1...arguments.count-1 {
		if let n = UInt(arguments[i]) {
			print("Fibonacci sequence number at index \(n) is \(fib(n: n))\n")
		} else {
			print("Failed to parse argument into a number: \(arguments[i])\n")
		}
	}
} else {
	print("Enter a non-negative number:\n")
	if let line = readLine() {
		if let n = UInt(line) {
			print("Fibonacci sequence number at index \(n) is \(fib(n: n))\n")
		} else {
			print("Could not convert \(line) to integer.\n")	
		}
	} else {
		print("Could not read user input.\n")	
	}
}
```
:::tip
Access the [Swift codex repository](https://github.com/enarx/codex/tree/main/examples/swift) for code samples, including the [fibonacci example](https://github.com/enarx/codex/tree/main/demos/fibonacci/swift).
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


