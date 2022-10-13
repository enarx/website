# WebAssembly with TypeScript

:::note
* TypeScript is a superset of JavaScript. Therefore, the best approach to using TypeScript with WebAssembly is to transpile it into JavaScript.
* WebAssembly support for JavaScript is good thanks to [Javy](https://github.com/Shopify/javy).
* Javy compiles [QuickJS](https://bellard.org/quickjs/), a tiny JavaScript runtime, to Wasm along with the script to be executed. 
* JavaScript is the second most popular and desirable language to work with WebAssembly.
:::

## Install TypeScript compiler 

If you have npm, you can install TypeScript globally:

```bash
npm install -g typescript
```

## TypeScript code

Create a file named `index.ts`:

```typescript
function fibonacci(num: number) {
    var a: number = 1;
    var b: number = 0;
    var temp: number;
    while (num >= 0) {
        temp = a;
        a = a + b;
        b = temp;
        num--;
    }
    console.log("Fibonacci Term is:", b);
}
```
:::tip
Access the [TypeScript codex repository](https://github.com/enarx/codex/tree/main/TypeScript) for code samples, including the [fibonacci example](https://github.com/enarx/codex/tree/main/TypeScript/fibonacci).
:::

## Transpiling TypeScript to JavaScript

```bash
tsc index.ts
```

Follow the instructions at [WebAssembly with JavaScript](JavaScript) to compile JavaScript to WebAssembly and run it with Enarx.