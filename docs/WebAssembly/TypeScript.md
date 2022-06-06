# WebAssembly with TypeScript

TypeScript is a superset of JavaScript. Therefore, the best approach to using TypeScript in WebAssembly is to transpile it into JavaScript.

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

## Transpiling TypeScript to JavaScript

```bash
tsc index.ts
```

Follow the instructions at [WebAssembly with JavaScript](JavaScript) to compile JavaScript to WebAssembly and run it with Enarx.