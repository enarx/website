# WebAssembly with Java

:::note
* WebAssembly support for Java is good thanks to a friendly [fork](https://github.com/fermyon/teavm-wasi) of [TeaVM](https://teavm.org/), modified to support WASI and the WebAssembly Component Model proposal.
:::

## Install Java

Install OpenJDK (the command might vary depending on the distribution):

```
sudo apt install openjdk-11-jdk
```

## Install TeaVM WASI

Clone the TeaVM WASI repository:

```
git clone https://github.com/fermyon/teavm-wasi.git
```

Navigate to the TeaVM WASI directory and do a clean install using Maven:

```
cd teavm-wasi
mvn clean install
```

Navigate to the `tests/wasi` directory and execute the Maven command again:

```
cd tests/wasi
mvn clean install
```

A `classes.wasm` file will be generated at ```target/generated/wasm/teavm-wasm/```.

:::tip
If you encounter the following error:

```
[ERROR] Failed to execute goal org.apache.maven.plugins:maven-war-plugin:2.2:war (default-war) on project foo: Error assembling WAR: webxml attribute is required (or pre-existing WEB-INF/web.xml if executing in update mode)
```

Please add the following plugin to the `pom.xml` file located at `tests/wasi`:

```xml
<plugin>
  <artifactId>maven-war-plugin</artifactId>
  <version>2.2</version>
  <extensions>false</extensions>
  <configuration>
    <failOnMissingWebXml>false</failOnMissingWebXml>
  </configuration>
</plugin>
```
:::

Several test examples are provided and you can run them using Enarx by passing the test name and argument with the help of an `Enarx.toml` file.

For example, create the following `Enarx.toml` file:

```
args = [ "catch", "Hello Enarx!" ]

[[files]]
kind = "stdin"

[[files]]
kind = "stdout"

[[files]]
kind = "stderr"
```

Now run this test on Enarx:

```
enarx run --wasmcfgfile Enarx.toml classes.wasm
```

## Java code

Let's try the Fibonacci example now.

Rename the `Test.java` file at `tests/wasi/src/main/java/wasi` to `Fibonacci.java` and replace the code with the following:

```java
package wasi;

public class Fibonacci {
    public static void main(String[] args) {
        int n = Integer.parseInt(args[0]);
        System.out.println(fib(n));
    }

    private static int fib(int n)
    {
        if (n <= 1)
            return n;
        return fib(n - 1) + fib(n - 2);
    }
}
```

:::tip
Access the [Java codex repository](https://github.com/enarx/codex/tree/main/Java) for code samples, including the [fibonacci example](https://github.com/enarx/codex/tree/main/Java/fibonacci).
:::

Now edit the main class name at the `pom.xml` file located at `tests/wasi`:

```xml
<mainClass>wasi.Fibonacci</mainClass>
```

## Compile Java code to Wasm

Execute the Maven command to generate a new `classes.wasm` file:

```
mvn clean install
```

## Run with Enarx

Now create the following `Enarx.toml` file with the fibonacci argument of your choice:

```
args = [ "9" ]

[[files]]
kind = "stdin"

[[files]]
kind = "stdout"

[[files]]
kind = "stderr"
```

At last, run the Fibonacci example using Enarx:

```
enarx run --wasmcfgfile Enarx.toml classes.wasm
```