# WebAssembly With C 

## Install WASI SDK

Install [WASI SDK](https://github.com/WebAssembly/wasi-sdk/) following the instructions:

https://github.com/WebAssembly/wasi-sdk

## C code

We will create a simple C application that will return us the fibonacci sequence of an integer input. Create a file named `fibonacci.c`:

```c
#include <stdio.h>

int FibonacciSequence(int num) {
    if(num <= 1) {
        return num ;
    }
    return FibonacciSequence(num-1) + FibonacciSequence(num-2);
}
int main(){
    printf("Enter the Number\n");
    int n ;
    scanf("%d",&n);
    
    printf("Fibonacci Sequence term at %d is %d " , n , FibonacciSequence(n));
}

```
:::tip
Access the [C codex repository](https://github.com/enarx/codex/tree/main/C) for code samples, including the [fibonacci example](https://github.com/enarx/codex/tree/main/C/fibonacci).
:::

## Compile the C code to Wasm

```bash
 {path-wasi-sdk}/bin/clang fibonacci.c --sysroot {path-wasi-sdk}/share/wasi-sysroot/ -o fibonacci.wasm
```

## Run with Enarx

```bash
enarx run fibonacci.wasm
```