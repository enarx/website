# WebAssembly with Python

## Environment Setup

### Docker
Install docker using the instructions [here](https://docs.docker.com/engine/install/)

### CPython's Wasm build

#### Steps to build a CPython WebAssembly Build

- Clone the repo https://github.com/singlestore-labs/python-wasi/
```bash
git clone https://github.com/singlestore-labs/python-wasi/
```
- Change directory to ```python-wasi``` using the command: ```cd python-wasi```
- Build the docker image using the command: ```docker build -f docker/Dockerfile -t wasi-build:latest docker```
- Now start the docker container and mount the current directory inside the docker container:
```bash
docker run -it --rm -v $(pwd):$(pwd) -w $(pwd) wasi-build:latest bash
```
- To download the CPython source, dependencies and to build the CPython's Wasm build, run the command:
```bash
./run.sh
```
- The build output is saved at ```opt/wasi-python/```.

## Python code

Python code to print the fibonacci sequence:

```python
from functools import cache
import sys

@cache
def fib(n):
    if n <= 0:
        return 0
    if n == 1:
        return 1
    else:
        return fib(n - 1) + fib(n - 2)

args = sys.argv[1:]

if len(args) == 0:
    print("Please pass one or more numbers as arguments to the program")
else:
    for arg in args:
        idx = int(arg)
        print(f"Fibonacci sequence number at index {idx} is {fib(idx)}")
```
:::tip
Access the [Python codex repository](https://github.com/enarx/codex/tree/main/Python) for code samples, including the [fibonacci example](https://github.com/enarx/codex/tree/main/Python/fibonacci).
:::

## Run with Wasmtime
- Change directory to the **root python-wasi source directory**.
- Save the fibonacci code source at ```$HOME/fib.py```
- Run the python fibonacci code in wasmtime using the command
```bash
wasmtime run --mapdir=$(pwd)/opt::opt \
             -- opt/wasi-python/bin/python3.wasm -c "$(cat $(pwd)/fib.py)"
```