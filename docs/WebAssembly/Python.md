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
nterms = 10
n1, n2 = 0, 1
count = 0
if nterms == 1:
   print("Fibonacci sequence upto",nterms,":")
   print(n1)
else:
   print("Fibonacci sequence:")
   while count < nterms:
       print(n1)
       nth = n1 + n2
       # update values
       n1 = n2
       n2 = nth
       count += 1
```

## Run with Wasmtime
- Change directory to the **root python-wasi source directory**.
- Save the fibonacci code source at ```$HOME/fib.py```
- Run the python fibonacci code in wasmtime using the command
```bash
wasmtime run --mapdir=$(pwd)/opt::opt \
             -- opt/wasi-python/bin/python3.wasm -c "$(cat $(pwd)/fib.py)"
```