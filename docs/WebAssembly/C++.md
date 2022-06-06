# WebAssembly with C++

## Install WASI SDK

Install [WASI SDK](https://github.com/WebAssembly/wasi-sdk/) following the instructions:

https://github.com/WebAssembly/wasi-sdk

## C++ code

We will create a simple C++ application that will return us the fibonacci sequence of an integer input. Create a file named `fibonacci.cpp`:

```cpp
// Simple Program to calculate Fibonacci Sequence of an integer input
#include <iostream>
using namespace std;
int FibonacciSequence(int num) {
    if(num <= 1) {
        return num ;
    }
    return FibonacciSequence(num-1) + FibonacciSequence(num-2);
}
int main(){
    cout << "Enter the Number" << endl;
    int n ;
    cin  >> n ;
    
    cout << "Fibonacci Sequence term at " << n << "  " << "is " << FibonacciSequence(n) << endl;
}
```

## Compile the C++ code to Wasm

```bash
 {path-wasi-sdk}/bin/clang++ fibonacci.cpp --sysroot {path-wasi-sdk}/share/wasi-sysroot/ -o fibonacci.wasm
```

## Run with Enarx

```bash
enarx run fibonacci.wasm
```
