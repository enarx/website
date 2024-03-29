# WebAssembly With .NET 

:::note
* WebAssembly support for .NET is good thanks to the [dotnet WASI SDK](https://github.com/SteveSandersonMS/dotnet-wasi-sdk).
* dotnet WASI SDK is an experimental package that can build .NET Core projects (including whole ASP.NET Core applications) into standalone WASI-compliant .wasm files.
:::

## Install .NET Preview (7.0.0-preview.4)

You can download .NET and follow installation instructions here:

https://dotnet.microsoft.com/en-us/download/dotnet/7.0

You'll also need the Experimental WASI SDK for .NET Core available here:

https://github.com/SteveSandersonMS/dotnet-wasi-sdk

## .NET code

First we will have to create a new .NET console application:

```bash
dotnet new console -o MyFirstWasiApp
```

Replace the existing code in the `Program.cs` file with:

```csharp
using System;

namespace MyFirstWasiApp
{
    public class Program
    {

        public void fibonacci(ref int num){
            int a=1,b=0,temp;
            while(num >= 0){
                temp=a;
                a=a+b;
                b=temp;
                num--;
            }
            Console.WriteLine("Fibonacci Term is: "+b);
        }

        public static void Main(string[] args)
        {
            Program p = new Program();
            int num=10;
            p.fibonacci(ref num);
        }

    }
}
```
:::tip
Access the [C# codex repository](https://github.com/enarx/codex/tree/main/examples/c%23) for code samples, including the [fibonacci example](https://github.com/enarx/codex/tree/main/demos/fibonacci/c%23). Please also check the following demos: [Greenhouse Monitor](https://github.com/enarx/GreenhouseMonitor), [ICU Monitor](https://github.com/enarx/ICUMonitor), [Confidential Trading](https://github.com/enarx/ConfidentialTrading).
:::

:::note
Currently `Experimental WASI SDK` does not allow to take user input through the console using `ReadLine()`.
:::

## Compile .NET

Import the `Wasi.Sdk` package so that it has support for WASI bindings.

```bash
dotnet add package Wasi.Sdk --prerelease
```

Build your application now using the following command: 

```bash
dotnet build
```

The Wasm binary will be generate here:
`bin/Debug/net7.0/MyFirstWasiApp.wasm`. 

## Run with Enarx

```bash
enarx run MyFirstWasiApp.wasm
```