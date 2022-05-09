# Attestation Syscall - User Space

syscall number `0xEA01`

## NAME

get_attestation - get the attestation from the CPU

## SYNOPSIS

For `C`
```C
ssize_t get_attestation(void *nonce, size_t nonce_length, void *buf, size_t buf_length, size_t *technology);
```

Note: a `C` wrapper has to store the second return value in `rdx` into `technology` and a negative `rax` in errno.

## RETURN VALUE

On error a negative number is returned as `-errno`.

On success, this call returns the number of bytes placed in buf.

`technology` is filled in with
| value | TEE technology identifier  |
|--------|---------------|
| 0       | NONE  |
| 1       | SEV  |
| 2       | SGX |


## LOW LEVEL INTERFACE

### Inputs

1. `rdi` - input data buffer (const)
2. `rsi` - input data buffer length, must be 64
3. `rdx` - output data buffer
4. `r10` - output data buffer length

### Outputs

1. `rax` - number of bytes written or negative errno (per Linux convention)
2. `rdx` - TEE technology identifier (enum)

### Special Case

When `rdx` (input) is `0` (i.e. `NULL`):
* `r10` is ignored
* no data is written (since the buffer is non-existent)
* other outputs are the same as if the call had succeeded with a large enough buffer

### Format of `buf`

Serialization is done on the host and deserialization is done in the Wasmtime code payload. Both have access to full `std`, so
all features of `serde` should be used to ensure a safe data transfer from the untrusted host data.

`rdx` or `technology` from the`getatt()` call decides which of the union members to use.

Example union for `buf`:
```rust
#[repr(C)]
pub union Attestation {
    Sev_PrivateKeyInfo,
    Sgx_Attestation,
    // … to be extended
}
```

Suggested serde formats:
* json - best maintained - most languages have bindings
* cbor - smaller transfer - standardized, a lot of languages have bindings
* bincode - smaller transfer

## ERRORS

EFAULT: buf extends outside the process's allocated address space.

EINVAL: bufsiz is not positive.

EIO: an error occurred getting the attestation

EMSGSIZE: provided buffer too small

# Attestation Syscall - Shim to Host

Because the method of attestation differs for every architecture, the internal syscall handling differs for each.


## SEV - post attestation - Shim

No special handling besides the usual is needed.

## SEV - post attestation - Host

The Loader requests the attestation with the nonce included and places the result at the address given by the shim.

## SGX - post attestation - Shim

No special handling besides the usual is needed.

## SGX - post attestation - Host

The Loader requests the attestation with the nonce included and places the result at the address given by the shim.
