# WebAssembly with AssemblyScript

## Install AssemblyScript

To install AssemblyScript on your local system, run the command:

```
npm install -g assemblyscript
```

We also need to install `as-wasi`. It is an easy to use API for the AssemblyScript WASI bindings. By bindings, we mean the declared functions that would map to the `WASI` host functions. The command to do the same is :

```
npm install --save as-wasi
```

## AssemblyScript code

The fibonacci code in AssemblyScript is:


```typescript
import "wasi";
import { Console } from "as-wasi";

export function fibo (n: i32): i32 {
if(n==1 || n==0){
  return n;
}
else{
  return fibo(n-1) + fibo(n-2);
}
}

let a: i32 = fibo(7);
Console.log(a.toString());
```

We need to import `wasi` to add some nice defaults for compiling to `WASI` and we need to import `Console` to write to `stdout`.

## Compile AssemblyScript code to Wasm

To compile your AssemblyScript code, simply run :

```
asc fibo.ts -o fibo.wasm
```

## Run with Enarx

```
enarx run fibo.wasm
```