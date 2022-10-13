# WebAssembly with C++

:::note
* WebAssembly support for C++ is excellent.
* C/C++ are among the most popular languages to work with WebAssembly.
* The [WASI SDK](https://github.com/WebAssembly/wasi-sdk/) toolchain is maintained by the Bytecode Alliance.
* WASI SDK pulls upstream projects [Clang](https://clang.llvm.org/) and [LLVM](https://llvm.org/), as well as [wasi-libc](https://github.com/WebAssembly/wasi-libc).  
:::

## Install WASI SDK

Install [WASI SDK](https://github.com/WebAssembly/wasi-sdk/) following the instructions:

https://github.com/WebAssembly/wasi-sdk

## C++ code

We will create a simple C++ application that will return us the fibonacci sequence of an integer input. Create a file named `fibonacci.cpp`:

```cpp
#include <cstdlib>
#include <iostream>
#include <string.h>

using namespace std;

unsigned long fib(unsigned long i) {
  if (i <= 1) {
    return i;
  }
  return fib(i - 1) + fib(i - 2);
}

int main(int argc, char *argv[]) {
  cout << "C++ - Fibonacci sequence example" << endl;
  if (argc <= 1) {
    unsigned long n;
    cout << "Enter a non-negative number:" << endl;
    cin >> n;
    cout << "Fibonacci sequence number at index " << n << " is " << fib(n)
         << endl;
  } else {
    for (unsigned int i = 1; i < argc; i++) {
      errno = 0;
      unsigned long n = strtoul(argv[i], NULL, 10);
      if (errno != 0) {
        cerr << "Failed to parse argument into a number: " << strerror(errno)
             << endl;
        exit(1);
      }
      cout << "Fibonacci sequence number at index " << n << " is " << fib(n)
           << endl;
    }
  }
}
```
:::tip
Access the [C++ codex repository](https://github.com/enarx/codex/tree/main/C%2B%2B) for code samples, including the [fibonacci example](https://github.com/enarx/codex/tree/main/C%2B%2B/fibonacci).
:::

## Compile the C++ code to Wasm

```bash
 {path-wasi-sdk}/bin/clang++ fibonacci.cpp --sysroot {path-wasi-sdk}/share/wasi-sysroot/ -o fibonacci.wasm
```

## Run with Enarx

```bash
enarx run fibonacci.wasm
```
