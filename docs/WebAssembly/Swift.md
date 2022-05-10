# WebAssembly with SwiftWasm

1. Setting up the environment
    
    To install Docker on your local system, refer the [official guide](https://docs.docker.com/get-docker/).
    
    If you don’t want to install Docker locally on your system, you can use [Docker Playground](https://labs.play-with-docker.com/).
    
    First, we need to pull the docker image and run it in an interactive mode; we would be accessing the container from its bash. To do the same, run the following command.
    
    ```docker
    docker run --rm -it ghcr.io/swiftwasm/swift:latest /bin/bash
    ```
    
    But what is Docker? Citing the official documentation,
    
    ```
    Docker is an open platform for developing, shipping, and running applications.
    Docker enables you to separate your applications from your infrastructure
    so you can deliver software quickly. 
    With Docker, you can manage your infrastructure in the same ways you manage
    your applications. By taking advantage of Docker’s methodologies for shipping,
    testing, and deploying code quickly, you can significantly reduce the delay
    between writing code and running it in production.
    ```
    
    With that clear, lets understand what's a Docker container. According to the documentation,
    
    ```
    Docker provides the ability to package and run an application in a loosely 
    isolated environment called a container. The isolation and security allows 
    you to run many containers simultaneously on a given host. Containers are 
    lightweight and contain everything needed to run the application, so you do 
    not need to rely on what is currently installed on the host. You can easily 
    share containers while you work, and be sure that everyone you share with 
    gets the same container that works in the same way.
    ```
    
    Or simply, a Docker container is nothing but a Docker image brought to action. Docker image acts as a set of instructions to build a Docker container and is made of Dockerfile and any necessary dependencies.
    
    The above line of Docker code pulls the latest Docker image of SwiftWasm from Docker hub, extracts it, and runs the container. The `--rm` command causes Docker to automatically remove the container when we exit from it. We are using `-i` and `-t` together as `-it` command. `-i` is short form for `--interactive`, this keeps the STDIN of the Docker container open. Without  `--interactive`, our container won’t take any input. `-t` is short form for `--tty`. This command gives us a pseudo terminal to our container, it connects the STDIN and STDOUT, or input and output of the container to our terminal.
    
2. Code
    
    To write the Fibonacci code, we need to have a text editor in the container. You can use any preferred text editor, be it Vim or Emacs. For this demo, we would be using nano text editor. To install the same, follow the below instructions :
    
    1. First, we need to run the `apt update` command in our container.
    2. To install nano text editor using apt, we need to run `apt install nano`
    
    With our text editor now installed in the container, lets make a swift file and write the fibonacci code in it.
    
    To make a new file, we would be using the `touch` command.
    
    ```bash
    touch fibonacci.swift
    ```
    
    To open the newly created file in nano text editor, we use this simple command.
    
    ```bash
    nano fibonacci.swift
    ```
    
    The fibonacci code in Swift is as follows :
    
    ```swift
    func fibonacci(n: Int) -> Int {
        var a = 0
        var b = 1
        for _ in 0..<n {
            let temp = a
            a = b
            b = temp + b
        }
        return a
    }
    
    print(fibonacci(n:7))
    ```
    
3. Compiling the code
    
    To compile your Swift code to wasm, simply run:
    
    ```
    swiftc -target wasm32-unknown-wasi fibonacci.swift -o fibonacci.wasm
    ```
    
    This would generate a `fibonacci.wasm` file.
    

4. Running .wasm file in Wasmtime
    
    We would be using Wasmtime as our WebAssembly runtime to run our `fibonacci.wasm` file. Before we install wasmtime in our container, we would need to install `curl` command, which is a command-line tool to transfer data to or from a server. To install the `curl` command, run the following command :
    
    ```
    apt install curl
    ```
    
    With that done, lets install our WebAssembly runtime, Wasmtime with the following command.
    
    ```
    curl https://wasmtime.dev/install.sh -sSf | bash
    ```
    
    We need to open a new terminal to start using Wasmtime, but the same can be achieved simply by the following command.
    
    ```
    exec bash
    ```
    
    To run our `fibonacci.wasm` , run the following command :
    
    ```
    wasmtime fibonacci.wasm
    ```
    
    
