# WebAssembly with JavaScript

:::note
* WebAssembly support for JavaScript is good thanks to [Javy](https://github.com/Shopify/javy).
* Javy compiles [QuickJS](https://bellard.org/quickjs/), a tiny JavaScript runtime, to Wasm, along with script to be executed. 
* JavaScript is the second most popular and desirable language to work with WebAssembly.
* TypeScript, a superset of JavaScript, can be transpiled into JavaScript before being compiled to Wasm.
:::

## Install Javy

Install Javy following the instructions here:

https://github.com/Shopify/javy

:::note
All of the build dependencies of the Javy toolchain have to be installed after cloning the GitHub repository.
:::

## JavaScript code

We will create a simple JavaScript application that will return us the Fibonacci sequence. Create a file named `index.js`:

```javascript
function fibonacci(){
  var num = 10;
  var a = 1, b = 0, temp;

  while (num >= 0){
    temp = a;
    a = a + b;
    b = temp;
    num--;
  }
console.log("Fibonacci result is: ",b);

}

var Shopify = {
  main: fibonacci
};
```
:::tip
Access the [JavaScript codex repository](https://github.com/enarx/codex/tree/main/JavaScript) for code samples, including the [fibonacci example](https://github.com/enarx/codex/tree/main/JavaScript/fibonacci).
:::

:::note
The Javy toolchain expects `Shopify.main` to point to our main function, in this case, `fibonacci`.
:::

## Compile to Wasm

Navigate to `/javy/target/release` directory to generate the Wasm file using the `./javy` executable. You will have to save your JavaScript source code in this directory as well.

```bash
./javy index.js -o index.wasm
```

## Run with Enarx

```bash
Enarx run index.wasm
```
