# WebAssembly with JavaScript

## Environment Setup 

To compile this demo, you must install the following :

### Javy

[Javy](https://github.com/Shopify/javy) is a JavaScript to WebAssembly Toolchain. It is currently used for the 
beta Shopify Scripts Platform.

A Quick Note that, all of the build dependencies of the Javy Toolchain have to be installed after forking the Github Repository on your Machine and then executing all of the commands which are required for installation of the Build Dependencies.


### Wasmtime

You will find wasmtime at [wasmtime.dev](https://wasmtime.dev/)

## JavaScript Code Snippet 

We will create a Simple JavaScript Program that will return us the Fibonacci Sequence of an Integer Input.

Create a file named `index.js` or you can name the file whatever you want. In my case, I have named it `index.js`

```JavaScript
//Simple Program to calculate Fibonacci Sequence of an Integer Input
function fibonacci(num){
  var a = 1, b = 0, temp;

  while (num >= 0){
    temp = a;
    a = a + b;
    b = temp;
    num--;
  }
console.log("Fibonacci Term is ",b);
  
}

var Shopify = {
  main: fibonacci
};
```

Now, you might be wondering this is JavaScript Code and fibonacci function is also written in JavaScript as per the syntax but what is the role of this `Shopify` Object here. 

Well the Javy Toolchain expects that our JavaScript code needs to define a global object where `Shopify.main` points to our main function. 
In this case I have defined my main function as `fibonacci`.

### Creating a WASM Binary out of the Source Code
### STEP 1 
Now, in order to create a WASM Binary out of the JavaScript source code, we will need our two weapons in hand `Javy` toolchain and `msgpack-tools` under our belt.

Navigate to `/javy/target/release` directory to generate the WASM Binary using the `./javy` executable.
You will have to save your JavaScript source code in this directory as well.

While installing `javy` you can also install it as a global dependency and then you won't need to navigate to this directory in order to make use of the executable. 
In my case, I haven't installed it globally that's why I have navigated to this directory.

```bash
./javy index.js -o index.wasm
```

After executing this command, you will have the WebAssembly Binary in your directory named `index.wasm`

![WASM Binary](/img/tutorial/WASMBinaryJS.png?raw=true)

### Step 2:

After you have the WebAssembly Binary with you, you need to execute the following command 
in order to run it on the top of Wasmtime:

```bash
echo "10" | wasmtime run index.wasm
```

As of now the Default implementation of the Javy Toolchain does not allow the user to dynamically enter the input instead we have to directly serve it via command line arguments on 
the terminal. 

That is why, we are explicitly appending `echo "10"` in order to append the value 10 to the 
fibonacci function argument. This value will get substituted in place of the `num` parameter which is present in the Fibonacci Function, and hence you will get the 10th Fibonacci Sequence as the Output. 
### STEP 3 : 

Finally you will be able to see your Output displayed and working flawlessly on Wasmtime
