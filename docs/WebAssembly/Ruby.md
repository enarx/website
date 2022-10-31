# WebAssembly with Ruby

:::note
* WebAssembly support for Ruby is good thanks to [ruby.wasm](https://github.com/ruby/ruby.wasm/).
* ruby.wasm is a collection of WebAssembly ports of the CRuby. It enables running Ruby applications on WASI compatible WebAssembly runtimes.
* It uses [wasi-vfs](https://github.com/kateinoigakukun/wasi-vfs/) to create a virtual filesystem layer for WASI.
* Sockets and threads are not supported yet.
:::

## Install wasi-vfs and ruby.wasm

Install wasi-vfs and ruby.wasm following the instructions here:

https://github.com/kateinoigakukun/wasi-vfs/

https://github.com/ruby/ruby.wasm/

The ruby.wasm installation guide explains how to run a Ruby application using wasmtime, but you can use Enarx as well.

## Ruby code

Let's create a fibonacci example:

```ruby
def FibonacciSequence( n )
  return  n  if ( 0..1 ).include? n
  ( FibonacciSequence( n - 1 ) + FibonacciSequence( n - 2 ) )
end

puts "Ruby - Fibonacci sequence example"

if ARGV.length > 0
  ARGV.each { |arg|
	n = arg.to_i
    puts "Fibonacci sequence number at index #{n} is #{FibonacciSequence(n)}"
  }
else
  puts "Enter a non-negative number:"
  n = ARGF.gets.to_i
  puts "Fibonacci sequence number at index #{n} is #{FibonacciSequence(n)}"
end
```
:::tip
Access the [Ruby codex repository](https://github.com/enarx/codex/tree/main/examples/ruby) for code samples, including the [fibonacci example](https://github.com/enarx/codex/tree/main/demos/fibonacci/ruby).
:::

Save it to: `head-wasm32-unknown-wasi-full/src/fibonacci.rb`

## Run with Enarx

To run this application with Enarx, we'll need to create an `Enarx.toml` file:

```toml
args = ["ruby.wasm", "/src/fibonacci.rb"]

[[files]]
kind = "stdin"

[[files]]
kind = "stdout"

[[files]]
kind = "stderr"
```

Save it to: `head-wasm32-unknown-wasi-full/Enarx.toml`

Now run Enarx and pass the path of the TOML file with the command line option `--wasmcfgfile Enarx.toml`:

```
enarx run --wasmcfgfile Enarx.toml my-ruby-app.wasm
```