# WebAssembly with Golang

## Install Golang

Go to [go.dev](https://go.dev/) and follow the instructions.

## Install Tinygo

A Go compiler intended for use in small places such as microcontrollers, WebAssembly (Wasm), and command-line tools

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
// Simple Program to calculate fibonacci of input

package main

import "fmt"
func FibonacciRecursion(n int) int {
    if n <= 1 {
        return n
    }
    return FibonacciRecursion(n-1) + FibonacciRecursion(n-2)
}

func main(){
    fmt.Print("Enter number : ")
    var n int
    fmt.Scanln(&n)
    
    fmt.Println("Fibonacci of", n , "is", FibonacciRecursion(n));
}


```
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
