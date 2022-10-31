# WebAssembly with Golang

:::note
* WebAssembly support for Go is excellent thanks to [TinyGo](https://tinygo.org/).
* TinyGo provides a compiler based on LLVM.
* Go is among the most popular and the second most desirable language to work with WebAssembly (using wasmtime).
:::

## Install Golang

Go to [go.dev](https://go.dev/) and follow the instructions.

## Install TinyGo

Go to [tinygo.org](https://tinygo.org/getting-started/install/) and follow the instructions.

:::note
Tinygo requires golang version 1.15 through 1.17
:::

## Go code

Let's create a simple Go program that caculates the fibonacci sequence of an integer input.

Create a folder "fibonacci":

```bash
cd fibonacci
go mod init fibonacci
```

Create a file `main.go`, and add the following:

```go
package main

import (
	"bufio"
	"flag"
	"fmt"
	"log"
	"os"
	"strconv"
)

func init() {
	log.SetFlags(0)
}

func fib(n uint64) uint64 {
	if n <= 1 {
		return n
	}
	return fib(n-1) + fib(n-2)
}

func main() {
	fmt.Println("Go - Fibonacci sequence example")

	flag.Parse()

	args := flag.Args()
	if len(args) == 0 {
		fmt.Println("Enter a non-negative number:")
		sc := bufio.NewScanner(os.Stdin)
		sc.Scan()
		b, err := sc.Bytes(), sc.Err()
		if err != nil {
			log.Fatalf("Failed to read stdin: %s", err)
		}
		args = []string{string(b)}
	}

	for _, arg := range args {
		n, err := strconv.ParseUint(arg, 10, 64)
		if err != nil {
			log.Fatalf("Failed to parse number: %s", err)
		}
		fmt.Printf("Fibonacci sequence number at index %d is %d\n", n, fib(n))
	}
}

```
:::tip
Access the [Go codex repository](https://github.com/enarx/codex/tree/main/examples/go) for code samples, including the [fibonacci example](https://github.com/enarx/codex/tree/main/demos/fibonacci/go).
:::

## Compile the Go code

```bash
go run main.go
```

## Compile to Wasm

```
tinygo build -wasm-abi=generic -target=wasi -o main.wasm main.go
```

## Run with Enarx

```bash
enarx run main.wasm
```
