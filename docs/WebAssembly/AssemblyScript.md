# WebAssembly with AssemblyScript

:::note
* AssemblyScript was designed for WebAssembly and has a syntax similar to TypeScript. 
* Support for WASI is uncertain, given that the AssemblyScript team has [criticized](https://www.assemblyscript.org/standards-objections.html) the WASI standardization process.
:::

## Install AssemblyScript

To install AssemblyScript on your local system, run the command:

```
npm install -g assemblyscript
```

We also need to install `as-wasi`. It is an easy to use API for the AssemblyScript WASI bindings. By bindings, we mean the declared functions that would map to the `WASI` host functions. The command to do the same is:

```
npm install --save as-wasi
```

## AssemblyScript code

The fibonacci code in AssemblyScript is:


```typescript
import "wasi";

export function fibo(n: i32): i32 {
  if (n == 0 || n == 1) return n;
  return fibo(n - 1) + fibo(n - 2);
}

let res = fibo(7);
console.log(res.toString());
```
:::tip
Access the [AssemblyScript codex repository](https://github.com/enarx/codex/tree/main/examples/assemblyScript) for code samples, including the [fibonacci example](https://github.com/enarx/codex/tree/main/demos/fibonacci/assemblyscript).
:::

We need to import `wasi` to add some nice defaults for compiling to `WASI` and we need to import `Console` to write to `stdout`.

## Compile AssemblyScript code to Wasm

To compile your AssemblyScript code, simply run:

```
asc fibo.ts -o fibo.wasm
```

## Run with Enarx

```
enarx run fibo.wasm
```